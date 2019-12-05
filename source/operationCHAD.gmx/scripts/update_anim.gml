/// update_anim(anim,dir);

anim_index = argument[0];
if (argument_count > 1)
    face = argument[1];
else
    face = 1;

// determine start/end frame of animation
if (anim_aim[anim_index])
    anim_start = anim_pos[anim_index,anim_angle];
else
    anim_start = anim_pos[anim_index,0];
anim_end = anim_start + anim_len[anim_index];

if (anim_group[anim_index] != anim_group_old)
    {
    // start animation from beginning
    img_index = anim_start;
    }
else
    {
    // continue where it left off
    var _remainder = clamp(img_index-anim_start_old,0,anim_len_old);
    img_index = anim_start+_remainder;
    }
