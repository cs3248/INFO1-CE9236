//
//  View.m
//  Touch
//
//  Created by Severino Christopher on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "TouchView.h"
#import "TouchObject.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        touchViews = [[NSMutableArray alloc] init];
        
        
        CGRect f0 = CGRectMake(0, 0, 80, 40);
        TouchObject *touchObject0 = [[TouchObject alloc] 
                                    initWithText: [[NSMutableString alloc] initWithString: @"tap"] 
                                    color: [UIColor blueColor]];
        TouchView *touchView0 = [[TouchView alloc] initWithFrame: f0 touchObject: touchObject0];        
        [touchViews addObject: touchView0];
        
        
        CGRect f2 = CGRectMake(self.bounds.size.width-80, 0, 80, 40);
        TouchObject *touchObject2 = [[TouchObject alloc] 
                                     initWithText: [[NSMutableString alloc] initWithString: @"follow"] 
                                     color: [UIColor greenColor]];
        TouchView *touchView2 = [[TouchView alloc] initWithFrame: f2 touchObject: touchObject2];        
        [touchViews addObject: touchView2];
        
        
        CGRect f1 = CGRectMake(self.bounds.size.width/2, 0, 80, 40);
        TouchObject *touchObject1 = [[TouchObject alloc] 
                                     initWithText: [[NSMutableString alloc] initWithString: @"drag"] 
                                     color: [UIColor orangeColor]];
        TouchView *touchView1 = [[TouchView alloc] initWithFrame: f1 touchObject: touchObject1];        
        [touchViews addObject: touchView1];
        
        
        
       
        
        for(TouchView *t in touchViews) {
            [self addSubview: t];
        }
        
        
        //[self addSubview: touchView];
        
    }
    return self;
}


- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        TouchView *tv = [touchViews objectAtIndex: 0];
        [UIView animateWithDuration: 1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseInOut
         | UIViewAnimationOptionAllowUserInteraction
         | UIViewAnimationOptionBeginFromCurrentState
                         animations: ^{
                             tv.center = [[touches anyObject] locationInView: self];
                         }
                         completion: NULL
         ];
        //tv.center = [[touches anyObject] locationInView: self];
    }
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        TouchView *tv = [touchViews objectAtIndex: 2];
        TouchView *tvFollow = [touchViews objectAtIndex: 1];
        tv.center = [[touches anyObject] locationInView: self];
        [UIView animateWithDuration: 1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseOut
         | UIViewAnimationOptionAllowUserInteraction
         | UIViewAnimationOptionBeginFromCurrentState
                         animations: ^{
                             tvFollow.center = [[touches anyObject] locationInView: self];
                         }
                         completion: NULL
         ];
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
