//
//  MessageViewController.m
//  Dec15
//
//  Created by Severino Christopher on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MessageViewController.h"
#import "WallViewController.h"

@interface MessageViewController() <UITextFieldDelegate>
@end 

@implementation MessageViewController
@synthesize message = _message;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *) generateQueryString {
    NSString *finalURL = @"";
    
    if([self.message.text length] > 0) {
        NSString *username = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    
        finalURL = [NSString stringWithFormat:@"?action=post&type=text&username=%@&message=%@", 
                           [username stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], 
                           [self.message.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
    return finalURL;
}

-(WallViewController *) splitWallViewController {
    id wvc = [self.splitViewController.viewControllers lastObject];
    if(![wvc isKindOfClass:[WallViewController class]]) {
        wvc = nil;
    }
    return wvc;
}

- (IBAction)sendMessage {
    [self textFieldShouldReturn:self.message];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField { 
    [self.message resignFirstResponder]; 
        
    if([self splitWallViewController]) {
        [self splitWallViewController].queryString = [self generateQueryString];
                        
    } else {
        //perform segue
        [self performSegueWithIdentifier:@"showWall" sender:self];
    }
        
    return YES; 
}
     
- (void)finishedEditing:(UITextField *)textField {

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WallViewController *wallVC = (WallViewController *)segue.destinationViewController;
    wallVC.queryString = [self generateQueryString];
    
}     

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.message.delegate = self;
    
    [self setContentSizeForViewInPopover:CGSizeMake(320, 200)];
}


- (void)viewDidUnload
{
    [self setMessage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}


@end
