//
//  EnglishDialogsToolsAppDelegate.m
//  EnglishDialogsTools
//
//  Created by Павел Ковардыков on 26.01.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "EnglishDialogsToolsAppDelegate.h"
#import "NewDialogViewController.h"
#import "ActorCell.h"

@implementation EnglishDialogsToolsAppDelegate

@synthesize window;
#pragma mark -
#pragma mark Application Life Cycle
-(void) applicationWillFinishLaunching:(NSNotification *)notification {
    //[[[actorsView tableColumns] objectAtIndex:0] setDataCell:[[[ActorCell alloc] init] autorelease]];
    
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
    //ActorCell* actorCell = [[ActorCell alloc] init];
    
    
    dialogsView.target = self;
    dialogsView.doubleAction =@selector(editDialog:);
    actorsView.target =self;
    actorsView.doubleAction  =@selector(editActor:);
    phrasesView.target =self;
    phrasesView.doubleAction  =@selector(editPhrase:);
}

-(void)applicationDidHide:(NSNotification *)notification {
	[self saveContext];
}
-(void)applicationWillTerminate:(NSNotification *)notification {
	[self saveContext];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag {
    NSLog(@"Reopen");
    //[NSApp 
    //if (!flag)  [window makeKeyAndOrderFront:nil];
    //return YES;
    return NO;
}

-(BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}


#pragma mark -
#pragma mark Core Data STACK

-(NSManagedObjectModel*) managedObjectModel {
	if (managedObjectModel_!=nil) return managedObjectModel_;
	
	NSURL* modelUrl= [[NSBundle mainBundle] URLForResource:@"EnglishDialogs" withExtension:@"momd"];	
	managedObjectModel_=[[NSManagedObjectModel alloc] initWithContentsOfURL:modelUrl];	
	return managedObjectModel_;
  }
-(NSManagedObjectContext*) managedObjectContext {
	if (managedObjectContext_!=nil) {
		return managedObjectContext_;
	}
	NSPersistentStoreCoordinator* psc=self.persistentStoreCoordinator;
	if (psc!=nil){
		managedObjectContext_ = [[NSManagedObjectContext alloc] init];
		managedObjectContext_.persistentStoreCoordinator = psc;
	}
	return managedObjectContext_;
}
-(NSPersistentStoreCoordinator*) persistentStoreCoordinator{
	if (persistentStoreCoordinator_!=nil) {
		return persistentStoreCoordinator_;
	}
	NSURL* storeUrl = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"EnglishDialogs.sqlite"];
	NSError* error=nil;
	NSDictionary* options = [NSDictionary dictionaryWithObjectsAndKeys: 
							 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
							 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
							 nil];
	persistentStoreCoordinator_=[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
	if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error]) {
		NSLog(@"Unresolved error: %@, %@", error, [error userInfo]);
		abort();
	}
	return persistentStoreCoordinator_;
}

-(void)saveContext {
	NSLog(@"Save context");
	NSError* error=nil;
	NSManagedObjectContext* moc = self.managedObjectContext;
	if (moc!=nil) {
		if ([moc hasChanges]&&![moc save:&error]) {
			NSLog(@"Unresolved error: %@, %@", error, [error userInfo]);
			abort();
		}
	}
}
-(NSURL*)applicationDocumentsDirectory{
    NSURL* path = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSLog(@"Application directory: %@", path);
    return path;
}

-(NSArray*) sortPhrases {
    if (sortPhrases_!=nil) return sortPhrases_;
    return [NSArray arrayWithObjects: 
             [[[NSSortDescriptor alloc] initWithKey:@"lineNumber" ascending:YES] autorelease], nil] ;
            
}
#pragma mark -
#pragma mark Custom CRUD

-(void) addToSet: (NSArrayController*) set at:(NSWindow*) wnd {
    [set addObject:[set newObject]]; 
    [NSApp beginSheet:wnd modalForWindow:self.window modalDelegate:self 
       didEndSelector:@selector(newObjectSheetDidEnd:returnCode:contextInfo:) contextInfo:nil];
}

-(void) editInSet: (NSArrayController*) set at:(NSWindow*) wnd {
    [NSApp beginSheet:wnd modalForWindow:self.window modalDelegate:self 
       didEndSelector:@selector(newObjectSheetDidEnd:returnCode:contextInfo:) contextInfo:nil];
}

-(void) removeSelectionFromSet: (NSArrayController*) set {
    [set remove: [set selection]];
    [self saveContext];
}

-(void)newObjectSheetDidEnd:(NSWindow*)sheet returnCode:(NSInteger)returnCode contextInfo:(void*)contextInfo {
    [sheet orderOut:self];
    [self saveContext];
}
#pragma mark -
#pragma mark Dialog CRUD
- (IBAction)addDialog:(id)sender {
    NSLog(@"Add new dialog");
    [self addToSet:dialogSet at:newDialogViewController.newDialogWindow];
}

-(IBAction)deleteDialog:(id)sender{
    NSLog(@"Delete dialog");
    [self removeSelectionFromSet:dialogSet];
}
-(IBAction)editDialog:(id)sender{
    NSLog(@"Edit dialog");
    [self editInSet:dialogSet at: newDialogViewController.newDialogWindow];
}

#pragma mark -
#pragma mark Actor CRUD
-(IBAction)closeActorDetail:(id)sender{
    [NSApp endSheet:actorDetailWindow returnCode:NSOKButton];
}

-(IBAction)addActor:(id)sender{
    NSLog(@"Add new actor");
    [self addToSet:actorSet at:actorDetailWindow];
}
-(IBAction)deleteActor:(id)sender{
    NSLog(@"Delete actor");
    [self removeSelectionFromSet:actorSet];
}
-(IBAction)editActor:(id)sender{
    NSLog(@"Edit actor");
    [self editInSet:actorSet at: actorDetailWindow];
}

#pragma mark -
#pragma mark Phrase CRUD

-(IBAction)closePhraseDetail:(id)sender{[NSApp endSheet:phraseDetailWindow returnCode:NSOKButton];}

-(IBAction)addPhrase:(id)sender{
    NSLog(@"Add new phrase");
    [self addToSet:phraseSet at:phraseDetailWindow];
}
-(IBAction)deletePhrase:(id)sender{
    NSLog(@"Delete phrase");
    [self removeSelectionFromSet:phraseSet];
}
-(IBAction)editPhrase:(id)sender{    
    NSLog(@"Edit phrase");
    [self editInSet:phraseSet at: phraseDetailWindow];
}
@end
