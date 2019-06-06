/// input();

input_up = keyboard_check(global.key_up[0]) or gamepad_check(0,global.pad_up[0],false);
input_down = keyboard_check(global.key_down[0]) or gamepad_check(0,global.pad_down[0],false);
input_right = keyboard_check(global.key_right[0]) or gamepad_check(0,global.pad_right[0],false);
input_left = keyboard_check(global.key_left[0]) or gamepad_check(0,global.pad_left[0],false);

input_jump = keyboard_check(global.key_jump[0]) or gamepad_check(0,global.pad_jump[0],false);
input_fire = keyboard_check(global.key_fire[0]) or gamepad_check(0,global.pad_fire[0],false);

input_up_pressed = keyboard_check_pressed(global.key_up[0]) or gamepad_check_pressed(0,global.pad_up[0],false);
input_down_pressed = keyboard_check_pressed(global.key_down[0]) or gamepad_check_pressed(0,global.pad_down[0],false);
input_jump_pressed = keyboard_check_pressed(global.key_jump[0]) or gamepad_check_pressed(0,global.pad_jump[0],false);
