//
//  View.h
//  Dec1
//
//  Created by Severino Christopher on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface View : UIView {
    ViewController *viewController;
    UISegmentedControl *speedSelector;
    UILabel *speedLabel;
    float variant;
    Boolean up;
    Boolean clockwise;
    float rotateAngle;
    float deltaVariant;
    float deltaAngle;
    
}

-(id) initWithFrame: (CGRect) frame controller: (ViewController *) c;

-(void) redraw: (CADisplayLink *) displayLink;

-(void) speedChanged: (id) sender;

@property (nonatomic, retain) UISegmentedControl *speedSelector;

@end
