/// anim_create(id,...);

var _anim_id = argument[0];

var _anim_aim;
var _anim_tag;
if (argument_count == 1)
    {
    _anim_aim = false;
    _anim_tag[0] = EXP_TAG[_anim_id,0];
    for(var i=1; i<8; i++;)
        _anim_tag[i] = "";
    }
else if (argument_count == 9)
    {
    _anim_aim = true;
    for(var i=0; i<8; i++;)
        _anim_tag[i] = EXP_TAG[_anim_id,argument[1+i]];
    }

// lookup start frame for each tag
var _anim_pos;
for(var i=0; i<8; i++;)
    {
    if (ds_map_exists(tag_map,_anim_tag[i]))
        _anim_pos[i] = tag_info[tag_map[?_anim_tag[i]],TAG_START];
    else
        _anim_pos[i] = 0;
    }

// lookup frame len for first tag
if (ds_map_exists(tag_map,_anim_tag[0]))
    var _anim_len = (tag_info[tag_map[?_anim_tag[0]],TAG_END]-_anim_pos[0])+1;
else
    var _anim_len = 0;

// anim data
anim_info[_anim_id,ANIM_LEN]    = _anim_len;
anim_info[_anim_id,ANIM_AIM]    = _anim_aim;
for(var i=0; i<8; i++;)
    anim_info[_anim_id,ANIM_POS0+i] = _anim_pos[i];
