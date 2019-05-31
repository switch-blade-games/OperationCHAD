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

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const vec2 res = vec2(400.0,240.0);

// scanline hardness (-8.0 = soft, -16.0 = medium)
const float hardScan = -8.0;

// pixel hardness (-2.0 = soft, -4.0 = hard)
const float hardPix = -3.0;

// display warp (0.0 = none, 1.0/8.0 = extreme)
const vec2 warp = vec2(0.0,0.0); // vec2(1.0/32.0,1.0/24.0);

//------------------------------------------------------------------------

// nearest emulated sample given floating point position and texel offset (offscreen is black)
vec3 Fetch(vec2 pos,vec2 off)
    {
    pos = pos+off;
    if (max(abs(pos.x-0.5),abs(pos.y-0.5))>0.5)
        return(vec3(0.0,0.0,0.0));
    return(texture2D(gm_BaseTexture,pos.xy).rgb);
    }

// emulated pixel-distance to nearest texel
vec2 Dist(vec2 pos)
   {
    pos = pos*res;
   return(-((pos-floor(pos))-vec2(0.5)));
   }
    
// 1D Gaussian
float Gaus(float pos,float scale)
   {
   return(exp2(scale*pos*pos));
   }

// 3-tap horizontal Gaussian filter
vec3 Horz3(vec2 pos,float off)
   {
   vec3 B=Fetch(pos,vec2(-1.0,off));
   vec3 C=Fetch(pos,vec2( 0.0,off));
   vec3 D=Fetch(pos,vec2( 1.0,off));
   float dst=Dist(pos).x;
   
   float scale=hardPix;
   float wB=Gaus(dst-1.0,scale);
   float wC=Gaus(dst+0.0,scale);
   float wD=Gaus(dst+1.0,scale);
   return((B*wB+C*wC+D*wD)/(wB+wC+wD));
   }

// 5-tap horizontal Gaussian filter
vec3 Horz5(vec2 pos,float off)
   {
   vec3 A = Fetch(pos,vec2(-2.0,off));
   vec3 B = Fetch(pos,vec2(-1.0,off));
   vec3 C = Fetch(pos,vec2( 0.0,off));
   vec3 D = Fetch(pos,vec2( 1.0,off));
   vec3 E = Fetch(pos,vec2( 2.0,off));
   float dst = Dist(pos).x;
   
   float scale = hardPix;
   float wA = Gaus(dst-2.0,scale);
   float wB = Gaus(dst-1.0,scale);
   float wC = Gaus(dst+0.0,scale);
   float wD = Gaus(dst+1.0,scale);
   float wE = Gaus(dst+2.0,scale);
   return((A*wA+B*wB+C*wC+D*wD+E*wE)/(wA+wB+wC+wD+wE));
   }

// scanline weight
float Scan(vec2 pos,float off)
   {
   float dst = Dist(pos).y;
   return(Gaus(dst+off,hardScan));
   }

// allow nearest three lines to effect pixel
vec3 Tri(vec2 pos)
   {
   vec3 A = Horz3(pos,-1.0);
   vec3 B = Horz5(pos, 0.0);
   vec3 C = Horz3(pos, 1.0);
   float wA = Scan(pos,-1.0);
   float wB = Scan(pos, 0.0);
   float wC = Scan(pos, 1.0);
   return(A*wA+B*wB+C*wC);
   }

// screen/scanline distortion
vec2 Warp(vec2 pos)
    {
    pos = pos*2.0-1.0;    
    pos *= vec2(1.0+(pos.y*pos.y)*warp.x,1.0+(pos.x*pos.x)*warp.y);
    return(pos*0.5+0.5);
    }

void main()
    {
    gl_FragColor.rgb = Tri(Warp(v_vTexcoord.xy));
    gl_FragColor.a = 1.0;
    }
