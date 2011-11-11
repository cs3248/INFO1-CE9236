//
//  ImageManipView.h
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageView;
@class MainView;

@interface ImageManipView : UIView {
    MainView *mainView;
    ImageView *imageView;
}

@property(nonatomic, copy) ImageView *imageView;

- (id)initWithFrame:(CGRect)frame mainView: (MainView*) mainView;
- (void) setNewImage: (NSInteger) i;

@end
