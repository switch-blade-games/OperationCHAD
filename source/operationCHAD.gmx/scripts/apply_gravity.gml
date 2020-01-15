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
            no_mb = false;
            
            // sfx
            if (land_sfx)
                {
                land_sfx = false;
                snd_play(choose(snd_land_stone_1,snd_land_stone_2,snd_land_stone_3),0.1,0.25);
                }
            }
        
        // gravity
        if (on_ground)
            on_ramp = detect_ramp;
        else
            {
            // start hanging
            if (detect_mb) and (mb_id == noone) and (yspeed > 0)
                {
                var temp_mb = detect_mb_id;
                
                var x1 = temp_mb.x+temp_mb.x1;
                var x2 = temp_mb.x+temp_mb.x2;
                var y1 = temp_mb.y+temp_mb.y1;
                var y2 = temp_mb.y+temp_mb.y2;
                var len = temp_mb.len;
                var amt = (x-min(x1,x2))/max(1,abs(x2-x1));
                var yto = round(lerp(ternary(x1<x2,y1,y2),ternary(x1<x2,y2,y1),amt));
                var off = round(ternary(x1<x2,amt*len,len-(amt*len)));
                
                if (off >= 0) and (off <= len) and (abs(y-(yto+32)) <= 10)
                and (!place_meeting(x,yto+32,par_solid))
                    {
                    move_state = mState.mb;
                    y = yto+32;
                    mb_id = temp_mb;
                    mb_offset = off;
                    mb_sign = ternary(x1<x2,+1,-1);
                    xspeed = 0;
                    yspeed = 0;
                    }
                }
            if (yspeed < fall_speed)
                yspeed += grav;
            
            // sfx
            land_sfx = true;
            }
        break;
    
    case mState.mb:
        var fall = false;
        if (!instance_exists(mb_id))
            fall = true;
        else if (mb_offset < 0) or (mb_offset > mb_id.len)
            {
            fall = true;
            
            // move to position
            var x1 = mb_id.x+mb_id.x1;
            var x2 = mb_id.x+mb_id.x2;
            var y1 = mb_id.y+mb_id.y1;
            var y2 = mb_id.y+mb_id.y2;
            var ldx = lengthdir_x(mb_offset,mb_id.dir);
            var ldy = lengthdir_y(mb_offset,mb_id.dir);
            if (!place_meeting(round(x1+ldx),round(y1+ldy)+32,par_solid))
                {
                x = round(x1+ldx);
                y = round(y1+ldy)+32;
                mb_sign = ternary(x2>=x1,+1,-1);
                }
            
            var temp_mb = collision_line(x,y-28,x,y-40,par_mb,true,true);
            if (temp_mb != noone)
                {
                var x1 = temp_mb.x+temp_mb.x1;
                var x2 = temp_mb.x+temp_mb.x2;
                var y1 = temp_mb.y+temp_mb.y1;
                var y2 = temp_mb.y+temp_mb.y2;
                var len = temp_mb.len;
                var amt = (x-min(x1,x2))/max(1,abs(x2-x1));
                var yto = round(lerp(ternary(x1<x2,y1,y2),ternary(x1<x2,y2,y1),amt));
                var off = round(ternary(x1<x2,amt*len,len-(amt*len)));
                
                if (off >= 0) and (off <= len) and (abs(y-(yto+32)) <= 10)
                and (!place_meeting(x,yto+32,par_solid))
                    {
                    move_state = mState.mb;
                    y = yto+32;
                    mb_id = temp_mb;
                    mb_offset = off;
                    mb_sign = ternary(x1<x2,+1,-1);
                    xspeed = 0;
                    yspeed = 0;
                    fall = false;
                    }
                }
            }
        
        if (fall)
            {
            move_state = mState.walk;
            mb_id = noone;
            no_mb_time = 12;
            drop = true;
            }
        
        yspeed = 0;
        grace_jump = 0;
        on_ground = false;
        break;
    
    case mState.wc:
        on_ground = false;
        if (place_meeting(x,y+1,par_solid))
        or (!place_meeting(x,y,par_jt) and place_meeting(x,y+1,par_jt) and yspeed >= 0)
        or (position_meeting(x,bbox_bottom+1,par_ramp))
            {
            // on the ground
            on_ground = true;
            // no hang
            no_mb = false;
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
            no_mb = false;
            }
        else
            {
            // start hanging
            if (detect_mb) and (mb_id = noone) and (yspeed > 0)
                {
                var temp_mb = detect_mb_id;
                var xh = x-(temp_mb.x);
                var yh = floor(lerp(temp_mb.y1,temp_mb.y2,xh/(temp_mb.x2-temp_mb.x1)))+40;
                if (!place_meeting(temp_mb.x+xh,temp_mb.y+yh,par_solid))
                    {
                    move_state = mState.mb;
                    x = temp_mb.x + xh;
                    y = temp_mb.y + yh;
                    mb_id = temp_mb;
                    mb_offset = xh;
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
