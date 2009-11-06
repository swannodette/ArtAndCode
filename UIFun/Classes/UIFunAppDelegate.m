//
//  UIFunAppDelegate.m
//  UIFun
//
//  Created by David Nolen on 4/6/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "UIFunAppDelegate.h"
#import "RootViewController.h"


@implementation UIFunAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{    
	[window addSubview:[navigationController view]];
  [window makeKeyAndVisible];
  
  [[NSString init] alloc];
}


- (void)applicationWillTerminate:(UIApplication *)application 
{
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc 
{
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

