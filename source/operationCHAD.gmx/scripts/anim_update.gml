/// anim_update(anim,dir);

anim_index = argument[0];
if (argument_count > 1)
    face = argument[1];
else
    face = 1;

// determine start/end frame of animation
anim_len = anim_info[anim_index,ANIM_LEN];
if (anim_info[anim_index,ANIM_AIM])
    anim_start = anim_info[anim_index,ANIM_POS0+anim_angle];
else
    anim_start = anim_info[anim_index,ANIM_POS0];
anim_end = anim_start + anim_len;

if (anim_group != EXP_GROUP[anim_index])
    {
    anim_group = EXP_GROUP[anim_index];
    // start animation from beginning
    img_index = anim_start;
    }
else
    {
    // continue where it left off
    var _remainder = clamp(img_index-anim_start_old,0,anim_len_old);
    img_index = anim_start+_remainder;
    }
