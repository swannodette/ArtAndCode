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
      loc = [Vector2D randomInside:CGRectMake(0, 0, 320, 480)];
    }
    else 
    {
      loc = aloc;
    }
    vel = [Vector2D randomInside:CGRectMake(-1, -1, 2, 2)];
    acc = [Vector2D zero];
    maxSpeed = ms;
    maxForce = mf;
    size = 2.0f;
  }
  return self;
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


- (Vector2D*) cohesion:(Flock*)flock
{
  float nhood = 100.0f;
  int count = 0;
  Vector2D *result = [Vector2D zero];
  for(Boid *b in [flock boids])
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


- (Vector2D*) alignment:(Flock*)flock
{
  float nhood = 50.0f;
  int count = 0;
  Vector2D *result = [Vector2D zero];
  for(Boid *b in [flock boids])
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


- (Vector2D*) separation:(Flock*)flock
{
  float dsep = 25.0f;
  Vector2D *result = [Vector2D zero];
  int count = 0;
  for(Boid *b in [flock boids])
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

@end
