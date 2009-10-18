#import <Foundation/Foundation.h>
#import "MyClass.h"

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	MyClass *myInstance = [[MyClass alloc] init];

	[myInstance sayHello];
	NSLog(@"Sum of 4 and 5: %d", [myInstance addA:4 toB:5]);
	[myInstance release];
	
	myInstance = [MyClass makeANewOne];
	NSLog(@"a new instance: %@", myInstance);
	[myInstance release];
	
	[pool drain];
	return 0;
}
