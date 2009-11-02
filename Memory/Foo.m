//
//  Foo.m
//  Memory
//
//  Created by David Nolen on 11/2/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "Foo.h"


@implementation Foo

- (void) dealloc
{
	NSLog(@"dealloc Foo");
	[super dealloc];
}


@end
