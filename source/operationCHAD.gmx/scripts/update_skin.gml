/// update_skin();

switch(skin_id)
    {
    case skin.yoloswag:
        var skin_prefix = "yolo_";
        break;
    default:
        var skin_prefix = "yolo_";
        break;
    }

// idle
skin_idle[0] = asset_get_index(string(skin_prefix)+"stand_0_spr");
skin_idle[1] = asset_get_index(string(skin_prefix)+"stand_45_spr");
skin_idle[2] = asset_get_index(string(skin_prefix)+"stand_90_spr");
skin_idle[3] = asset_get_index(string(skin_prefix)+"stand_45_spr");
skin_idle[4] = asset_get_index(string(skin_prefix)+"stand_0_spr");
skin_idle[5] = asset_get_index(string(skin_prefix)+"stand_315_spr");
skin_idle[6] = asset_get_index(string(skin_prefix)+"stand_270_spr");
skin_idle[7] = asset_get_index(string(skin_prefix)+"stand_315_spr");
// idle + ramp up
skin_idle_ramp_u[0] = asset_get_index(string(skin_prefix)+"Uramp_0_spr");
skin_idle_ramp_u[1] = asset_get_index(string(skin_prefix)+"Uramp_45_spr");
skin_idle_ramp_u[2] = asset_get_index(string(skin_prefix)+"Uramp_90_spr");
skin_idle_ramp_u[3] = asset_get_index(string(skin_prefix)+"Uramp_45_spr");
skin_idle_ramp_u[4] = asset_get_index(string(skin_prefix)+"Uramp_0_spr");
skin_idle_ramp_u[5] = asset_get_index(string(skin_prefix)+"Uramp_315_spr");
skin_idle_ramp_u[6] = asset_get_index(string(skin_prefix)+"Uramp_270_spr");
skin_idle_ramp_u[7] = asset_get_index(string(skin_prefix)+"Uramp_315_spr");
// idle + ramp down
skin_idle_ramp_d[0] = asset_get_index(string(skin_prefix)+"Dramp_0_spr");
skin_idle_ramp_d[1] = asset_get_index(string(skin_prefix)+"Dramp_45_spr");
skin_idle_ramp_d[2] = asset_get_index(string(skin_prefix)+"Dramp_90_spr");
skin_idle_ramp_d[3] = asset_get_index(string(skin_prefix)+"Dramp_45_spr");
skin_idle_ramp_d[4] = asset_get_index(string(skin_prefix)+"Dramp_0_spr");
skin_idle_ramp_d[5] = asset_get_index(string(skin_prefix)+"Dramp_315_spr");
skin_idle_ramp_d[6] = asset_get_index(string(skin_prefix)+"Dramp_270_spr");
skin_idle_ramp_d[7] = asset_get_index(string(skin_prefix)+"Dramp_315_spr");

// walk
skin_walk = asset_get_index(string(skin_prefix)+"walk_spr");
// walk + fire
skin_walk_fire[0] = asset_get_index(string(skin_prefix)+"walk_0_spr");
skin_walk_fire[1] = asset_get_index(string(skin_prefix)+"walk_45_spr");
skin_walk_fire[2] = asset_get_index(string(skin_prefix)+"stand_90_spr");
skin_walk_fire[3] = asset_get_index(string(skin_prefix)+"walk_45_spr");
skin_walk_fire[4] = asset_get_index(string(skin_prefix)+"walk_0_spr");
skin_walk_fire[5] = asset_get_index(string(skin_prefix)+"walk_315_spr");
skin_walk_fire[6] = asset_get_index(string(skin_prefix)+"stand_270_spr");
skin_walk_fire[7] = asset_get_index(string(skin_prefix)+"walk_315_spr");

// roll
skin_roll = asset_get_index(string(skin_prefix)+"roll_spr");

// duck
skin_duck = asset_get_index(string(skin_prefix)+"duck_spr");
// duck + ramp up
skin_duck_ramp_u = asset_get_index(string(skin_prefix)+"Uramp_duck_spr");
// duck + ramp down
skin_duck_ramp_d = asset_get_index(string(skin_prefix)+"Dramp_duck_spr");

// monkey bar
skin_mb = asset_get_index(string(skin_prefix)+"monkey_move_spr");
// monkey bar + fire
skin_mb_fire[0] = asset_get_index(string(skin_prefix)+"monkey_0_spr");
skin_mb_fire[1] = asset_get_index(string(skin_prefix)+"monkey_45_spr");
skin_mb_fire[2] = asset_get_index(string(skin_prefix)+"monkey_90_spr");
skin_mb_fire[3] = asset_get_index(string(skin_prefix)+"monkey_135_spr");
skin_mb_fire[4] = asset_get_index(string(skin_prefix)+"monkey_180_spr");
skin_mb_fire[5] = asset_get_index(string(skin_prefix)+"monkey_225_spr");
skin_mb_fire[6] = asset_get_index(string(skin_prefix)+"monkey_270_spr");
skin_mb_fire[7] = asset_get_index(string(skin_prefix)+"monkey_315_spr");

// wall-climb
skin_wc = asset_get_index(string(skin_prefix)+"wall_move_spr");
// wall-climb + fire
skin_wc_fire[0] = asset_get_index(string(skin_prefix)+"wall_0_spr");
skin_wc_fire[1] = asset_get_index(string(skin_prefix)+"wall_45_spr");
skin_wc_fire[2] = asset_get_index(string(skin_prefix)+"wall_90_spr");
skin_wc_fire[3] = asset_get_index(string(skin_prefix)+"wall_135_spr");
skin_wc_fire[4] = asset_get_index(string(skin_prefix)+"wall_180_spr");
skin_wc_fire[5] = asset_get_index(string(skin_prefix)+"wall_225_spr");
skin_wc_fire[6] = asset_get_index(string(skin_prefix)+"wall_270_spr");
skin_wc_fire[7] = asset_get_index(string(skin_prefix)+"wall_315_spr");

// moto
skin_moto = asset_get_index(string(skin_prefix)+"moto_spr");

// dead
skin_dead = asset_get_index(string(skin_prefix)+"dead_spr");
// dead lean
skin_dead_lean = asset_get_index(string(skin_prefix)+"dead_lean_spr");
// dead roll
skin_dead_roll = asset_get_index(string(skin_prefix)+"dead_roll_spr");
