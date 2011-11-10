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

@synthesize imageArray;

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
        imageArray = imgArr;
        float margin = 40;

        
        for(int i=0; i<4; i++) {
            ImageView *iv = [imageArray objectAtIndex: i];
            CGSize tileSize = iv.image.size;
            CGSize viewSize = self.bounds.size;
            
            self.bounds = CGRectMake(
                                     .5 * (tileSize.width  + margin) - viewSize.width  / 2,
                                     .5 * (tileSize.height + margin) - viewSize.height / 2,
                                     viewSize.width,
                                     viewSize.height
                                     );
            iv.center = CGPointMake(
                                          (i+1)%2 * (tileSize.width  + margin),
                                          i%2 * (tileSize.height + margin)
                                          );
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
}
*/



@end
