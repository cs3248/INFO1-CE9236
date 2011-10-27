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
        self.backgroundColor = [UIColor whiteColor];
        
        
        
                
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGSize size = self.bounds.size;
    CGFloat min = MIN(size.width, size.height);
    
    UIFont *f = [UIFont systemFontOfSize: 32.0];
    NSString *s = @"Moiré";
    CGPoint p = CGPointMake(10.0, 10.0);
    [s drawAtPoint: p withFont: f];
    
    CGPoint center = CGPointMake(0,0);
    CGFloat radius = (.8 * min)/2;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(c, self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    CGFloat red = 0.0;
    CGFloat blue = 0.0;
    CGFloat green = 0.0;
    
    for(int d=0; d<=360; d++) {
        

        CGContextBeginPath(c);
        CGContextMoveToPoint(c, 0, 0);
        CGContextAddLineToPoint(c, center.x + radius, center.y);
        CGContextSetRGBStrokeColor(c, red, green, blue, 1);
        CGContextRotateCTM(c, 1 * M_PI / 180);
        CGContextStrokePath(c);
        
        if(d<45) red += 1.0/45;
        else if(d<90) { red -= 1.0/45; green += 1.0/90; blue += 1.0/90; }
        else if(d<135) { red += 1.0/45; green -= 1.0/90; blue += 1.0/90; }
        else if(d<180) { red -= 1.0/45; }
        else if(d<225) { blue -= 1.0/45; green += 1.0/45;}
        else if(d<270) { red += 1.0/90; green -= 1.0/90; blue += 1.0/90;}
        else if(d<315) { red += 1.0/90; green += 1.0/90; blue -= 1.0/90;}
        else if(d<360) { red -= 1.0/45; green -= 1.0/45;}


        
        
        
        
        
        

        
        
        
    }
    
    
    

    
  /*  
    
    CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat length = min * 5 / 8;           //of side
    
	CGMutablePathRef p = CGPathCreateMutable();   //right triangle
	CGPathMoveToPoint(p, NULL, 0, 0);          //lower right vertex (the right angle)
	CGPathAddLineToPoint(p, NULL, 0, length);  //upper right vertex
	CGPathAddLineToPoint(p, NULL, -length, 0); //lower left vertex
	CGPathCloseSubpath(p);
    
	CGContextRef c = UIGraphicsGetCurrentContext();
	//Origin at right angle.
	CGContextTranslateCTM(c,
                          (size.width + length) / 2,
                          (size.height + length) / 2
                          );
	CGContextScaleCTM(c, 1, -1);
    
	CGContextBeginPath(c);
	CGContextAddPath(c, p);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1);
	CGContextFillPath(c);
    
	CGContextBeginPath(c);
	CGContextAddPath(c, p);
	CGContextSetLineWidth(c, 10.0);
	CGContextSetRGBStrokeColor(c, 0.0, 0.0, 1.0, 1);
	CGContextStrokePath(c);
	CGPathRelease(p);
    */
    
    
    
}


@end
