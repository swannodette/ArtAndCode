//
//  RotateMeAppDelegate.m
//  RotateMe
//
//  Created by David Nolen on 2/16/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "RotateMeAppDelegate.h"
#import "RotateMeViewController.h"

@implementation RotateMeAppDelegate

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
