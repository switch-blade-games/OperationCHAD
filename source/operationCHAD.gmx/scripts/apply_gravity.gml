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
            // grace jump time
            grace_jump = 8;
            // drop
            drop = false;
            // no hang
            no_hang = false;
            }
        
        // gravity
        if (on_ground)
            {
            if (place_meeting(x,y+1,par_ramp))
                {
                on_ramp = true;
                ramp_slope = 1;
                var inst = instance_place(x,y+1,par_ramp);
                if (inst != noone)
                    ramp_slope = inst.slope;
                }
            else
                on_ramp = false;
            }
        else
            {
            // start hanging
            if (yspeed > 0) and (!no_hang) and (hang_id = noone)
                {
                var i = 0;
                var inst = noone;
                while(inst == noone and i<=yspeed)
                    {
                    inst = instance_position(x,(y-42)+i,par_mb);
                    i++;
                    }
                
                if (inst != noone)
                    {
                    if (y >= inst.y)
                        {
                        var xh = (x-(inst.x));
                        var yh = round(inst.y)+floor(lerp(inst.y1,inst.y2,xh/(inst.x2-inst.x1)))+40;
                        if (!place_meeting(x,yh,par_solid) and (abs(y-yh) <= 16))
                            {
                            move_state = mState.hang;
                            hang_id = inst;
                            yspeed = 0;
                            hang_offset = xh;
                            y = yh;
                            }
                        }
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
            var temp_x = x;
            if (hang_offset < hang_id.x1) and (!place_meeting(x-2,y,par_solid))
                temp_x -= 2;
            if (hang_offset > hang_id.x2) and (!place_meeting(x+2,y,par_solid))
                temp_x += 2;
            
            var inst = instance_position(temp_x,y-40,par_mb);
            if (inst != noone) and (inst != hang_id)
                {
                var xh = round(x-(inst.x));
                var yh = round(inst.y)+floor(lerp(inst.y1,inst.y2,xh/(inst.x2-inst.x1)))+40;
                if (!place_meeting(x,yh,par_solid) and abs(y-yh) <= 16)
                    {
                    move_state = mState.hang;
                    hang_id = inst;
                    yspeed = 0;
                    hang_offset = xh;
                    y = yh;
                    }
                }
            else
                fall = true;
            }
        
        if (fall)
            {
            move_state = mState.walk;
            hang_id = noone;
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
            if (yspeed > 0) and (!no_hang) and (hang_id = noone)
                {
                var i = 0;
                var inst = noone;
                while(inst == noone and i<=yspeed)
                    {
                    inst = instance_position(x,(y-42)+i,par_mb);
                    i++;
                    }
                
                if (inst != noone)
                    {
                    if (y >= inst.y)
                        {
                        var xh = (x-(inst.x));
                        var yh = round(inst.y)+floor(lerp(inst.y1,inst.y2,xh/(inst.x2-inst.x1)))+40;
                        if (!place_meeting(x,yh,par_solid) and (abs(y-yh) <= 16))
                            {
                            move_state = mState.hang;
                            hang_id = inst;
                            yspeed = 0;
                            hang_offset = xh;
                            y = yh;
                            }
                        }
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
        if (place_meeting(x,y+1,par_solid))
        or ((position_meeting(bbox_left,bbox_bottom+1,par_jt) or position_meeting(bbox_right,bbox_bottom+1,par_jt))
        and (!position_meeting(bbox_left,bbox_bottom,par_jt) and !position_meeting(bbox_right,bbox_bottom,par_jt)) and yspeed >= 0)
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
