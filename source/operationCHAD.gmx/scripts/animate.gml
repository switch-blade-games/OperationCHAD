/// animation();

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
                        {
                        anim_state = aState.walk_fire;
                        img_index = 0;
                        }
                    }
                else
                    {
                    if (anim_state != aState.walk)
                        {
                        anim_state = aState.walk;
                        img_index = 0;
                        }
                    }
                }
            else
                {
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
            if (mb_offset != mb_offset_old)
                {
                mb_offset_old = mb_offset;
                if (anim_state != aState.mb_move)
                    {
                    anim_state = aState.mb_move;
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
                if (x != xpre)
                    {
                    if (anim_state != aState.mb_move)
                        {
                        anim_state = aState.mb_move;
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
                if (y != ypre)
                    {
                    if (anim_state != aState.wc_move)
                        {
                        anim_state = aState.wc_move;
                        img_index = 0;
                        }
                    }
                else
                    {
                    if (anim_state != aState.wc)
                        {
                        anim_state = aState.wc;
                        img_index = 0;
                        }
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

anim_angle = floor(aim/45);

switch(anim_state)
    {
    case aState.idle:
        update_sprite(skin_idle[anim_angle],dir);
        gun_y = -18;
        
        if (input_fire)
            img_index += 0.2;
        else
            img_index = 0;
        break;
    
    case aState.idle_ramp:
        if (dir > 0)
            {
            if (ramp_slope > 0)
                update_sprite(skin_idle_ramp_u[anim_angle],+1);
            else if (ramp_slope < 0)
                update_sprite(skin_idle_ramp_d[anim_angle],+1);
            }
        else if (dir < 0)
            {
            if (ramp_slope > 0)
                update_sprite(skin_idle_ramp_d[anim_angle],-1);
            else if (ramp_slope < 0)
                update_sprite(skin_idle_ramp_u[anim_angle],-1);
            }
        gun_y = -18;
        
        if (input_fire)
            img_index += 0.2;
        else
            img_index = 0;
        break;
    
    case aState.walk:
        update_sprite(skin_walk,dir);
        img_index += 0.2;
        break;
    
    case aState.walk_fire:
        update_sprite(skin_walk_fire[anim_angle],dir);
        gun_y = -18;
        
        img_index += 0.2;
        break;
    
    /*
    case aState.drop:
        break;
    */
    
    case aState.roll:
        update_sprite(skin_roll,dir);
        gun_y = -18;
        
        img_index += 0.3;
        break;
    
    case aState.duck:
        update_sprite(skin_duck,dir);
        gun_y = -6;
        
        if (input_fire)
            img_index += 0.2;
        else
            img_index = 0;
        break;
    
    case aState.duck_ramp:
        if (dir > 0)
            {
            if (ramp_slope > 0)
                update_sprite(skin_duck_ramp_u,+1);
            else if (ramp_slope < 0)
                update_sprite(skin_duck_ramp_d,+1);
            }
        else if (dir < 0)
            {
            if (ramp_slope > 0)
                update_sprite(skin_duck_ramp_d,-1);
            else if (ramp_slope < 0)
                update_sprite(skin_duck_ramp_u,-1);
            }
        gun_y = -12;
        
        if (input_fire)
            img_index += 0.2;
        else
            img_index = 0;
        break;
    
    case aState.mb:
        update_sprite(skin_mb,dir);
        
        img_index = 0;
        break;
    
    case aState.mb_move:
        update_sprite(skin_mb,dir);
        img_index += 0.2;
        break;
    
    case aState.mb_fire:
        if (dir > 0)
            update_sprite(skin_mb_fire[anim_angle],+1);
        else
            update_sprite(skin_mb_fire[(12-anim_angle) mod 8],-1);
        gun_y = -18;
        
        img_index += 0.2;
        break;
    
    case aState.wc:
        update_sprite(skin_wc,dir);
        img_index = 0;
        break;
    
    case aState.wc_move:
        update_sprite(skin_wc,dir);
        img_index += 0.2;
        break;
    
    case aState.wc_fire:
        if (dir > 0)
            update_sprite(skin_wc_fire[anim_angle],+1);
        else
            update_sprite(skin_wc_fire[(12-anim_angle) mod 8],-1);
        gun_y = -18;
        
        img_index += 0.2;
        break;
    
    case aState.moto:
        update_sprite(skin_moto,+1);
        gun_y = -18;
        
        img_index += 0.2;
        break;
    
    case aState.dead_roll:
        update_sprite(skin_dead_roll,dir);
        img_index += 0.3;
        break;
    
    case aState.dead:
        update_sprite(skin_dead,dir);
        img_index = 0;
        break;
    }

if (img_index > sprite_get_number(spr_index))
    img_index = 0;
else if (img_index < 0)
    img_index = sprite_get_number(spr_index)-1;

anim_update = false;
if (sprite_index != spr_index) or (image_index != img_index)
    {
    if (sprite_index != spr_index)
        sprite_index = spr_index;
    if (image_index != img_index)
        image_index = img_index;
    
    anim_update = true;
    }
