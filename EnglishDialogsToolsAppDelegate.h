//
//  EnglishDialogsToolsAppDelegate.h
//  EnglishDialogsTools
//
//  Created by Павел Ковардыков on 26.01.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>

@class NewDialogViewController;

@interface EnglishDialogsToolsAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	
	NSManagedObjectModel* managedObjectModel_;
	NSManagedObjectContext* managedObjectContext_;
	NSPersistentStoreCoordinator* persistentStoreCoordinator_;
    
    NSArray* sortPhrases_;

    IBOutlet NewDialogViewController * newDialogViewController;
    IBOutlet NSArrayController * dialogSet;
    IBOutlet NSTableView* dialogsView;
    IBOutlet NSWindow* actorDetailWindow;
    IBOutlet NSArrayController * actorSet;
    IBOutlet NSTableView* actorsView;
    IBOutlet NSWindow* phraseDetailWindow;
    IBOutlet NSArrayController * phraseSet;
    IBOutlet NSTableView* phrasesView;
	
}

@property(nonatomic,retain, readonly) NSManagedObjectModel* managedObjectModel;
@property(nonatomic,retain, readonly) IBOutlet NSManagedObjectContext* managedObjectContext;
@property(nonatomic,retain, readonly) NSPersistentStoreCoordinator* persistentStoreCoordinator;

@property(readonly) IBOutlet NSArray* sortPhrases;

-(void)saveContext;
-(NSURL*)applicationDocumentsDirectory;
-(IBAction)addDialog:(id)sender;
-(IBAction)deleteDialog:(id)sender;
-(IBAction)editDialog:(id)sender;
-(IBAction)addActor:(id)sender;
-(IBAction)deleteActor:(id)sender;
-(IBAction)editActor:(id)sender;
-(IBAction)closeActorDetail:(id)sender;
-(IBAction)addPhrase:(id)sender;
-(IBAction)deletePhrase:(id)sender;
-(IBAction)editPhrase:(id)sender;
-(IBAction)closePhraseDetail:(id)sender;


@property (assign) IBOutlet NSWindow *window;

@end
