//
//  Dialog.h
//  EnglishDialogsTools
//
//  Created by Павел Ковардыков on 03.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Phrase;

@interface Dialog : NSManagedObject

@property (nonatomic, retain) id nativeText;
@property (nonatomic, retain) NSNumber * orderNumber;
@property (nonatomic, retain) NSString * audioFile;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSString * groupName;
@property (nonatomic, retain) id translateText;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSString * titleDialog;
@property (nonatomic, retain) NSSet *phrases;
@end

@interface Dialog (CoreDataGeneratedAccessors)

- (void)addPhrasesObject:(Phrase *)value;
- (void)removePhrasesObject:(Phrase *)value;
- (void)addPhrases:(NSSet *)values;
- (void)removePhrases:(NSSet *)values;

@end
