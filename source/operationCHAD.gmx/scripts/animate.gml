/// animation();

switch(move_state)
    {
    case mState.idle:
        if (on_ramp)
            {
            if (anim_state != aState.idle_ramp)
                {
                anim_state = aState.idle_ramp;
                img_index = 0;
                }
            }
        else
            {
            if (anim_state != aState.idle)
                {
                anim_state = aState.idle;
                img_index = 0;
                }
            }
        break;
    
    case mState.walk:
        if (on_ground)
            {
            if (anim_state != aState.walk)
                {
                anim_state = aState.walk;
                img_index = 0;
                }
            }
        else
            {
            if (anim_state != aState.roll)
                {
                anim_state = aState.roll;
                img_index = 0;
                }
            }
        break;
    
    case mState.duck:
        if (on_ramp)
            {
            if (anim_state != aState.duck_ramp)
                {
                anim_state = aState.duck_ramp;
                img_index = 0;
                }
            }
        else
            {
            if (anim_state != aState.duck)
                {
                anim_state = aState.duck;
                img_index = 0;
                }
            }
        break;
    
    case mState.mb:
        if (input_fire)
            {
            if (anim_state != aState.mb_fire)
                {
                anim_state = aState.mb_fire;
                img_index = 0;
                }
            }
        else
            {
            if (anim_state != aState.mb)
                {
                anim_state = aState.mb;
                img_index = 0;
                }
            }
        break;
    
    case mState.wc:
        if (wc_side == tile_side.bottom)
            {
            if (input_fire)
                {
                if (anim_state != aState.mb_fire)
                    {
                    anim_state = aState.mb_fire;
                    img_index = 0;
                    }
                }
            else
                {
                if (anim_state != aState.mb)
                    {
                    anim_state = aState.mb;
                    img_index = 0;
                    }
                }
            }
        else
            {
            if (input_fire)
                {
                if (anim_state != aState.wc_fire)
                    {
                    anim_state = aState.wc_fire;
                    img_index = 0;
                    }
                }
            else
                {
                // climbing but not shooting
                if (anim_state != aState.wc)
                    {
                    anim_state = aState.wc;
                    img_index = 0;
                    }
                }
            }
        break;
    
    case mState.moto:
        if (on_moto)
            {
            if (anim_state != aState.moto)
                {
                anim_state = aState.moto;
                img_index = 0;
                }
            
            /*
            if (input_fire)
                {
                if (anim_state != aState.moto_fire)
                    {
                    anim_state = aState.moto_fire;
                    img_index = 0;
                    }
                }
            else
                {
                if (anim_state != aState.moto)
                    {
                    anim_state = aState.moto;
                    img_index = 0;
                    }
                }
            */
            }
        else
            {
            if (anim_state != aState.roll)
                {
                anim_state = aState.roll
                img_index = 0;
                }
            }
        break;
    
    case mState.dead:
        if (on_ground)
            {
            if (anim_state != aState.dead)
                {
                anim_state = aState.dead;
                img_index = 0;
                }
            }
        else
            {
            if (anim_state != aState.dead_roll)
                {
                anim_state = aState.dead_roll;
                img_index = 0;
                }
            }
        break;
    }

