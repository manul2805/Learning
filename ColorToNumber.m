//
//  ColorToNumber.m
//  EnglishDialogsTools
//
//  Created by Kovardykov Pavel on 09.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ColorToNumber.h"

@implementation ColorToNumber
+(Class)transformedValueClass {
    return [NSColor class];
}
+(BOOL) allowsReverseTransformation {
    return YES;
}
-(id) transformedValue:(NSNumber*) colorNumber {
    if (colorNumber==nil)return nil;
    NSLog(@"Color number %@", colorNumber);
    long cl=[colorNumber longValue];
    return [NSColor colorWithSRGBRed:(CGFloat) ((cl >> 16)&0xFF /0xFF) 
                               green:(CGFloat) ((cl >> 8)&0xFF /0xFF) 
                                blue:(CGFloat) (cl &0xFF /0xFF) 
                               alpha:1.0f];
}

-(id) reverseTransformedValue:(NSColor*)color {
    if (color==nil)       return nil;
    long cl=0;
    //NSLog(@"color %@, %@, %@", color.redComponent, color.greenComponent, color.blueComponent);
    cl = (int) (color.redComponent * 0xFF) << 16 + (int) (color.greenComponent * 0xFF) << 8 + (int) (color.blueComponent * 0xFF) ;
    NSLog(@"color %@", [NSNumber numberWithLong:cl]);
    return [NSNumber numberWithLong: cl];
}

@end
