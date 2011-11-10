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


- (id) initWithView: (ImageChoiceView *) v Image: (UIImage *) img {

	if (img == nil) {	
		return nil;
	}
    
	self = [super initWithImage: img];
	if (self) {
		// Initialization code
		self.userInteractionEnabled = YES;	//UIImageView defaults to NO.
		icv = v;
	}
	return self;
}


@end
