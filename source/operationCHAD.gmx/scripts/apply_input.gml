/*
aim = point_direction(x,y,mouse_x,mouse_y);
aim = round(aim/45)*45;
if (mouse_x >= x)
    face = +1;
else
    face = -1;
*/

var h_dir = input_right-input_left;
var v_dir = input_down-input_up;

switch(move_state)
    {
    case mState.walk:
        
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
            if (on_ground) and (input_jump_pressed)
                jump();
            }
        
        if (on_ground) or (!on_ground and yspeed >= 1)
            {
            if (input_fire)
                {
                fire_weapon();
                roll = false;
                }
            }
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
        
        if (input_fire)
            {
            fire_weapon();
            
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
        
        yspeed = 0;
        
        var i = 0;
        var inst = instance_position(x,(y-26)+i,par_mb);
        while(inst == noone and i<12)
            i++;
        
        if (inst != noone)
            {
            var yh = round(lerp(inst.y1,inst.y2,(x-inst.x1)/(inst.x2-inst.x1)))+24;
            if (!place_meeting(x,yh,par_solid))
                y = yh;
            }
        else
            {
            move_state = mState.walk;
            roll = false;
            }
        
        if (input_down_pressed)
            {
            move_state = mState.walk;
            roll = false;
            }
        if (input_jump_pressed)
            {
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
            
            // move left or right
            if (h_dir == 1)
                aim = 180;
            else if (h_dir == -1)
                aim = 0;
            
            if (input_fire)
                {
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
        break;
    }
