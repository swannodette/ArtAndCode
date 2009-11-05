//
//  CocoaAppDelegate.m
//  Cocoa
//
//  Created by David Nolen on 11/2/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "CocoaAppDelegate.h"

@implementation CocoaAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification 
{
	// Insert code here to initialize your application 
}

- (IBAction) createLotsOfObjects:(id)sender
{
  for (int i = 0; i < 100000; i++) {
    NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:@"bar", @"foo", nil];
  }
}

- (IBAction) createLotsOfObjectsBetter:(id)sender
{
  for (int i = 0; i < 100000; i++) {
    NSDictionary *d = [NSDictionary new];
    [d setValue:@"bar" forKey:@"foo"];
    [d release];
  }
}

@end
