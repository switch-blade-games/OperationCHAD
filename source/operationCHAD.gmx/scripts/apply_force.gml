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
        
        var yh = round(hang_id.y)+floor(lerp(hang_id.y1,hang_id.y2,hang_offset/(hang_id.x2-hang_id.x1)))+40;
        if (!place_meeting(hang_id.x+hang_offset,yh,par_solid))
            {
            x = hang_id.x + hang_offset;
            y = yh;
            }
        else
            hang_id = noone;
        break;
    }
