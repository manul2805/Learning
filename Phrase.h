//
//  Phrase.h
//  EnglishDialogsTools
//
//  Created by Kovardykov Pavel on 22.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Actor, Dialog;

@interface Phrase : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSNumber * sampleEnd;
@property (nonatomic, retain) NSNumber * sampleStart;
@property (nonatomic, retain) NSNumber * lineNumber;
@property (nonatomic, retain) Actor *actor;
@property (nonatomic, retain) Dialog *dialog;

@end
