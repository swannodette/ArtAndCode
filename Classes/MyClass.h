//
//  MyClass.h
//  Classes
//
//  Created by David Nolen on 10/18/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MyClass : NSObject 
{
	NSString *name;
}

+ (id) makeANewOne:(NSString*)name;

- (id) initWithName:(NSString *)name;
- (void) setName:(NSString *)aName;
- (NSString*) name;
- (void) sayHello;
- (int) addA:(int)a toB:(int)b;

@end
