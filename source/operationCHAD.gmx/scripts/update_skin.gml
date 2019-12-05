/// update_skin();

for(var i=0; i<anim.size; i++;)
    {
    anim_group_len[i] = 0;
    anim_group_pos[i] = 0;
    
    anim_group[i] = 0;
    anim_aim[i] = false;
    anim_len[i] = 0;
    for(var j=0; j<8; j++;)
        anim_pos[i,j] = 0;
    }

img_index = 0;
switch(skin_id)
    {
    case skin.stonetoss:
        spr_index = stone_master_spr;
        break;
    case skin.yoloswag:
    default:
        spr_index = yolo_master_spr;
        break;
    }

////////////////////////////////////////////////////////////////////////

// animation group lengths
switch(skin_id)
    {
    case skin.stonetoss:
    case skin.yoloswag:
        anim_group_len[anim.walk] = 30;
        anim_group_len[anim.walk_fire] = 30;
        anim_group_len[anim.idle] = 10;
        anim_group_len[anim.duck] = 2;
        anim_group_len[anim.idle_ramp_d] = 10;
        anim_group_len[anim.duck_ramp_d] = 2;
        anim_group_len[anim.idle_ramp_u] = 10;
        anim_group_len[anim.duck_ramp_u] = 2;
        anim_group_len[anim.wc_fire] = 16;
        anim_group_len[anim.wc] = 4;
        anim_group_len[anim.mb_fire] = 10;
        anim_group_len[anim.mb] = 4;
        anim_group_len[anim.moto_fire] = 16;
        anim_group_len[anim.moto] = 2;
        anim_group_len[anim.roll] = 4;
        anim_group_len[anim.dead_roll] = 4;
        anim_group_len[anim.dead] = 2;
        break;
    }

// animation group positions
var _index = 0;
for(var i=0; i<anim.size; i++;)
    {
    anim_group_pos[i] = _index;
    _index += anim_group_len[i];
    }

////////////////////////////////////////////////////////////////////////

// create animation groups
switch(skin_id)
    {
    case skin.stonetoss:
    case skin.yoloswag:
        create_anim(anim.walk,0,10,true,0,1,0,1,0,2,0,2);
        create_anim(anim.walk_fire,0,10,true,0,1,0,1,0,2,0,2);
        create_anim(anim.idle,1,2,true,0,1,2,1,0,4,3,4);
        create_anim(anim.duck,1,2,false);
        create_anim(anim.idle_ramp_d,1,2,true,0,1,2,1,0,4,3,4);
        create_anim(anim.duck_ramp_d,1,2,false);
        create_anim(anim.idle_ramp_u,1,2,true,0,1,2,1,0,4,3,4);
        create_anim(anim.duck_ramp_u,1,2,false);
        create_anim(anim.wc_fire,2,2,true,0,1,2,3,4,5,6,7);
        create_anim(anim.wc,3,4,false);
        create_anim(anim.mb_fire,4,2,true,0,1,2,1,0,4,3,4);
        create_anim(anim.mb,5,2,false);
        create_anim(anim.moto_fire,6,2,true,0,1,2,3,4,5,6,7);
        create_anim(anim.moto,7,2,false);
        create_anim(anim.roll,8,4,false);
        create_anim(anim.dead_roll,9,4,false);
        create_anim(anim.dead,10,2,false);
        break;
    }

// animation state speeds
switch(skin_id)
    {
    case skin.stonetoss:
    case skin.yoloswag:
        img_speed[aState.walk] = 0.2;
        img_speed[aState.walk_fire] = 0.2;
        img_speed[aState.idle] = 0.2;
        img_speed[aState.duck] = 0.2;
        img_speed[aState.idle_ramp] = 0.2;
        img_speed[aState.duck_ramp] = 0.2;
        img_speed[aState.wc] = 0.2;
        img_speed[aState.wc_move] = 0.2;
        img_speed[aState.wc_fire] = 0.2;
        img_speed[aState.mb] = 0.2;
        img_speed[aState.mb_move] = 0.2;
        img_speed[aState.mb_fire] = 0.2;
        img_speed[aState.roll] = 0.3;
        img_speed[aState.moto] = 0.2;
        img_speed[aState.dead_lean] = 0.2;
        img_speed[aState.dead_roll] = 0.3;
        img_speed[aState.dead] = 0.2;
        break;
    }
