//
//  UsernameViewController.m
//  Dec15
//
//  Created by Severino Christopher on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UsernameViewController.h"
#import "WebWallProtocol.h"

@interface UsernameViewController() <UITextFieldDelegate>
@end 

@implementation UsernameViewController 
@synthesize username = _username;

- (void) awakeFromNib {
    [super awakeFromNib];
    self.splitViewController.delegate = self;
}

- (id<WebWallProtocol>) webWallBarButtonItem {
    id detailVC = [self.splitViewController.viewControllers lastObject];
    if(![detailVC conformsToProtocol:@protocol(WebWallProtocol)]) {
        detailVC = nil;
    }
    return detailVC;
}

- (BOOL) splitViewController:(UISplitViewController *)svc 
    shouldHideViewController:(UIViewController *)vc 
               inOrientation:(UIInterfaceOrientation)orientation {
    
    return [self webWallBarButtonItem] ? UIInterfaceOrientationIsPortrait(orientation) : NO;
}

- (void) splitViewController:(UISplitViewController *)svc 
      willHideViewController:(UIViewController *)aViewController 
           withBarButtonItem:(UIBarButtonItem *)barButtonItem 
        forPopoverController:(UIPopoverController *)pc {
    
    barButtonItem.title = @"New Message";
    [self webWallBarButtonItem].webWallButtonItem = barButtonItem;
    
}

- (void) splitViewController:(UISplitViewController *)svc 
      willShowViewController:(UIViewController *)aViewController 
   invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    [self webWallBarButtonItem].webWallButtonItem = nil;
    
}

- (IBAction)saveName {
    [self textFieldShouldReturn:self.username];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField { 
    if([self.username.text length] > 0) {
        [self.username resignFirstResponder]; 
        
        [[NSUserDefaults standardUserDefaults] setValue:self.username.text forKey:@"username"];
        
        //perform segue
        [self performSegueWithIdentifier:@"showMessageEntry" sender:self];
        
        
    }
    return YES; 
}

- (void)finishedEditing:(UITextField *)textField {
    //[self saveName];
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
    self.username.delegate = self;
    
    self.username.text = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    
    [self setContentSizeForViewInPopover:CGSizeMake(320, 200)];
}

- (void)viewDidUnload
{
    [self setUsername:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[self setContentSizeForViewInPopover:CGSizeMake(320, 200)];
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
    return YES;
}
@end
