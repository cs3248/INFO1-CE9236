//
//  WallViewController.m
//  Dec15
//
//  Created by Severino Christopher on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WallViewController.h"

@interface WallViewController()
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation WallViewController
@synthesize toolbar = _toolbar;

@synthesize webWall = _webWall;
@synthesize baseUrl = _baseUrl;
@synthesize queryString = _queryString;
@synthesize webWallButtonItem = _webWallButtonItem;

- (void) setWebWallButtonItem:(UIBarButtonItem *)webWallButtonItem {
    if(_webWallButtonItem != webWallButtonItem) {
        NSMutableArray *toolbarItems = [self.toolbar.items mutableCopy];
        if(_webWallButtonItem) [toolbarItems removeObject:_webWallButtonItem];
        if(webWallButtonItem) [toolbarItems insertObject:webWallButtonItem atIndex:0];
        self.toolbar.items = toolbarItems;
        _webWallButtonItem = webWallButtonItem;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *)baseUrl {
    if(!_baseUrl) _baseUrl = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"baseUrl"];
    return _baseUrl;
}

- (void) setQueryString:(NSString *)queryString {
    if(_queryString || self.splitViewController) {
        _queryString = queryString;
        NSURL *url;
        if(_queryString) url = [NSURL URLWithString: [self.baseUrl stringByAppendingString: self.queryString]];
        else url = [NSURL URLWithString: self.baseUrl];
        //NSLog(@"%@", url);
        NSData *data = [NSData dataWithContentsOfURL: url];
        [self.webWall loadData: data
                      MIMEType: @"text/html"
              textEncodingName:@"NSUTF8StringEncoding"
                       baseURL:url];
    } else {
        _queryString = queryString;
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)refresh:(id)sender {
    NSURL *url = [NSURL URLWithString: self.baseUrl];
    
    NSData *data = [NSData dataWithContentsOfURL: url];
    [self.webWall loadData: data
                  MIMEType: @"text/html"
          textEncodingName:@"NSUTF8StringEncoding"
                   baseURL:url];
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url;
    if(self.queryString) url = [NSURL URLWithString: [self.baseUrl stringByAppendingString: self.queryString]];
    else url = [NSURL URLWithString: self.baseUrl];
    //NSLog(@"%@", url);
    NSData *data = [NSData dataWithContentsOfURL: url];
    [self.webWall loadData: data
                  MIMEType: @"text/html"
          textEncodingName:@"NSUTF8StringEncoding"
                   baseURL:url];
    
}


- (void)viewDidUnload
{
    [self setWebWall:nil];
    [self setToolbar:nil];
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
