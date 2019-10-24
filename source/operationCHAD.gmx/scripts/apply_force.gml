/// apply_force();

switch(move_state)
    {
    case mState.hang:
        if (!instance_exists(hang_id))
            {
            move_state = mState.walk;
            hang_id = noone;
            drop = true;
            break;
            }
        
        var xh = hang_offset;
        var yh = floor(lerp(hang_id.y1,hang_id.y2,xh/(hang_id.x2-hang_id.x1)))+40;
        if (!place_meeting(hang_id.x+xh,hang_id.y+yh,par_solid))
            {
            x = hang_id.x + xh;
            y = hang_id.y + yh;
            }
        else
            {
            show_debug_message("FAILHERE");
            hang_id = noone;
            }
        break;
    }
