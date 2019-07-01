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
