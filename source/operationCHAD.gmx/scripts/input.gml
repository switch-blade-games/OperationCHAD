/// input();

input_left = false;
input_right = false;
input_up =  false;
input_down = false;
input_jump = false;
input_fire = false;
input_lock = false;

input_left_pressed = false;
input_right_pressed = false;
input_up_pressed = false;
input_down_pressed = false;
input_swap_pressed = false;
input_jump_pressed = false;

if (gamepad_slot <= 0)
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
    input_swap_pressed = input_swap_pressed or keyboard_check_pressed(global.key_swap[0]);
    input_jump_pressed = input_jump_pressed or keyboard_check_pressed(global.key_jump[0]);
    }

if (gamepad_slot < 0)
    exit;

input_left = input_left or gamepad_check(gamepad_slot,global.pad_left[gamepad_slot]);
input_right = input_right or gamepad_check(gamepad_slot,global.pad_right[gamepad_slot]);
input_up = input_up or gamepad_check(gamepad_slot,global.pad_up[gamepad_slot]);
input_down = input_down or gamepad_check(gamepad_slot,global.pad_down[gamepad_slot]);
input_jump = input_jump or gamepad_check(gamepad_slot,global.pad_jump[gamepad_slot]);
input_fire = input_fire or gamepad_check(gamepad_slot,global.pad_fire[gamepad_slot]);
input_lock = input_lock or gamepad_check(gamepad_slot,global.pad_lock[gamepad_slot]);

input_left_pressed = input_left_pressed or gamepad_check_pressed(gamepad_slot,global.pad_left[gamepad_slot]);
input_right_pressed = input_right_pressed or gamepad_check_pressed(gamepad_slot,global.pad_right[gamepad_slot]);
input_up_pressed = input_up_pressed or gamepad_check_pressed(gamepad_slot,global.pad_up[gamepad_slot]);
input_down_pressed = input_down_pressed or gamepad_check_pressed(gamepad_slot,global.pad_down[gamepad_slot]);
input_swap_pressed = input_swap_pressed or gamepad_check_pressed(gamepad_slot,global.pad_swap[gamepad_slot]);
input_jump_pressed = input_jump_pressed or gamepad_check_pressed(gamepad_slot,global.pad_jump[gamepad_slot]);
