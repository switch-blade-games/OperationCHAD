/// animate();

switch(move_state)
    {
    case mState.walk:
        if (on_ground)
            {
            if (x != xpre)
                {
                if (input_fire)
                    {
                    if (anim_state != aState.walk_fire)
                        anim_state = aState.walk_fire;
                    }
                else
                    {
                    if (anim_state != aState.walk)
                        anim_state = aState.walk;
                    }
                }
            else
                {
                if (on_ramp)
                    {
                    if (anim_state != aState.idle_ramp)
                        anim_state = aState.idle_ramp;
                    }
                else
                    {
                    if (anim_state != aState.idle)
                        anim_state = aState.idle;
                    }
                }
            }
        else
            {
            if (anim_state != aState.roll)
                anim_state = aState.roll;
            }
        break;
    
    case mState.duck:
        if (on_ramp)
            {
            if (anim_state != aState.duck_ramp)
                anim_state = aState.duck_ramp;
            }
        else
            {
            if (anim_state != aState.duck)
                anim_state = aState.duck;
            }
        break;
    
    case mState.mb:
        if (input_fire)
            {
            if (anim_state != aState.mb_fire)
                anim_state = aState.mb_fire;
            }
        else
            {
            if (mb_offset != mb_offset_old)
                {
                mb_offset_old = mb_offset;
                if (anim_state != aState.mb_move)
                    anim_state = aState.mb_move;
                }
            else
                {
                if (anim_state != aState.mb)
                    anim_state = aState.mb;
                }
            }
        break;
    
    case mState.wc:
        if (wc_side == tile_side.bottom)
            {
            if (input_fire)
                {
                if (anim_state != aState.mb_fire)
                    anim_state = aState.mb_fire;
                }
            else
                {
                if (x != xpre)
                    {
                    if (anim_state != aState.mb_move)
                        anim_state = aState.mb_move;
                    }
                else
                    {
                    if (anim_state != aState.mb)
                        anim_state = aState.mb;
                    }
                }
            }
        else
            {
            if (input_fire)
                {
                if (anim_state != aState.wc_fire)
                    anim_state = aState.wc_fire;
                }
            else
                {
                if (y != ypre)
                    {
                    if (anim_state != aState.wc_move)
                        anim_state = aState.wc_move;
                    }
                else
                    {
                    if (anim_state != aState.wc)
                        anim_state = aState.wc;
                    }
                }
            }
        break;
    
    case mState.moto:
        if (on_moto)
            {
            if (anim_state != aState.moto)
                anim_state = aState.moto;
            
            /*
            if (input_fire)
                {
                if (anim_state != aState.moto_fire)
                    anim_state = aState.moto_fire;
                }
            else
                {
                if (anim_state != aState.moto)
                    anim_state = aState.moto;
                }
            */
            }
        else
            {
            if (anim_state != aState.roll)
                anim_state = aState.roll
            }
        break;
    
    case mState.dead:
        if (on_ground)
            {
            if (anim_state != aState.dead)
                anim_state = aState.dead;
            }
        else
            {
            if (anim_state != aState.dead_roll)
                anim_state = aState.dead_roll;
            }
        break;
    }

// determine animation angle index
switch(anim_state)
    {
    case aState.wc_fire:
        if (dir > 0)
            anim_angle = floor(aim/45);
        else
            anim_angle = (12-floor(aim/45)) mod 8;
        break;
    
    default:
        anim_angle = floor(aim/45);
        break;
    }

// update animation
switch(anim_state)
    {
    case aState.idle:
        update_anim(anim.idle,dir);
        gun_y = -18;
        
        if (input_fire)
            img_index += 0.2;
        else
            img_index = anim_start;
        break;
    
    case aState.idle_ramp:
        if (dir > 0)
            {
            if (ramp_slope > 0)
                update_anim(anim.idle_ramp_u,+1);
            else if (ramp_slope < 0)
                update_anim(anim.idle_ramp_d,+1);
            }
        else if (dir < 0)
            {
            if (ramp_slope > 0)
                update_anim(anim.idle_ramp_d,-1);
            else if (ramp_slope < 0)
                update_anim(anim.idle_ramp_u,-1);
            }
        gun_y = -18;
        
        if (input_fire)
            img_index += 0.2;
        else
            img_index = anim_start;
        break;
    
    case aState.walk:
        update_anim(anim.walk,dir);
        img_index += 0.2;
        break;
    
    case aState.walk_fire:
        update_anim(anim.walk_fire,dir);
        gun_y = -18;
        img_index += 0.2;
        break;
    
    /*
    case aState.drop:
        break;
    */
    
    case aState.roll:
        update_anim(anim.roll,dir);
        gun_y = -18;
        img_index += 0.3;
        break;
    
    case aState.duck:
        update_anim(anim.duck,dir);
        gun_y = -6;
        
        if (input_fire)
            img_index += 0.2;
        else
            img_index = anim_start;
        break;
    
    case aState.duck_ramp:
        if (dir > 0)
            {
            if (ramp_slope > 0)
                update_anim(anim.duck_ramp_u,+1);
            else if (ramp_slope < 0)
                update_anim(anim.duck_ramp_d,+1);
            }
        else if (dir < 0)
            {
            if (ramp_slope > 0)
                update_anim(anim.duck_ramp_d,-1);
            else if (ramp_slope < 0)
                update_anim(anim.duck_ramp_u,-1);
            }
        gun_y = -12;
        
        if (input_fire)
            img_index += 0.2;
        else
            img_index = anim_start;
        break;
    
    case aState.mb:
        update_anim(anim.mb,dir);
        img_index = anim_start;
        break;
    
    case aState.mb_move:
        update_anim(anim.mb,dir);
        img_index += 0.2;
        break;
    
    case aState.mb_fire:
        if (dir > 0)
            {
            if (anim_angle <= 2) or (anim_angle >= 6)
                update_anim(anim.mb_fire,dir);
            else
                update_anim(anim.mb_fire,-dir);
            }
        else if (dir < 0)
            {
            if (anim_angle >= 2) and (anim_angle <= 6)
                update_anim(anim.mb_fire,dir);
            else
                update_anim(anim.mb_fire,-dir);
            }
        gun_y = -18;
        img_index += 0.2;
        break;
    
    case aState.wc:
        update_anim(anim.wc,dir);
        img_index = anim_start;
        break;
    
    case aState.wc_move:
        update_anim(anim.wc,dir);
        img_index += 0.2;
        break;
    
    case aState.wc_fire:
        update_anim(anim.wc_fire,dir);
        gun_y = -18;
        img_index += 0.2;
        break;
    
    case aState.moto:
        update_anim(anim.moto,+1);
        gun_y = -18;
        img_index += 0.2;
        break;
    
    //case aState.moto_fire:
    
    case aState.dead_roll:
        update_anim(anim.dead_roll,dir);
        img_index += 0.3;
        break;
    
    case aState.dead:
        update_anim(anim.dead,dir);
        img_index = anim_start;
        break;
    }

if (img_index >= anim_end)
    img_index = anim_start;
else if (img_index < anim_start)
    img_index = anim_end-1;
