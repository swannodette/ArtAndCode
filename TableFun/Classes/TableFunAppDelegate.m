//
//  TableFunAppDelegate.m
//  TableFun
//
//  Created by David Nolen on 3/11/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "TableFunAppDelegate.h"

@implementation TableFunAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
  [window addSubview:tableViewController.view];
  // Override point for customization after application launch
  [window makeKeyAndVisible];
}


- (void)dealloc 
{
  [tableViewController release];
  [window release];
  [super dealloc];
}


@end
