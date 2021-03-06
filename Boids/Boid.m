//
//  Boid.m
//  Boids
//
//  Created by David Nolen on 11/3/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "Boid.h"
#import "Vector2D.h"
#import "Flock.h"

@implementation Boid

- (Boid*) init
{
  return [self initWithLocation:nil maxSpeed:2.0f maxForce:0.05f];
}


- (Boid*) initWithLocation:(Vector2D*)aloc maxSpeed:(float)ms maxForce:(float)mf
{
  self = [super init];
  if(nil != self)
  {
    if(nil == loc)
    {
      loc = [[Vector2D randomInside:CGRectMake(0, 0, 320, 480)] retain];
    }
    else 
    {
      loc = [aloc retain];
    }
    // fix this
    vel = [[Vector2D randomInside:CGRectMake(-1, -1, 2, 2)] retain];
    acc = [[Vector2D zero] retain];
    maxSpeed = ms;
    maxForce = mf;
    size = BOID_SIZE;
  }
  return self;
}


- (void) update
{
  [[vel add:acc] limit:maxSpeed];
  [loc add:vel];
  if(loc->x < 0)
  {
    loc->x += 320;
  }
  if(loc->x > 320)
  {
    loc->x -= 320;
  }
  if(loc->y < 0)
  {
    loc->y += 480;
  }
  if(loc->y > 480)
  {
    loc->y -= 480;
  }
  [acc zero];
}


- (Vector2D*) steer:(Vector2D*)target slowDown:(BOOL)slowDown
{
  Vector2D *desired = [Vector2D sub:target with:loc];
  float d = [desired length];
  if (d > 0.0f) 
  {
    if(slowDown && d < 100.0f)
    {
      return [[[[desired normalize] mult:(maxSpeed * (d / 100.0f))] sub:vel] limit:maxForce];
    }
    else 
    {
      return [[[[desired normalize] mult:maxSpeed] sub:vel] limit:maxForce];
    }
  }
  return [Vector2D zero];
}


- (Vector2D*) cohesion:(NSArray*)boids
{
  float nhood = 100.0f;
  int count = 0;
  Vector2D *result = [Vector2D zero];
  for(Boid *b in boids)
  {
    float d = [[Vector2D sub:loc with:b->loc] length];
    if(d > 0 && d < nhood)
    {
      count++;
      [result add:b->loc];
    }
  }
  if(count > 0)
  {
    return [self steer:[result div:count] slowDown:NO];
  }
  return result;
}


- (Vector2D*) alignment:(NSArray*)boids
{
  float nhood = 50.0f;
  int count = 0;
  Vector2D *result = [Vector2D zero];
  for(Boid *b in boids)
  {
    if(b != self)
    {
      float d = [[Vector2D sub:loc with:b->loc] length];
      if(d > 0.0f && d < nhood)
      {
        count++;
        [result add:vel];
      }
    }
  }
  if(count > 0)
  {
    return [[result div:count] limit:maxForce];
  }
  return result;
}


- (Vector2D*) separation:(NSArray*)boids
{
  float dsep = 25.0f;
  Vector2D *result = [Vector2D zero];
  int count = 0;
  for(Boid *b in boids)
  {
    if(b != self)
    {
      float d = [[Vector2D sub:loc with:b->loc] length];
      if (d > 0.0f && d < dsep) 
      {
        count++;
        [result add:[[[Vector2D sub:loc with:b->loc] normalize] div:d]];
      }
    }
  }
  if (count > 0) 
  {
    return [result div:count];
  }
  return result;
}


- (NSString*) description
{
  return [NSString stringWithFormat:@"Boid loc:%@ vel:%@ acc:%@", loc, vel, acc];
}


- (void) dealloc
{
  [loc release];
  loc = nil;
  [vel release];
  vel = nil;
  [acc release];
  acc = nil;
  [super dealloc];
}


@end
