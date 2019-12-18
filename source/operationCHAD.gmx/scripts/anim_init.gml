/// anim_init();

// player skin
skin_id = -1;
skin_tag[skin.stone] = "stone";
skin_tag[skin.foxford] = "foxford";
skin_tag[skin.yolo] = "yolo";
skin_tag[skin.pumpkin] = "pumpkin";

// sheet/json paths
for(var i=skin.stone; i<skin.size; i++;)
    {
    sheet_path[i] = working_directory+string(skin_tag[i])+"sheet.png";
    json_path[i]  = working_directory+string(skin_tag[i])+"info.json";
    }

spr_index = -1;
img_index = 0;

// player anim
anim_state = aState.idle;
anim_index = anim.idle;
anim_group = -1;
anim_angle = 0;
anim_start = 0;
anim_end = 0;
anim_len = 0;

// tag data
tags = 0;
tag_info = -1;
tag_map = -1;
// frame data
frames = 0;
frame_info = -1;
// anim data
anim_info = -1;

// tag enums
TAG_NAME    = 0;
TAG_START   = 1;
TAG_END     = 2;
// frame enums
FRAME_TEX_X = 0;
FRAME_TEX_Y = 1;
FRAME_TEX_W = 2;
FRAME_TEX_H = 3;
// group enums
EXP_GROUP[anim.walk] = 0;
EXP_GROUP[anim.walk_fire] = 0;
EXP_GROUP[anim.idle] = 1;
EXP_GROUP[anim.idle_fire] = 2;
EXP_GROUP[anim.duck] = 1;
EXP_GROUP[anim.idle_ramp_d] = 1;
EXP_GROUP[anim.duck_ramp_d] = 1;
EXP_GROUP[anim.idle_ramp_u] = 1;
EXP_GROUP[anim.duck_ramp_u] = 1;
EXP_GROUP[anim.wc] = 3;
EXP_GROUP[anim.wc_fire] = 4;
EXP_GROUP[anim.mb] = 5;
EXP_GROUP[anim.mb_fire] = 6;
EXP_GROUP[anim.moto] = 7;
EXP_GROUP[anim.moto_fire] = 8;
EXP_GROUP[anim.roll] = 9;
EXP_GROUP[anim.dead_roll] = 10;
EXP_GROUP[anim.dead] = 11;
// expected tags
for(var i=0; i<anim.size; i++;)
    {
    for(var j=0; j<8; j++;)
        EXP_TAG[i,j] = "";
    }
EXP_TAG[anim.walk,0]           = "W_0";
EXP_TAG[anim.walk,1]           = "W_45";
EXP_TAG[anim.walk,2]           = "W_315";
EXP_TAG[anim.walk_fire,0]      = "W_shoot_0";
EXP_TAG[anim.walk_fire,1]      = "W_shoot_45";
EXP_TAG[anim.walk_fire,2]      = "W_shoot_315";
EXP_TAG[anim.idle,0]           = "idle";
EXP_TAG[anim.idle_fire,0]      = "F_0";
EXP_TAG[anim.idle_fire,1]      = "F_45";
EXP_TAG[anim.idle_fire,2]      = "F_90";
EXP_TAG[anim.idle_fire,3]      = "F_270";
EXP_TAG[anim.idle_fire,4]      = "F_315";
EXP_TAG[anim.duck,0]           = "F_duck";
EXP_TAG[anim.idle_ramp_d,0]    = "DR_0";
EXP_TAG[anim.idle_ramp_d,1]    = "DR_45";
EXP_TAG[anim.idle_ramp_d,2]    = "DR_90";
EXP_TAG[anim.idle_ramp_d,3]    = "DR_270";
EXP_TAG[anim.idle_ramp_d,4]    = "DR_315";
EXP_TAG[anim.duck_ramp_d,0]    = "DR_duck";
EXP_TAG[anim.idle_ramp_u,0]    = "UR_0";
EXP_TAG[anim.idle_ramp_u,1]    = "UR_45";
EXP_TAG[anim.idle_ramp_u,2]    = "UR_90";
EXP_TAG[anim.idle_ramp_u,3]    = "UR270";
EXP_TAG[anim.idle_ramp_u,4]    = "UR315";
EXP_TAG[anim.duck_ramp_u,0]    = "UR_duck";
EXP_TAG[anim.wc_fire,0]        = "C_0";
EXP_TAG[anim.wc_fire,1]        = "C_45";
EXP_TAG[anim.wc_fire,2]        = "W_90";
EXP_TAG[anim.wc_fire,3]        = "C_135";
EXP_TAG[anim.wc_fire,4]        = "C_180";
EXP_TAG[anim.wc_fire,5]        = "C_225";
EXP_TAG[anim.wc_fire,6]        = "C_270";
EXP_TAG[anim.wc_fire,7]        = "C_315";
EXP_TAG[anim.wc,0]             = "C_move";
EXP_TAG[anim.mb_fire,0]        = "M_0";
EXP_TAG[anim.mb_fire,1]        = "M_45";
EXP_TAG[anim.mb_fire,2]        = "M_90";
EXP_TAG[anim.mb_fire,3]        = "M_270";
EXP_TAG[anim.mb_fire,4]        = "M_315";
EXP_TAG[anim.mb,0]             = "M_move";
EXP_TAG[anim.moto_fire,0]      = "B_0";
EXP_TAG[anim.moto_fire,1]      = "B_45";
EXP_TAG[anim.moto_fire,2]      = "B_90";
EXP_TAG[anim.moto_fire,3]      = "B_135";
EXP_TAG[anim.moto_fire,4]      = "B_180";
EXP_TAG[anim.moto_fire,5]      = "B_225";
EXP_TAG[anim.moto_fire,6]      = "B_270";
EXP_TAG[anim.moto_fire,7]      = "B_315";
EXP_TAG[anim.moto,0]           = "B_rest";
EXP_TAG[anim.roll,0]           = "jump";
EXP_TAG[anim.dead_roll,0]      = "dead_fly";
EXP_TAG[anim.dead,0]           = "dead";
// anim enums
ANIM_LEN   = 0;
ANIM_AIM   = 1;
ANIM_POS0  = 2;
ANIM_POS1  = 3;
ANIM_POS2  = 4;
ANIM_POS3  = 5;
ANIM_POS4  = 6;
ANIM_POS5  = 7;
ANIM_POS6  = 8;
ANIM_POS7  = 9;
