attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
    {
    vec4 object_space_pos = vec4(in_Position.x,in_Position.y,in_Position.z,1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    }

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float time;
uniform float warp;
uniform float xAmp;
uniform float xFreq;
uniform float yAmp;
uniform float yFreq;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
    {
    vec2 tc = vec2(v_vTexcoord.x,v_vTexcoord.y);
    tc.x += cos(tc.y + time*xFreq)*(xAmp*warp);
    tc.y += sin(tc.x + time*yFreq)*(yAmp*warp);
    
    // apply
    gl_FragColor = v_vColour*texture2D(gm_BaseTexture,vec2(tc.x,tc.y));
    }
