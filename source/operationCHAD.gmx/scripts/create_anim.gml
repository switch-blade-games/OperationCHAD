/// create_anim(id,group,len,aim,...);

var _anim_id = argument[0];

anim_group[_anim_id] = argument[1];
anim_len[_anim_id] = argument[2];
anim_aim[_anim_id] = argument[3];
if (argument_count > 4)
    {
    for(var i=0; i<argument_count-4; i++;)
        anim_pos[_anim_id,i] = anim_group_pos[_anim_id] + anim_len[_anim_id]*argument[4+i];
    }
else
    anim_pos[_anim_id,0] = anim_group_pos[_anim_id];
