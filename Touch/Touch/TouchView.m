//
//  TouchView.m
//  Touch
//
//  Created by Severino Christopher on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TouchView.h"
#import "TouchObject.h"

@implementation TouchView

@synthesize tObj;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame touchObject:(TouchObject *)t
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        tObj=t;
        
        //self.backgroundColor = [UIColor redColor];
        
        self.backgroundColor = tObj.bgColor;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIFont *font = [UIFont systemFontOfSize: 16];
    [tObj.text drawAtPoint: CGPointZero withFont: font];
}


@end
