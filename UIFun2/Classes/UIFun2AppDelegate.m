//
//  UIFun2AppDelegate.m
//  UIFun2
//
//  Created by David Nolen on 4/6/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "UIFun2AppDelegate.h"
#import "UIFun2ViewController.h"

@implementation UIFun2AppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application 
{    
  // Override point for customization after app launch    
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
