//
//  Phrase.h
//  EnglishDialogsTools
//
//  Created by Павел Ковардыков on 10.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Actor, Dialog;

@interface Phrase : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSNumber * lineNumber;
@property (nonatomic, retain) NSNumber * startRange;
@property (nonatomic, retain) NSNumber * endRange;
@property (nonatomic, retain) Actor *actor;
@property (nonatomic, retain) Dialog *dialog;

@end
