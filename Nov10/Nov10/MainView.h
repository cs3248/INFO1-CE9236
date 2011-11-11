//
//  MainView.h
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView {
    NSArray *views;
    NSInteger viewIndex;
    NSArray *imageArray;
    NSArray *imageViewArray;
}

@property(nonatomic, copy) NSArray *imageArray;

@end
