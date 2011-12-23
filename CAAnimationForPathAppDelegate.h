//
//  CAAnimationForPathAppDelegate.h
//  CAAnimationForPath
//
//  Created by keefo on 11-05-31.
//  Copyright 2011 Beyondcow. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface CAAnimationForPathAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	CALayer *rootlayer;
	CAGradientLayer *ball;
}

@property (assign) IBOutlet NSWindow *window;

@end
