//
//  SecondViewController.m
//  Dec8
//
//  Created by Severino Christopher on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController()
@property (nonatomic) CGFloat scale;
@property (nonatomic) CGFloat rotation;
@property (nonatomic) CGPoint pan;

@end

@implementation SecondViewController
@synthesize gestureRecognizers = _gestureRecognizers;
@synthesize tapGesture = _tapGesture;
@synthesize currentImage = _currentImage;
@synthesize scale = _scale;
@synthesize rotation = _rotation;
@synthesize pan = _pan;




-(CGFloat)scale {
    if(!_scale) _scale = 1;
    return _scale;
}

-(CGFloat)rotation {
    if(!_rotation) _rotation = 0;
    return _rotation;
}

-(CGAffineTransform) transformImage {
    return self.currentImage.transform = CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformMakeScale(self.scale, self.scale), CGAffineTransformMakeRotation(self.rotation)),CGAffineTransformMakeTranslation(self.pan.x, self.pan.y));
}

- (void)swapImage:(NSNotification *)notification {
    self.currentImage.image = (UIImage *)[notification object];
    self.scale=1.0;
    self.rotation=0;
    self.pan = CGPointZero;
    self.currentImage.transform = [self transformImage];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.currentImage.image = ((AppDelegate *)[UIApplication sharedApplication].delegate).defaultImage;
    self.currentImage.userInteractionEnabled = YES;
    self.tapGesture.numberOfTapsRequired = 2;
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(swapImage:) 
                                                 name:@"swapImage" 
                                               object:nil];
}

- (void)viewDidUnload
{
    [self setCurrentImage:nil];
    [self setGestureRecognizers:nil];
    [self setTapGesture:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}



- (IBAction)transformViaGesture:(id)sender {

    if([sender isKindOfClass:[UIPinchGestureRecognizer class]]) {
        UIPinchGestureRecognizer *gesture = sender;
        if ((gesture.state == UIGestureRecognizerStateChanged) ||
            (gesture.state == UIGestureRecognizerStateEnded)) {
            self.scale *= gesture.scale;
            gesture.scale = 1;
        }
    } else if([sender isKindOfClass:[UIRotationGestureRecognizer class]]) {
        UIRotationGestureRecognizer *gesture = sender;
        if ((gesture.state == UIGestureRecognizerStateChanged) ||
            (gesture.state == UIGestureRecognizerStateEnded)) {
            self.rotation += gesture.rotation;
            gesture.rotation = 0;
        }
    }  else if([sender isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *gesture = sender;
        if (((gesture.state == UIGestureRecognizerStateChanged) ||
            (gesture.state == UIGestureRecognizerStateEnded)) && gesture.numberOfTouches == 1) {
            self.pan = CGPointMake(self.pan.x+[gesture translationInView:self.view].x, self.pan.y+[gesture translationInView:self.view].y);
            [gesture setTranslation:CGPointZero inView:self.view];
        }
        
    }

    self.currentImage.transform = [self transformImage];
    
}

- (IBAction)resetImage:(id)sender {
    self.scale=1.0;
    self.rotation=0;
    self.pan = CGPointZero;
    self.currentImage.transform = [self transformImage];

}

@end
