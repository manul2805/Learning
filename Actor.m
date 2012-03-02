// 
//  Actor.m
//  EnglishDialogs
//
//  Created by Павел Ковардыков on 26.01.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Actor.h"


@implementation Actor 

@dynamic color;
@dynamic icon;
@dynamic name;
-(id) selfActor {
    return [NSDictionary dictionaryWithObjectsAndKeys:self,@"item", nil ];
}

@end
