/// gamepad_init();

global.gpcount = 0;
if (gamepad_is_supported())
    {
    for(i = 0; i < 4; i++)
        {
        global.gp[i,0] = gamepad_is_connected(i); // gamepad connected
        global.gp[i,1] = gamepad_get_description(i); // gamepad name
        global.gp[i,2] = 0; // gamepad rumble left
        global.gp[i,3] = 0; // gamepad rumble right
        global.gp[i,4] = 0; // gamepad deadzone
        global.gp[i,5] = 0; // gamepad left stick vertical
        global.gp[i,6] = 0; // gamepad left stick horizontal
        global.gp[i,7] = 0; // gamepad right stick vertical
        global.gp[i,8] = 0; // gamepad right stick horizontal
        
        if (global.gp[i,0] == true) {
            global.gpcount++;
            }
        }
    return(global.gpcount);
    }
return(-1);
