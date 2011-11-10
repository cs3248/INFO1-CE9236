//
//  ImageView.h
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//


@class ImageChoiceView;


@interface ImageView : UIImageView {
    NSInteger index;
    ImageChoiceView *icv;
    
}

- (id) initWithView: (ImageChoiceView*) v Image: (UIImage *) img index: (NSInteger) i;

@end
