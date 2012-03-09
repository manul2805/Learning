//
//  AudioPlaybackController.m
//  EnglishDialogsTools
//
//  Created by Павел Ковардыков on 08.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AudioPlaybackController.h"

@implementation AudioPlaybackController
@synthesize fileName;
-(NSPanel*) window {
    return _window;
}
-(NSTimeInterval) startRange{
    NSFormCell* cell=[fields cellAtIndex:0];
    return cell.floatValue;
}
-(NSTimeInterval) endRange{
    NSFormCell* cell=[fields cellAtIndex:1];
    return cell.floatValue;
}
-(void) setStartRange:(NSTimeInterval)startRange{
    NSFormCell* cell=[fields cellAtIndex:0];
    cell.floatValue = startRange; 
}
-(void)setEndRange:(NSTimeInterval)endRange{
    NSFormCell* cell=[fields cellAtIndex:1];
    cell.floatValue = endRange; 
}
-(void)changePosition:(id)sender{
    NSTimeInterval pos = positionSlider.floatValue * player.duration/100;
    if (player.playing) {
        [player setCurrentTime:pos];
        
        
    }
    NSFormCell* cell=[fields cellAtIndex:choiceField.selectedRow];
    cell.floatValue = pos;//*/
}
-(void) play{
    /*NSTimeInterval pos = positionSlider.floatValue * player.duration/100;
    if (pos != [player currentTime]) [player playAtTime:pos];
    else [player play];//*/
    [player play];
    
    [[NSRunLoop currentRunLoop] 
     addTimer:[NSTimer 
               timerWithTimeInterval:1.0/24.0 
               target:self selector:@selector(timerFire:) userInfo:nil repeats:YES ] 
     forMode:NSDefaultRunLoopMode];
 
}

-(void)pause:(id)sender{
    
    if (player.playing)  {
        [player pause];
        [sender setTitle:@"Continue"];
    }
    else        {
        [self play];
        [sender setTitle:@"Pause"];
    }
    
}

-(void)playRange:(id)sender {
    if (player.playing) {
        [player stop];
        [sender setTitle: @"Play range"];
        player=nil;
        return;
    }
    NSLog(@"File: %@",fileName);
    player = [[AVAudioPlayer alloc] 
              initWithContentsOfURL:[NSURL fileURLWithPath:fileName]
              error:nil] ;
    
    [player prepareToPlay];
    [player setCurrentTime:self.startRange];
    [player play];
    
    [[NSRunLoop currentRunLoop] 
     addTimer:[NSTimer 
               timerWithTimeInterval:1.0/24.0 
               target:self selector:@selector(timerFirePlayRange:) userInfo:sender repeats:YES ] 
     forMode:NSDefaultRunLoopMode];
    [sender setTitle:@"Stop range"];
}
-(void)play:sender {
    
    if (player.playing) {
        [player stop];
        [sender setTitle: @"Play"];
        player=nil;
        return;
    }
    NSLog(@"File: %@",fileName);
    player = [[AVAudioPlayer alloc] 
                             initWithContentsOfURL:[NSURL fileURLWithPath:fileName]
                             error:nil] ;
    [player prepareToPlay];
    [player play];
    [[NSRunLoop currentRunLoop] 
        addTimer:[NSTimer 
                  timerWithTimeInterval:1.0/24.0 
                  target:self selector:@selector(timerFire:) userInfo:sender repeats:YES ] 
        forMode:NSDefaultRunLoopMode];
    [sender setTitle:@"Stop"];
}

-(void)timerFire:(NSTimer*) timer {
    if (player.playing) {    
        
        positionSlider.floatValue = player.currentTime *100.0 / player.duration;
        NSFormCell* cell=[fields cellAtIndex:choiceField.selectedRow];
        cell.floatValue = player.currentTime;
    } else {
        [[timer userInfo] setTitle: @"Play"];
        [timer invalidate];
    }
}
-(void)timerFirePlayRange:(NSTimer *)timer{
    if (player.playing && player.currentTime>= self.endRange) {
        [player stop];
    }
    if (player.playing) {    
        
        positionSlider.floatValue = player.currentTime *100.0 / player.duration;
        
        
    } else {
        [[timer userInfo] setTitle: @"Play range"];
        [timer invalidate];
    }
    
}
@end
