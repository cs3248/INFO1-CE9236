//
//  AppDelegate.h
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainView;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    MainView *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
