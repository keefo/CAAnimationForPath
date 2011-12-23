//
//  CAAnimationForPathAppDelegate.m
//  CAAnimationForPath
//
//  Created by keefo on 11-05-29.
//  Copyright 2011 Beyondcow. All rights reserved.
//

#import "CAAnimationForPathAppDelegate.h"
#import <Quartz/Quartz.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreFoundation/CoreFoundation.h>

@implementation CAAnimationForPathAppDelegate

@synthesize window;

- (void)awakeFromNib
{
	rootlayer=[[CALayer layer] retain];
	rootlayer.needsDisplayOnBoundsChange = YES;
	rootlayer.backgroundColor = CGColorGetConstantColor(kCGColorBlack);
	[[window contentView] setLayer:rootlayer];
	[[window contentView] setWantsLayer:YES];
	NSRect r=[window frame];
	r.size=NSMakeSize(360, 360);
	[window setFrame:r display:YES];
	
	ball=[[CAGradientLayer layer] retain];
	ball.colors=[NSArray arrayWithObjects:
				  (id)CGColorCreateGenericRGB(0.1, 0.1, 0.1, 1),
				  (id)CGColorCreateGenericRGB(0.6, 0.1, 0.1, 1),
				  nil];
	ball.frame=CGRectMake(100, 100, 30, 30);
	ball.cornerRadius=15;
	[rootlayer addSublayer:ball];
}

- (CGMutablePathRef)spiralPath:(CGRect)rect
{
	CGMutablePathRef path = CGPathCreateMutable();
	float ox=rect.origin.x+rect.size.width*0.5;
	float oy=rect.origin.y+rect.size.height*0.6;
	CGPathMoveToPoint(path, nil, ox, oy);
	float x=ox,y=oy;
	float a=2;
    float t = 0.0;
	for(int i=0;i<600;i++){
		t+=0.1;
        float r=a*t*0.1;
        x+=r*cos(t);
        y-=r*sin(t);
		CGPathAddLineToPoint(path, nil, x, y);
	}
	CGPathCloseSubpath(path);
	return path;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	CGMutablePathRef path = [self spiralPath:CGRectMake(30, 30, 300, 300)];
	CAKeyframeAnimation* animation = [CAKeyframeAnimation animation];
	animation.path=path;
    animation.duration = 10;
    animation.repeatCount = 100000;
	animation.autoreverses=YES;
    [ball addAnimation:animation forKey:@"position"];
	CGPathRelease(path);
}

@end
