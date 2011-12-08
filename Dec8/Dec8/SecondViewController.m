//
//  SecondViewController.m
//  Dec8
//
//  Created by Severino Christopher on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController()
@property (nonatomic) CGFloat scale;
@property (nonatomic) CGFloat rotation;
@property (nonatomic) CGPoint pan;

@end

@implementation SecondViewController
@synthesize pinchRecognizer = _pinchRecognizer;
@synthesize rotateRecognizer = _rotateRecognizer;
@synthesize gestureRecognizers = _gestureRecognizers;
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
    self.currentImage.userInteractionEnabled = YES;
}

- (void)viewDidUnload
{
    [self setCurrentImage:nil];
    [self setPinchRecognizer:nil];
    [self setRotateRecognizer:nil];
    [self setGestureRecognizers:nil];
    [self setGestureRecognizers:nil];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pinched:(id)sender {
    UIPinchGestureRecognizer *gesture = sender;
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        self.scale *= gesture.scale;
        self.currentImage.transform = [self transformImage];        
        gesture.scale = 1;
    }

}

- (IBAction)rotated:(id)sender {
    UIRotationGestureRecognizer *gesture = sender;
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        self.rotation = gesture.rotation;
        self.currentImage.transform = [self transformImage];    
    }
}

- (IBAction)panned:(id)sender {
    UIPanGestureRecognizer *gesture = sender;
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        NSLog(@"pan = %g, %g", [gesture translationInView:self.view].x, [gesture translationInView:self.view].y);
        self.pan = CGPointMake(self.pan.x+[gesture translationInView:self.view].x, self.pan.y+[gesture translationInView:self.view].y);
        self.currentImage.transform = [self transformImage];
        [gesture setTranslation:CGPointZero inView:self.view];
    }

    
}

@end
