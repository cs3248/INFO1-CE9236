//
//  SecondViewController.h
//  Dec8
//
//  Created by Severino Christopher on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutletCollection(id) NSArray *gestureRecognizers;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@property (strong, nonatomic) IBOutlet UIImageView *currentImage;

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;

- (void)swapImage:(NSNotification *)notification;
- (IBAction)transformViaGesture:(id)sender;
- (IBAction)resetImage:(id)sender;


@end
