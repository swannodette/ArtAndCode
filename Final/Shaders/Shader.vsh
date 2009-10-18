//
//  Shader.vsh
//  Final
//
//  Created by David Nolen on 10/18/09.
//  Copyright David Nolen 2009. All rights reserved.
//

attribute vec4 position;
attribute vec4 color;

varying vec4 colorVarying;

uniform float translate;

void main()
{
	gl_Position = position;
	gl_Position.y += sin(translate) / 2.0;
	
	colorVarying = color;
}
