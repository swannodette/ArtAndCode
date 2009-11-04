//
//  Flock.h
//  Boids
//
//  Created by David Nolen on 11/3/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BOID_COUNT 100

@interface Flock : NSObject {
  int count;
}

- (void) initCount:(int)count;

- (void) update;
- (void) render;

@end