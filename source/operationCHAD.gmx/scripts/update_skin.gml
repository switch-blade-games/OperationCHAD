/// update_skin(skin_index);

// added more comments, hopefully that helps
switch(argument[0])
    {
    case skin.yoloswag:
        // === LEGS ===
        
        // idle
        sprite[skin_spr.leg_idle] = yolo_legs_stand_spr; // no slope
        sprite[skin_spr.leg_idle_r] = yolo_ramp_stand_R_spr; // right slope
        sprite[skin_spr.leg_idle_l] = yolo_ramp_stand_L_spr; // left slope
        // duck
        sprite[skin_spr.leg_duck_r] = yolo_ramp_stand_R_spr; // right slope crouch
        sprite[skin_spr.leg_duck_l] = yolo_ramp_stand_L_spr; // left slope crouch
        // walk
        sprite[skin_spr.leg_walk] = yolo_legs_walk_spr;
        leg_walk_sprite[0] = yolo_legs_walk_spr;
        // drop
        sprite[skin_spr.leg_drop] = yolo_legs_drop_spr;
        leg_drop_sprite = yolo_legs_drop_spr;
        // hang
        sprite[skin_spr.leg_hang] = yolo_legs_monkey_spr;
        leg_hang_sprite = yolo_legs_monkey_spr;
        
        // === ARMS ===
        
        // normal
        sprite[skin_spr.arm_0] = yolo_arms_0_spr;
        sprite[skin_spr.arm_45] = yolo_arms_45_spr;
        sprite[skin_spr.arm_90] = yolo_arms_90_spr;
        sprite[skin_spr.arm_135] = yolo_arms_45_spr;
        sprite[skin_spr.arm_180] = yolo_arms_0_spr;
        sprite[skin_spr.arm_225] = yolo_arms_315_spr;
        sprite[skin_spr.arm_270] = yolo_arms_270_spr;
        sprite[skin_spr.arm_315] = yolo_arms_315_spr;
        // single
        sprite[skin_spr.arm_single_0] = yolo_single_0_spr;
        sprite[skin_spr.arm_single_45] = yolo_single_45_spr;
        sprite[skin_spr.arm_single_90] = yolo_single_90_spr;
        sprite[skin_spr.arm_single_135] = yolo_single_45_spr;
        sprite[skin_spr.arm_single_180] = yolo_single_0_spr;
        sprite[skin_spr.arm_single_225] = yolo_single_315_spr;
        sprite[skin_spr.arm_single_270] = yolo_single_270_spr;
        sprite[skin_spr.arm_single_315] = yolo_single_315_spr;
        
        // === FULL ===
        
        // roll
        sprite[skin_spr.full_roll] = yolo_jump_spr;
        // duck
        sprite[skin_spr.full_duck] = yolo_duck_spr;
        // dead idle
        sprite[skin_spr.full_dead_idle] = yolo_dead_stand_spr;
        // dead roll
        sprite[skin_spr.full_dead_roll] = yolo_dead_fly_spr;
        // dead down
        sprite[skin_spr.full_dead_down] = yolo_dead_down_spr;
        break;
    }
