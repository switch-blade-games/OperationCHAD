/// settings_load(filepath);

var _filepath = argument[0];

var buff = buffer_load(_filepath);
buffer_seek(buff,buffer_seek_start,0);

// check version
var _version = buffer_read(buff,buffer_u8);
if (_version != global.version)
    {
    buffer_delete(buff);
    return(false);
    }

// read settings
global.fullscreen = buffer_read(buff,buffer_u8);
global.crt = buffer_read(buff,buffer_u8);
global.particles = buffer_read(buff,buffer_u8);
global.btnstyle = buffer_read(buff,buffer_u8);
// read keybinds
global.key_left[0] = buffer_read(buff,buffer_u16);
global.key_right[0] = buffer_read(buff,buffer_u16);
global.key_up[0] = buffer_read(buff,buffer_u16);
global.key_down[0] = buffer_read(buff,buffer_u16);
global.key_jump[0] = buffer_read(buff,buffer_u16);
global.key_fire[0] = buffer_read(buff,buffer_u16);
global.key_lock[0] = buffer_read(buff,buffer_u16);
global.pad_left[0] = buffer_read(buff,buffer_u8);
global.pad_right[0] = buffer_read(buff,buffer_u8);
global.pad_up[0] = buffer_read(buff,buffer_u8);
global.pad_down[0] = buffer_read(buff,buffer_u8);
global.pad_jump[0] = buffer_read(buff,buffer_u8);
global.pad_fire[0] = buffer_read(buff,buffer_u8);
global.pad_lock[0] = buffer_read(buff,buffer_u8);

buffer_delete(buff);
return(true);
