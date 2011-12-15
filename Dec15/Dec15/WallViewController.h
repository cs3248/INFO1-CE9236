//
//  WallViewController.h
//  Dec15
//
//  Created by Severino Christopher on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WebWallProtocol.h"

@interface WallViewController : UIViewController <WebWallProtocol> 

@property (weak, nonatomic) IBOutlet UIWebView *webWall;
@property (strong, nonatomic) NSString *baseUrl;
@property (strong, nonatomic) NSString *queryString;

@end
