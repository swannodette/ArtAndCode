//
//  ESRenderer.h
//  Boids
//
//  Created by David Nolen on 11/3/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import <OpenGLES/EAGL.h>
#import <OpenGLES/EAGLDrawable.h>
#import "Flock.h"

@protocol ESRenderer <NSObject>

- (void) render:(Flock*)flock;
- (BOOL) resizeFromLayer:(CAEAGLLayer *)layer;

@end
