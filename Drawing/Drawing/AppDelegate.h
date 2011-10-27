//
//  AppDelegate.h
//  Drawing
//
//  Created by Severino Christopher on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
