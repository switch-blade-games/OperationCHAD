/// input();

input_left = gamepad_check(gamepad_slot,global.pad_left[gamepad_slot]);
input_right = gamepad_check(gamepad_slot,global.pad_right[gamepad_slot]);
input_up =  gamepad_check(gamepad_slot,global.pad_up[gamepad_slot]);
input_down = gamepad_check(gamepad_slot,global.pad_down[gamepad_slot]);
input_jump = gamepad_check(gamepad_slot,global.pad_jump[gamepad_slot]);
input_fire = gamepad_check(gamepad_slot,global.pad_fire[gamepad_slot]);
input_lock = gamepad_check(gamepad_slot,global.pad_lock[gamepad_slot]);

input_left_pressed = gamepad_check_pressed(gamepad_slot,global.pad_left[gamepad_slot]);
input_right_pressed = gamepad_check_pressed(gamepad_slot,global.pad_right[gamepad_slot]);
input_up_pressed = gamepad_check_pressed(gamepad_slot,global.pad_up[gamepad_slot]);
input_down_pressed = gamepad_check_pressed(gamepad_slot,global.pad_down[gamepad_slot]);
input_jump_pressed = gamepad_check_pressed(gamepad_slot,global.pad_jump[gamepad_slot]);

if (gamepad_slot == 0)
    {
    input_left = input_left or keyboard_check(global.key_left[0]);
    input_right = input_right or keyboard_check(global.key_right[0]);
    input_up = input_up or keyboard_check(global.key_up[0]);
    input_down = input_down or keyboard_check(global.key_down[0]);
    input_jump = input_jump or keyboard_check(global.key_jump[0]);
    input_fire = input_fire or keyboard_check(global.key_fire[0]);
    input_lock = input_lock or keyboard_check(global.key_lock[0]);
    
    input_left_pressed = input_left_pressed or keyboard_check_pressed(global.key_left[0]);
    input_right_pressed = input_right_pressed or keyboard_check_pressed(global.key_right[0]);
    input_up_pressed = input_up_pressed or keyboard_check_pressed(global.key_up[0]);
    input_down_pressed = input_down_pressed or keyboard_check_pressed(global.key_down[0]);
    input_jump_pressed = input_jump_pressed or keyboard_check_pressed(global.key_jump[0]);
    }
