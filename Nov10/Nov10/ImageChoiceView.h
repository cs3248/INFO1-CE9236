//
//  ImageChoiceView.h
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageChoiceView : UIView {
    NSArray *imageArray;
    NSInteger currentImage;
}

@property(nonatomic, copy) NSArray *imageArray;

- (id)initWithFrame:(CGRect)frame imageArray: (NSArray*)imgArr;

@end
