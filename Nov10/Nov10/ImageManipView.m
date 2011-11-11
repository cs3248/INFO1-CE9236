//
//  ImageManipView.m
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageManipView.h"
#import "ImageView.h"
#import "MainView.h"

@implementation ImageManipView

@synthesize imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame mainView: (MainView*) mv 
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        mainView = mv;
        imageView = [[ImageView alloc] init];
        
        CGSize size = self.bounds.size;
        imageView.center = CGPointMake((size.width/2),(size.height/2));
        
        [self addSubview: imageView];

        

        /*
        CGRect f = CGRectMake(10,self.bounds.size.height-40.0,
                              self.bounds.size.width,40);
        UILabel *label = [[UILabel alloc] initWithFrame: f];
        label.font = [UIFont systemFontOfSize: 32.0];
        label.textColor = [UIColor redColor];
        label.text = @"Choose an image...";
        [self addSubview: label];
        */

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

- (void) setNewImage: (NSInteger) i {
    CGSize size = self.bounds.size;
    imageView.image = [mainView.imageArray objectAtIndex: i];   
    [imageView sizeToFit];
    imageView.center = CGPointMake((size.width/2),(size.height/2));
    
}

@end
