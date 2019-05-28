/// gamepad_update();

i = 0;
repeat(4)
    {
    if (gamepad_is_connected(i))
        {
        if (global.gp[i,0] == false)
            {
            global.gp[i,0] = true;
            global.gp[i,1] = gamepad_get_description(i);
            global.gp[i,2] = 0;
            global.gp[i,3] = 0;
            global.gp[i,4] = 0;
            }
        global.gp[i,2] *= 0.9;
        global.gp[i,3] *= 0.9;
        
        // left stick vertical
        if (global.gp[i,5] == true)
            {
            if (abs(gamepad_axis_value(i,gp_axislv)) < 0.05) {
                global.gp[i,5] = false;
                }
            }
        else
            {
            if (abs(gamepad_axis_value(i,gp_axislv)) > 0.05) {
                global.gp[i,5] = true;
                }
            }
        
        // left stick horizontal
        if (global.gp[i,6] == true)
            {
            if (abs(gamepad_axis_value(i,gp_axislh)) < 0.05) {
                global.gp[i,6] = false;
                }
            }
        else
            {
            if (abs(gamepad_axis_value(i,gp_axislh)) > 0.05) {
                global.gp[i,6] = true;
                }
            }
        
        // right stick vertical
        if (global.gp[i,7] == true)
            {
            if (abs(gamepad_axis_value(i,gp_axisrv)) < 0.05) {
                global.gp[i,7] = false;
                }
            }
        else
            {
            if (abs(gamepad_axis_value(i,gp_axisrv)) > 0.05) {
                global.gp[i,7] = true;
                }
            }
        
        // right stick horizontal
        if (global.gp[i,8] == true)
            {
            if (abs(gamepad_axis_value(i,gp_axisrh)) < 0.05) {
                global.gp[i,8] = false;
                }
            }
        else
            {
            if (abs(gamepad_axis_value(i,gp_axisrh)) > 0.05) {
                global.gp[i,8] = true;
                }
            }
        }
    else
        {
        if (global.gp[i,0] == true)
            {
            global.gp[i,0] = false;
            global.gp[i,1] = "";
            global.gp[i,2] = 0;
            global.gp[i,3] = 0;
            global.gp[i,4] = 0;
            global.gp[i,5] = false;
            global.gp[i,6] = false;
            global.gp[i,7] = false;
            global.gp[i,8] = false;
            global.gp[i,9] = 0;
            global.gp[i,10] = 0;
            }
        }
    
    i++;
    }
