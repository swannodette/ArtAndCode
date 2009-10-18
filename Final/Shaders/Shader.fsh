//
//  Shader.fsh
//  Final
//
//  Created by David Nolen on 10/18/09.
//  Copyright David Nolen 2009. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
	gl_FragColor = colorVarying;
}
