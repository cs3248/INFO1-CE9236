//
//  TouchView.h
//  Touch
//
//  Created by Severino Christopher on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TouchObject;

@interface TouchView : UIView {
    TouchObject *tObj;
}

@property(nonatomic, copy) TouchObject *tObj;

-(id) initWithFrame:(CGRect)frame touchObject:(TouchObject*)t;

@end
