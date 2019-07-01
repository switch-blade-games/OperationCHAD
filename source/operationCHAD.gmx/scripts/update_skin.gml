/// update_skin(skin_index);

///I only have a vague idea how this works but this is how I dealt with it to get the yolo sprites in
switch(argument[0])
    {
    case skin.yoloswag:
        // leg IDLE
        leg_idle_sprite[0] = yolo_legs_stand_spr; // no slope
        leg_idle_sprite[1] = yolo_ramp_stand_R_spr; // right slope STAND
        leg_idle_sprite[2] = yolo_ramp_stand_L_spr; // left slope STAND
        leg_idle_sprite[3] = yolo_ramp_crouch_R_spr; // right slope CROUCH
        leg_idle_sprite[4] = yolo_ramp_crouch_L_spr; // left slope CROUCH
        // leg WALK (no slope)
        leg_walk_sprite[0] = yolo_legs_walk_spr;
        // leg DROP
        leg_drop_sprite = yolo_legs_drop_spr;
        // leg HANG
        leg_hang_sprite = yolo_legs_hang_spr;
        
        // arm NORMAL
        arm_normal_sprite[0] = yolo_arms_0_spr;
        arm_normal_sprite[1] = yolo_arms_45_spr;
        arm_normal_sprite[2] = yolo_arms_90_spr;
        arm_normal_sprite[3] = yolo_arms_45_spr;
        arm_normal_sprite[4] = yolo_arms_0_spr;
        arm_normal_sprite[5] = yolo_arms_315_spr;
        arm_normal_sprite[6] = yolo_arms_270_spr;
        arm_normal_sprite[7] = yolo_arms_315_spr;
        // arm SINGLE
        arm_single_sprite[0] = yolo_single_0_spr;
        arm_single_sprite[1] = yolo_single_45_spr;
        arm_single_sprite[2] = yolo_single_90_spr;
        arm_single_sprite[3] = yolo_single_45_spr;
        arm_single_sprite[4] = yolo_single_0_spr;
        arm_single_sprite[5] = yolo_single_315_spr;
        arm_single_sprite[6] = yolo_single_270_spr;
        arm_single_sprite[7] = yolo_single_315_spr;
        
        // roll sprite
        roll_sprite = yolo_jump_spr;
        // duck sprite
        duck_sprite = yolo_duck_spr;
        // hang sprite
        hang_sprite = spr_player_hang;
        // climb sprite
        climb_sprite = spr_player_climb;
        
        // dead STAND sprite
        dead_stand_sprite = yolo_dead_stand_spr;
        // dead ROLL sprite
        dead_roll_sprite = yolo_dead_fly_spr;
        // dead DOWN sprite
        dead_down_sprite = yolo_dead_down_spr;
        break;
    }
