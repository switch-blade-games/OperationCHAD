/// animation();
switch(move_state)
    {
    case mState.idle:
    case mState.walk:
    case mState.lock:
        if (on_ground)
            {
            if (abs(xspeed) > 0)
                {
                if (anim_state != aState.walk)
                    {
                    anim_state = aState.walk;
                    img_index[doll.legs] = 0;
                    }
                
                img_index[doll.legs] += 0.2;
                if (img_index[doll.legs] >= 10)
                    img_index[doll.legs] = 0;
                else if (img_index[doll.legs] < 0)
                    img_index[doll.legs] = 9;
                }
            else
                {
                if (anim_state != aState.idle)
                    {
                    anim_state = aState.idle;
                    img_index[doll.legs] = 0;
                    }
                }
            
            if (input_fire)
                {
                img_index[doll.arms] += 0.2;
                if (img_index[doll.arms] >= 2)
                    img_index[doll.arms] = 0;
                }
            else
                img_index[doll.arms] = 0;
            }
        else
            {
            if (drop)
                {
                if (anim_state != aState.drop)
                    {
                    anim_state = aState.drop;
                    img_index[doll.legs] = 0;
                    }
                }
            else
                {
                if (anim_state != aState.roll)
                    {
                    anim_state = aState.roll
                    img_index[doll.full] = 0;
                    }
                }
            
            if (anim_state == aState.drop)
                {
                if (input_fire)
                    {
                    img_index[doll.arms] += 0.2;
                    if (img_index[doll.arms] >= 2)
                        img_index[doll.arms] = 0;
                    }
                else
                    img_index[doll.arms] = 0;
                }
            if (anim_state == aState.roll)
                {
                img_index[doll.full] += 0.3;
                if (img_index[doll.full] >= 4)
                    img_index[doll.full] = 0;
                else if (img_index[doll.full] < 0)
                    img_index[doll.full] = 3;
                }
            }
        break;
    
    case mState.duck:
        if (anim_state != aState.duck)
            {
            anim_state = aState.duck;
            
            if (on_ramp)
                img_index[doll.legs] = 0;
            else
                img_index[doll.full] = 0;
            }
        
        if (on_ramp)
            {
            if (input_fire)
                {
                img_index[doll.arms] += 0.2;
                if (img_index[doll.arms] >= 2)
                    img_index[doll.arms] = 0;
                }
            else
                img_index[doll.arms] = 0;
            }
        else
            {
            if (input_fire)
                {
                img_index[doll.full] += 0.2;
                if (img_index[doll.full] >= 2)
                    img_index[doll.full] = 0;
                }
            else
                img_index[doll.full] = 0;
            }
        break;
    
    case mState.hang:
        if (abs(xspeed) > 0)
            {
            if (anim_state != aState.hang_move)
                {
                anim_state = aState.hang_move;
                img_index[doll.full] = 0;
                }
            
            img_index[doll.full] += 0.2;
            if (img_index[doll.full] >= 4)
                img_index[doll.full] = 0;
            else if (img_index[doll.full] < 0)
                img_index[doll.full] = 3;
            }
        else
            {
            if (anim_state != aState.hang)
                anim_state = aState.hang;
            
            if (input_fire)
                {
                img_index[doll.arms] += 0.2;
                if (img_index[doll.arms] >= 2)
                    img_index[doll.arms] = 0;
                }
            else
                img_index[doll.arms] = 0;
            }
        break;
    
    case mState.climb:
        if (climb_side == tile_side.bottom)
            {
            if (abs(xspeed) > 0)
                {
                if (anim_state != aState.hang_move)
                    {
                    anim_state = aState.hang_move;
                    img_index[doll.full] = 0;
                    }
                
                img_index[doll.full] += 0.2;
                if (img_index[doll.full] >= 4)
                    img_index[doll.full] = 0;
                else if (img_index[doll.full] < 0)
                    img_index[doll.full] = 3;
                }
            else
                {
                if (anim_state != aState.hang)
                    anim_state = aState.hang;
                
                if (input_fire)
                    {
                    img_index[doll.arms] += 0.2;
                    if (img_index[doll.arms] >= 2)
                        img_index[doll.arms] = 0;
                    }
                else
                    img_index[doll.arms] = 0;
                }
            }
        else
            {
            if (abs(yspeed) > 0)
                {
                if (anim_state != aState.climb_move)
                    {
                    anim_state = aState.climb_move;
                    img_index[doll.full] = 0;
                    }
                
                img_index[doll.full] += 0.2;
                if (img_index[doll.full] >= 4)
                    img_index[doll.full] = 0;
                else if (img_index[doll.full] < 0)
                    img_index[doll.full] = 3;
                }
            else
                {
                if (anim_state != aState.climb)
                    anim_state = aState.climb;
                
                if (input_fire)
                    {
                    img_index[doll.arms] += 0.2;
                    if (img_index[doll.arms] >= 2)
                        img_index[doll.arms] = 0;
                    }
                else
                    img_index[doll.arms] = 0;
                }
            }
        break;
    
    case mState.moto:
        if (on_moto)
            {
            if (input_fire)
                {
                if (anim_state != aState.moto_fire)
                    {
                    anim_state = aState.moto_fire;
                    img_index[doll.arms] = 0;
                    }
                
                if (anim_state == aState.moto_fire)
                    {
                    img_index[doll.arms] += 0.2;
                    if (img_index[doll.arms] >= 2)
                        img_index[doll.arms] = 0;
                    }
                }
            else
                {
                if (anim_state != aState.moto)
                    {
                    anim_state = aState.moto;
                    img_index[doll.full] = 0;
                    }
                
                if (anim_state == aState.moto)
                    {
                    img_index[doll.full] += 0.2;
                    if (img_index[doll.full] >= 2)
                        img_index[doll.full] = 0;
                    }
                }
            }
        else
            {
            if (anim_state != aState.roll)
                {
                anim_state = aState.roll
                img_index[doll.full] = 0;
                }
            
            if (anim_state == aState.roll)
                {
                img_index[doll.full] += 0.3;
                if (img_index[doll.full] >= 4)
                    img_index[doll.full] = 0;
                else if (img_index[doll.full] < 0)
                    img_index[doll.full] = 3;
                }
            }
        
        img_index[doll.back] = 0;
        img_index[doll.moto] += 0.2;
        if (img_index[doll.moto] >= 2)
            img_index[doll.moto] = 0;
        break;
    
    case mState.dead:
        if (anim_state != aState.dead)
            {
            anim_state = aState.dead;
            img_index[doll.full] = 0;
            }
        
        if (on_ground)
            img_index[doll.full] = 0;
        else
            {
            img_index[doll.full] += 0.3;
            if (img_index[doll.full] >= 4)
                img_index[doll.full] = 0;
            else if (img_index[doll.full] < 0)
                img_index[doll.full] = 3;
            }
        break;
    }

