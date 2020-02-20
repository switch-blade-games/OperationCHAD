/// paperdoll(type,index,dir);

var _type = argument[0];
var _index = argument[1];
var _dir = argument[2];
if (_type >= doll.size) or (_type < 0)
    return(false);
if (_index >= skin_spr.size) or (_index < 0)
    return(false);

draw[_type] = true;
spr_index[_type] = _index;
spr_id[_type] = sprite[_index];
spr_dir[_type] = _dir;

if (sprite_offset_states[_index] > 0)
    {
    for(var i=0; i<sprite_offset_states[_index]; i++;)
        {
        if (sprite_offset_state[_index,i] == anim_state)
            {
            spr_ox[_type] = sprite_offset_x[_index,i];
            spr_oy[_type] = sprite_offset_y[_index,i];
            break;
            }
        }
    }
else
    {
    spr_ox[_type] = 0;
    spr_oy[_type] = 0;
    }
