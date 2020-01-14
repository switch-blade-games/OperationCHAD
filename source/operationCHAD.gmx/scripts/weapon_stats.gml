/// weapon_stats();

weapons = 0;
enum weapon
    {
    rifle,
    flame,
    spread,
    homing,
    rollingCutter,
    }

weapon_name[weapon.rifle] = "Rifle";
weapon_time[weapon.rifle] = 4;
weapon_pspd[weapon.rifle] = 8;
weapon_pnum[weapon.rifle] = 1;
weapon_sprd[weapon.rifle] = 0;
weapon_proj[weapon.rifle] = obj_bullet;
weapon_case[weapon.rifle] = 0;
weapons++;

weapon_name[weapon.flame] = "Flame Thrower"
weapon_time[weapon.flame] = 4;
weapon_pspd[weapon.flame] = 6;
weapon_pnum[weapon.flame] = 1;
weapon_sprd[weapon.flame] = 0;
weapon_proj[weapon.flame] = obj_flamethrower_flame;
weapon_case[weapon.flame] = -1;
weapons++;

weapon_name[weapon.spread] = "Spreadshot"
weapon_time[weapon.spread] = 6;
weapon_pspd[weapon.spread] = 8;
weapon_pnum[weapon.spread] = 5;
weapon_sprd[weapon.spread] = 5;
weapon_proj[weapon.spread] = obj_pellet;
weapon_case[weapon.spread] = 1;
weapons++;

weapon_name[weapon.homing] = "Heat Seeker"
weapon_time[weapon.homing] = 10;
weapon_pspd[weapon.homing] = 6;
weapon_pnum[weapon.homing] = 1;
weapon_sprd[weapon.homing] = 0;
weapon_proj[weapon.homing] = obj_heat_seeker;
weapon_case[weapon.homing] = -1;
weapons++;

weapon_name[weapon.rollingCutter] = "Rolling Cutter";
weapon_time[weapon.rollingCutter] = 10;
weapon_pspd[weapon.rollingCutter] = 6;
weapon_pnum[weapon.rollingCutter] = 1;
weapon_sprd[weapon.rollingCutter] = 0;
weapon_proj[weapon.rollingCutter] = obj_rolling_cutter;
weapon_case[weapon.rollingCutter] = 1;
weapons++;
