//
//  AppDelegate.h
//  Nov17
//
//  Created by Severino Christopher on 11/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@class MainView;

@interface AppDelegate : UIResponder <UIApplicationDelegate, AVAudioPlayerDelegate> {
    AVAudioPlayer *player;
    
    MPMoviePlayerController *controller;
    MainView *view;
    UIWindow *_window;
    CGFloat volume;
    Boolean mute;
    
}

@property (strong, nonatomic) UIWindow *window;

- (void) soundChanged: (id) sender;
- (void) playSound: (id) sender;
- (void) stopSound: (id) sender;
- (void) toggleMute: (id) sender;
- (void) volChanged: (id) sender;
- (void) videoChanged: (id) sender;
- (void) playbackDidFinish: (NSNotification *) notification;



@end
