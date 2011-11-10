//
//  MainView.m
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "ImageChoiceView.h"
#import "ImageManipView.h"
#import "ImageView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        imageArray = [NSArray arrayWithObjects:
                      [UIImage imageNamed: @"drawing screen cap.png"],
                      [UIImage imageNamed: @"DSCN0515.png"],
                      [UIImage imageNamed: @"DSCN0419.png"],
                      [UIImage imageNamed: @"DSCN1587.png"],
                      nil
                      ];
  
        views = [NSArray arrayWithObjects:
                 [[ImageChoiceView alloc] initWithFrame: self.bounds view: self imageArray: imageArray],
                  [[ImageManipView alloc] initWithFrame: self.bounds],
                  nil
                ];
        
        viewIndex = 0;
        [self addSubview: [views objectAtIndex: viewIndex]];
        
       
        
        
        
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
    
	NSUInteger newIndex = 1 - viewIndex;	//toggle the index
    
	[UIView transitionFromView: [views objectAtIndex: viewIndex]
                        toView: [views objectAtIndex: newIndex]
                      duration: 1
                       options: UIViewAnimationOptionTransitionFlipFromLeft
                    completion: NULL
     ];
    
	viewIndex = newIndex;
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
