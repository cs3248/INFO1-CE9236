//
//  TouchObject.h
//  Touch
//
//  Created by Severino Christopher on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//



@interface TouchObject : NSObject {
    NSMutableString *text;
    UIColor *bgColor;
    
}

@property (nonatomic, copy) NSMutableString *text;
@property (nonatomic, copy) UIColor *bgColor;


-(id) initWithText: (NSMutableString*) t color: (UIColor*) c;

@end
