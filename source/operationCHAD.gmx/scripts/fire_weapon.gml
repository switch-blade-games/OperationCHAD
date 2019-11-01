var muzzle_y = gun_y;

if (shoot_timer == 0)
    {
    shoot_timer = weapon_time[cur_weapon];
    
    if (cur_weapon == 3)
        var ang = flame_ang;
    else
        {
        if (weapon_pnum[cur_weapon] == 1)
            var ang = aim;
        else if (weapon_pnum[cur_weapon] == 2)
            var ang = aim-(weapon_sprd[cur_weapon]/2);
        else if (weapon_pnum[cur_weapon] > 2)
            var ang = aim - weapon_sprd[cur_weapon]*floor(weapon_pnum[cur_weapon]/2);
        }
    
    repeat(weapon_pnum[cur_weapon])
        {
        // aim vector
        var ldx = lengthdir_x(1,ang);
        var ldy = lengthdir_y(1,ang);
        
        // bullet
        var inst = instance_create(x+ldx*16,y+muzzle_y+ldy*16,weapon_proj[cur_weapon]);
        inst.direction = ang;
        inst.speed = weapon_pspd[cur_weapon]
        inst.image_angle = ang;
        
        ang += weapon_sprd[cur_weapon];
        }
    
    // aim vector
    var ldx = lengthdir_x(1,aim);
    var ldy = lengthdir_y(1,aim);
    
    if (weapon_case[cur_weapon] >= 0)
        {
        // bullet/shell casing
        var inst = instance_create(x+ldx*12,y+muzzle_y+ldy*12,obj_casing);
        if (aim == 0)
            inst.direction = aim+random_range(130,160);
        else
            inst.direction = aim-random_range(130,160);
        inst.speed = 4+random(2);
        inst.image_speed = 0;
        inst.image_index = weapon_case[cur_weapon];
        }
    
    // sound
    
    if(instance_number(tunnel)=0)
    snd_play_3d(x,y,bullet_snd,0.5,1);
    
    
    // smoke
    repeat(3)
        {
        var inst = instance_create(x+ldx*12,y+muzzle_y+ldy*12,obj_dust);
        inst.direction = aim+random_range(-15,15);
        inst.speed = 6+random(2);
        inst.friction = 0.8;
        inst.image_xscale *= 0.5;
        inst.image_yscale *= 0.5;
        inst.fade = 0.1;
        }
    }
