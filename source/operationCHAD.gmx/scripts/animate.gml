// animation
switch(move_state)
    {
    case mState.idle:
    case mState.walk:
    case mState.lock:
        if (on_ground)
            {
            if (abs(x-xpre) > 0)
                {
                if (anim_state != aState.walk)
                    {
                    anim_state = aState.walk;
                    leg_index = 0;
                    }
                
                leg_index += 0.2;
                if (leg_index >= 10)
                    leg_index = 0;
                else if (leg_index < 0)
                    leg_index = 9;
                }
            else
                {
                if (anim_state != aState.idle)
                    {
                    anim_state = aState.idle;
                    leg_index = 0;
                    }
                }
            
            if (input_fire)
                {
                arm_index += 0.2;
                if (arm_index >= 2)
                    arm_index = 0;
                }
            else
                arm_index = 0;
            }
        else
            {
            if (drop)
                {
                if (anim_state != aState.drop)
                    {
                    anim_state = aState.drop;
                    leg_index = 0;
                    }
                }
            else
                {
                if (anim_state != aState.roll)
                    {
                    anim_state = aState.roll
                    full_index = 0;
                    }
                }
            
            if (anim_state == aState.drop)
                {
                if (input_fire)
                    {
                    arm_index += 0.2;
                    if (arm_index >= 2)
                        arm_index = 0;
                    }
                else
                    arm_index = 0;
                }
            if (anim_state == aState.roll)
                {
                full_index += 0.3;
                if (full_index >= 4)
                    full_index = 0;
                else if (full_index < 0)
                    full_index = 3;
                }
            }
        break;
    
    case mState.duck:
        if (anim_state != aState.duck)
            {
            anim_state = aState.duck;
            
            if (on_ramp)
                leg_index = 0;
            else
                full_index = 0;
            }
        
        if (on_ramp)
            {
            if (input_fire)
                {
                arm_index += 0.2;
                if (arm_index >= 2)
                    arm_index = 0;
                }
            else
                arm_index = 0;
            }
        else
            {
            if (input_fire)
                {
                full_index += 0.2;
                if (full_index >= 2)
                    full_index = 0;
                }
            else
                full_index = 0;
            }
        break;
    
    case mState.hang:
        if (anim_state != aState.hang)
            anim_state = aState.hang;
        
        if (input_fire)
            {
            arm_index += 0.2;
            if (arm_index >= 2)
                arm_index = 0;
            }
        else
            arm_index = 0;
        break;
    
    case mState.climb:
        if (climb_side == tile_side.bottom)
            {
            if (anim_state != aState.hang)
                anim_state = aState.hang;
            }
        else if (anim_state != aState.climb)
            anim_state = aState.climb;
        
        if (input_fire)
            {
            arm_index += 0.2;
            if (arm_index >= 2)
                arm_index = 0;
            }
        else
            arm_index = 0;
        break;
    
    case mState.bike:
        if (on_bike)
            {
            if (anim_state != aState.bike)
                {
                anim_state = aState.bike;
                leg_index = 1;
                
                if (input_fire)
                    {
                    arm_index += 0.2;
                    if (arm_index >= 2)
                        arm_index = 0;
                    }
                else
                    arm_index = 0;
                }
            }
        else
            {
            if (anim_state != aState.roll)
                {
                anim_state = aState.roll
                full_index = 0;
                }
            
            if (anim_state == aState.roll)
                {
                full_index += 0.3;
                if (full_index >= 4)
                    full_index = 0;
                else if (full_index < 0)
                    full_index = 3;
                }
            }
        break;
    
    case mState.dead:
        if (anim_state != aState.dead)
            {
            anim_state = aState.dead;
            full_index = 0;
            }
        
        if (on_ground)
            {
            full_index = 0;
            }
        else
            {
            full_index += 0.3;
            if (full_index >= 4)
                full_index = 0;
            else if (full_index < 0)
                full_index = 3;
            }
        break;
    }

