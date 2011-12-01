//
//  View.m
//  Dec1
//
//  Created by Severino Christopher on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "ViewController.h"

@implementation View

@synthesize speedSelector;

- (id)initWithFrame:(CGRect)frame controller: (ViewController *) c
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        viewController = c;
        self.backgroundColor = [UIColor blackColor];
        variant = 8;
        rotateAngle=0.0;
        up=YES;
        clockwise=YES;
        deltaAngle=10.0;
        deltaVariant=4.0;
        
        UILabel *title = [[UILabel alloc] initWithFrame: CGRectMake(10.0,10.0,self.bounds.size.width,40)];
        title.font = [UIFont systemFontOfSize: 32.0];
        title.text = @"Moiré Redux";
        title.textColor = [UIColor whiteColor];
        title.backgroundColor = [UIColor blackColor];
        [self addSubview:title];
        
        CGRect b = self.bounds;
        
        speedSelector = [[UISegmentedControl alloc] initWithItems: [NSArray arrayWithObjects: 
                                                                    @"-1.00",@"-0.25",@"+0.25",@"+1.00",nil]];
		speedSelector.segmentedControlStyle = UISegmentedControlStylePlain;	
		speedSelector.momentary = YES;	
		speedSelector.center = CGPointMake(
                                           b.origin.x + b.size.width / 2,
                                           b.origin.y + b.size.height-40
                                           );
        
		[speedSelector addTarget: self
                          action: @selector(speedChanged:)
                forControlEvents: UIControlEventValueChanged
         ];
        
        
		[self addSubview: speedSelector];

        
        
    }
    return self;
}


- (void) redraw: (CADisplayLink *) displayLink {
    
    if(up && variant<1440) variant+=deltaVariant;
    else if(up) { up=NO; clockwise=NO; }
    else if(!up && variant>8) variant-=deltaVariant;
    else if(!up) { up=YES; clockwise=YES; }
    
    NSLog(@"%g", variant);
    
    //if(clockwise) [self setTransform:CGAffineTransformMakeRotation (rotateAngle+=deltaAngle/variant)];
    //else [self setTransform:CGAffineTransformMakeRotation (rotateAngle-=deltaAngle/variant)];

    [self setNeedsDisplay];

}

-(void) speedChanged: (id) sender {
    UISegmentedControl *control = sender;
    if(control.selectedSegmentIndex==0 && deltaVariant > 0.75) deltaVariant-=1.0;
    else if(control.selectedSegmentIndex==1 && deltaVariant > 0.0) deltaVariant-=0.25;
    else if(control.selectedSegmentIndex==2 && deltaVariant<40.0) deltaVariant+=0.25;
    else if(control.selectedSegmentIndex==3 && deltaVariant<39.25) deltaVariant+=1.0;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGSize size = self.bounds.size;
    CGFloat min = MIN(size.width, size.height);
    
    
    
    
    UILabel *speed = [[UILabel alloc] initWithFrame: CGRectMake(self.bounds.size.width-100.0,10.0,self.bounds.size.width,40)];
    speed.font = [UIFont systemFontOfSize: 16.0];
    speed.text = [NSString stringWithFormat:@"Speed: %g", deltaVariant];
    speed.textColor = [UIColor whiteColor];
    speed.backgroundColor = [UIColor blackColor];
    [self addSubview:speed];
     
    CGPoint center = CGPointMake(0,0);
    CGFloat radius = (.8 * min)/2;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(c, self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    CGFloat red = 0.0;
    CGFloat blue = 0.0;
    CGFloat green = 0.0;
    
    //float variant = 180;
    
    for(int d=0; d<=variant; d++) {
        
        CGContextBeginPath(c);
        CGContextMoveToPoint(c, 0, 0);
        CGContextAddLineToPoint(c, center.x + radius, center.y);
        CGContextSetRGBStrokeColor(c, red, green, blue, 1);
        CGContextRotateCTM(c, 360/variant * M_PI / 180);
        CGContextStrokePath(c);
        
        float divider = variant/16;
        float halfDivider = divider*2;
        
        if(d<variant/16) red += 1.0/divider;
        else if(d<(variant/16)*2) { red -= 1.0/divider; green += 1.0/halfDivider; blue += 1.0/halfDivider; }
        else if(d<(variant/16)*3) { red += 1.0/divider; green -= 1.0/halfDivider; blue += 1.0/halfDivider; }
        else if(d<(variant/16)*4) { red -= 1.0/divider; }
        else if(d<(variant/16)*5) { blue -= 1.0/divider; green += 1.0/divider;}
        else if(d<(variant/16)*6) { red += 1.0/halfDivider; green -= 1.0/halfDivider; blue += 1.0/halfDivider;}
        else if(d<(variant/16)*7) { red += 1.0/halfDivider; green += 1.0/halfDivider; blue -= 1.0/halfDivider;}
        else if(d<(variant/16)*8) { blue += 1.0/divider;}
        
        else if(d<(variant/16)*9) red -= 1.0/divider;        
        else if(d<(variant/16)*10) { red += 1.0/divider; green -= 1.0/halfDivider; blue -= 1.0/halfDivider; }
        else if(d<(variant/16)*11) { red -= 1.0/divider; green += 1.0/halfDivider; blue -= 1.0/halfDivider; }
        else if(d<(variant/16)*12) { red += 1.0/divider; }
        else if(d<(variant/16)*13) { blue += 1.0/divider; green -= 1.0/divider;}
        else if(d<(variant/16)*14) { red -= 1.0/halfDivider; green += 1.0/halfDivider; blue -= 1.0/halfDivider;}
        else if(d<(variant/16)*15) { red -= 1.0/halfDivider; green -= 1.0/halfDivider; blue += 1.0/halfDivider;}
        else if(d<(variant/16)*16) { red -= 1.0/divider; green -= 1.0/divider; blue -= 1.0/divider;}
        
    }
    
    
}


@end
