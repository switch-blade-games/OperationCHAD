/// update_skin(skin_index);

// added more comments, hopefully that helps
switch(argument[0])
    {
    case skin.yoloswag:
        // BODY SEGMENT SPRITES
        
        // legs IDLE
        leg_idle_sprite[0] = yolo_legs_stand_spr; // no slope
        leg_idle_sprite[1] = yolo_ramp_stand_R_spr; // right slope STAND
        leg_idle_sprite[2] = yolo_ramp_stand_L_spr; // left slope STAND
        leg_idle_sprite[3] = yolo_ramp_crouch_R_spr; // right slope CROUCH
        leg_idle_sprite[4] = yolo_ramp_crouch_L_spr; // left slope CROUCH
        // legs WALK (no slope)
        leg_walk_sprite[0] = yolo_legs_walk_spr;
        // legs DROP
        leg_drop_sprite = yolo_legs_drop_spr;
        // legs HANG
        leg_hang_sprite = yolo_legs_hang_spr;
        
        // arms NORMAL
        arm_normal_sprite[0] = yolo_arms_0_spr; // 0
        arm_normal_sprite[1] = yolo_arms_45_spr; // 45
        arm_normal_sprite[2] = yolo_arms_90_spr; // 90
        arm_normal_sprite[3] = yolo_arms_45_spr; // 135
        arm_normal_sprite[4] = yolo_arms_0_spr; // 180
        arm_normal_sprite[5] = yolo_arms_315_spr; // 225
        arm_normal_sprite[6] = yolo_arms_270_spr; // 270
        arm_normal_sprite[7] = yolo_arms_315_spr; // 315
        // arms SINGLE
        arm_single_sprite[0] = yolo_single_0_spr; // 0
        arm_single_sprite[1] = yolo_single_45_spr; // 45
        arm_single_sprite[2] = yolo_single_90_spr; // 90
        arm_single_sprite[3] = yolo_single_45_spr; // 135
        arm_single_sprite[4] = yolo_single_0_spr; // 180
        arm_single_sprite[5] = yolo_single_315_spr; // 225
        arm_single_sprite[6] = yolo_single_270_spr; // 270
        arm_single_sprite[7] = yolo_single_315_spr; // 315
        
        // FULL BODY SPRITES
        
        // roll sprite
        roll_sprite = yolo_jump_spr;
        // duck sprite
        duck_sprite = yolo_duck_spr;
        
        // dead STAND sprite
        dead_stand_sprite = yolo_dead_stand_spr;
        // dead ROLL sprite
        dead_roll_sprite = yolo_dead_fly_spr;
        // dead DOWN sprite
        dead_down_sprite = yolo_dead_down_spr;
        break;
    }
