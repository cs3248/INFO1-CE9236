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
        tv.center = [[touches anyObject] locationInView: self];
    }
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        TouchView *tv = [touchViews objectAtIndex: 1];
        tv.center = [[touches anyObject] locationInView: self];
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
