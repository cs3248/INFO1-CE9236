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
                      [[ImageView alloc] initWithImage: [UIImage imageNamed: @"drawing screen cap.png"]],
                      [[ImageView alloc] initWithImage: [UIImage imageNamed: @"DSCN0419.png"]],
                      [[ImageView alloc] initWithImage: [UIImage imageNamed: @"DSCN0515.png"]],
                      [[ImageView alloc] initWithImage: [UIImage imageNamed: @"DSCN1587.png"]],
                      nil
                      ];
        
        views = [NSArray arrayWithObjects:
                 [[ImageChoiceView alloc] initWithFrame: self.bounds imageArray: imageArray],
                  [[ImageManipView alloc] initWithFrame: self.bounds],
                  nil
                ];
        
        viewIndex = 0;
        [self addSubview: [views objectAtIndex: viewIndex]];
        
       
        
        
        
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
