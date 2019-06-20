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

// video settings
global.fullscreen = buffer_read(buff,buffer_u8);
global.scale = buffer_read(buff,buffer_u8);
global.curve = buffer_read(buff,buffer_f32);
global.scan = buffer_read(buff,buffer_f32);
global.particles = buffer_read(buff,buffer_u8);
// audio settings
global.bgm_gain = buffer_read(buff,buffer_f32);
global.sfx_gain = buffer_read(buff,buffer_f32);
// keyboard controls
global.key_left[0] = buffer_read(buff,buffer_u16);
global.key_right[0] = buffer_read(buff,buffer_u16);
global.key_up[0] = buffer_read(buff,buffer_u16);
global.key_down[0] = buffer_read(buff,buffer_u16);
global.key_jump[0] = buffer_read(buff,buffer_u16);
global.key_fire[0] = buffer_read(buff,buffer_u16);
global.key_lock[0] = buffer_read(buff,buffer_u16);
// gamepad 1 controls
global.pad_left[0] = buffer_read(buff,buffer_u8);
global.pad_right[0] = buffer_read(buff,buffer_u8);
global.pad_up[0] = buffer_read(buff,buffer_u8);
global.pad_down[0] = buffer_read(buff,buffer_u8);
global.pad_jump[0] = buffer_read(buff,buffer_u8);
global.pad_fire[0] = buffer_read(buff,buffer_u8);
global.pad_lock[0] = buffer_read(buff,buffer_u8);
// gamepad 2 controls
global.pad_left[1] = buffer_read(buff,buffer_u8);
global.pad_right[1] = buffer_read(buff,buffer_u8);
global.pad_up[1] = buffer_read(buff,buffer_u8);
global.pad_down[1] = buffer_read(buff,buffer_u8);
global.pad_jump[1] = buffer_read(buff,buffer_u8);
global.pad_fire[1] = buffer_read(buff,buffer_u8);
global.pad_lock[1] = buffer_read(buff,buffer_u8);
// gamepad button style
global.btnstyle = buffer_read(buff,buffer_u8);

buffer_delete(buff);
return(true);
