/// update_skin(skin_index);

// added more comments, hopefully that helps
switch(argument[0])
    {
    case skin.yoloswag:
        // === LEGS ===
        
        // idle
        sprite[skin_spr.leg_idle] = yolo_legs_idle_spr; // no slope
        sprite[skin_spr.leg_idle_r] = yolo_legs_ramp_idle_R_spr; // right slope
        sprite[skin_spr.leg_idle_l] = yolo_legs_ramp_idle_L_spr; // left slope
        // duck
        sprite[skin_spr.leg_duck_r] = yolo_legs_ramp_duck_R_spr; // right slope duck
        sprite[skin_spr.leg_duck_l] = yolo_legs_ramp_duck_L_spr; // left slope duck
        // walk
        sprite[skin_spr.leg_walk] = yolo_legs_walk_spr;
        // drop
        sprite[skin_spr.leg_drop] = yolo_legs_drop_spr;
        // hang
        sprite[skin_spr.leg_hang] = yolo_legs_hang_spr;
        // climb
        sprite[skin_spr.leg_climb] = yolo_legs_climb_spr;
        // moto
        sprite[skin_spr.leg_moto] = yolo_legs_moto_spr;
        
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
        sprite[skin_spr.arm_single_0] = yolo_arms_single_0_spr;
        sprite[skin_spr.arm_single_45] = yolo_arms_single_45_spr;
        sprite[skin_spr.arm_single_90] = yolo_arms_single_90_spr;
        sprite[skin_spr.arm_single_135] = yolo_arms_single_45_spr;
        sprite[skin_spr.arm_single_180] = yolo_arms_single_0_spr;
        sprite[skin_spr.arm_single_225] = yolo_arms_single_315_spr;
        sprite[skin_spr.arm_single_270] = yolo_arms_single_270_spr;
        sprite[skin_spr.arm_single_315] = yolo_arms_single_315_spr;
        // climb
        sprite[skin_spr.arm_climb_0] = yolo_arms_climb_0_spr;
        sprite[skin_spr.arm_climb_45] = yolo_arms_climb_45_spr;
        sprite[skin_spr.arm_climb_90] = yolo_arms_climb_90_spr;
        sprite[skin_spr.arm_climb_135] = yolo_arms_climb_135_spr;
        sprite[skin_spr.arm_climb_180] = yolo_arms_climb_180_spr;
        sprite[skin_spr.arm_climb_225] = yolo_arms_climb_225_spr;
        sprite[skin_spr.arm_climb_270] = yolo_arms_climb_270_spr;
        sprite[skin_spr.arm_climb_315] = yolo_arms_climb_315_spr;
        
        // === FULL ===
        
        // roll
        sprite[skin_spr.full_roll] = yolo_jump_spr;
        // duck
        sprite[skin_spr.full_duck] = yolo_duck_spr;
        // hang
        sprite[skin_spr.full_hang] = yolo_hang_move_spr;
        // climb
        sprite[skin_spr.full_climb] = yolo_climb_move_spr;
        // moto
        sprite[skin_spr.full_moto] = yolo_moto_spr;
        // dead idle
        sprite[skin_spr.full_dead_idle] = yolo_dead_stand_spr;
        // dead roll
        sprite[skin_spr.full_dead_roll] = yolo_dead_fly_spr;
        // dead down
        sprite[skin_spr.full_dead_down] = yolo_dead_down_spr;
        
        // === EXTRA ===
        
        // back arm on moto
        sprite[skin_spr.extra_arm_moto] = yolo_moto_back_spr;
        // motorcycle sprite
        sprite[skin_spr.extra_moto] = yolo_vehicle_moto_spr;
        
        // sprite offset path
        offset_path = working_directory+"spriteOffsetsYolo.sof";
        break;
    }

// load sprite offsets
for(var i=0; i<skin_spr.size; i++;)
    {
    sprite_offset_states[i] = 0;
    sprite_offset_state[i,0] = -1;
    sprite_offset_x[i,0] = 0;
    sprite_offset_y[i,0] = 0;
    }

if (file_exists(offset_path))
    {
    var buff = buffer_load(offset_path);
    buffer_seek(buff,buffer_seek_start,0);
    
    for(var i=0; i<skin_spr.size; i++;)
        {
        var num = buffer_read(buff,buffer_u16);
        for(var j=0; j<num; j++;)
            {
            var state = buffer_read(buff,buffer_u8);
            var offx  = buffer_read(buff,buffer_s8);
            var offy  = buffer_read(buff,buffer_s8);
            
            if (state < aState.size)
                {
                sprite_offset_state[i,j] = state;
                sprite_offset_x[i,j] = offx;
                sprite_offset_y[i,j] = offy;
                sprite_offset_states[i]++;
                }
            }
        }
    
    buffer_delete(buff);
    }
