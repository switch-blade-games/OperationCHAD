/// settings_save(filepath);

var _filepath = argument[0];

var buff = buffer_create(1024,buffer_fixed,1);
buffer_seek(buff,buffer_seek_start,0);
buffer_write(buff,buffer_u8,global.version);

// write settings
buffer_write(buff,buffer_u8,global.fullscreen);
buffer_write(buff,buffer_u8,global.crt);
buffer_write(buff,buffer_u8,global.particles);
buffer_write(buff,buffer_u8,global.btnstyle);
// write keybinds
buffer_write(buff,buffer_u16,global.key_left[0]);
buffer_write(buff,buffer_u16,global.key_right[0]);
buffer_write(buff,buffer_u16,global.key_up[0]);
buffer_write(buff,buffer_u16,global.key_down[0]);
buffer_write(buff,buffer_u16,global.key_jump[0]);
buffer_write(buff,buffer_u16,global.key_fire[0]);
buffer_write(buff,buffer_u16,global.key_lock[0]);
buffer_write(buff,buffer_u16,global.pad_left[0]);
buffer_write(buff,buffer_u16,global.pad_right[0]);
buffer_write(buff,buffer_u16,global.pad_up[0]);
buffer_write(buff,buffer_u16,global.pad_down[0]);
buffer_write(buff,buffer_u16,global.pad_jump[0]);
buffer_write(buff,buffer_u16,global.pad_fire[0]);
buffer_write(buff,buffer_u16,global.pad_lock[0]);

var bytes = buffer_tell(buff);
buffer_save_ext(buff,_filepath,0,bytes);
buffer_delete(buff);
