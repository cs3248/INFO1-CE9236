//
//  ImageChoiceView.m
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageChoiceView.h"
#import "ImageView.h"

@implementation ImageChoiceView

@synthesize currentImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame imageArray: (NSArray*)imgArr
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *imageArray = imgArr;


        
        for(int i=0; i<4; i++) {
            
            
            ImageView *iv = [[ImageView alloc] initWithView: self Image: [imageArray objectAtIndex: i] index: i];
            

            CGFloat x = 80;
            CGFloat y = 80;
            
            if(i%2==1) x += self.bounds.size.width/2;
            if(i>1) y += self.bounds.size.height/2-80;
                
            
            
            
            iv.center = CGPointMake(x,y);
            
            iv.transform = CGAffineTransformMakeScale(.20,.20);
            
            [imageViewArray addObject: iv];
            
            [self addSubview: iv];

        }
        
        
               
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 
 UIFont *f = [UIFont systemFontOfSize: 32.0];
 NSString *s = @"Choose an image";
 CGPoint p = CGPointMake(10, self.bounds.size.height-20.0);
    [s drawAtPoint: p withFont: f];
}

*/


@end
