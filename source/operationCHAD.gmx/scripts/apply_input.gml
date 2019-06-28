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
            dir = h_dir;
            
            // move left or right
            if (input_right)
                {
                var inst = instance_place(x+1,y,par_climb);
                if (!input_down) and (yspeed >= -2)
                and (inst != noone) and (inst.sides & tile_side.left == tile_side.left)
                    {
                    move_state = mState.climb;
                    yspeed = 0;
                    }
                if (input_up)
                    aim = 45;
                else
                    {
                    if (input_down)
                        aim = 315;
                    else
                        aim = 0;
                    }
                }
            if (input_left)
                {
                var inst = instance_place(x-1,y,par_climb);
                if (!input_down) and (yspeed >= -2)
                and (inst != noone) and (inst.sides & tile_side.right == tile_side.right)
                    {
                    move_state = mState.climb;
                    yspeed = 0;
                    }
                if (input_up)
                    aim = 135;
                else
                    {
                    if (input_down)
                        aim = 225;
                    else
                        aim = 180;
                    }
                }
            }
        else
            {
            if (input_up)
                aim = 90;
            else if (dir > 0)
                aim = 0;
            else if (dir < 0)
                aim = 180;
            
            // friction
            if (xspeed > 0)
                xspeed = max(0,xspeed-fric);
            else if (xspeed < 0)
                xspeed = min(0,xspeed+fric);
            }
        
        if (input_down) and (on_ground)
            {
            if (h_dir == 0) and (!place_meeting(x+dir,y,par_solid))
                {
                move_state = mState.duck;
                mask_index = msk_player_duck;
                }
            }
        
        if (!on_ground) and (input_up)
            {
            var inst = instance_place(x,y-1,par_climb);
            if (!input_down) and (yspeed <= 0)
            and (inst != noone) and (inst.sides & tile_side.bottom == tile_side.bottom)
                {
                move_state = mState.climb;
                yspeed = 0;
                }
            }
        
        // jump
        if ((on_ground) or (grace_jump > 0)) and (input_jump_pressed) and (!input_down)
            jump();
        
        if (input_fire)
            fire_weapon();
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
            dir = h_dir;
        if (h_dir == 0 and v_dir == 0)
            {
            if (dir > 0)
                aim = 0;
            else if (dir < 0)
                aim = 180;
            }
        else
            aim = point_direction(0,0,h_dir,v_dir);
        
        if (input_down)
        and (!input_left)
        and (!input_right)
        and (on_ground)
            {
            if (!place_meeting(x+dir,y,par_climb))
                {
                move_state = mState.duck;
                mask_index = msk_player_duck;
                
                if (dir > 0)
                    aim = 0;
                else if (dir < 0)
                    aim = 180;
                }
            }
        else
            {
            // jump
            if (on_ground) and (input_jump_pressed)
                jump();
            }
        
        if (input_fire)
            fire_weapon();
        
        // friction
        if (xspeed > 0)
            xspeed = max(0,xspeed-fric);
        else if (xspeed < 0)
            xspeed = min(0,xspeed+fric);
        break;
    
    case mState.duck:
        
        if (h_dir != 0)
            {
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
            
            // aim
            if (h_dir != 0)
                dir = h_dir;
            if (h_dir == 0 and v_dir == 0)
                {
                if (dir > 0)
                    aim = 0;
                else if (dir < 0)
                    aim = 180;
                }
            else
                aim = point_direction(0,0,h_dir,v_dir);
            
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
            inst = instance_position(x,(y-46)+i,par_mb);
            i += 2;
            }
        
        if (inst != noone)
            {
            if (!place_meeting(round(x+xspeed),y,par_solid))
                var xh = round(x+xspeed);
            else
                var xh = x;
            
            var yh = floor(lerp(inst.y1,inst.y2,(xh-inst.x1)/(inst.x2-inst.x1)))+40;
            if (!place_meeting(x,yh,par_solid) and position_meeting(x,yh-40,par_mb))
            and (abs(y-yh) <= 16)
                y = yh;
            }
        else
            move_state = mState.walk;
        
        if (input_jump_pressed)
            {
            if (input_down)
                {
                if (!input_lock)
                    {
                    no_hang_time = 12;
                    move_state = mState.walk;
                    }
                }
            else
                {
                no_hang_time = 4;
                move_state = mState.walk;
                jump();
                }
            }
        break;
    
    case mState.climb:
        
        climb_side = tile_side.none;
        var inst = instance_place(x-1,y,par_climb);
        if (inst != noone) and (inst.sides & tile_side.right == tile_side.right)
            climb_side += tile_side.right;
        var inst = instance_place(x+1,y,par_climb);
        if (inst != noone) and (inst.sides & tile_side.left == tile_side.left)
            climb_side += tile_side.left;
        var inst = instance_place(x,y-1,par_climb);
        if (inst != noone) and (inst.sides & tile_side.bottom == tile_side.bottom)
            climb_side += tile_side.bottom;
        
        if ((climb_side & tile_side.bottom == tile_side.bottom) and (!input_fire)
        and ((climb_side & tile_side.left == 0 and input_right) or (climb_side & tile_side.right == 0 and input_left)))
            climb_side = tile_side.bottom;
        /*
        if ((climb_side & tile_side.right == tile_side.right) and (input_left or input_down))
            climb_side = tile_side.right;
        if ((climb_side & tile_side.left == tile_side.left) and (input_right or input_down))
            climb_side = tile_side.left;
        */
        
        if (climb_side == tile_side.none) // no longer climbing on a wall
            {
            /*
             // jump up onto ledge
            if (!place_meeting(x+face,y,par_solid))
            and (input_up)
                x += face;
            */
            move_state = mState.walk;
            }
        else
            {
            // face away from wall you are climbing on
            if (climb_side & tile_side.right == tile_side.right)
                dir = -1;
            else if (climb_side & tile_side.left == tile_side.left)
                dir = 1;
            else if (climb_side == tile_side.bottom)
                {
                // face in direction of movement
                if (h_dir != 0)
                    dir = h_dir;
                }
            
            if (input_lock) or (input_fire)
                {
                // friction
                if (xspeed > 0)
                    xspeed = max(0,xspeed-fric);
                else if (xspeed < 0)
                    xspeed = min(0,xspeed+fric);
                if (yspeed > 0)
                    yspeed = max(0,yspeed-fric);
                else if (yspeed < 0)
                    yspeed = min(0,yspeed+fric);
                
                // aim
                if (climb_side & tile_side.right == tile_side.right)
                    {
                    aim = 0;
                    if (input_up) or (input_down)
                        {
                        aim = point_direction(0,0,input_right-input_left,input_down-input_up);
                        if (climb_side & tile_side.bottom == tile_side.bottom)
                            {
                            if (aim < 180)
                                aim = 0;
                            else if (aim >= 180) and (aim < 270)
                                aim = 270;
                            }
                        else
                            {
                            if (aim > 90) and (aim <= 180)
                                aim = 90;
                            if (aim > 180) and (aim <= 270)
                                aim = 270;
                            }
                        }
                    }
                else if (climb_side & tile_side.left == tile_side.left)
                    {
                    aim = 180;
                    if (input_up) or (input_down)
                        {
                        aim = point_direction(0,0,input_right-input_left,input_down-input_up);
                        if (climb_side & tile_side.bottom == tile_side.bottom)
                            aim = clamp(aim,180,270);
                        else
                            aim = clamp(aim,90,270);
                        }
                    }
                else if (climb_side == tile_side.bottom)
                    {
                    aim = point_direction(0,0,dir,0);
                    if (h_dir != 0) or (input_down)
                        aim = point_direction(0,0,input_right-input_left,input_down);
                    }
                
                if (input_fire)
                    fire_weapon();
                }
            else
                {
                // move and aim
                if (climb_side & tile_side.right == tile_side.right)
                or (climb_side & tile_side.left == tile_side.left)
                    {
                    xspeed = 0;
                    
                    // aim
                    if (climb_side & tile_side.right == tile_side.right)
                        aim = 180;
                    else if (climb_side & tile_side.left == tile_side.left)
                        aim = 0;
                    
                    // vertical movement
                    if (v_dir == 0)
                        {
                        // friction
                        if (yspeed > 0)
                            yspeed = max(0,yspeed-fric);
                        else if (yspeed < 0)
                            yspeed = min(0,yspeed+fric);
                        }
                    else
                        {
                        move_speed = 2;
                        yspeed = move_speed*v_dir;
                        }
                    
                    // jump/fall off
                    if (input_jump_pressed)
                    or (on_ground and (input_down or ((climb_side & tile_side.right == tile_side.right) and input_right) or ((climb_side & tile_side.left == tile_side.left) and input_left)))
                        {
                        move_state = mState.walk;
                        aim = point_direction(0,0,dir,0);
                        
                        if (!on_ground)
                        and (input_up or ((climb_side & tile_side.right == tile_side.right) and input_right and !input_left) or ((climb_side & tile_side.left == tile_side.left) and input_left and !input_right))
                        and (!input_down) and (!place_meeting(x,y-1,par_solid))
                            jump();
                        }
                    }
                else if (climb_side == tile_side.bottom)
                    {
                    yspeed = 0;
                    
                    // horizontal movement
                    if (h_dir == 0)
                        {
                        // friction
                        if (xspeed > 0)
                            xspeed = max(0,xspeed-fric);
                        else if (xspeed < 0)
                            xspeed = min(0,xspeed+fric);
                        }
                    else
                        {
                        move_speed = 2;
                        xspeed = move_speed*h_dir;
                        if (dir > 0)
                            aim = 0;
                        else if (dir < 0)
                            aim = 180;
                        }
                    
                    // fall off
                    if (input_jump_pressed and !input_up)
                    or (input_down and on_ground)
                        {
                        move_state = mState.walk;
                        aim = point_direction(0,0,dir,0);
                        }
                    }
                }
            }
        
        grace_jump = 0;
        break;
    
    case mState.dead:
        if (on_ground)
            {
            // friction
            if (xspeed > 0)
                xspeed = max(0,xspeed-fric);
            else if (xspeed < 0)
                xspeed = min(0,xspeed+fric);
            }
        break;
    }