/*

switch(anim_state)
    {
    case aState.idle:
    case aState.walk:
        gun_y = -18;
        
        // legs
        if (anim_state == aState.idle)
            {}
            //paperdoll(doll.legs,skin_spr.leg_idle,dir);
        else if (anim_state == aState.walk)
            {}
            //paperdoll(doll.legs,skin_spr.leg_walk,dir);
        
        // arms
        //paperdoll(doll.arms,skin_spr.arm_0 + floor(aim/45),dir);
        break;
    
    case aState.ramp_idle:
    case aState.ramp_walk:
        gun_y = -18;
        
        // legs
        if (anim_state == aState.ramp_idle)
            {
            if (dir > 0)
                {
                if (ramp_slope > 0)
                    {}
                    //paperdoll(doll.legs,skin_spr.leg_idle_r,1);
                else if (ramp_slope < 0)
                    {}
                    //paperdoll(doll.legs,skin_spr.leg_idle_l,-1);
                }
            else if (dir < 0)
                {
                if (ramp_slope > 0)
                    {}
                    //paperdoll(doll.legs,skin_spr.leg_idle_l,1);
                else if (ramp_slope < 0)
                    {}
                    //paperdoll(doll.legs,skin_spr.leg_idle_r,-1);
                }
            }
        else if (anim_state == aState.ramp_walk)
            //paperdoll(doll.legs,skin_spr.leg_walk,dir);
        
        // arms
        //paperdoll(doll.arms,skin_spr.arm_0 + floor(aim/45),dir);
        break;
    
    case aState.drop:
        gun_y = -18;
        
        //paperdoll(doll.legs,skin_spr.leg_drop,dir);
        //paperdoll(doll.arms,skin_spr.arm_0 + floor(aim/45),dir);
        break;
    
    case aState.roll:
        gun_y = -18;
        
        //paperdoll(doll.full,skin_spr.full_roll,dir);
        if (move_state == mState.moto)
            {
            if (on_moto)
                {}
                //paperdoll(doll.back,skin_spr.extra_arm_moto,1);
            //paperdoll(doll.moto,skin_spr.extra_moto,1);
            }
        break;
    
    case aState.duck:
        if (on_ramp)
            {
            gun_y = -12;
            
            // legs
            if (dir > 0)
                {
                if (ramp_slope > 0)
                    {}
                    //paperdoll(doll.legs,skin_spr.leg_duck_r,1);
                else if (ramp_slope < 0)
                    {}
                    //paperdoll(doll.legs,skin_spr.leg_duck_l,-1);
                }
            else if (dir < 0)
                {
                if (ramp_slope > 0)
                    {}
                    //paperdoll(doll.legs,skin_spr.leg_duck_l,1);
                else if (ramp_slope < 0)
                    {}
                    //paperdoll(doll.legs,skin_spr.leg_duck_r,-1);
                }
            
            // arms
            //paperdoll(doll.arms,skin_spr.arm_0 + floor(aim/45),dir);
            }
        else
            {
            gun_y = -6;
            
            //paperdoll(doll.full,skin_spr.full_duck,dir);
            }
        break;
    
    case aState.hang:
        //paperdoll(doll.full,skin_spr.full_hang,dir);
        break;
    
    case aState.hang_fire:
        gun_y = -22;
        
        //paperdoll(doll.legs,skin_spr.leg_hang,dir);
        //paperdoll(doll.arms,skin_spr.arm_single_0 + floor(aim/45),dir);
        break;
    
    case aState.climb:
        //paperdoll(doll.full,skin_spr.full_climb,dir);
        break;
    
    case aState.climb_fire:
        gun_y = -18;
        
        //paperdoll(doll.legs,skin_spr.leg_climb,dir);
        if ((aim == 90) and (dir == -1))
        or ((aim == 270) and (dir == 1))
            {}
            //paperdoll(doll.arms,skin_spr.arm_climb_0 + floor(aim/45),-1);
        else
            {}
            //paperdoll(doll.arms,skin_spr.arm_climb_0 + floor(aim/45),+1);
        break;
    
    case aState.moto:
        //paperdoll(doll.full,skin_spr.full_moto,1);
        //paperdoll(doll.back,skin_spr.extra_arm_moto,1);
        //paperdoll(doll.moto,skin_spr.extra_moto,1);
        break;
    
    case aState.moto_fire:
        gun_y = -18;
        
        //paperdoll(doll.legs,skin_spr.leg_moto,1);
        //paperdoll(doll.arms,skin_spr.arm_climb_0 + floor(aim/45),1);
        //paperdoll(doll.moto,skin_spr.extra_moto,1);
        break;
    
    case aState.dead:
        if (on_ground)
            {}
            //paperdoll(doll.full,skin_spr.full_dead_down,dir);
        else
            {}
            //paperdoll(doll.full,skin_spr.full_dead_roll,dir);
        break;
    }

*/
