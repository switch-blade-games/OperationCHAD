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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float crt;
uniform float wAmp;
uniform float wFreq;
uniform float time;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float scanline = 500.0;

void main()
    {
    vec4 cta = vec4(0.0);
    
    vec2 tc = vec2(v_vTexcoord.x,v_vTexcoord.y);
    tc.y += (sin(tc.x + time*wFreq)*wAmp)*0.02;
    
    if (crt >= 0.5)
        {
        // distance from the center
        float dx = abs(0.5-tc.x);
        float dy = abs(0.5-tc.y);
        // square it to smooth the edges
        dx *= dx;
        dy *= dy;
        
        tc.x -= 0.5; tc.x *= 1.0+(dy*0.15); tc.x += 0.5;
        tc.y -= 0.5; tc.y *= 1.0+(dx*0.20); tc.y += 0.5;
    
        // get texel and add in scanline
        cta = texture2D(gm_BaseTexture,vec2(tc.x,tc.y));
        cta.rgb += sin(tc.y*scanline)*0.02;
        
        // cutoff
        if(tc.y > 1.0 || tc.x < 0.0 || tc.x > 1.0 || tc.y < 0.0)
            cta = vec4(0.0);
        }
    else
        {
        cta = texture2D(gm_BaseTexture,vec2(tc.x,tc.y));
        }
    
    // apply
    gl_FragColor = v_vColour*cta;
    }
