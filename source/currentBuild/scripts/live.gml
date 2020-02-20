if (move_state == mState.dead)
    {
    // stay dead and do nothing for a bit
    if (death_timer > 0)
        death_timer--;
    else
        {
        // respawn
        life = lifemax;
        respawn_timer = respawn_time;
        block_projectiles = true;
        
        xspeed = 0;
        yspeed = 0;
        no_mb = false;
        mb_id = noone;
        
        dead_moto = false;
        if (instance_exists(motor_controller))
        or (instance_exists(sub_controller))
            dead_moto = true;
        
        if (dead_moto)
            {
            move_state = mState.moto;
            drop = false;
            
            y = moto_y;
            }
        else
            {
            move_state = mState.walk;
            drop = true;
            
            if (instance_exists(JB_cam))
                {
                if(global.P1LIVES<=0)
                    room_goto(game_over_room)
                
                if (point_in_rectangle(xstart,ystart,view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0]))
                    {
                    x = xstart;
                    y = ystart;
                    }
                else
                    {
                    x = view_xview[0]+64;
                    y = view_yview[0];
                    }
                }
            else
                {
                x = xstart;
                y = ystart;
                }
            }
        }
    }
else
    {
    if (life > 0)
        {
        // respawn flash
        if (respawn_timer > 0)
            {
            respawn_timer--;
            
            // invulnerability/flash
            if (respawn_timer > 0)
                {
                if (respawn_timer mod flash_rate == 0)
                    respawn_flash = !respawn_flash;
                take_damage = false;
                }
            else
                {
                take_damage = true;
                respawn_flash = false;
                }
            }
        }
    else
        {
        // die
        global.P1LIVES--;
        death_timer = death_time;
        block_projectiles = false;
        
        // player dead state and knockback
        move_state = mState.dead;
        on_ground = false;
        xspeed = choose(-2,2);
        yspeed = -8;
        
        // screen flash
        if (instance_exists(obj_shader))
            obj_shader.flash = 3;
        }
    }
