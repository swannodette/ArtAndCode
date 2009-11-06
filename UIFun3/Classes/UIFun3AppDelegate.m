//
//  UIFun3AppDelegate.m
//  UIFun3
//
//  Created by David Nolen on 4/6/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "UIFun3AppDelegate.h"

@implementation UIFun3AppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application 
{    
  // Override point for customization after app launch    
  [window addSubview:navigationController.view];
  [window makeKeyAndVisible];
}


- (void)dealloc 
{
  [navigationController release];
  [window release];
  [super dealloc];
}


@end
