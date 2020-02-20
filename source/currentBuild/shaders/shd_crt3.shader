attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
    {
    vec4 object_space_pos = vec4(in_Position.x,in_Position.y,in_Position.z,1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    }
//######################_==_YOYO_SHADER_MARKER_==_######################@~const vec2 iResolution = vec2(400,240);

uniform float timer;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec3 xsample(vec2 tc)
    {
    vec3 s = pow(abs(texture2D(gm_BaseTexture,vec2(tc.x,1.0-tc.y)).rgb),vec3(2.2));
    return s;
    }

vec3 filmic(vec3 LinearColor)
    {
    vec3 x = max(vec3(0.0),LinearColor-0.004);
    return(x*(6.2*x+0.5))/(x*(6.2*x+1.7)+0.06);
    }

vec3 blur(vec2 tc, float offs)
    {
    vec4 xoffs = offs * vec4(-2.0, -1.0, 1.0, 2.0) / iResolution.x;
    vec4 yoffs = offs * vec4(-2.0, -1.0, 1.0, 2.0) / iResolution.y;
   
    vec3 color = vec3(0.0, 0.0, 0.0);
    color += xsample(tc + vec2(xoffs.x, yoffs.x)) * 0.00366;
    color += xsample(tc + vec2(xoffs.y, yoffs.x)) * 0.01465;
    color += xsample(tc + vec2(    0.0, yoffs.x)) * 0.02564;
    color += xsample(tc + vec2(xoffs.z, yoffs.x)) * 0.01465;
    color += xsample(tc + vec2(xoffs.w, yoffs.x)) * 0.00366;
    
    color += xsample(tc + vec2(xoffs.x, yoffs.y)) * 0.01465;
    color += xsample(tc + vec2(xoffs.y, yoffs.y)) * 0.05861;
    color += xsample(tc + vec2(    0.0, yoffs.y)) * 0.09524;
    color += xsample(tc + vec2(xoffs.z, yoffs.y)) * 0.05861;
    color += xsample(tc + vec2(xoffs.w, yoffs.y)) * 0.01465;
    
    color += xsample(tc + vec2(xoffs.x, 0.0)) * 0.02564;
    color += xsample(tc + vec2(xoffs.y, 0.0)) * 0.09524;
    color += xsample(tc + vec2(    0.0, 0.0)) * 0.15018;
    color += xsample(tc + vec2(xoffs.z, 0.0)) * 0.09524;
    color += xsample(tc + vec2(xoffs.w, 0.0)) * 0.02564;
    
    color += xsample(tc + vec2(xoffs.x, yoffs.z)) * 0.01465;
    color += xsample(tc + vec2(xoffs.y, yoffs.z)) * 0.05861;
    color += xsample(tc + vec2(    0.0, yoffs.z)) * 0.09524;
    color += xsample(tc + vec2(xoffs.z, yoffs.z)) * 0.05861;
    color += xsample(tc + vec2(xoffs.w, yoffs.z)) * 0.01465;
    
    color += xsample(tc + vec2(xoffs.x, yoffs.w)) * 0.00366;
    color += xsample(tc + vec2(xoffs.y, yoffs.w)) * 0.01465;
    color += xsample(tc + vec2(    0.0, yoffs.w)) * 0.02564;
    color += xsample(tc + vec2(xoffs.z, yoffs.w)) * 0.01465;
    color += xsample(tc + vec2(xoffs.w, yoffs.w)) * 0.00366;
    
    return color;
    }

float rand(vec2 co)
    {
    return fract(sin(dot(co.xy,vec2(12.9898,78.233)))*43758.5453);
    }

vec2 curve(vec2 uv)
    {
    uv = (uv-0.5)*2.0;
    uv *= 1.1;
    uv.x *= 1.0 + pow((abs(uv.y) / 5.0), 2.0);
    uv.y *= 1.0 + pow((abs(uv.x) / 4.0), 2.0);
    uv = (uv/2.0)+0.5;
    uv = uv*0.92+0.04;
    return uv;
    }

void main()
    {
    // Adjust timer a bit
    float Timer = timer*0.05;
    
    // Curve
    vec2 FragCoord = vec2(v_vTexcoord.x,v_vTexcoord.y);
    vec2 q = FragCoord.xy;
    q.y = 1.0 - q.y;
    vec2 uv = q;
    uv = mix(curve(uv),uv,0.75);
    
    // Main color, Bleed
    vec3 col;
    float x = sin(0.1*Timer+uv.y*13.0)*sin(0.23*Timer+uv.y*19.0)*sin(0.3+0.11*Timer+uv.y*23.0)*0.0012;
    float o = sin(FragCoord.y*1.5)/iResolution.x;
    x+=o*0.25;
    
    col.r = blur(vec2(x+uv.x+0.0009,uv.y+0.0009),iResolution.y/500.0).x+0.02;
    col.g = blur(vec2(x+uv.x+0.0000,uv.y-0.0011),iResolution.y/500.0).y+0.02;
    col.b = blur(vec2(x+uv.x-0.0015,uv.y+0.0000),iResolution.y/500.0).z+0.02;
    float i = clamp(col.r*0.299 + col.g*0.587 + col.b*0.114,0.0,1.0);
    
    vec3 oricol = texture2D(gm_BaseTexture,vec2(q.x,1.0-q.y)).xyz;
    col = mix(col,oricol,0.2);
    
    // Glow
    vec3 glow = (2.5*i*i)*pow(clamp(blur(vec2(x+uv.x+0.2*sin(uv.x + 10.0*Timer)*0.012,uv.y + 0.2*sin( uv.y + 7.3*Timer)*0.012),4.0)-0.3,0.0,1.0),vec3(5.0));
    glow = 0.75*clamp(glow,0.0,1.0);
    col += glow;
    
    i = 1.0-pow(abs(i),2.0);
    i = (1.0-i)*0.96+0.04;
    
    // Level adjustment (curves)
    col = clamp(col*1.7 + 1.4*col*col + 2.5*col*col*col*col*col,0.0,10.0);
    
    // Vignette
    float vig = (0.1 + 1.0*4.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y));
    vig = sqrt(vig);
    col *= vec3(vig);
    
    // Scanlines
    float scans = 0.5+clamp(0.35+0.18*sin(6.0*Timer+uv.y*iResolution.y*1.5), 0.0, 0.5);
    col = col*vec3(scans);
    
    // Vertical lines (aperture) 
    col*=1.0-0.23*vec3(clamp((mod(FragCoord.x, 2.0)-1.0)*2.0,0.0,1.0));
    
    // Flicker
    col *= 1.0+0.0017*sin(300.0*Timer);
    
    // Noise
    vec2 seed = floor(uv*iResolution.xy*0.5)/iResolution.xy;
    col *= vec3( 1.0 ) - 0.15*vec3( rand( seed+0.00001*Timer),  rand( seed+0.000011*Timer + 0.3 ),  rand( seed+0.000012*Timer+ 0.5 )  );
    
    // Tone map
    col = filmic(col);
    
    // Clamp
    if (uv.x < 0.0 || uv.x > 1.0)
        col *= 0.0;
    if (uv.y < 0.0 || uv.y > 1.0)
        col *= 0.0;
  
    gl_FragColor = vec4(col,1.0);
    }
