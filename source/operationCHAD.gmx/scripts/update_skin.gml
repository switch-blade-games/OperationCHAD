/// update_skin(skin_index);

switch(argument[0])
    {
    case skin.pepe:
        // leg IDLE (no slope)
        leg_sprite[0,0] = pepe_legs_stand_spr;
        // leg WALK (no slope)
        leg_sprite[1,0] = pepe_legs_walk_spr;
        
        // arm sprite
        arm_sprite[0] = pepe_arms_0_spr;
        arm_sprite[1] = pepe_arms_45_spr;
        arm_sprite[2] = pepe_arms_90_spr;
        arm_sprite[3] = pepe_arms_45_spr;
        arm_sprite[4] = pepe_arms_0_spr;
        arm_sprite[5] = pepe_arms_315_spr;
        arm_sprite[6] = pepe_arms_270_spr;
        arm_sprite[7] = pepe_arms_315_spr;
        
        // roll sprite
        roll_sprite = pepe_jump_spr;
        // duck sprite
        duck_sprite = pepe_duck_spr;
        // hang sprite
        hang_sprite = spr_player_hang;
        // climb sprite
        climb_sprite = spr_player_climb;
        // dead sprite
        dead_sprite = spr_player_dead;
        break;
    }
