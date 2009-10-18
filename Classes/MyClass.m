//
//  MyClass.m
//  Classes
//
//  Created by David Nolen on 10/18/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "MyClass.h"


@implementation MyClass

#pragma mark -
#pragma mark Class Methods

+ (id) makeANewOne
{
	return [[[MyClass alloc] init] autorelease];
}

#pragma mark -
#pragma mark Instance Methods

- (id) init
{
	self = [super init];
	if (self != nil) {
		myString = @"foobar!";
	}
	return self;
}


- (void) sayHello
{
	NSLog(@"Hello, world!");
}


- (int) addA:(int)a toB:(int)b
{
	return a + b;
}


- (NSString*) description
{
	return [NSString stringWithFormat:@"<MyClass: %@>", myString];
}


- (void) dealloc
{
	[super dealloc];
}


@end
