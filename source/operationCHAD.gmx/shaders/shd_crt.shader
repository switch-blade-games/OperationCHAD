//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float xCurve;
uniform float yCurve;
uniform float scanline;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
    {
	   vec2 tc = vec2(v_vTexcoord.x,v_vTexcoord.y);
    
    // Distance from the center
    float dx = abs(0.5-tc.x);
    float dy = abs(0.5-tc.y);
    // Square it to smooth the edges
    dx *= dx;
    dy *= dy;
    
    tc.x -= 0.5; tc.x *= 1.0+(dy*xCurve); tc.x += 0.5;
    tc.y -= 0.5; tc.y *= 1.0+(dx*yCurve); tc.y += 0.5;
    
    // Get texel, and add in scanline if need be
    vec4 cta = texture2D(gm_BaseTexture,vec2(tc.x,tc.y));
    cta.rgb += sin(tc.y*scanline)*0.02;
    
    // Cutoff
	   if(tc.y > 1.0 || tc.x < 0.0 || tc.x > 1.0 || tc.y < 0.0)
        cta = vec4(0.0);
    
    // Apply
    gl_FragColor = v_vColour*cta;
    }
