//
//  AppDelegate.m
//  Nov17
//
//  Created by Severino Christopher on 11/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "MainView.h"
#import "MediaView.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    volume = 1.0;
    
    view = [[MainView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window addSubview: view];
    [self.window makeKeyAndVisible];
    return YES;

}


- (void) soundChanged: (id) sender {
    UISegmentedControl *control = sender;
    NSMutableArray *mViews = view.views;
    MediaView *mView = [mViews objectAtIndex: 0];
    mView.selectedSound = control.selectedSegmentIndex;
    
    
}

- (void) playSound: (id) sender {
    NSMutableArray *mViews = view.views;
    MediaView *mView = [mViews objectAtIndex: 0];
    mView.soundSelector.selectedSegmentIndex = mView.selectedSound;
    NSURL *url = [NSURL fileURLWithPath: [view.sounds objectAtIndex: mView.selectedSound]];
    NSError *error = nil;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: &error];
    if (player == nil) {
        NSLog(@"AVAudioPayer initWithContentsOfURL:error: %@", error);
    }
    
    player.delegate = self;
    player.volume = 1.0;		
    player.numberOfLoops = 0;	//negative for infinite loop
    if(mute) player.volume = 0.0;
    else player.volume = volume;
    
    [player play];
}
- (void) stopSound: (id) sender {
    if (player != nil && [player isPlaying]) {
        [player stop];
    }
}

- (void) toggleMute: (id) sender {
    UISwitch *control = sender;
    NSMutableArray *mViews = view.views;
    MediaView *mView = [mViews objectAtIndex: 0];
    mute = !control.on;
    if(mute) { 
        mView.volSlider.value = 0.0;
        mView.volSlider.enabled = NO;
        player.volume = 0.0;
    }
    else {
        player.volume = volume;
        mView.volSlider.enabled = YES;
        mView.volSlider.value = volume;
    }
    
    
}

- (void) volChanged: (id) sender {
    UISlider *control = sender;
    volume = control.value;
    player.volume = volume;
    
    
}

- (void) videoChanged: (id) sender {
    UISegmentedControl *control = sender;
    
    controller = [[MPMoviePlayerController alloc] init];
    NSURL *url = [NSURL fileURLWithPath: [view.videos objectAtIndex:control.selectedSegmentIndex]];
    
    [controller setContentURL: url];
    
    controller.scalingMode = MPMovieScalingModeNone;
	controller.controlStyle = MPMovieControlStyleFullscreen;
	controller.movieSourceType = MPMovieSourceTypeFile; 
    
	NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
	
	[center
     addObserver: self
     selector: @selector(playbackDidFinish:)
     name: MPMoviePlayerPlaybackDidFinishNotification
     object: controller
     ];
    
    controller.view.frame = view.frame;
	[view removeFromSuperview];
	[self.window addSubview: controller.view];
	[controller play];
    
}

- (void) playbackDidFinish: (NSNotification *) notification {
	//notification.object is the movie player controller.
	[controller.view removeFromSuperview];
	[UIApplication sharedApplication].statusBarHidden = NO;
	[self.window addSubview: view];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
