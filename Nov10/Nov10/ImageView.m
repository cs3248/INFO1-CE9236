//
//  ImageView.m
//  Nov10
//
//  Created by Severino Christopher on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageView.h"
#import "ImageChoiceView.h"

@implementation ImageView


- (id) initWithView: (ImageChoiceView*) v Image: (UIImage *) img index: (NSInteger) i {

	if (img == nil) {	
		return nil;
	}
    
	self = [super initWithImage: img];
	if (self) {
		// Initialization code
		self.userInteractionEnabled = YES;	//UIImageView defaults to NO.
        index = i;
        icv=v;
	}
	return self;
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	icv.currentImage = index;
    [icv touchesEnded: nil withEvent: nil];
}	

@end
