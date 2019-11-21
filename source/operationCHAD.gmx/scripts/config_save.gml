/// config_save(filepath);

if (argument_count > 0)
    var _filepath = argument[0];
else
    var _filepath = global.CFGfile;

// write version and settings to map
var _map = ds_map_create();
for(var i=0; i<config.size; i++;)
    _map[?global.CFGtag[i]] = global.CFG[i];
// encode map into a string and cleanup
var _enc = ds_map_write(_map);
ds_map_destroy(_map);

// write string to file
var _file = file_text_open_write(_filepath);
file_text_write_string(_file,global.CFGversion);
file_text_writeln(_file);
file_text_write_string(_file,_enc);
file_text_close(_file);
