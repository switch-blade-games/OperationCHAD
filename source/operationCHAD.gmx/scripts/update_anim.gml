/// update_anim(anim,dir);

var _anim_index_old = anim_index;
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

if (anim_index != _anim_index_old)
    img_index = anim_start;
