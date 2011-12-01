//
//  ViewController.m
//  Dec1
//
//  Created by Severino Christopher on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@implementation ViewController

-(void) loadView {
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    self.view = [[View alloc] initWithFrame: frame controller: self];
    
}

- (void) viewDidLoad
{
	[super viewDidLoad];
    
	displayLink = [CADisplayLink displayLinkWithTarget: self.view
                                              selector: @selector(redraw:)
                   ];
    
	displayLink.frameInterval = 1;
    
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink addToRunLoop: loop forMode: NSDefaultRunLoopMode];
}

@end
