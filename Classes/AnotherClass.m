//
//  AnotherClass.m
//  Classes
//
//  Created by David Nolen on 10/18/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "AnotherClass.h"

#pragma mark -
#pragma mark Private Methods

@interface AnotherClass(private)
- (void) privateMethod;
@end

#pragma mark -
#pragma mark Public Methods

@implementation AnotherClass

- (void) privateMethod
{
	NSLog(@"This is a private method of %@", NSStringFromClass([self class]));
}


- (void) saySomethingElse
{
	[self privateMethod];
}

@end
