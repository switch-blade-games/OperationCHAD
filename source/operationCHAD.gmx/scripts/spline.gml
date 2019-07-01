/// spline(p1,p2,p3,p4,t);

var p1 = argument[0];
var p2 = argument[1];
var p3 = argument[2];
var p4 = argument[3];
var t = argument[4];

return(((-p1 + 3*p2 - 3*p3 + p4)*t*t*t + (2*p1 - 5*p2 + 4*p3 - p4)*t*t + (-p1 + p3)*t + 2*p2)/2);