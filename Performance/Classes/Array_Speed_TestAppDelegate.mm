//
//  Array_Speed_TestAppDelegate.m
//  Array Speed Test
//
//  Created by Mehmet Akten on 05/02/2009.
//  Copyright MSA Visuals Ltd. 2009. All rights reserved.
//

#import "Array_Speed_TestAppDelegate.h"
#import "Array_Speed_TestViewController.h"

@implementation Array_Speed_TestAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application 
{    
	[window addSubview:viewController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc 
{
	[viewController release];
	[window release];
	[super dealloc];
}


@end
