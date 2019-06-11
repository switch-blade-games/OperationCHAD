var h_dir = input_right-input_left;
var v_dir = input_down-input_up;

switch(move_state)
    {
    case mState.walk:
        
        if (input_lock)
            {
            move_state = mState.lock;
            break;
            }
        
        // horizontal movement input
        move_speed = MOVEspe;
        if (h_dir != 0)
            {
            xspeed = move_speed*h_dir;
            face = h_dir;
            dir = h_dir;
            
            // move left or right
            if (input_right)
                {
                var inst = instance_place(x+1,y,par_climb);
                if (!input_down) and (yspeed >= -2)
                and (inst != noone) and (inst.sides & tile_side.right == tile_side.right)
                    {
                    move_state = mState.climb;
                    yspeed = 0;
                    }
                if (input_up)
                    aim = 45;
                else
                    aim = 0;
                }
            if (input_left)
                {
                var inst = instance_place(x-1,y,par_climb);
                if (!input_down) and (yspeed >= -2)
                and (inst != noone) and (inst.sides & tile_side.left == tile_side.left)
                    {
                    move_state = mState.climb;
                    yspeed = 0;
                    }
                if (input_up)
                    aim = 135;
                else
                    aim = 180;
                }
            }
        else
            {
            if (input_up)
                aim = 90;
            else if (face > 0)
                aim = 0;
            else if (face < 0)
                aim = 180;
            
            // friction
            if (xspeed > 0)
                xspeed = max(0,xspeed-fric);
            else if (xspeed < 0)
                xspeed = min(0,xspeed+fric);
            }
        
        if (input_down_pressed
        or (input_down
        and (place_meeting(x,y+1,par_jt))
        and (!place_meeting(x,y+1,par_solid))
        and (!place_meeting(x,y-1,par_solid))))
        and (on_ground)
            {
            if (!place_meeting(x+face,y,par_climb))
                {
                move_state = mState.duck;
                mask_index = msk_player_duck;
                }
            }
        else
            {
            // jump
            if ((on_ground) or (grace_jump > 0)) and (input_jump_pressed)
                jump();
            }
        
        if (input_fire) // and ((on_ground) or (!on_ground and yspeed >= 1))
            {
            fire_weapon();
            roll = false;
            }
        break;
    
    case mState.lock:
        if (!input_lock)
            {
            if (!input_down)
                move_state = mState.walk;
            else
                {
                move_state = mState.duck;
                mask_index = msk_player_duck;
                }
            break;
            }
        
        // aim
        if (h_dir != 0)
            {
            face = h_dir;
            dir = h_dir;
            }
        if (h_dir == 0 and v_dir == 0)
            {
            if (face > 0)
                aim = 0;
            else if (face < 0)
                aim = 180;
            }
        else
            aim = point_direction(0,0,h_dir,v_dir);
        
        if (input_down)
        and (!input_left)
        and (!input_right)
        and (on_ground)
            {
            if (!place_meeting(x+face,y,par_climb))
                {
                move_state = mState.duck;
                mask_index = msk_player_duck;
                
                if (face > 0)
                    aim = 0;
                else if (face < 0)
                    aim = 180;
                }
            }
        else
            {
            // jump
            if (on_ground) and (input_jump_pressed)
                jump();
            }
        
        if (input_fire) // and ((on_ground) or (!on_ground and yspeed >= 1))
            {
            fire_weapon();
            roll = false;
            }
        
        // friction
        if (xspeed > 0)
            xspeed = max(0,xspeed-fric);
        else if (xspeed < 0)
            xspeed = min(0,xspeed+fric);
        break;
    
    case mState.duck:
        
        if (h_dir != 0)
            {
            face = h_dir;
            dir = h_dir;
            
            // move left or right
            if (input_right)
                aim = 0;
            if (input_left)
                aim = 180;
            }
        
        // friction
        if (xspeed > 0)
            xspeed = max(0,xspeed-fric);
        else if (xspeed < 0)
            xspeed = min(0,xspeed+fric);
        
        if (input_down)
            {
            // fall through one way floors
            if (input_jump_pressed)
                {
                if (on_ground)
                and (place_meeting(x,y+1,par_jt))
                and (!place_meeting(x,y+1,par_solid))
                and (!place_meeting(x,y-1,par_solid))
                    {
                    // fall through jump through platform
                    move_state = mState.walk;
                    on_ground = false;
                    grace_jump = 0;
                    roll = false;
                    
                    mask_index = msk_player;
                    y += 1;
                    }
                }
            }
        else
            {
            // stop crouching
            if (!place_meeting(x,y-1,par_solid))
                {
                move_state = mState.walk;
                mask_index = msk_player;
                }
            }
        
        if (input_fire)
            fire_weapon();
        break;
    
    case mState.hang:
        
        if (input_fire) or (input_lock)
            {
            if (input_fire)
                fire_weapon();
            
            if (input_lock)
                {
                // aim
                if (h_dir != 0)
                    {
                    face = h_dir;
                    dir = h_dir;
                    }
                if (h_dir == 0 and v_dir == 0)
                    {
                    if (face > 0)
                        aim = 0;
                    else if (face < 0)
                        aim = 180;
                    }
                else
                    aim = point_direction(0,0,h_dir,v_dir);
                }
            else
                {
                if (h_dir != 0)
                    {
                    face = h_dir;
                    dir = h_dir;
                    
                    // move left or right
                    if (input_right)
                        aim = 0;
                    if (input_left)
                        aim = 180;
                    }
                }
            
            // friction
            if (xspeed > 0)
                xspeed = max(0,xspeed-fric);
            else if (xspeed < 0)
                xspeed = min(0,xspeed+fric);
            }
        else
            {
            // horizontal movement input
            move_speed = 2;
            if (h_dir != 0)
                {
                xspeed = move_speed*h_dir;
                face = h_dir;
                dir = h_dir;
                
                // move left or right
                if (input_right)
                    aim = 0;
                if (input_left)
                    aim = 180;
                }
            else
                {
                // friction
                if (xspeed > 0)
                    xspeed = max(0,xspeed-fric);
                else if (xspeed < 0)
                    xspeed = min(0,xspeed+fric);
                }
            }
        
        grace_jump = 0;
        yspeed = 0;
        
        var i = 0;
        var inst = noone;
        while(inst == noone and i<=12)
            {
            inst = instance_position(x,(y-30)+i,par_mb);
            i += 2;
            }
        
        if (inst != noone)
            {
            if (!place_meeting(round(x+xspeed),y,par_solid))
                var xh = round(x+xspeed);
            else
                var xh = x;
            
            var yh = round(lerp(inst.y1,inst.y2,(xh-inst.x1)/(inst.x2-inst.x1)))+24;
            if (!place_meeting(x,yh,par_solid) and position_meeting(x,yh-24,par_mb))
            and (abs(y-yh) <= 16)
                y = yh;
            }
        else
            {
            move_state = mState.walk;
            roll = false;
            }
        
        if (input_down_pressed) and (!input_lock)
            {
            no_hang_time = 12;
            move_state = mState.walk;
            roll = false;
            }
        if (input_jump_pressed)
            {
            no_hang_time = 4;
            move_state = mState.walk;
            jump();
            }
        break;
    
    case mState.climb:
        
        h_dir = place_meeting(x+1,y,par_climb)-place_meeting(x-1,y,par_climb);
        if (h_dir == 0) // no longer climbing on a wall
            {
            if (!place_meeting(x+face,y,par_solid))
            and (input_up)
                x += face; // jump up onto ledge
            
            move_state = mState.walk;
            roll = false;
            }
        else
            {
            face = h_dir;
            dir = h_dir;
            
            if (input_lock)
                {
                if (h_dir == 1)
                    {
                    aim = 180;
                    if (input_left) or (input_up) or (input_down)
                        {
                        aim = point_direction(0,0,input_right-input_left,input_down-input_up);
                        aim = clamp(aim,90,270);
                        }
                    }
                if (h_dir == -1)
                    {
                    aim = 0;
                    if (input_left) or (input_up) or (input_down)
                        {
                        aim = point_direction(0,0,input_right-input_left,input_down-input_up);
                        if (aim > 90) and (aim <= 180)
                            aim = 90;
                        if (aim > 180) and (aim <= 270)
                            aim = 270;
                        }
                    }
                }
            else
                {
                // move left or right
                if (h_dir == 1)
                    aim = 180;
                else if (h_dir == -1)
                    aim = 0;
                }
            
            if (input_fire) or (input_lock)
                {
                if (input_fire)
                    fire_weapon();
                
                // friction
                if (yspeed > 0)
                    yspeed = max(0,yspeed-fric);
                else if (yspeed < 0)
                    yspeed = min(0,yspeed+fric);
                }
            else
                {
                // vertical movement input
                move_speed = 2;
                if (v_dir != 0)
                    yspeed = move_speed*v_dir;
                else
                    {
                    // friction
                    if (yspeed > 0)
                        yspeed = max(0,yspeed-fric);
                    else if (yspeed < 0)
                        yspeed = min(0,yspeed+fric);
                    }
                }
            
            // stop climbing when climbing down to floor
            if (input_down) and (on_ground)
                {
                move_state = mState.walk;
                roll = false;
                
                aim = point_direction(0,0,h_dir,0);
                }
            
            // jump/fall off
            if (input_jump_pressed)
                {
                if (input_up) // jump
                or ((input_right and h_dir == -1)
                or (input_left and h_dir == +1))
                and (!input_down)
                    {
                    move_state = mState.walk;
                    jump();
                    
                    aim = point_direction(0,0,h_dir,0);
                    }
                else if (input_down) // fall
                    {
                    move_state = mState.walk;
                    roll = false;
                    
                    aim = point_direction(0,0,h_dir,0);
                    }
                }
            }
        
        xspeed = 0;
        grace_jump = 0;
        break;
    }
