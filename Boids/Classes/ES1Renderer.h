//
//  ES1Renderer.h
//  Boids
//
//  Created by David Nolen on 11/3/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "ESRenderer.h"

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@interface ES1Renderer : NSObject <ESRenderer>
{
@private
	EAGLContext *context;
	
	// The pixel dimensions of the CAEAGLLayer
	GLint backingWidth;
	GLint backingHeight;
	
	// The OpenGL names for the framebuffer and renderbuffer used to render to this view
	GLuint defaultFramebuffer, colorRenderbuffer;
}

- (void) render:(Flock*)flock;
- (BOOL) resizeFromLayer:(CAEAGLLayer *)layer;

@end