paperdoll_clear();

switch(anim_state)
    {
    case aState.idle:
    case aState.walk:
        gun_y = -18;
        
        // legs
        if (anim_state == aState.idle)
            {
            if (on_ramp)
                {
                if (dir > 0)
                    {
                    if (ramp_slope > 0)
                        paperdoll(doll.legs,skin_spr.leg_idle_r,1);
                    else if (ramp_slope < 0)
                        paperdoll(doll.legs,skin_spr.leg_idle_l,-1);
                    }
                else if (dir < 0)
                    {
                    if (ramp_slope > 0)
                        paperdoll(doll.legs,skin_spr.leg_idle_l,1);
                    else if (ramp_slope < 0)
                        paperdoll(doll.legs,skin_spr.leg_idle_r,-1);
                    }
                }
            else
                paperdoll(doll.legs,skin_spr.leg_idle,dir);
            }
        else if (anim_state == aState.walk)
            paperdoll(doll.legs,skin_spr.leg_walk,dir);
        
        // arms
        paperdoll(doll.arms,skin_spr.arm_0 + floor(aim/45),dir);
        break;
    
    case aState.drop:
        gun_y = -18;
        
        paperdoll(doll.legs,skin_spr.leg_drop,dir);
        paperdoll(doll.arms,skin_spr.arm_0 + floor(aim/45),dir);
        break;
    
    case aState.roll:
        gun_y = -18;
        
        paperdoll(doll.full,skin_spr.full_roll,dir);
        if (move_state == mState.moto)
            {
            if (on_moto)
                paperdoll(doll.back,skin_spr.extra_arm_moto,1);
            paperdoll(doll.moto,skin_spr.extra_moto,1);
            }
        break;
    
    case aState.duck:
        if (on_ramp)
            {
            gun_y = -18;
            
            // legs
            if (dir > 0)
                {
                if (ramp_slope > 0)
                    paperdoll(doll.legs,skin_spr.leg_duck_r,1);
                else if (ramp_slope < 0)
                    paperdoll(doll.legs,skin_spr.leg_duck_l,-1);
                }
            else if (dir < 0)
                {
                if (ramp_slope > 0)
                    paperdoll(doll.legs,skin_spr.leg_duck_l,1);
                else if (ramp_slope < 0)
                    paperdoll(doll.legs,skin_spr.leg_duck_r,-1);
                }
            
            // arms
            paperdoll(doll.arms,skin_spr.arm_0 + floor(aim/45),dir);
            }
        else
            {
            gun_y = -6;
            
            paperdoll(doll.full,skin_spr.full_duck,dir);
            }
        break;
    
    case aState.hang:
        gun_y = -18;
        
        paperdoll(doll.legs,skin_spr.leg_hang,dir);
        paperdoll(doll.arms,skin_spr.arm_single_0 + floor(aim/45),dir);
        break;
    
    case aState.hang_move:
        paperdoll(doll.full,skin_spr.full_hang,dir);
        break;
    
    case aState.climb:
        gun_y = -18;
        
        paperdoll(doll.legs,skin_spr.leg_climb,dir);
        paperdoll(doll.arms,skin_spr.arm_climb_0 + floor(aim/45),dir);
        break;
    
    case aState.climb_move:
        paperdoll(doll.full,skin_spr.full_climb,dir);
        break;
    
    case aState.moto:
        paperdoll(doll.full,skin_spr.full_moto,1);
        paperdoll(doll.back,skin_spr.extra_arm_moto,1);
        paperdoll(doll.moto,skin_spr.extra_moto,1);
        break;
    
    case aState.moto_fire:
        gun_y = -18;
        
        paperdoll(doll.legs,skin_spr.leg_moto,1);
        paperdoll(doll.arms,skin_spr.arm_climb_0 + floor(aim/45),1);
        break;
    
    case aState.dead:
        if (on_ground)
            paperdoll(doll.full,skin_spr.full_dead_down,dir);
        else
            paperdoll(doll.full,skin_spr.full_dead_roll,dir);
        break;
    }
