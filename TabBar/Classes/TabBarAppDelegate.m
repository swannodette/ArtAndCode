//
//  TabBarAppDelegate.m
//  TabBar
//
//  Created by David Nolen on 3/10/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "TabBarAppDelegate.h"

@implementation TabBarAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
  [window addSubview:tabBarController.view];
  // Override point for customization after application launch
  [window makeKeyAndVisible];
}


- (void)dealloc {
  [window release];
  [super dealloc];
}


@end
