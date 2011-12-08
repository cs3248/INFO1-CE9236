//
//  FirstViewController.m
//  Dec8
//
//  Created by Severino Christopher on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

@implementation FirstViewController
@synthesize tapGestureRecognizers = _tapGestureRecognizers;
@synthesize selectedImage = _selectedImage;
@synthesize images = _images;


- (IBAction)imageTapped:(UITapGestureRecognizer *)sender {
    UIImageView *tappedView = (UIImageView *)sender.view;
    //NSLog(@"image selected = %@", tappedView.description);
    self.selectedImage.image = tappedView.image;
    ((AppDelegate *)[UIApplication sharedApplication].delegate).defaultImage = self.selectedImage.image;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"swapImage" 
                                                        object:self.selectedImage.image];
    
    
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
    [self imageTapped: [self.tapGestureRecognizers lastObject]];
    
}

- (void)viewDidUnload
{
    [self setTapGestureRecognizers:nil];
    [self setSelectedImage:nil];
    [self setImages:nil];
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


@end
