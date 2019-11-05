/// camera_setup(x,y,state,target);

// all arguments are optional!

var _cx = 200;
var _cy = 120;
var _state = camState.static;
var _target = noone;

if (argument_count > 0)
    var _cx = argument[0];
if (argument_count > 1)
    var _cy = argument[1];
if (argument_count > 2)
    var _state = argument[2];
if (argument_count > 3)
    var _target = argument[3];

var inst = instance_create(_cx,_cy,obj_camera);

with(inst)
    {
    cam_state = _state;
    target = _target;
    
    var _temp_lerp = cam_lerp;
    cam_lerp = 1;
    event_user(0);
    event_user(1);
    cam_lerp = _temp_lerp;
    }
