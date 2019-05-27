if (shoot_timer == 0)
    {
    shoot_timer = weapon_time[cur_weapon];
    recoil = weapon_kick[cur_weapon];
    
    // aim vector
    var ldx = lengthdir_x(1,aim);
    var ldy = lengthdir_y(1,aim);
    
    // bullet
    var inst = instance_create(x+ldx*16,y+arm_pos+ldy*16,weapon_proj[cur_weapon]);
    inst.direction = aim;
    inst.speed = weapon_pspd[cur_weapon]
    inst.image_angle = aim;
    inst.team = 0;
    inst.damage = 4;
    
    // bullet/shell casing
    var inst = instance_create(x+ldx*12,y+arm_pos+ldy*12,weapon_case[cur_weapon]);
    if (aim == 0)
        inst.direction = aim+random_range(130,160);
    else
        inst.direction = aim-random_range(130,160);
    inst.speed = 4+random(2);
    
    // smoke
    repeat(3)
        {
        var inst = instance_create(x+ldx*12,y+arm_pos+ldy*12,obj_dust);
        inst.direction = aim+random_range(-15,15);
        inst.speed = 6+random(2);
        inst.friction = 0.8;
        inst.image_xscale *= 0.5;
        inst.image_yscale *= 0.5;
        inst.fade = 0.1;
        }
    }
