//
//  Flock.m
//  Boids
//
//  Created by David Nolen on 11/3/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "Flock.h"
#import "Boid.h"
#import "Vector2D.h"

@implementation Flock

- (Flock*) init
{
  return [self initWithCount:BOID_COUNT];
}

- (Flock*) initWithCount:(int)n
{
  self = [super init];
  if(nil != self)
  {
    boids = [NSMutableArray new];
    for(int i = 0; i < n; i++)
    {
      [boids addObject:[[Boid alloc] init]];
    }
  }
  return self;
}


- (void) update
{
  // could optimize the following by calculating distances upfront
  for(Boid *b in boids)
  {
    Vector2D *sep = [b separation:boids];
    Vector2D *ali = [b alignment:boids];
    Vector2D *coh = [b cohesion:boids];
    [[[b->acc add:sep] add:ali] add:coh];
    [b update];
  }
}


- (NSArray*) boids
{
  return boids;
}

@end
