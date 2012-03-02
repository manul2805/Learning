//
//  Actor.h
//  EnglishDialogs
//
//  Created by Павел Ковардыков on 26.01.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Actor :  NSManagedObject  
{
}

@property (nonatomic, retain) NSColor * color;
@property (nonatomic, retain) NSImage * icon;
@property (nonatomic, retain) NSString * name;
@property (readonly) id selfActor;
@end



