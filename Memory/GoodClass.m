//
//  GoodClass.m
//  Memory
//
//  Created by David Nolen on 10/18/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "GoodClass.h"


@implementation GoodClass

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
	[foo release];
	foo = [aFoo retain];
}

- (Foo*) foo
{
	return foo;
}

- (void) dealloc
{
	[foo dealloc];
	foo = nil;
	NSLog(@"dealloc GoodClass");
	[super dealloc];
}


@end
