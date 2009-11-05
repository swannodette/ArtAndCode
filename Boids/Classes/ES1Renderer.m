//
//  ES1Renderer.m
//  Boids
//
//  Created by David Nolen on 11/3/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "ES1Renderer.h"
#import "Flock.h"
#import "Boid.h"
#import "Vector2D.h"

@implementation ES1Renderer

GLfloat triVertices[BOID_COUNT*6];

// Create an ES 1.1 context
- (id) init
{
	if (self = [super init])
	{
		context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    
    if (!context || ![EAGLContext setCurrentContext:context])
		{
      [self release];
      return nil;
    }
		
		// Create default framebuffer object. The backing will be allocated for the current layer in -resizeFromLayer
		glGenFramebuffersOES(1, &defaultFramebuffer);
		glGenRenderbuffersOES(1, &colorRenderbuffer);
		glBindFramebufferOES(GL_FRAMEBUFFER_OES, defaultFramebuffer);
		glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
		glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, colorRenderbuffer);
	}
	
	return self;
}

- (void) render:(Flock*)flock
{
  // Replace the implementation of this method to do your own custom drawing
  
  // load the boid positions into the rendering array
  NSArray *boids = [flock boids];
  int idx = 0;
  for (Boid *b in boids) {
    Vector2D *loc = b->loc;
    Vector2D *vel = b->vel;
    Vector2D *perp = [[[[vel copy] normalize] perp] mult:2.0f];
    Vector2D *head = [[[vel copy] normalize] mult:6.0f];
    triVertices[idx++] = loc->x + perp->x;
    triVertices[idx++] = loc->y + perp->y;
    triVertices[idx++] = loc->x - perp->x;  
    triVertices[idx++] = loc->y - perp->y;
    triVertices[idx++] = loc->x + head->x;
    triVertices[idx++] = loc->y + head->y;
  }
  
	static float transY = 0.0f;
	
	// This application only creates a single context which is already set current at this point.
	// This call is redundant, but needed if dealing with multiple contexts.
  [EAGLContext setCurrentContext:context];
  
	// This application only creates a single default framebuffer which is already bound at this point.
	// This call is redundant, but needed if dealing with multiple framebuffers.
  glBindFramebufferOES(GL_FRAMEBUFFER_OES, defaultFramebuffer);
  glViewport(0, 0, backingWidth, backingHeight);
  
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glOrthof(0, 320, 0, 480, -1, 1);
  glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
  glTranslatef(0.0f, (GLfloat)(sinf(transY)*50.0f), 0.0f);
	
  glClearColor(0.5f, 0.5f, 0.5f, 1.0f);
  glClear(GL_COLOR_BUFFER_BIT);
  
  glColor4f(1.0f, 0.0f, 0.0f, 1.0f);
  
  glVertexPointer(2, GL_FLOAT, 0, triVertices);
  glEnableClientState(GL_VERTEX_ARRAY);
  
  glDrawArrays(GL_TRIANGLES, 0, 3*BOID_COUNT);
  
	// This application only creates a single color renderbuffer which is already bound at this point.
	// This call is redundant, but needed if dealing with multiple renderbuffers.
  glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
  [context presentRenderbuffer:GL_RENDERBUFFER_OES];
}

- (BOOL) resizeFromLayer:(CAEAGLLayer *)layer
{	
	// Allocate color buffer backing based on the current layer size
  glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
  [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:layer];
	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
  glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);
	
  if (glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		NSLog(@"Failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
    return NO;
  }
  
  return YES;
}

- (void) dealloc
{
	// Tear down GL
	if (defaultFramebuffer)
	{
		glDeleteFramebuffersOES(1, &defaultFramebuffer);
		defaultFramebuffer = 0;
	}
  
	if (colorRenderbuffer)
	{
		glDeleteRenderbuffersOES(1, &colorRenderbuffer);
		colorRenderbuffer = 0;
	}
	
	// Tear down context
	if ([EAGLContext currentContext] == context)
    [EAGLContext setCurrentContext:nil];
	
	[context release];
	context = nil;
	
	[super dealloc];
}

@end
