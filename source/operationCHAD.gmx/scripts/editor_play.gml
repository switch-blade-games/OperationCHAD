/// editor_play();

last = mode;
mode = -1;

edit_vx = view_xview[0];
edit_vy = view_yview[0];

var key = ds_map_find_first(collide_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(collide_map,key);
    with(inst)
        visible = false;
    var key = ds_map_find_next(collide_map,key);
    }

for(var i=0; i<layers; i++;)
    {
    var tilelist = tile_get_ids_at_depth(layer_depth[i]);
    var tiles = array_length_1d(tilelist);
    
    for(var j=0; j<tiles; j++;)
        {
        var tile = tilelist[j];
        if (tile_exists(tile))
            tile_set_alpha(tile,1);
        }
    }

var key = ds_map_find_first(entity_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(entity_map,key);
    with(inst)
        visible = false;
    var key = ds_map_find_next(entity_map,key);
    }

with(obj_player_spawn)
    {
    instance_create(0,0,obj_control);
    instance_create(x,y,obj_player);
    }
