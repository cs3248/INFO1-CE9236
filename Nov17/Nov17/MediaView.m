//
//  CreateView.m
//  Nov17
//
//  Created by Severino Christopher on 11/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MediaView.h"
#import "MainView.h"

@implementation MediaView

@synthesize mainView;
@synthesize selectedSound;
@synthesize segControl;
@synthesize soundSelector;
@synthesize videoSelector;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame view: (MainView*) view {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        mainView = view;
        selectedSound = 0;
       
        
        CGRect f = CGRectMake(10,0,
                              self.bounds.size.width,40);
        UILabel *label = [[UILabel alloc] initWithFrame: f];
        label.font = [UIFont systemFontOfSize: 28.0];
        label.textColor = [UIColor blackColor];
        label.text = @"Sound";
        [self addSubview: label];
        
        
		soundSelector = [[UISegmentedControl alloc] initWithItems: mainView.soundItems];
		soundSelector.segmentedControlStyle = UISegmentedControlStylePlain;	
		soundSelector.momentary = NO;		
        
        
		CGRect b = self.bounds;
        
		soundSelector.center = CGPointMake(
                                     b.origin.x + b.size.width / 2,
                                     b.origin.y + 60
                                     );
        
		[soundSelector addTarget: [UIApplication sharedApplication].delegate
                    action: @selector(soundChanged:)
          forControlEvents: UIControlEventValueChanged
         ];
        
        
		[self addSubview: soundSelector];
        
        
        
        playButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		CGSize s = CGSizeMake(80, 40);	
    
		playButton.frame = CGRectMake(
                                  b.size.width *.25 - 40,
                                  b.origin.y + (b.size.height - s.height) / 2 - 90,
                                  s.width,
                                  s.height
                                  );
        
		[playButton setTitleColor: [UIColor greenColor] forState: UIControlStateNormal];
		[playButton setTitle: @"Play" forState: UIControlStateNormal];
        
		[playButton addTarget: [UIApplication sharedApplication].delegate
                   action: @selector(playSound:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        
		[self addSubview: playButton];
        
        
        stopButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
	
        
		stopButton.frame = CGRectMake(
                                      b.size.width *.75 - 40,
                                      b.origin.y + (b.size.height - s.height) / 2 - 90,
                                      s.width,
                                      s.height
                                      );
        
		[stopButton setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[stopButton setTitle: @"Stop" forState: UIControlStateNormal];
        
		[stopButton addTarget: [UIApplication sharedApplication].delegate
                       action: @selector(stopSound:)
             forControlEvents: UIControlEventTouchUpInside
         ];
        
		[self addSubview: stopButton];
        
        
        CGRect g = CGRectMake(10,self.bounds.size.height/2 - 60,
                              self.bounds.size.width,40);
        UILabel *vidLabel = [[UILabel alloc] initWithFrame: g];
        vidLabel.font = [UIFont systemFontOfSize: 28.0];
        vidLabel.textColor = [UIColor blackColor];
        vidLabel.text = @"Video";
        [self addSubview: vidLabel];
        
        videoSelector = [[UISegmentedControl alloc] initWithItems: mainView.videoItems];
		videoSelector.segmentedControlStyle = UISegmentedControlStylePlain;	
		videoSelector.momentary = NO;		

        
		videoSelector.center = CGPointMake(
                                           b.origin.x + b.size.width / 2,
                                           b.origin.y + b.size.height / 2
                                           );
        
		[videoSelector addTarget: [UIApplication sharedApplication].delegate
                          action: @selector(videoChanged:)
                forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: videoSelector];
        
        
    }
    return self;
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
