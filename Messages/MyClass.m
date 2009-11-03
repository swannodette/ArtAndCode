//
//  MyClass.m
//  Messages
//
//  Created by David Nolen on 11/2/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "MyClass.h"


@implementation MyClass

- (void) sayHello
{
	NSLog(@"Hello, world!");
}

- (void) sayGoodbye
{
	// _cmd and self are two invisible arguments available from any method
	NSLog(@"method %@ from %@", NSStringFromSelector(_cmd), self);
}

- (int) addX:(int)x Y:(int)y
{
	return x + y;
}

@end
