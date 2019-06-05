/// editor_load(filepath);

var buff = buffer_load(argument[0]);
buffer_seek(buff,buffer_seek_start,0);

var version = buffer_read(buff,buffer_u8);
if (version != global.version)
    {
    buffer_delete(buff);
    return(false);
    }

editor_clear();

var file_name = filename_name(argument[0]);
var file_ext = filename_ext(argument[0]);
global.levelname = string_replace_all(file_name,file_ext,"");

var collide_map_size = buffer_read(buff,buffer_u16);
show_debug_message("COLLIDERS: "+string(collide_map_size));

for(var i=0; i<collide_map_size; i++;)
    {
    var obj = buffer_read(buff,buffer_u16);
    var ox = buffer_read(buff,buffer_s16);
    var oy = buffer_read(buff,buffer_s16);
    
    var inst = instance_create(ox,oy,obj);
    ds_map_add(collide_map,string(ox)+":"+string(oy),inst);
    }

layers = buffer_read(buff,buffer_u8);
show_debug_message("LAYERS: "+string(layers));

for(var i=0; i<layers; i++;)
    {
    var tiles = buffer_read(buff,buffer_u16);
    show_debug_message("TILES["+string(i)+"]: "+string(tiles));
    
    layer_depth[i] = buffer_read(buff,buffer_s8);
    for(var j=0; j<tiles; j++;)
        {
        var tbg = buffer_read(buff,buffer_u8);
        var tx = buffer_read(buff,buffer_s16);
        var ty = buffer_read(buff,buffer_s16);
        var tl = buffer_read(buff,buffer_u8)*20;
        var tt = buffer_read(buff,buffer_u8)*20;
        var tw = buffer_read(buff,buffer_u8)*20;
        var th = buffer_read(buff,buffer_u8)*20;
        
        tile_add(tbg,tl,tt,tw,th,tx,ty,layer_depth[i]);
        layer_count[i]++;
        }
    }

var entity_map_size = buffer_read(buff,buffer_u16);
show_debug_message("ENTITIES: "+string(entity_map_size));

for(var i=0; i<entity_map_size; i++;)
    {
    var obj = buffer_read(buff,buffer_u16);
    var ex = buffer_read(buff,buffer_s16);
    var ey = buffer_read(buff,buffer_s16);
    
    var inst = instance_create(ex,ey,obj);
    ds_map_add(entity_map,string(ex)+":"+string(ey),inst);
    }

buffer_delete(buff);
return(true);
