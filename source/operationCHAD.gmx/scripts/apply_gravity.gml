switch(move_state)
    {
    case mState.walk:
    case mState.duck:
    
        // detect if we're standing on ground
        on_ground = false;
        if (detect_ground)
            {
            // on the ground
            on_ground = true;
            // grace jump time
            grace_jump = 8;
            // drop
            drop = false;
            // no hang
            no_hang = false;
            }
        
        // gravity
        if (on_ground)
            on_ramp = detect_ramp;
        else
            {
            // start hanging
            if (detect_mb) and (hang_id == noone) and (yspeed > 0)
                {
                var xh = x-mb_id.x;
                var yh = floor(lerp(mb_id.y1,mb_id.y2,xh/(mb_id.x2-mb_id.x1)))+40;
                if (!place_meeting(mb_id.x+xh,mb_id.y+yh,par_solid))
                    {
                    move_state = mState.hang;
                    x = mb_id.x + xh;
                    y = mb_id.y + yh;
                    hang_id = mb_id;
                    hang_offset = xh;
                    yspeed = 0;
                    }
                }
            if (yspeed < fall_speed)
                yspeed += grav;
            }
        break;
    
    case mState.hang:
        var fall = false;
        if (!instance_exists(hang_id))
            fall = true;
        else if (hang_offset < hang_id.x1) or (hang_offset > hang_id.x2)
            {
            fall = true;
            var temp_x = hang_id.x+hang_offset;
            var inst = collision_line(temp_x,y-36,temp_x,y-42,par_mb,true,true);
            if (inst != noone)
                {
                var xh = temp_x-inst.x;
                var yh = floor(lerp(inst.y1,inst.y2,xh/(inst.x2-inst.x1)))+40;
                if (!place_meeting(inst.x+xh,inst.y+yh,par_solid))
                    {
                    move_state = mState.hang;
                    x = inst.x + xh;
                    y = inst.y + yh;
                    hang_id = inst;
                    hang_offset = xh;
                    yspeed = 0;
                    
                    fall = false;
                    }
                }
            }
        
        
        if (fall)
            {
            move_state = mState.walk;
            hang_id = noone;
            no_hang_time = 12;
            drop = true;
            }
        
        yspeed = 0;
        grace_jump = 0;
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
            // no hang
            no_hang = false;
            }
        break;
    
    case mState.moto:
        // player gravity
        on_moto = false;
        if (y >= moto_y)
            {
            on_moto = true;
            y = moto_y;
            yspeed = 0;
            // no hang
            no_hang = false;
            }
        else
            {
            // start hanging
            if (detect_mb) and (hang_id = noone) and (yspeed > 0)
                {
                var xh = x-(mb_id.x);
                var yh = floor(lerp(mb_id.y1,mb_id.y2,xh/(mb_id.x2-mb_id.x1)))+40;
                if (!place_meeting(mb_id.x+xh,mb_id.y+yh,par_solid))
                    {
                    move_state = mState.hang;
                    x = mb_id.x + xh;
                    y = mb_id.y + yh;
                    hang_id = mb_id;
                    hang_offset = xh;
                    yspeed = 0;
                    }
                }
            if (yspeed < fall_speed)
                yspeed += grav;
            }
        
        // moto gravity
        if (moto_y >= global.moto_floor)
            {
            moto_y = global.moto_floor;
            moto_yspeed = 0;
            }
        else
            {
            if (moto_yspeed < fall_speed)
                moto_yspeed += grav;
            }
        
        moto_y += moto_yspeed;
        break;
    
    case mState.dead:
        // detect if we're standing on ground
        on_ground = false;
        if (detect_ground)
            {
            // on the ground
            on_ground = true;
            // grace jump time
            grace_jump = 8;
            }
        
        // gravity
        if (!on_ground) and (yspeed < fall_speed)
            yspeed += grav;
        break;
    }

if (grace_jump > 0)
    grace_jump--;
