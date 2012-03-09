//
//  AudioPlaybackController.h
//  EnglishDialogsTools
//
//  Created by Павел Ковардыков on 08.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioPlaybackController : NSObject {
    IBOutlet NSPanel* _window;
    IBOutlet NSSlider*positionSlider;
    IBOutlet NSTextField* fileNameTextField;
    NSString* fileName;
    AVAudioPlayer* player;
    IBOutlet NSForm* fields;
    IBOutlet NSMatrix* choiceField;
}
@property(readonly) NSPanel* window;
@property(retain) NSString* fileName;
@property NSTimeInterval startRange;
@property NSTimeInterval endRange;
-(IBAction) play :(id) sender;
-(void)timerFire:(NSTimer*) timer;
-(void)timerFirePlayRange:(NSTimer*) timer;
-(IBAction)playRange:(id)sender;
-(IBAction)pause:(id)sender;
-(IBAction)changePosition:(id)sender;
//-(IBAction)choiceChange:(id)sender;

@end
