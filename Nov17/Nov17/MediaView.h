//
//  MediaView.h
//  Nov17
//
//  Created by Severino Christopher on 11/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainView;

@interface MediaView : UIView {
    MainView *mainView;
    NSInteger selectedSound;
    NSInteger selectedVideo;
    UISegmentedControl *soundSelector;
    UIButton *playButton;
    UIButton *stopButton;
    UISegmentedControl *videoSelector;
    
    
}



- (id)initWithFrame:(CGRect)frame view: (MainView*) view;

@property (nonatomic, retain) MainView *mainView;
@property (nonatomic, assign) NSInteger selectedSound;
@property (nonatomic, retain) UISegmentedControl *segControl;
@property (nonatomic, retain) UISegmentedControl *soundSelector;
@property (nonatomic, retain) UISegmentedControl *videoSelector;

@end
