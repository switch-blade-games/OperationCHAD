/// detect();

// detect ground
detect_ground = false;
if (place_meeting(x,y+1,par_solid))
or ((position_meeting(bbox_left,bbox_bottom+1,par_jt) or position_meeting(bbox_right,bbox_bottom+1,par_jt))
and (!position_meeting(bbox_left,bbox_bottom,par_jt) and !position_meeting(bbox_right,bbox_bottom,par_jt)) and yspeed >= 0)
    detect_ground = true;

// detect ramp
detect_ramp = false;
ramp_id = noone;
if (detect_ground)
    {
    ramp_id = instance_place(x,y+1,par_ramp);
    if (ramp_id != noone)
        {
        detect_ramp = true;
        ramp_slope = ramp_id.slope;
        }
    }

// detect monkey bar
detect_mb = false;
mb_id = noone;
if (!no_hang) and (no_hang_time <= 0)
    {
    if (move_state == mState.hang)
        {
        mb_id = instance_position(x,y-40,par_mb);
        if (mb_id != noone)
            detect_mb = true;
        }
    else
        {
        mb_id = collision_line(x,y-36,x,y-42,par_mb,true,true);
        if (mb_id != noone)
            detect_mb = true;
        }
    }

// detect climbable walls
detect_climb = false;
climb_side = tile_side.none;
var temp_id = instance_place(x+1,y,par_climb);
if (temp_id != noone) and (temp_id.sides & tile_side.left == tile_side.left)
    {
    detect_climb = true;
    climb_side += tile_side.left;
    }
var temp_id = instance_place(x-1,y,par_climb);
if (temp_id != noone) and (temp_id.sides & tile_side.right == tile_side.right)
    {
    detect_climb = true;
    climb_side += tile_side.right;
    }
var temp_id = instance_place(x,y-1,par_climb);
if (temp_id != noone) and (temp_id.sides & tile_side.bottom == tile_side.bottom)
    {
    detect_climb = true;
    climb_side += tile_side.bottom;
    }
