/// config_load(filepath);

if (argument_count > 0)
    var _filepath = argument[0];
else
    var _filepath = global.CFGfile;

if (!file_exists(_filepath))
    return(false);

_map = ds_map_create();

var _file = file_text_open_read(_filepath);
var _version = file_text_read_string(_file);
file_text_readln(_file);
var _enc = file_text_read_string(_file);
file_text_close(_file);

ds_map_read(_map,_enc);

if (_version != global.CFGversion)
or (ds_map_size(_map) < config.size-1)
    {
    ds_map_destroy(_map);
    return(false);
    }

var _key = ds_map_find_first(_map);
while(ds_map_exists(_map,_key))
    {
    if (ds_map_exists(global.CFGmap,_key))
        {
        var _index = global.CFGmap[?_key];
        global.CFG[_index] = _map[?_key];
        }
    var _key = ds_map_find_next(_map,_key);
    }

return(true);
