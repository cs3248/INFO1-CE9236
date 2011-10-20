//
//  View.m
//  HelloWorld
//
//  Created by Christopher Severino on 10/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"
//things to try #11
#define RED(color)	(((color) >> 2*8 & 0xFF) / 255.0)
#define GREEN(color)	(((color) >> 1*8 & 0xFF) / 255.0)
#define BLUE(color)	(((color) >> 0*8 & 0xFF) / 255.0)

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //Standard 
        //self.backgroundColor = [UIColor yellowColor];
        
        //Things to try #11
        self.backgroundColor = [UIColor colorWithRed: 1.0 green: 0.4 blue: 0.2 alpha: 1.0];
        
        
        /*//Things to try 11-12
        unsigned color = 0xFF00FF;
        self.backgroundColor = [UIColor colorWithRed: RED(color) green: GREEN(color) blue: BLUE(color) alpha: 1.0];
        */
        
        /*//Things to try #6
        CGFloat w = self.bounds.size.width;
		CGFloat h = self.bounds.size.height;
		self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
        */
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    /* Standard function
    UIFont *f = [UIFont systemFontOfSize: 32.0];
    NSString *s = @"Hello, World!";
    CGPoint p = CGPointMake(0.0, 0.0);
    [s drawAtPoint: p withFont: f];
    */
    
    /*
    [@"Things to try #2"
     drawAtPoint: CGPointMake(0,0)
     withFont: [UIFont systemFontOfSize: 32]
     ];
    */
    
    /*//Things to try #6
    NSString *s = @"Things to try #6";
    UIFont *f = [UIFont systemFontOfSize: 60/2];
    CGSize size = [s sizeWithFont: f];
	CGPoint p = CGPointMake(-size.width / 2, -size.height / 2);
    [s drawAtPoint: p withFont: f];
    */
    
    //Things to try #8, #9
    NSString *s = @"Things to try #8";
    UIFont *f = [UIFont systemFontOfSize: 12];
    UIFont *boldf = [UIFont boldSystemFontOfSize: 12];
    UIFont *italicf = [UIFont italicSystemFontOfSize: 12];
	CGPoint p = CGPointMake(10,10);
    [s drawAtPoint: p withFont: f];

    UIDevice *d = [UIDevice currentDevice];	//There is only one object of this class.
    
	NSString *model = d.model;		//Is it an iPhone, iPod, or iPad?
    [model drawAtPoint: CGPointMake(10, 30) withFont: boldf];
	NSString *uid = d.uniqueIdentifier;	//serial number  - apparently, this is deprecated
    [uid drawAtPoint: CGPointMake(10, 50) withFont: f];
	NSString *sn = d.systemName;	//name of operating system, e.g. "iPhone OS"
    [sn drawAtPoint: CGPointMake(10, 70) withFont: italicf];
	NSString *sv = d.systemVersion;	//version number of operating system, e.g., "4.3"
    [sv drawAtPoint: CGPointMake(10, 90) withFont: f];
    
    
    
}


@end
