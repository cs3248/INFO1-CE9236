//
//  View.m
//  HelloWorld
//
//  Created by Christopher Severino on 10/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor yellowColor];
        
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UIFont *f = [UIFont systemFontOfSize: 32.0];
    NSString *s = @"Hello, World!";
    CGPoint p = CGPointMake(0.0, 0.0);
    [s drawAtPoint: p withFont: f];
}


@end
