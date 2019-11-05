/// settings_init();

global.version = 6;

// video settings
global.fullscreen = false;
global.scale = 2;
global.vsync = 0;
global.aa = 0;
global.curve = 0.25;
global.scan = 0.25;
global.particles = false;
// audio settings
global.bgm_gain = 0.75;
global.sfx_gain = 0.75;
// keyboard controls
global.key_left[0] = vk_left;
global.key_right[0] = vk_right;
global.key_up[0] = vk_up;
global.key_down[0] = vk_down;
global.key_swap[0] = ord("C");
global.key_jump[0] = ord("X");
global.key_fire[0] = ord("Z");
global.key_lock[0] = vk_shift;
// gamepad 1 controls
global.pad_left[0] = gpinput.padl;
global.pad_right[0] = gpinput.padr;
global.pad_up[0] = gpinput.padu;
global.pad_down[0] = gpinput.padd;
global.pad_swap[0] = gpinput.face4;
global.pad_jump[0] = gpinput.face1;
global.pad_fire[0] = gpinput.face3;
global.pad_lock[0] = gpinput.bumpr;
// gamepad 2 controls
global.pad_left[1] = gpinput.padl;
global.pad_right[1] = gpinput.padr;
global.pad_up[1] = gpinput.padu;
global.pad_down[1] = gpinput.padd;
global.pad_swap[1] = gpinput.face4;
global.pad_jump[1] = gpinput.face1;
global.pad_fire[1] = gpinput.face3;
global.pad_lock[1] = gpinput.bumpr;
// gamepad button style
global.btnstyle = true;
