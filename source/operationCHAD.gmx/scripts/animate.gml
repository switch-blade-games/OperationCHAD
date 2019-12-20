/// animate();

// capture old variables
skin_id_old = skin_id;
spr_index_old = spr_index;
img_index_old = img_index;

anim_group_old = EXP_GROUP[anim_state];
anim_state_old = anim_state;
anim_start_old = anim_start;
anim_end_old = anim_end;
anim_len_old = anim_len;
anim_angle_old = anim_angle;

// determine appropriate animation state
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
                    if (anim_state != aState.walk_move)
                        anim_state = aState.walk_move;
                    }
                }
            else
                {
                if (on_ramp)
                    {
                    if (input_fire)
                        {
                        if (dir > 0)
                            {
                            if (ramp_slope > 0)
                                {
                                if (anim_state != aState.ramp_u_fire)
                                    anim_state = aState.ramp_u_fire;
                                }
                            else if (ramp_slope < 0)
                                {
                                if (anim_state != aState.ramp_d_fire)
                                    anim_state = aState.ramp_d_fire;
                                }
                            }
                        else if (dir < 0)
                            {
                            if (ramp_slope > 0)
                                {
                                if (anim_state != aState.ramp_d_fire)
                                    anim_state = aState.ramp_d_fire;
                                }
                            else if (ramp_slope < 0)
                                {
                                if (anim_state != aState.ramp_u_fire)
                                    anim_state = aState.ramp_u_fire;
                                }
                            }
                        }
                    else
                        {
                        if (dir > 0)
                            {
                            if (ramp_slope > 0)
                                {
                                if (anim_state != aState.ramp_u_idle)
                                    anim_state = aState.ramp_u_idle;
                                }
                            else if (ramp_slope < 0)
                                {
                                if (anim_state != aState.ramp_d_idle)
                                    anim_state = aState.ramp_d_idle;
                                }
                            }
                        else if (dir < 0)
                            {
                            if (ramp_slope > 0)
                                {
                                if (anim_state != aState.ramp_d_idle)
                                    anim_state = aState.ramp_d_idle;
                                }
                            else if (ramp_slope < 0)
                                {
                                if (anim_state != aState.ramp_u_idle)
                                    anim_state = aState.ramp_u_idle;
                                }
                            }
                        }
                    }
                else
                    {
                    if (input_fire)
                        {
                        if (anim_state != aState.flat_fire)
                            anim_state = aState.flat_fire;
                        }
                    else
                        {
                        if (wait > 15*room_speed)
                            {
                            if (anim_state != aState.flat_wait)
                                anim_state = aState.flat_wait;
                            }
                        else
                            {
                            if (anim_state != aState.flat_idle)
                                anim_state = aState.flat_idle;
                            }
                        }
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
            if (dir > 0)
                {
                if (ramp_slope > 0)
                    {
                    if (anim_state != aState.ramp_u_duck)
                        anim_state = aState.ramp_u_duck; // +1
                    }
                else if (ramp_slope < 0)
                    {
                    if (anim_state != aState.ramp_d_duck)
                        anim_state = aState.ramp_d_duck; // +1
                    }
                }
            else if (dir < 0)
                {
                if (ramp_slope > 0)
                    {
                    if (anim_state != aState.ramp_d_duck)
                        anim_state = aState.ramp_d_duck; // -1
                    }
                else if (ramp_slope < 0)
                    {
                    if (anim_state != aState.ramp_u_duck)
                        anim_state = aState.ramp_u_duck; // -1
                    }
                }
            }
        else
            {
            if (input_fire)
                {
                if (anim_state != aState.duck_fire)
                    anim_state = aState.duck_fire;
                }
            else
                {
                if (anim_state != aState.duck_idle)
                    anim_state = aState.duck_idle;
                }
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
                if (anim_state != aState.mb_idle)
                    anim_state = aState.mb_idle;
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
                    if (anim_state != aState.mb_idle)
                        anim_state = aState.mb_idle;
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
                    if (anim_state != aState.wc_idle)
                        anim_state = aState.wc_idle;
                    }
                }
            }
        break;
    
    case mState.moto:
        if (on_moto)
            {
            if (anim_state != aState.moto_idle)
                anim_state = aState.moto_idle;
            
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
anim_angle_old = anim_angle;
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
    case aState.flat_wait:
        anim_update();
        img_index += img_speed[anim_state];
        if (img_index >= anim_end)
            wait = 0;
        break;
    
    case aState.flat_idle:
    case aState.flat_fire:
    case aState.walk_move:
    case aState.walk_fire:
    case aState.ramp_u_idle:
    case aState.ramp_d_idle:
        anim_update();
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.ramp_u_duck:
    case aState.ramp_d_duck:
        anim_update();
        if (input_fire)
            img_index += img_speed[anim_state];
        else
            img_index = anim_start;
        gun_y = -12;
        break;
    
    case aState.ramp_u_fire:
    case aState.ramp_d_fire:
        anim_update();
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.duck_idle:
    case aState.duck_fire:
        anim_update();
        img_index += img_speed[anim_state];
        gun_y = -6;
        break;
    
    case aState.wc_idle:
    case aState.wc_move:
    case aState.wc_fire:
        anim_update();
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.mb_idle:
    case aState.mb_move:
        anim_update();
        img_index += img_speed[anim_state];
        break;
    case aState.mb_fire:
        if (dir > 0)
            {
            if (anim_angle <= 2) or (anim_angle >= 6)
                anim_update(+dir);
            else
                anim_update(-dir);
            }
        else if (dir < 0)
            {
            if (anim_angle >= 2) and (anim_angle <= 6)
                anim_update(+dir);
            else
                anim_update(-dir);
            }
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.moto_idle:
        anim_update(1);
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.roll:
    case aState.dead_roll:
        anim_update();
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.dead:
        anim_update();
        img_index = anim_start;
        break;
    
    case aState.victory:
        anim_update();
        if (img_index >= anim_end)
            img_index = anim_end-0.1;
        break;
    }

if (img_index >= anim_end)
    img_index = anim_start;
else if (img_index < anim_start)
    img_index = anim_end-0.1;
