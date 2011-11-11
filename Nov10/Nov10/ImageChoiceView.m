//
//  ImageChoiceView.m
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageChoiceView.h"
#import "ImageView.h"
#import "MainView.h"

@implementation ImageChoiceView

@synthesize currentImage;
@synthesize imageViewArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame view: (MainView*) v imageArray: (NSArray*)imgArr
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.window.backgroundColor = [UIColor whiteColor];
        imageViewArray = [[NSMutableArray alloc] init];
        NSArray *imageArray = imgArr;
        mainView = v;
        currentImage = 0;


        
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
            
        CGRect f = CGRectMake(10,self.bounds.size.height-40.0,
                              self.bounds.size.width,40);
        UILabel *label = [[UILabel alloc] initWithFrame: f];
        label.font = [UIFont systemFontOfSize: 32.0];
        label.textColor = [UIColor redColor];
        label.text = @"Choose an image...";
        [self addSubview: label];
        
               
        
    }
    return self;
}

- (void) touch {

    [mainView touchesEnded: nil withEvent: nil];
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
