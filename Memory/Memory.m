#import <Foundation/Foundation.h>
#import "GoodClass.h"
#import "LeakyClass.h"

int main (int argc, const char * argv[]) {
	// Create an autorelease pool
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	GoodClass *objectA = [[GoodClass alloc] init]; // retain count 1
	
	NSLog(@"objectA retain count: %d", [objectA retainCount]);
	[objectA release];
	
	LeakyClass *objectB = [[LeakyClass alloc] init]; // retain count 1
	NSLog(@"objectB retain count: %d", [objectB retainCount]);
	[objectB release];
	
	GoodClass *objectC = [[[GoodClass alloc] init] autorelease];
	NSLog(@"objectC retain count: %d", [objectB retainCount]);
	
	// alloc, new, retain, copy - usually means you need to do a manual release
	// many objects in Objective-C are autoreleased, if you need them beyond
	// the scope of the current function you will need to retain them as well
	// release them whenever you are finaly done with them.
	
	NSArray *ary = [NSArray arrayWithObjects:@"one", @"two", @"three", nil]; // retain count 1, this is an autoreleased object, will be released automatically alter
	NSArray *cpy = [ary copy]; // retain count 1, won't be autoreleased
	NSArray *new = [NSArray new]; // short cut for [[NSArray alloc] init], retain count 1, won't be autoreleased
	
	// send release to any object set to be autoreleased
	NSLog(@"BEFORE");
	NSLog(@"ary retain count: %d", [ary retainCount]);
	NSLog(@"cpy retain count: %d", [cpy retainCount]);
	NSLog(@"new retain count: %d", [new retainCount]);
	
	NSLog(@"DRAIN");
	[pool drain]; // objectC will get release automatically here
	
	NSLog(@"AFTER");
	NSLog(@"ary retain count: %d", [ary retainCount]); // these three objects won't be released most likely because they use their own autorelease pools
	NSLog(@"cpy retain count: %d", [cpy retainCount]);
	NSLog(@"new retain count: %d", [new retainCount]);
	return 0;
}
