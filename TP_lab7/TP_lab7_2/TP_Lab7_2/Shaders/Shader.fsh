//
//  Shader.fsh
//  TP_Lab7_2
//
//  Created by Admin on 29.04.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
