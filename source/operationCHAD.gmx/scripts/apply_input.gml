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
        
        if (keyboard_check(global.key_down[0]))
            {
            move_state = mState.crouch;
            mask_index = msk_player_crouch;
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
        
        if (mouse_check_button(mb_left))
            fire_weapon();
        break;
    
    case mState.crouch:
        
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
        
        if (keyboard_check(global.key_down[0]))
            {
            // fall through one way floors
            if (keyboard_check_pressed(global.key_up[0]))
                {
                if (on_ground)
                and (place_meeting(x,y+1,par_jt))
                and (!place_meeting(x,y+1,par_solid))
                    {
                    // fall through jump through platform
                    on_ground = false;
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
    }
