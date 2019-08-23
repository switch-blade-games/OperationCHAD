/// projectile(x1,y1,x2,y2,v,g);

// tx - target x
// ty - target y
// v - velocity
// g - gravity

var x1 = argument[0];
var y1 = argument[1];
var x2 = argument[2];
var y2 = argument[3];
var v = argument[4];
var g = argument[5];

a = g/2;
b = ((y2-y1) - a*(x2*x2-x1*x1))/(x2-x1);
c = -a*x1*x1 - b*x1 + y1;

var theta = darctan(2*a*x1+b);

var vx = sign(x2-x1);
var v = vx/dcos(theta);
var vy = v*dsin(theta);

gravity = g;
hspeed = vx;
vspeed = vy;

return(true);
