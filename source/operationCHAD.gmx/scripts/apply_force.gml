/// apply_force();

switch(move_state)
    {
    case mState.mb:
        if (!instance_exists(mb_id))
            {
            move_state = mState.walk;
            mb_id = noone;
            drop = true;
            break;
            }
        
        var xh = mb_offset;
        var yh = floor(lerp(mb_id.y1,mb_id.y2,xh/(mb_id.x2-mb_id.x1)))+40;
        if (!place_meeting(mb_id.x+xh,mb_id.y+yh,par_solid))
            {
            x = mb_id.x + xh;
            y = mb_id.y + yh;
            }
        else
            mb_id = noone;
        break;
    }
