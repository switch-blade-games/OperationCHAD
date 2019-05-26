/*
// aim and face the mouse
aim = point_direction(x,y,mouse_x,mouse_y);
aim = round(aim/45)*45;
if (mouse_x >= x)
    face = +1;
else
    face = -1;
*/

var h_dir = keyboard_check(global.key_right[0])-keyboard_check(global.key_left[0]);
var v_dir = keyboard_check(global.key_down[0])-keyboard_check(global.key_up[0]);

switch(move_state)
    {
    case mState.walk:
        
        // horizontal movement input
        move_speed = 3;
        if (h_dir != 0)
            {
            xspeed = move_speed*h_dir;
            face = h_dir;
            dir = h_dir;
            
            // move left or right
            if (keyboard_check(global.key_right[0]))
                {
                if (place_meeting(x+1,y,par_climb) and !on_ground)
                    {
                    move_state = mState.climb;
                    yspeed = 0;
                    }
                aim = 0;
                }
            if (keyboard_check(global.key_left[0]))
                {
                if (place_meeting(x-1,y,par_climb) and !on_ground)
                    {
                    move_state = mState.climb;
                    yspeed = 0;
                    }
                aim = 180;
                }
            }
        else
            {
            // friction
            if (xspeed > 0)
                xspeed = max(0,xspeed-fric);
            else if (xspeed < 0)
                xspeed = min(0,xspeed+fric);
            }
        
        if (keyboard_check(global.key_down[0]))
            {
            if (on_ground)
                {
                move_state = mState.duck;
                mask_index = msk_player_duck;
                }
            }
        else
            {
            // jump
            if (keyboard_check_pressed(global.key_up[0]))
                {
                if (on_ground) // first jump
                    jump();
                else if (double_jump) // double jump
                    {
                    double_jump = false;
                    jump();
                    }
                }
            }
        
        if (on_ground) or (!on_ground and yspeed >= 1)
            {
            if (mouse_check_button(mb_left))
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
            if (keyboard_check(global.key_right[0]))
                aim = 0;
            if (keyboard_check(global.key_left[0]))
                aim = 180;
            }
        
        // friction
        if (xspeed > 0)
            xspeed = max(0,xspeed-fric);
        else if (xspeed < 0)
            xspeed = min(0,xspeed+fric);
        
        if (keyboard_check(global.key_down[0]))
            {
            // fall through one way floors
            if (keyboard_check_pressed(global.key_up[0]))
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
        
        if (mouse_check_button(mb_left))
            fire_weapon();
        break;
    
    case mState.hang:
        
        if (mouse_check_button(mb_left))
            {
            fire_weapon();
            
            if (h_dir != 0)
                {
                face = h_dir;
                dir = h_dir;
                
                // move left or right
                if (keyboard_check(global.key_right[0]))
                    aim = 0;
                if (keyboard_check(global.key_left[0]))
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
                if (keyboard_check(global.key_right[0]))
                    aim = 0;
                if (keyboard_check(global.key_left[0]))
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
        
        if (keyboard_check_pressed(global.key_down[0]))
            {
            move_state = mState.walk;
            roll = false;
            }
        if (keyboard_check_pressed(global.key_up[0]))
            {
            move_state = mState.walk;
            jump();
            }
        break;
    
    case mState.climb:
        
        h_dir = place_meeting(x+1,y,par_climb)-place_meeting(x-1,y,par_climb);
        if (h_dir == 0)
            {
            if (!place_meeting(x+face,y,par_solid))
            and (keyboard_check(global.key_up[0]))
                x += face;
            
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
            
            if (mouse_check_button(mb_left))
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
                    {
                    yspeed = move_speed*v_dir;
                    }
                else
                    {
                    // friction
                    if (yspeed > 0)
                        yspeed = max(0,yspeed-fric);
                    else if (yspeed < 0)
                        yspeed = min(0,yspeed+fric);
                    }
                }
            
            if (keyboard_check(global.key_left[0]) and h_dir == 1)
            or (keyboard_check(global.key_right[0]) and h_dir == -1)
                {
                if (keyboard_check_pressed(global.key_up[0]))
                    {
                    move_state = mState.walk;
                    double_jump = false;
                    jump();
                    }
                else if (keyboard_check(global.key_down[0]))
                    {
                    move_state = mState.walk;
                    roll = false;
                    }
                }
            }
        break;
    }
