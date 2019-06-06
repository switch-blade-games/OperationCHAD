/// gamepad_init();

global.gpcount = 0;
for(var i=0; i<4; i++;)
    {
    global.gp[i,0] = false; // gamepad connected
    global.gp[i,1] = "";    // gamepad description
    global.gp[i,2] = 0;     // gamepad rumble left
    global.gp[i,3] = 0;     // gamepad rumble right
    global.gp[i,4] = 0.05;  // gamepad deadzone
    global.gp[i,5] = false; // gamepad left stick vertical
    global.gp[i,6] = false; // gamepad left stick horizontal
    global.gp[i,7] = false; // gamepad right stick vertical
    global.gp[i,8] = false; // gamepad right stick horizontal
    global.gp[i,9] = -1;    // gamepad last function
    }

if (gamepad_is_supported())
    {
    for(i=0; i<4; i++;)
        {
        if (gamepad_is_connected(i))
            {
            global.gp[i,0] = true;
            global.gp[i,1] = gamepad_get_description(i);
            global.gpcount++;
            
            gamepad_set_vibration(i,global.gp[i,2],global.gp[i,3]);
            }
        }
    return(global.gpcount);
    }

// gamepads not supported
return(-1);
