//
//  GoodClass.h
//  Memory
//
//  Created by David Nolen on 10/18/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Foo.h"


@interface GoodClass : NSObject 
{
	Foo *foo;
}

- (void) setFoo:(Foo *)aFoo;
- (Foo*) foo;

@end
