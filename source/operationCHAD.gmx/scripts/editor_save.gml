/// editor_save(filepath);

var buff = buffer_create(4096,buffer_grow,1);
buffer_seek(buff,buffer_seek_start,0);
buffer_write(buff,buffer_u8,global.version);

var seek = buffer_tell(buff);
buffer_write(buff,buffer_u16,0);

var num = 0;
var key = ds_map_find_first(collide_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(collide_map,key);
    if (instance_exists(inst))
        {
        buffer_write(buff,buffer_u16,inst.object_index);
        buffer_write(buff,buffer_s16,inst.x);
        buffer_write(buff,buffer_s16,inst.y);
        num++;
        }
    var key = ds_map_find_next(collide_map,key);
    }

show_debug_message("COLLIDERS: "+string(num));
buffer_poke(buff,seek,buffer_u16,num);

show_debug_message("LAYERS: "+string(layers));
buffer_write(buff,buffer_u8,layers);

for(var i=0; i<layers; i++;)
    {
    var tilelist = tile_get_ids_at_depth(layer_depth[i]);
    var tiles = array_length_1d(tilelist);
    
    var seek = buffer_tell(buff);
    buffer_write(buff,buffer_u16,0);
    buffer_write(buff,buffer_s8,layer_depth[i]);
    
    var num = 0;
    for(var j=0; j<tiles; j++;)
        {
        var tile = tilelist[j];
        if (tile_exists(tile))
            {
            buffer_write(buff,buffer_u8,tile_get_background(tile));
            buffer_write(buff,buffer_s16,tile_get_x(tile));
            buffer_write(buff,buffer_s16,tile_get_y(tile));
            buffer_write(buff,buffer_u8,floor(tile_get_left(tile)/20));
            buffer_write(buff,buffer_u8,floor(tile_get_top(tile)/20));
            buffer_write(buff,buffer_u8,floor(tile_get_width(tile)/20));
            buffer_write(buff,buffer_u8,floor(tile_get_height(tile)/20));
            num++;
            }
        }
    
    show_debug_message("TILES["+string(i)+"]: "+string(num));
    buffer_poke(buff,seek,buffer_u16,num);
    }

buffer_save(buff,argument[0]);
buffer_delete(buff);
return(true);
