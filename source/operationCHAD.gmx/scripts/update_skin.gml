/// update_skin();

img_index = 0;
switch(skin_id)
    {
    case skin.stonetoss:
        skin_sprite = stone_master_spr;
        break;
    case skin.yoloswag:
    default:
        skin_sprite = yolo_master_spr;
        break;
    }

for(var i=0; i<anim.size; i++;)
    {
    anim_group_len[i] = 0;
    anim_group_pos[i] = 0;
    anim_group_ox[i] = 0;
    anim_group_oy[i] = 0;
    }

////////////////////////////////////////////////////////////////////////

// animation group lengths
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

// animation group positions
var _index = 0;
for(var i=0; i<anim.size; i++;)
    {
    anim_group_pos[i] = _index;
    _index += anim_group_len[i];
    }

// animation group offsets
anim_group_oy[anim.duck_ramp_d] = -6;
anim_group_oy[anim.idle_ramp_u] = -7;
anim_group_oy[anim.duck_ramp_u] = -10;
anim_group_oy[anim.mb_fire] = 7;
anim_group_oy[anim.mb] = 7;

////////////////////////////////////////////////////////////////////////

var _anim_id = anim.walk;
anim_len[_anim_id] = 10;
anim_pos[_anim_id,0] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 0
anim_pos[_anim_id,1] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 45
anim_pos[_anim_id,2] = 0;
anim_pos[_anim_id,3] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 135
anim_pos[_anim_id,4] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 180
anim_pos[_anim_id,5] = anim_group_pos[_anim_id] + anim_len[_anim_id]*2; // 225
anim_pos[_anim_id,6] = 0;
anim_pos[_anim_id,7] = anim_group_pos[_anim_id] + anim_len[_anim_id]*2; // 315

var _anim_id = anim.walk_fire;
anim_len[_anim_id] = 10;
anim_pos[_anim_id,0] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 0
anim_pos[_anim_id,1] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 45
anim_pos[_anim_id,2] = 0;
anim_pos[_anim_id,3] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 135
anim_pos[_anim_id,4] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 180
anim_pos[_anim_id,5] = anim_group_pos[_anim_id] + anim_len[_anim_id]*2; // 225
anim_pos[_anim_id,6] = 0;
anim_pos[_anim_id,7] = anim_group_pos[_anim_id] + anim_len[_anim_id]*2; // 315

var _anim_id = anim.idle;
anim_len[_anim_id] = 2;
anim_pos[_anim_id,0] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 0
anim_pos[_anim_id,1] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 45
anim_pos[_anim_id,2] = anim_group_pos[_anim_id] + anim_len[_anim_id]*2; // 90
anim_pos[_anim_id,3] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 135
anim_pos[_anim_id,4] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 180
anim_pos[_anim_id,5] = anim_group_pos[_anim_id] + anim_len[_anim_id]*4; // 225
anim_pos[_anim_id,6] = anim_group_pos[_anim_id] + anim_len[_anim_id]*3; // 270
anim_pos[_anim_id,7] = anim_group_pos[_anim_id] + anim_len[_anim_id]*4; // 315

var _anim_id = anim.duck;
anim_len[_anim_id] = 2;
anim_pos[_anim_id] = anim_group_pos[_anim_id];

var _anim_id = anim.idle_ramp_d;
anim_len[_anim_id] = 2;
anim_pos[_anim_id,0] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 0
anim_pos[_anim_id,1] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 45
anim_pos[_anim_id,2] = anim_group_pos[_anim_id] + anim_len[_anim_id]*2; // 90
anim_pos[_anim_id,3] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 135
anim_pos[_anim_id,4] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 180
anim_pos[_anim_id,5] = anim_group_pos[_anim_id] + anim_len[_anim_id]*4; // 225
anim_pos[_anim_id,6] = anim_group_pos[_anim_id] + anim_len[_anim_id]*3; // 270
anim_pos[_anim_id,7] = anim_group_pos[_anim_id] + anim_len[_anim_id]*4; // 315

var _anim_id = anim.duck_ramp_d;
anim_len[_anim_id] = 2;
anim_pos[_anim_id] = anim_group_pos[_anim_id];

