//
//  ImageChoiceView.h
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainView;

@interface ImageChoiceView : UIView {
    NSMutableArray *imageViewArray;
    NSInteger currentImage;
    MainView *mainView;
}

@property (nonatomic, assign) NSInteger currentImage;
@property (nonatomic, retain) NSMutableArray *imageViewArray;

- (id)initWithFrame:(CGRect)frame view: (MainView*) view imageArray: (NSArray*)imgArr;
- (void) touch;

@end
