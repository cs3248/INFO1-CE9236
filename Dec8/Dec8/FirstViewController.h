//
//  FirstViewController.h
//  Dec8
//
//  Created by Severino Christopher on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *selectedImage;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *images;


@end
