#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "AnotherClass.h"

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	MyClass *instanceA = [[MyClass alloc] init];

	[instanceA sayHello];
	NSLog(@"Sum of 4 and 5: %d", [instanceA addA:4 toB:5]);
	[instanceA release];
	
	instanceA = [MyClass makeANewOne];
	NSLog(@"a new instance: %@", instanceA);
	
	// inheritance
	AnotherClass *instanceB = [AnotherClass makeANewOne];
	
	[instanceB saySomethingElse];
	// will give a compiler warning, but won't crash your code
	[instanceB privateMethod];
	
	[pool drain];
	return 0;
}
