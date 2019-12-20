/// anim_update();

if (argument_count > 0)
    face = argument[0];
else
    face = dir;

// determine start/end frame of animation
anim_len = anim_info[anim_state,ANIM_LEN];
if (anim_info[anim_state,ANIM_AIM])
    anim_start = anim_info[anim_state,ANIM_POS0+anim_angle];
else
    anim_start = anim_info[anim_state,ANIM_POS0];
anim_end = anim_start + anim_len;

if (anim_group != EXP_GROUP[anim_state])
    {
    anim_group = EXP_GROUP[anim_state];
    // start animation from beginning
    img_index = anim_start;
    }
else
    {
    // continue where it left off
    var _remainder = clamp(img_index-anim_start_old,0,anim_len_old);
    img_index = anim_start+_remainder;
    }
