/// editor clear();

global.levelname = "Untitled";

var key = ds_map_find_first(collide_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(collide_map,key);
    with(inst)
        instance_destroy();
    var key = ds_map_find_next(collide_map,key);
    }
ds_map_clear(collide_map);

for(var i=0; i<layers; i++;)
    {
    tile_layer_delete(layer_depth[i]);
    layer_count[i] = 0;
    }

var key = ds_map_find_first(entity_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(entity_map,key);
    with(inst)
        instance_destroy();
    var key = ds_map_find_next(entity_map,key);
    }
ds_map_clear(entity_map);
