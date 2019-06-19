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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float scan;
uniform float curve;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
    {
    vec2 tc = vec2(v_vTexcoord.x,v_vTexcoord.y);
    
    // distance from the center
    float dx = abs(0.5-tc.x);
    float dy = abs(0.5-tc.y);
    // square it to smooth the edges
    dx *= dx;
    dy *= dy;
    
    tc.x -= 0.5; tc.x *= 1.0+(dy*(0.3*curve)); tc.x += 0.5;
    tc.y -= 0.5; tc.y *= 1.0+(dx*(0.4*curve)); tc.y += 0.5;
    
    // get texel and add in scanline
    vec4 cta = texture2D(gm_BaseTexture,vec2(tc.x,tc.y));
    
    // cutoff
    float val = abs(sin(v_vTexcoord.y*480.0)*0.6*scan);
    if(tc.y > 1.0 || tc.x < 0.0 || tc.x > 1.0 || tc.y < 0.0)
        cta = vec4(0.0,0.0,0.0,val);
    cta.rgb = mix(cta.rgb,vec3(0.0),val);
    
    // apply
    gl_FragColor = v_vColour*cta;
    }
