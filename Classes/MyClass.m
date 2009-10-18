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

+ (id) makeANewOne:(NSString*)name
{
	return [[[[self class] alloc] initWithName:name] autorelease];
}

#pragma mark -
#pragma mark Instance Methods

- (id) init
{
	[self initWithName:@"nobody"];
	return self;
}

// designated initializer
- (id) initWithName:(NSString*)aName
{
	self = [super init];
	if (self != nil) {
		[self setName:aName];
	}
	return self;
}


- (void) setName:(NSString*)aName
{
	name = aName;
}


- (NSString*) name
{
	return name;
}


- (void) sayHello
{
	NSLog(@"Hello, world! This is %@ calling.", [self name]);
}


- (int) addA:(int)a toB:(int)b
{
	return a + b;
}


- (NSString*) description
{
	return [NSString stringWithFormat:@"<MyClass: %@>", [self name]];
}


- (void) dealloc
{
	[super dealloc];
}


@end
