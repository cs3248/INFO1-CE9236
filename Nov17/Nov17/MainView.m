//
//  MainView.m
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "MediaView.h"


@implementation MainView

@synthesize views;
@synthesize images;
@synthesize videos;
@synthesize sounds;
@synthesize imageItems;
@synthesize videoItems;
@synthesize soundItems;
@synthesize pageControl;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSBundle *bundle = [NSBundle mainBundle];
        
        
        sounds = [NSArray arrayWithObjects:
                      [bundle pathForResource: @"04 Italy, Restaurant" ofType: @"aif"],
                      [bundle pathForResource: @"14 Brazil, Jungle, Amazon Jungle" ofType: @"aif"],
                      [bundle pathForResource: @"14 Indian, Music Apache Ceremonial Song" ofType: @"aif"],
                      [bundle pathForResource: @"14-16 Water, Ocean" ofType: @"aif"],
                      nil
                      ];
        
        videos = [NSArray arrayWithObjects:
                           [bundle pathForResource: @"00244=52635=40676=42474" ofType: @"mp4"],
                           [bundle pathForResource: @"00244=52725=52474=42459" ofType: @"mp4"],
                           [bundle pathForResource: @"00244=54135=53784=53237" ofType: @"mp4"],
                           [bundle pathForResource: @"00244=54545=53597=45400" ofType: @"mp4"],
                           nil
                           ];
        
        soundItems = [NSArray arrayWithObjects:
                               @"Italy",
                               @"Jungle",
                               @"Music",
                               @"Ocean",
                               nil
                               ];
        videoItems = [NSArray arrayWithObjects:
                               @"One",
                               @"Two",
                               @"Three",
                               @"Four",
                               nil
                               ];
        
        
        views = [[NSMutableArray alloc] init];
        [views addObject: [[MediaView alloc] initWithFrame: CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)  view: self]];
        //[views addObject: [[CreateView alloc] initWithFrame: CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-20)  view: self]];
                
        viewIndex = 0;
        [self addSubview: [views objectAtIndex: viewIndex]];
        
        
        
        /*
        
        NSInteger numberOfPages = views.count;
        

		CGRect b = self.bounds;
		CGSize s = CGSizeMake(16 * views.count, 16);	//size of UIPageControl
		
		CGRect f = CGRectMake(
                              b.origin.x + (b.size.width - s.width) / 2,
                              b.origin.y + (b.size.height - s.height),
                              s.width,
                              s.height
                              );
        
		pageControl = [[UIPageControl alloc] initWithFrame: f];
        
		[pageControl addTarget: self
                    action: @selector(pageChanged:)
          forControlEvents: UIControlEventTouchUpInside
         ];
        
		pageControl.backgroundColor = [UIColor blackColor];
		pageControl.hidesForSinglePage = NO;	//default is NO
		pageControl.numberOfPages = numberOfPages;
		pageControl.currentPage = 0;			//default is 0
		[self addSubview: pageControl];
        
      */  
        
        
    }
    return self;
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	
	/*
     Assume a swipe has just ended.  A more complicated program could
     distinguish between left vs. rights wipes, and perform a
     UIViewAnimationOptionTransitionFlipFromLeft or a
     UIViewAnimationOptionTransitionFlipFromRight.
     
     In UIViewAnimationOptionTransitionFlipFromLeft, the left edge moves
     to the right, and the right edge moves away from the user and to the
     left.
     */
    
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
