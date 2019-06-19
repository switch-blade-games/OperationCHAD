// animation
switch(move_state)
    {
    case mState.walk:
        if (on_ground)
            {
            if (abs(x-xpre) > 0)
                {
                if (sprite_index != spr_player_walk)
                    {
                    sprite_index = spr_player_walk;
                    image_index = 0;
                    }
                
                image_index += abs(x-xpre)*0.1;
                if (image_index > image_number)
                    image_index = 0;
                else if (image_index < 0)
                    image_index = image_number-1;
                }
            else
                {
                if (aim == 90)
                    {
                    if (sprite_index != spr_player_up)
                        {
                        sprite_index = spr_player_up;
                        image_index = 0;
                        }
                    }
                else if (sprite_index != spr_player_idle)
                    {
                    sprite_index = spr_player_idle;
                    image_index = 0;
                    }
                }
            }
        else
            {
            if (roll)
                {
                if (sprite_index != spr_player_jump)
                    {
                    sprite_index = spr_player_jump;
                    image_index = 0;
                    }
                
                image_index += 0.25;
                if (image_index > image_number)
                    image_index = 0;
                }
            else
                {
                if (sprite_index != spr_player_walk)
                    sprite_index = spr_player_walk;
                
                image_index = 4;
                }
            }
        break;
    
    case mState.lock:
        if (on_ground)
            {
            if (sprite_index != spr_player_idle)
                {
                sprite_index = spr_player_idle;
                image_index = 0;
                }
            }
        else
            {
            if (roll)
                {
                if (sprite_index != spr_player_jump)
                    {
                    sprite_index = spr_player_jump;
                    image_index = 0;
                    }
                
                image_index += 0.25;
                if (image_index > image_number)
                    image_index = 0;
                }
            else
                {
                if (sprite_index != spr_player_walk)
                    sprite_index = spr_player_walk;
                
                image_index = 4;
                }
            }
        break;
    
    case mState.duck:
        if (sprite_index != spr_player_duck)
            {
            sprite_index = spr_player_duck;
            image_index = 0;
            }
        break;
    
    case mState.hang:
        if (sprite_index != spr_player_hang)
            sprite_index = spr_player_hang;
        
        if (input_fire)
            image_index = 1;
        else
            image_index = 0;
        break;
    
    case mState.climb:
        if (climb_side == tile_side.bottom)
            {
            if (sprite_index != spr_player_hang)
                sprite_index = spr_player_hang;
            }
        else if (sprite_index != spr_player_climb)
            sprite_index = spr_player_climb;
        
        if (input_fire)
            image_index = 1;
        else
            image_index = 0;
        break;
    
    case mState.dead:
        if (sprite_index != spr_player_dead)
            {
            sprite_index = spr_player_dead;
            image_index = 0;
            }
        break;
    }
