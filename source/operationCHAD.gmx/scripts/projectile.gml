/// projectile(tx,ty,v,g);

// tx - target x
// ty - target y
// v - velocity
// g - gravity

x1 = x;
y1 = y;
x2 = argument[0];
y2 = argument[1];
v = argument[2];
g = argument[3];

ox = abs(x2-x1);
oy = y1-y2;

q0 = v*v*v*v - g*(g*ox*ox + 2*oy*v*v);
if (q0 < 0)
    return(false);
q0 = sqrt(q0);

q1 = v*v + q0;
q2 = v*v - q0;

q0 = min(q1,q2);
if (q0 < 0)
    return(false);

var sx = 1;
if (x1 > x2)
    sx = -1;

theta = arctan2(q1,g*ox);
hspeed = +cos(theta)*v*sx;
vspeed = -sin(theta)*v;
gravity = g;

xprevious = x;
yprevious = y;
image_angle = point_direction(x,y,x+hspeed,y+vspeed+gravity);
return(true);