switch(anim_state)
    {
    case aState.idle:
    case aState.walk:
        gun_y = -18;
        leg_y = 0;
        arm_y = 0;
        leg_dir = dir;
        arm_dir = dir;
        
        full_sprite = false;
        if (anim_state == aState.idle)
            {
            if (on_ramp)
                {
                leg_y = 7;
                arm_y = 2;
                leg_dir = sign(ramp_slope);
                
                if (dir > 0)
                    {
                    if (ramp_slope > 0)
                        leg_sprite_index = sprite[skin_spr.leg_idle_r];
                    else if (ramp_slope < 0)
                        leg_sprite_index = sprite[skin_spr.leg_idle_l];
                    }
                else if (dir < 0)
                    {
                    if (ramp_slope > 0)
                        leg_sprite_index = sprite[skin_spr.leg_idle_l];
                    else if (ramp_slope < 0)
                        leg_sprite_index = sprite[skin_spr.leg_idle_r];
                    }
                }
            else
                leg_sprite_index = sprite[skin_spr.leg_idle];
            }
        else if (anim_state == aState.walk)
            leg_sprite_index = sprite[skin_spr.leg_walk];
        arm_sprite_index = sprite[skin_spr.arm_0 + floor(aim/45)];
        break;
    
    case aState.drop:
        gun_y = -18;
        leg_y = 2;
        arm_y = 0;
        leg_dir = dir;
        arm_dir = dir;
        
        full_sprite = false;
        leg_sprite_index = sprite[skin_spr.leg_drop];
        arm_sprite_index = sprite[skin_spr.arm_0 + floor(aim/45)];
        break;
    
    case aState.roll:
        gun_y = -18;
        full_dir = dir;
        
        full_sprite = true;
        full_sprite_index = sprite[skin_spr.full_roll];
        break;
    
    case aState.duck:
        if (on_ramp)
            {
            gun_y = -18;
            leg_y = 7;
            arm_y = 6;
            leg_dir = sign(ramp_slope);
            arm_dir = dir;
            
            full_sprite = false;
            if (dir > 0)
                {
                if (ramp_slope > 0)
                    leg_sprite_index = sprite[skin_spr.leg_duck_r];
                else if (ramp_slope < 0)
                    leg_sprite_index = sprite[skin_spr.leg_duck_l];
                }
            else if (dir < 0)
                {
                if (ramp_slope > 0)
                    leg_sprite_index = sprite[skin_spr.leg_duck_l];
                else if (ramp_slope < 0)
                    leg_sprite_index = sprite[skin_spr.leg_duck_r];
                }
            arm_sprite_index = sprite[skin_spr.arm_0 + floor(aim/45)];
            }
        else
            {
            gun_y = -6;
            full_dir = dir;
            
            full_sprite = true;
            full_sprite_index = sprite[skin_spr.full_duck];
            }
        break;
    
    case aState.hang:
        gun_y = -18;
        leg_y = 0;
        arm_y = 0;
        leg_dir = dir;
        arm_dir = dir;
        
        full_sprite = false;
        leg_sprite_index = sprite[skin_spr.leg_hang];
        arm_sprite_index = sprite[skin_spr.arm_single_0 + floor(aim/45)];
        break;
    
    case aState.climb:
        gun_y = -18;
        leg_y = 0;
        arm_y = 0;
        leg_dir = -dir;
        arm_dir = -dir;
        
        full_sprite = false;
        leg_sprite_index = sprite[skin_spr.leg_hang];
        arm_sprite_index = sprite[skin_spr.arm_single_0 + floor(aim/45)];
        break;
    
    case aState.bike:
        gun_y = -10;
        leg_y = 0;
        arm_y = 0;
        leg_dir = 1;
        arm_dir = dir;
        
        full_sprite = false;
        leg_sprite_index = sprite[skin_spr.leg_walk];
        arm_sprite_index = sprite[skin_spr.arm_single_0 + floor(aim/45)];
        break;
    
    case aState.dead:
        full_dir = dir;
        
        full_sprite = true;
        if (on_ground)
            full_sprite_index = sprite[skin_spr.full_dead_down];
        else
            full_sprite_index = sprite[skin_spr.full_dead_roll];
        break;
    }
