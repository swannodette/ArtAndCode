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


- (Vector2D*) steer:(Boid*)target slowDown:(BOOL)slowDown
{
  Vector2D *desired = [Vector2D sub:target->loc with:loc];
  float d = [desired length];
  if (d > 0.0f) 
  {
    if(slowDown && d < 100.0f)
    {
      [[[[desired normalize] mult:(maxSpeed * (d / 100.0f))] sub:vel] limit:maxForce];
    }
    else 
    {
      [[[[desired normalize] mult:maxSpeed] sub:vel] limit:maxForce];
    }
  }
}


- (Vector2D*) cohesion:(Flock*)flock
{
  
}


- (Vector2D*) alignment:(Flock*)flock
{
  
}


- (Vector2D*) separate:(Flock*)flock
{
  
}

@end
