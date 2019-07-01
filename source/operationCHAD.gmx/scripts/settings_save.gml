/// settings_save(filepath);

var _filepath = argument[0];

var buff = buffer_create(512,buffer_fixed,1);
buffer_seek(buff,buffer_seek_start,0);
buffer_write(buff,buffer_u8,global.version);

// video settings
buffer_write(buff,buffer_u8,global.fullscreen);
buffer_write(buff,buffer_u8,global.scale);
buffer_write(buff,buffer_u8,global.vsync);
buffer_write(buff,buffer_u8,global.aa);
buffer_write(buff,buffer_f32,global.curve);
buffer_write(buff,buffer_f32,global.scan);
buffer_write(buff,buffer_u8,global.particles);
// audio settings
buffer_write(buff,buffer_f32,global.bgm_gain);
buffer_write(buff,buffer_f32,global.sfx_gain);
// keyboard controls
buffer_write(buff,buffer_u16,global.key_left[0]);
buffer_write(buff,buffer_u16,global.key_right[0]);
buffer_write(buff,buffer_u16,global.key_up[0]);
buffer_write(buff,buffer_u16,global.key_down[0]);
buffer_write(buff,buffer_u16,global.key_jump[0]);
buffer_write(buff,buffer_u16,global.key_fire[0]);
buffer_write(buff,buffer_u16,global.key_lock[0]);
// gamepad 1 controls
buffer_write(buff,buffer_u8,global.pad_left[0]);
buffer_write(buff,buffer_u8,global.pad_right[0]);
buffer_write(buff,buffer_u8,global.pad_up[0]);
buffer_write(buff,buffer_u8,global.pad_down[0]);
buffer_write(buff,buffer_u8,global.pad_jump[0]);
buffer_write(buff,buffer_u8,global.pad_fire[0]);
buffer_write(buff,buffer_u8,global.pad_lock[0]);
// gamepad 2 controls
buffer_write(buff,buffer_u8,global.pad_left[1]);
buffer_write(buff,buffer_u8,global.pad_right[1]);
buffer_write(buff,buffer_u8,global.pad_up[1]);
buffer_write(buff,buffer_u8,global.pad_down[1]);
buffer_write(buff,buffer_u8,global.pad_jump[1]);
buffer_write(buff,buffer_u8,global.pad_fire[1]);
buffer_write(buff,buffer_u8,global.pad_lock[1]);
// gamepad button style
buffer_write(buff,buffer_u8,global.btnstyle);

var bytes = buffer_tell(buff);
buffer_save_ext(buff,_filepath,0,bytes);
buffer_delete(buff);
