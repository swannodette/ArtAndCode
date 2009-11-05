//
//  Boid.h
//  Boids
//
//  Created by David Nolen on 11/3/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vector2D;
@class Flock;

@interface Boid : NSObject {
@public  
  Vector2D *loc;
  Vector2D *acc;
  Vector2D *vel;

@private
  float    size;
  float    maxSpeed;
  float    maxForce;
}

- (Boid*) initWithLocation:(Vector2D*)aloc maxSpeed:(float)ms maxForce:(float)mf;

- (void) update;

- (Vector2D*) steer:(Vector2D*)target slowDown:(BOOL)slowDown;

- (Vector2D*) cohesion:(NSArray*)flock;
- (Vector2D*) alignment:(NSArray*)flock;
- (Vector2D*) separation:(NSArray*)flock;

@end
