//
//  TouchObject.m
//  Touch
//
//  Created by Severino Christopher on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TouchObject.h"

@implementation TouchObject

@synthesize text;
@synthesize bgColor;

- (id) initWithText:(NSMutableString *)t color:(UIColor *)c {
    self = [super init];
    if(self != nil) {
        text = t;
        bgColor = c;
    }
    
    return self;
}

- (id) init {
    self = [super init];
    if(self != nil) {
        text = [[NSMutableString alloc] initWithString:@"New"];
        bgColor = [UIColor yellowColor];
    }
    
    return self;

    
}

@end
