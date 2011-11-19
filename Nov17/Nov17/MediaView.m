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
@synthesize volSlider;
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
        labels = [[NSMutableArray alloc] init];
        red = green = blue = 1.0;
        float minValue = 0.0;
        float maxValue = 1.0;
       
        //SOUND
        //label
        CGRect f = CGRectMake(10,0,
                              self.bounds.size.width,40);
        UILabel *label = [[UILabel alloc] initWithFrame: f];
        label.font = [UIFont systemFontOfSize: 28.0];
        label.textColor = [UIColor blackColor];
        label.text = @"Sound";
        [labels addObject: label];
        [self addSubview: label];
        
        //selector
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
        
        
        //buttons
        playButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		CGSize s = CGSizeMake(80, 40);	
    
		playButton.frame = CGRectMake(
                                  b.size.width *.25 - 40,
                                  b.origin.y + (b.size.height - s.height) / 2 - 120,
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
                                      b.origin.y + (b.size.height - s.height) / 2 - 120,
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
        
        //volume
        CGRect e = CGRectMake(5,135,
                              self.bounds.size.width,40);
        UILabel *volLabel = [[UILabel alloc] initWithFrame: e];
        volLabel.font = [UIFont systemFontOfSize: 28.0];
        volLabel.textColor = [UIColor blackColor];
        volLabel.text = @"🔊";
        [labels addObject: volLabel];
        [self addSubview: volLabel];
        
        muteSwitch = [[UISwitch alloc] initWithFrame: CGRectZero];
        [muteSwitch addTarget: [UIApplication sharedApplication].delegate
                     action: @selector(toggleMute:)
           forControlEvents: UIControlEventValueChanged
         ];
        muteSwitch.center = CGPointMake(30+(muteSwitch.bounds.size.width/2), 
                                        140 + (muteSwitch.bounds.size.height/2));
        muteSwitch.on = YES;	//the default
		[self addSubview: muteSwitch];
        
        CGRect d = CGRectMake(115,142,b.size.width-140,16);
        volSlider = [[UISlider alloc] initWithFrame: d];
		volSlider.minimumValue = minValue;
		volSlider.maximumValue = maxValue;
		volSlider.value = maxValue;
        volSlider.continuous = YES;
        [volSlider addTarget:[UIApplication sharedApplication].delegate
                    action: @selector(volChanged:)
          forControlEvents: UIControlEventValueChanged
         ];
        [self addSubview: volSlider];

        
        
        
        //VIDEO
        //label
        CGRect g = CGRectMake(10,self.bounds.size.height/2 - 60,
                              self.bounds.size.width,40);
        UILabel *vidLabel = [[UILabel alloc] initWithFrame: g];
        vidLabel.font = [UIFont systemFontOfSize: 28.0];
        vidLabel.textColor = [UIColor blackColor];
        vidLabel.text = @"Video";
        [labels addObject: vidLabel];
        [self addSubview: vidLabel];
        
        //selector
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
        
        //COLOR
        //label
        CGRect h = CGRectMake(10,self.bounds.size.height/2 + 30,
                              self.bounds.size.width,40);
        UILabel *colLabel = [[UILabel alloc] initWithFrame: h];
        colLabel.font = [UIFont systemFontOfSize: 28.0];
        colLabel.textColor = [UIColor blackColor];
        colLabel.text = @"Color";
        [labels addObject: colLabel];
        [self addSubview: colLabel];
        
        //sliders
        
        //red
        CGRect i = CGRectMake(20,self.bounds.size.height/2 + 80,b.size.width-40,16);
        rSlider = [[UISlider alloc] initWithFrame: i];
		rSlider.minimumValue = minValue;
		rSlider.maximumValue = maxValue;
		rSlider.value = maxValue;
        rSlider.continuous = YES;
        rSlider.backgroundColor = [UIColor colorWithRed:
                                  1.0 green: 0.0 blue: 0.0 alpha: 1.0];
        [rSlider addTarget:self
                   action: @selector(redChanged:)
         forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: rSlider];
        
        //green
        CGRect j = CGRectMake(20,self.bounds.size.height/2 + 120,b.size.width-40,16);
        gSlider = [[UISlider alloc] initWithFrame: j];
		gSlider.minimumValue = minValue;
		gSlider.maximumValue = maxValue;
		gSlider.value = maxValue;
        gSlider.continuous = YES;
        gSlider.backgroundColor = [UIColor colorWithRed:
                                   0.0 green: 1.0 blue: 0.0 alpha: 1.0];
        [gSlider addTarget:self
                    action: @selector(greenChanged:)
          forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: gSlider];
        
        //blue
        CGRect k = CGRectMake(20,self.bounds.size.height/2 + 160,b.size.width-40,16);
        bSlider = [[UISlider alloc] initWithFrame: k];
		bSlider.minimumValue = minValue;
		bSlider.maximumValue = maxValue;
		bSlider.value = maxValue;
        bSlider.continuous = YES;
        bSlider.backgroundColor = [UIColor colorWithRed:
                                   0.0 green: 0.0 blue: 1.0 alpha: 1.0];
        [bSlider addTarget:self
                    action: @selector(blueChanged:)
          forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: bSlider];
        
        
    }
    return self;
    
}


- (void) redChanged: (id) sender {
    UISlider *slider = sender;
    red = slider.value;
    self.backgroundColor = [UIColor colorWithRed: red green: green blue: blue alpha: 1.0 ];
    [self updateLabelColor];
    
}
- (void) greenChanged: (id) sender {
    UISlider *slider = sender;
    green = slider.value;
    self.backgroundColor = [UIColor colorWithRed: red green: green blue: blue alpha: 1.0 ];
    [self updateLabelColor];
    
}
- (void) blueChanged: (id) sender {
    UISlider *slider = sender;
    blue = slider.value;
    self.backgroundColor = [UIColor colorWithRed: red green: green blue: blue alpha: 1.0 ];
    [self updateLabelColor];
    
}

- (void) updateLabelColor {
    for(UILabel *label in labels) {
        label.backgroundColor = [UIColor colorWithRed: red green: green blue: blue alpha: 1.0 ];
        if(red+green+blue < 1.25) label.textColor = [UIColor whiteColor];
        else label.textColor = [UIColor blackColor];
    }
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
