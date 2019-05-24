// animation
switch(move_state)
    {
    case mState.walk:
        if (on_ground)
            {
            if (abs(xspeed) > 0)
                {
                if (sprite_index != spr_player_walk)
                    {
                    sprite_index = spr_player_walk;
                    image_index = 0;
                    }
                
                image_index += abs(xspeed)*0.1;
                if (image_index > image_number)
                    image_index = 0;
                else if (image_index < 0)
                    image_index = image_number-1;
                }
            else if (sprite_index != spr_player_idle)
                {
                sprite_index = spr_player_idle;
                image_index = 0;
                }
            }
        else
            {
            if (sprite_index != spr_player_walk)
                sprite_index = spr_player_walk;
            
            if (yspeed < 0)
                image_index = 4;
            else if (yspeed >= 0)
                image_index = 5;
            }
        break;
    
    case mState.crouch:
        if (on_ground)
            {
            if (abs(xspeed) > 0)
                {
                if (sprite_index != spr_player_crouch_walk)
                    {
                    sprite_index = spr_player_crouch_walk;
                    image_index = 0;
                    }
                
                image_index += abs(xspeed)*0.1;
                if (image_index > image_number)
                    image_index = 0;
                else if (image_index < 0)
                    image_index = image_number-1;
                }
            else if (sprite_index != spr_player_crouch_idle)
                {
                sprite_index = spr_player_crouch_idle;
                image_index = 0;
                }
            }
        else
            {
            if (sprite_index != spr_player_crouch_walk)
                sprite_index = spr_player_crouch_walk;
            
            if (yspeed < 0)
                image_index = 4;
            else if (yspeed >= 0)
                image_index = 5;
            }
        break;
    
    case mState.hang:
        if (sprite_index != spr_player_hang)
            {
            sprite_index = spr_player_hang;
            image_index = 0;
            }
        break;
    }
