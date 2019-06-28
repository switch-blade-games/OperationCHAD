/// weapon_stats();

weapons = 0;
enum weapon
    {
    rifle,
    spread,
    heatseeker,
    flame
    }

weapon_name[weapon.rifle] = "Rifle";
weapon_time[weapon.rifle] = 4;
weapon_pspd[weapon.rifle] = 8;
weapon_pnum[weapon.rifle] = 1;
weapon_sprd[weapon.rifle] = 0;
weapon_proj[weapon.rifle] = obj_bullet;
weapon_case[weapon.rifle] = 0;
weapons++;

weapon_name[weapon.spread] = "Spreadshot"
weapon_time[weapon.spread] = 6;
weapon_pspd[weapon.spread] = 8;
weapon_pnum[weapon.spread] = 5;
weapon_sprd[weapon.spread] = 5;
weapon_proj[weapon.spread] = obj_pellet;
weapon_case[weapon.spread] = 1;
weapons++;

weapon_name[weapon.heatseeker] = "Heat Seeker"
weapon_time[weapon.heatseeker] = 10;
weapon_pspd[weapon.heatseeker] = 6;
weapon_pnum[weapon.heatseeker] = 1;
weapon_sprd[weapon.heatseeker] = 0;
weapon_proj[weapon.heatseeker] = obj_heat_seeker;
weapon_case[weapon.heatseeker] = -1;
weapons++;

weapon_name[weapon.flame] = "Flame Thrower"
weapon_time[weapon.flame] = 4;
weapon_pspd[weapon.flame] = 6;
weapon_pnum[weapon.flame] = 1;
weapon_sprd[weapon.flame] = 0;
weapon_proj[weapon.flame] = obj_flamethrower_flame;
weapon_case[weapon.flame] = -1;
weapons++;
