/// update_skin(skin_index);

///I only have a vague idea how this works but this is how I dealt with it to get the yolo sprites in
switch(argument[0])
    {
    case skin.yoloswag:
        // leg IDLE (no slope)
        leg_sprite[0,0] = yolo_legs_stand_spr;
        // leg WALK (no slope)
        leg_sprite[1,0] = yolo_legs_walk_spr;
        
        // arm sprite
        arm_sprite[0] = yolo_arms_0_spr;
        arm_sprite[1] = yolo_arms_45_spr;
        arm_sprite[2] = yolo_arms_90_spr;
        arm_sprite[3] = yolo_arms_45_spr;
        arm_sprite[4] = yolo_arms_0_spr;
        arm_sprite[5] = yolo_arms_315_spr;
        arm_sprite[6] = yolo_arms_270_spr;
        arm_sprite[7] = yolo_arms_315_spr;
        
        // roll sprite
        roll_sprite = yolo_jump_spr;
        // duck sprite
        duck_sprite = yolo_duck_spr;
        // hang sprite
        hang_sprite = spr_player_hang;
        // climb sprite
        climb_sprite = spr_player_climb;
        // dead sprite
        dead_sprite = spr_player_dead;
        break;
    }


/*
switch(argument[0])
    {
    case skin.yolo:
        // leg IDLE (no slope)
        leg_sprite[0,0] = yolo_legs_stand_spr;
        // leg WALK (no slope)
        leg_sprite[1,0] = yolo_legs_walk_spr;
        
        // arm sprite
        arm_sprite[0] = yolo_arms_0_spr;
        arm_sprite[1] = yolo_arms_45_spr;
        arm_sprite[2] = yolo_arms_90_spr;
        arm_sprite[3] = yolo_arms_45_spr;
        arm_sprite[4] = yolo_arms_0_spr;
        arm_sprite[5] = yolo_arms_315_spr;
        arm_sprite[6] = yolo_arms_270_spr;
        arm_sprite[7] = yolo_arms_315_spr;
        
        // roll sprite
        roll_sprite = yolo_jump_spr;
        // duck sprite
        duck_sprite = yolo_duck_spr;
        // hang sprite
        hang_sprite = spr_player_hang;
        // climb sprite
        climb_sprite = spr_player_climb;
        // dead sprite
        dead_sprite = spr_player_dead;
        break;
    }
