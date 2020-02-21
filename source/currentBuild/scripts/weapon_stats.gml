/// weapon_stats();

weapons = 0;
enum weapon
    {
    rifle,
    flame,
    spread,
    homing,
    rollingCutter,
    crushShot,
    spinFlame
    }

weapon_name[weapon.rifle] = "Rifle";    // Name
weapon_auto[weapon.rifle] = true;       // automatic (hold LMB vs. click to fire)
weapon_pmax[weapon.rifle] = -1;         // max projectiles on screen
weapon_time[weapon.rifle] = 4;          // time between each shot (effects fire rate)
weapon_pspd[weapon.rifle] = 8;          // projectile speed
weapon_pnum[weapon.rifle] = 1;          // projectile number
weapon_sprd[weapon.rifle] = 0;          // spread (angle between each projectile)
weapon_proj[weapon.rifle] = obj_bullet; // projectile object
weapon_case[weapon.rifle] = 0;          // type of casing
weapon_snd[weapon.rifle] = bullet_snd;  // sound to play when firing
weapons++;

weapon_name[weapon.flame] = "Flame Thrower";
weapon_auto[weapon.flame] = true;
weapon_pmax[weapon.flame] = -1;
weapon_time[weapon.flame] = 4;
weapon_pspd[weapon.flame] = 6;
weapon_pnum[weapon.flame] = 1;
weapon_sprd[weapon.flame] = 0;
weapon_proj[weapon.flame] = obj_flamethrower_flame;
weapon_case[weapon.flame] = -1;
weapon_snd[weapon.flame] = bullet_snd;
weapons++;

weapon_name[weapon.spread] = "Spreadshot";
weapon_auto[weapon.spread] = true;
weapon_pmax[weapon.spread] = 15;
weapon_time[weapon.spread] = 6;
weapon_pspd[weapon.spread] = 8;
weapon_pnum[weapon.spread] = 5;
weapon_sprd[weapon.spread] = 5;
weapon_proj[weapon.spread] = obj_pellet;
weapon_case[weapon.spread] = 1;
weapon_snd[weapon.spread] = bullet_snd;
weapons++;

weapon_name[weapon.homing] = "Heat Seeker";
weapon_auto[weapon.homing] = true;
weapon_pmax[weapon.homing] = 3;
weapon_time[weapon.homing] = 10;
weapon_pspd[weapon.homing] = 6;
weapon_pnum[weapon.homing] = 1;
weapon_sprd[weapon.homing] = 0;
weapon_proj[weapon.homing] = obj_heat_seeker;
weapon_case[weapon.homing] = -1;
weapon_snd[weapon.homing] = bullet_snd;
weapons++;

weapon_name[weapon.rollingCutter] = "Rolling Cutter";
weapon_auto[weapon.rollingCutter] = true;
weapon_pmax[weapon.rollingCutter] = 3;
weapon_time[weapon.rollingCutter] = 10;
weapon_pspd[weapon.rollingCutter] = 6;
weapon_pnum[weapon.rollingCutter] = 1;
weapon_sprd[weapon.rollingCutter] = 0;
weapon_proj[weapon.rollingCutter] = obj_rolling_cutter;
weapon_case[weapon.rollingCutter] = 1;
weapon_snd[weapon.rollingCutter] = bullet_snd;
weapons++;

weapon_name[weapon.crushShot] = "Crush Shot";
weapon_auto[weapon.crushShot] = true;
weapon_pmax[weapon.crushShot] = 3;
weapon_time[weapon.crushShot] = 22;
weapon_pspd[weapon.crushShot] = 6;
weapon_pnum[weapon.crushShot] = 1;
weapon_sprd[weapon.crushShot] = 0;
weapon_proj[weapon.crushShot] = obj_crush_shot;
weapon_case[weapon.crushShot] = -1;
weapon_snd[weapon.crushShot] = bullet_snd;
weapons++;

weapon_name[weapon.spinFlame] = "Spin Flame";
weapon_auto[weapon.spinFlame] = false;
weapon_pmax[weapon.spinFlame] = 3;
weapon_time[weapon.spinFlame] = 12;
weapon_pspd[weapon.spinFlame] = 5; // projectile speed
weapon_pnum[weapon.spinFlame] = 1;
weapon_sprd[weapon.spinFlame] = 0;
weapon_proj[weapon.spinFlame] = obj_spin_flame;
weapon_case[weapon.spinFlame] = -1;
weapon_snd[weapon.spinFlame] = bullet_snd;
weapons++;
