//
//  LeakyClass.m
//  Memory
//
//  Created by David Nolen on 10/18/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "LeakyClass.h"


@implementation LeakyClass

- (id) init
{
	self = [super init];
	if (self != nil) {
		foo = [[Foo alloc] init];
	}
	return self;
}

- (void) setFoo:(Foo*)aFoo
{
	// Oops forgot to release foo!ß∫
	foo = [aFoo retain];
}

- (Foo*) foo
{
	return foo;
}

- (void) dealloc
{
	// Oop forgot to release foo!
	NSLog(@"dealloc LeakyClass");
	[super dealloc];
}


@end
