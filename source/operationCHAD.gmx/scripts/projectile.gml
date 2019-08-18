/// projectile(x1,y1,x2,y2,grav,angle);

// initial position
var px = argument[0];
var py = argument[1];
// target position
var tx = argument[2];
var ty = argument[3];
// gravity
var g = argument[4];
// angle
var ang = degtorad(argument[5]);

var dis = point_distance(px,py,tx,ty);
return((1 / cos(ang)) * sqrt((g*0.5 * sqr(dis)) / (dis * tan(ang) + (py - ty))));

