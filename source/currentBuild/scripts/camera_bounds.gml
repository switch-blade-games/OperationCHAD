/// camera_bounds(left,top,right,bottom);

var _x1 = 0;
var _y1 = 0;
var _x2 = room_width;
var _y2 = room_height;

if (argument_count > 0)
    _x1 = argument[0];
if (argument_count > 1)
    _y1 = argument[1];
if (argument_count > 2)
    _x2 = argument[2];
if (argument_count > 3)
    _y2 = argument[3];

with(obj_camera)
    {
    cam_x1 = _x1;
    cam_y1 = _y1;
    cam_x2 = _x2;
    cam_y2 = _y2;
    }
