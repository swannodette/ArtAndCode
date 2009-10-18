//
//  FinalAppDelegate.m
//  Final
//
//  Created by David Nolen on 10/18/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "FinalAppDelegate.h"
#import "EAGLView.h"

@implementation FinalAppDelegate

@synthesize window;
@synthesize glView;

- (void) applicationDidFinishLaunching:(UIApplication *)application
{
	[glView startAnimation];
}

- (void) applicationWillResignActive:(UIApplication *)application
{
	[glView stopAnimation];
}

- (void) applicationDidBecomeActive:(UIApplication *)application
{
	[glView startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	[glView stopAnimation];
}

- (void) dealloc
{
	[window release];
	[glView release];
	
	[super dealloc];
}

@end
