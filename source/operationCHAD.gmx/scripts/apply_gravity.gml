switch(move_state)
    {
    case mState.walk:
    case mState.duck:
    case mState.lock:
    
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
            // grace jump time
            grace_jump = 2;
            }
        
        // gravity
        if !(on_ground)
            {
            if (yspeed > 0) and (!input_down) and (no_hang_time == 0)
                {
                var i = 0;
                var inst = noone;
                while(inst == noone and i<=12)
                    {
                    inst = instance_position(x,(y-30)+i,par_mb);
                    i += 2;
                    }
                
                if (inst != noone)
                    {
                    if (y >= inst.y)
                        {
                        var yh = round(lerp(inst.y1,inst.y2,(x-inst.x1)/(inst.x2-inst.x1)))+24;
                        if (!place_meeting(x,yh,par_solid) and position_meeting(x,yh-24,par_mb))
                        and (abs(y-yh) <= 16)
                            {
                            move_state = mState.hang;
                            yspeed = 0;
                            y = yh;
                            }
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

if (no_hang_time > 0)
    no_hang_time--;
if (grace_jump > 0)
    grace_jump--;
