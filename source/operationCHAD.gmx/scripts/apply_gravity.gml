switch(move_state)
    {
    case mState.walk:
    case mState.duck:
    
        // detect if we're standing on ground
        on_ground = false;
        if (place_meeting(x,y+1,par_solid))
        or ((position_meeting(bbox_left,bbox_bottom+1,par_jt) or position_meeting(bbox_right,bbox_bottom+1,par_jt))
        and (!position_meeting(bbox_left,bbox_bottom,par_jt) and !position_meeting(bbox_right,bbox_bottom,par_jt)) and yspeed >= 0)
            {
            // on the ground
            on_ground = true;
            // reset jump roll
            roll = false;
            }
        
        // gravity
        if !(on_ground)
            {
            if (yspeed > 0) and (!input_down)
                {
                var inst = instance_place(x,y,par_mb);
                if (inst != noone)
                    {
                    if (bbox_top >= inst.bbox_top)
                        {
                        move_state = mState.hang;
                        yspeed = 0;
                        
                        y = inst.bbox_top+24;
                        }
                    }
                }
            if (yspeed < 10)
                yspeed += grav;
            }
        break;
    
    case mState.hang:
        on_ground = false;
        break;
    
    case mState.climb:
        on_ground = false;
        
        if (place_meeting(x,y+1,par_solid))
        or (!place_meeting(x,y,par_jt) and place_meeting(x,y+1,par_jt) and yspeed >= 0)
        or (position_meeting(x,bbox_bottom+1,par_ramp))
            {
            // on the ground
            on_ground = true;
            // reset jump roll
            roll = false;
            }
        break;
    }
