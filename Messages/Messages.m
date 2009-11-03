#include <mach/mach_time.h>
#include <stdint.h>
#import <Foundation/Foundation.h>
#import "MyClass.h"

// plain old C add
int add(int x, int y)
{
	return x + y;
}

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	MyClass *aInstance1 = [[MyClass alloc] init];
	
	// a very powerful introspection feature
	NSLog(@"aInstance1 responds to sayHello, %d", [aInstance1 respondsToSelector:@selector(sayHello)]);

	// can call a method like so
	[aInstance1 performSelector:@selector(sayHello)];
	
	// even if all you have is a string, easy to do dynamic dispatch
	[aInstance1 performSelector:NSSelectorFromString(@"sayHello")];
	
	// You can even create a class (that's availabe in your project) from a string
	MyClass *aInstance2 = [[NSClassFromString(@"MyClass") alloc] init];
	
	[aInstance2 sayGoodbye];
	
	// Method resolution is always dynamic
	// Sometimes you want to call a method directly

	int (*adder)(id, SEL, int, int);
	SEL adderSel = @selector(addX:Y:);
	NSLog(@"ainstance2 responds to addX:addY:, %d", [aInstance2 respondsToSelector:adderSel]);
	adder = (int (*)(id, SEL, int, int))[aInstance2 methodForSelector:adderSel];
	
	// Dynamic vs. Direct Call

	// Timing reference http://stackoverflow.com/questions/1615998/rudimentary-ways-to-measure-execution-time-of-a-method/1616376#1616376
  static double ticksToNanoseconds = 0.0;
	mach_timebase_info_data_t timebase;
	mach_timebase_info(&timebase);
  ticksToNanoseconds = (double)timebase.numer / timebase.denom;
	
	// Dynamic, MBP Core 2 Duo 2.5, ~10ms 
	uint64_t startTime = mach_absolute_time();
	for(int i = 0; i < 1000000; i++) {
		[aInstance2 addX:4 Y:5];
	}
	uint64_t endTime = mach_absolute_time();
	NSLog(@"1,000,000 method calls took %f nanoseconds", (endTime-startTime)*ticksToNanoseconds);

	// Direct, MBP Core 2 Duo 2.5, ~5ms
	startTime = mach_absolute_time();
	for(int i = 0; i < 1000000; i++) {
		adder(aInstance2, adderSel, 4, 5);
	}
	endTime = mach_absolute_time();
	NSLog(@"1,000,000 direct call took %f nanoseconds", (endTime-startTime)*ticksToNanoseconds);
	
	// Plain C functions, MBP Core 2 Duo 2.5, ~4ms
	startTime = mach_absolute_time();
	for(int i = 0; i < 1000000; i++) {
		add(4, 5);
	}
	endTime = mach_absolute_time();
	NSLog(@"1,000,000 simple C call took %f nanoseconds", (endTime-startTime)*ticksToNanoseconds);
	
	[pool drain];
	return 0;
}