var _anim_id = anim.idle_ramp_u;
anim_len[_anim_id] = 2;
anim_pos[_anim_id,0] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 0
anim_pos[_anim_id,1] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 45
anim_pos[_anim_id,2] = anim_group_pos[_anim_id] + anim_len[_anim_id]*2; // 90
anim_pos[_anim_id,3] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 135
anim_pos[_anim_id,4] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 180
anim_pos[_anim_id,5] = anim_group_pos[_anim_id] + anim_len[_anim_id]*4; // 225
anim_pos[_anim_id,6] = anim_group_pos[_anim_id] + anim_len[_anim_id]*3; // 270
anim_pos[_anim_id,7] = anim_group_pos[_anim_id] + anim_len[_anim_id]*4; // 315

var _anim_id = anim.duck_ramp_u;
anim_len[_anim_id] = 2;
anim_pos[_anim_id] = anim_group_pos[_anim_id];

var _anim_id = anim.wc_fire;
anim_len[_anim_id] = 2;
anim_pos[_anim_id,0] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 0
anim_pos[_anim_id,1] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 45
anim_pos[_anim_id,2] = anim_group_pos[_anim_id] + anim_len[_anim_id]*2; // 90
anim_pos[_anim_id,3] = anim_group_pos[_anim_id] + anim_len[_anim_id]*3; // 135
anim_pos[_anim_id,4] = anim_group_pos[_anim_id] + anim_len[_anim_id]*4; // 180
anim_pos[_anim_id,5] = anim_group_pos[_anim_id] + anim_len[_anim_id]*5; // 225
anim_pos[_anim_id,6] = anim_group_pos[_anim_id] + anim_len[_anim_id]*6; // 270
anim_pos[_anim_id,7] = anim_group_pos[_anim_id] + anim_len[_anim_id]*7; // 315

var _anim_id = anim.wc;
anim_len[_anim_id] = 4;
anim_pos[_anim_id] = anim_group_pos[_anim_id];

var _anim_id = anim.mb_fire;
anim_len[_anim_id] = 2;
anim_pos[_anim_id,0] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 0
anim_pos[_anim_id,1] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 45
anim_pos[_anim_id,2] = anim_group_pos[_anim_id] + anim_len[_anim_id]*2; // 90
anim_pos[_anim_id,3] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 135
anim_pos[_anim_id,4] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 180
anim_pos[_anim_id,5] = anim_group_pos[_anim_id] + anim_len[_anim_id]*4; // 225
anim_pos[_anim_id,6] = anim_group_pos[_anim_id] + anim_len[_anim_id]*3; // 270
anim_pos[_anim_id,7] = anim_group_pos[_anim_id] + anim_len[_anim_id]*4; // 315

var _anim_id = anim.mb;
anim_len[_anim_id] = 2;
anim_pos[_anim_id] = anim_group_pos[_anim_id];

var _anim_id = anim.moto_fire;
anim_len[_anim_id] = 2;
anim_pos[_anim_id,0] = anim_group_pos[_anim_id] + anim_len[_anim_id]*0; // 0
anim_pos[_anim_id,1] = anim_group_pos[_anim_id] + anim_len[_anim_id]*1; // 45
anim_pos[_anim_id,2] = anim_group_pos[_anim_id] + anim_len[_anim_id]*2; // 90
anim_pos[_anim_id,3] = anim_group_pos[_anim_id] + anim_len[_anim_id]*3; // 135
anim_pos[_anim_id,4] = anim_group_pos[_anim_id] + anim_len[_anim_id]*4; // 180
anim_pos[_anim_id,5] = anim_group_pos[_anim_id] + anim_len[_anim_id]*5; // 225
anim_pos[_anim_id,6] = anim_group_pos[_anim_id] + anim_len[_anim_id]*6; // 270
anim_pos[_anim_id,7] = anim_group_pos[_anim_id] + anim_len[_anim_id]*7; // 315

var _anim_id = anim.moto;
anim_len[_anim_id] = 2;
anim_pos[_anim_id] = anim_group_pos[_anim_id];

var _anim_id = anim.roll;
anim_len[_anim_id] = 4;
anim_pos[_anim_id] = anim_group_pos[_anim_id];

var _anim_id = anim.dead_roll;
anim_len[_anim_id] = 4;
anim_pos[_anim_id] = anim_group_pos[_anim_id];

var _anim_id = anim.dead;
anim_len[_anim_id] = 2;
anim_pos[_anim_id] = anim_group_pos[_anim_id];
