//
//  FirstAppDelegate.m
//  First
//
//  Created by David Nolen on 11/5/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "FirstAppDelegate.h"
#import "FirstViewController.h"

@implementation FirstAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
  
  // Override point for customization after app launch    
  [window addSubview:viewController.view];
  [window makeKeyAndVisible];
}

- (void)dealloc {
  [viewController release];
  [window release];
  [super dealloc];
}


@end
