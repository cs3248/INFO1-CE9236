//
//  MainView.h
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView {
    NSMutableArray *views;
    NSInteger viewIndex;
    UIPageControl *pageControl;
    NSArray *videos;
    NSArray *sounds;
    NSArray *videoItems;
    NSArray *soundItems;
    
}

@property(nonatomic, copy) NSMutableArray *views;
@property(nonatomic, copy) NSArray *videos;
@property(nonatomic, copy) NSArray *sounds;
@property(nonatomic, copy) NSArray *videoItems;
@property(nonatomic, copy) NSArray *soundItems;
@property(nonatomic, copy) UIPageControl *pageControl;

@end
