#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	// ====================
	// Dictionaries
	// ====================

	NSLog(@"----------------------");
	NSLog(@"Dictionaries");
	NSLog(@"----------------------");

	NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"bar", @"foo", nil];
	NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"bar", @"foo", nil];
	
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
	
	NSLog(@"----------------------");
	NSLog(@"Arrays");
	NSLog(@"----------------------");

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
	// Sets
	// ====================
	
	NSLog(@"----------------------");
	NSLog(@"Sets");
	NSLog(@"----------------------");
	
	NSArray *ary5 = [NSArray arrayWithObjects:@"bird", @"dog", @"cat", @"bird", @"zebra", @"lion", nil];
	NSArray *ary6 = [NSArray arrayWithObjects:@"bird", @"dog", @"cat", @"bird", @"zebra", @"lion", nil];
	NSSet *set1 = [NSSet setWithArray:ary5];
	
	NSLog(@"%@", set1);
	
	// ====================
	// Equality
	// ====================
	
	NSLog(@"----------------------");
	NSLog(@"Equality");
	NSLog(@"----------------------");

	// BOOL Objective-C type
	// YES == 1
	// NO == 0
	NSLog(@"ary5 == ary6 %d", [ary5 isEqual:ary6]);
		
	// ====================
	// Arbitrary Keys
	// ====================

	NSLog(@"----------------------");
	NSLog(@"Arbitrary Keys");
	NSLog(@"----------------------");
	
	NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"complex key", set1, nil];
	NSSet *set2 = [NSSet setWithObjects:@"lion", @"dog", @"cat", @"bird", @"bird", @"zebra", nil];

	NSLog(@"%@", [dict3 objectForKey:set2]);
	
	// ====================
	// Iteration
	// ====================

	NSLog(@"----------------------");
	NSLog(@"Iteration");
	NSLog(@"----------------------");
	
	NSArray *ary3 = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", @"five", @"size", @"seven", @"eight", @"nine", @"ten", nil];
	
	// old school
	for(int i = 0; i < [ary3 count]; i++) {
		//NSLog(@"%@", [ary3 objectAtIndex:i]);
	}
	
	// new school
	for(NSString *str in ary3) {
		//NSLog(@"%@", str);
	}
	
	// dictionary enumeration
	NSArray *keys = [NSArray arrayWithObjects:@"first", @"middle", @"last", nil];
	NSArray *values = [NSArray arrayWithObjects:@"Bob", @"Howard", @"Smith", nil];
	NSDictionary *dict4 = [NSDictionary dictionaryWithObjects:values forKeys:keys];
	for(id key in dict4) {
		NSLog(@"%@ = %@", key, [dict4 objectForKey:key]);
	}
	
	[pool drain];
	return 0;
}
