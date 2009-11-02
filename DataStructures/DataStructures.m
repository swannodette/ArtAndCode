#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	// ====================
	// Dictinaries
	// ====================
	
	NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"foo", @"bar", nil];
	NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"foo", @"bar", nil];
	
	@try {
		[dict1 setValue:@"baz" forKey:@"foo"];
	}
	@catch (NSException * e) {
		NSLog(@"Oops %@", e);
	}
	
	[dict2 setValue:@"baz" forKey:@"foo"];
	
	NSLog(@"%@", dict2);
	
	// ====================
	// Arrays
	// ====================
	
	NSArray *ary1 = [NSArray arrayWithObjects:@"item1", [NSDate date], dict2, nil];
	NSMutableArray *ary2 = [NSMutableArray arrayWithObjects:@"item1", [NSDate date], dict2, nil];
	
	@try {
		[ary1 removeObjectAtIndex:0];
	}
	@catch (NSException * e) {
		NSLog(@"Oops %@", e);
	}

	[ary2 removeObjectAtIndex:0];
	
	// ====================
	// Iteration
	// ====================
	
	NSArray *ary3 = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", @"five", @"size", @"seven", @"eight", @"nine", @"ten", nil];
	
	// old school
	for(int i = 0; i < [ary3 count]; i++) {
		NSLog(@"%@", [ary3 objectAtIndex:i]);
	}
	
	// new school
	for(NSString *str in ary3) {
		NSLog(@"%@", str);
	}
	
	
	
	[pool drain];
	return 0;
}
