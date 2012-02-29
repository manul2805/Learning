//
//  ActorCell.m
//  EnglishDialogsTools
//
//  Created by Kovardykov Pavel on 17.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ActorCell.h"
#import "Actor.h"

@implementation ActorCell
-(void) drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    NSDictionary* value = [self objectValue];
    Actor* actor = [value objectForKey:@"item" ];
    NSColor* colorText = actor.color;
    NSString* text = actor.name == nil?@"Not assigned name": actor.name;
    
    NSRect iconRect = cellFrame;
    iconRect.size.width = iconRect.size.height;
    [[actor icon] drawInRect:iconRect fromRect:NSZeroRect operation:NSCompositeCopy fraction:1.0];
//    NSLog(@"Cell text %@", value);
    [text drawAtPoint:NSMakePoint(cellFrame.origin.x + iconRect.size.width+10, cellFrame.origin.y)
       withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                       colorText, NSForegroundColorAttributeName, 
                       [NSFont systemFontOfSize:13], NSFontAttributeName, nil]];
}
@end
