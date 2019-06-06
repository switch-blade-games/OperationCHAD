/// gamepad_update();

// place in 'End Step' event

global.gpcount = 0;
for(var i=0; i<4; i++;)
    {
    if (gamepad_is_connected(i))
        {
        if (!global.gp[i,0])
            {
            global.gp[i,0] = true;
            global.gp[i,1] = gamepad_get_description(i);
            global.gp[i,2] = 0;
            global.gp[i,3] = 0;
            //global.gp[i,4] = 0.05;
            global.gp[i,5] = false;
            global.gp[i,6] = false;
            global.gp[i,7] = false;
            global.gp[i,8] = false;
            global.gp[i,9] = -1;
            global.gpcount++;
            }
        
        // gamepad rumble
        gamepad_set_vibration(i,global.gp[i,2],global.gp[i,3]);
        global.gp[i,2] *= 0.9;
        global.gp[i,3] *= 0.9;
        
        // reset last function
        global.gp[i,9] = -1;
        
        // left stick vertical
        if (global.gp[i,5])
            {
            if (abs(gamepad_axis_value(i,gp_axislv)) < global.gp[i,4])
                global.gp[i,5] = false;
            }
        else if (abs(gamepad_axis_value(i,gp_axislv)) > global.gp[i,4])
            {
            global.gp[i,5] = true;
            global.gp[i,9] = gp_axislv;
            }
        
        // left stick horizontal
        if (global.gp[i,6])
            {
            if (abs(gamepad_axis_value(i,gp_axislh)) < global.gp[i,4])
                global.gp[i,6] = false;
            }
        else if (abs(gamepad_axis_value(i,gp_axislh)) > global.gp[i,4])
            {
            global.gp[i,6] = true;
            global.gp[i,9] = gp_axislh;
            }
        
        // right stick vertical
        if (global.gp[i,7])
            {
            if (abs(gamepad_axis_value(i,gp_axisrv)) < global.gp[i,4])
                global.gp[i,7] = false;
            }
        else if (abs(gamepad_axis_value(i,gp_axisrv)) > global.gp[i,4])
            {
            global.gp[i,7] = true;
            global.gp[i,9] = gp_axisrv;
            }
        
        // right stick horizontal
        if (global.gp[i,8])
            {
            if (abs(gamepad_axis_value(i,gp_axisrh)) < global.gp[i,4])
                global.gp[i,8] = false;
            }
        else if (abs(gamepad_axis_value(i,gp_axisrh)) > global.gp[i,4])
            {
            global.gp[i,8] = true;
            global.gp[i,9] = gp_axisrh;
            }
        
        // last function
        for(var j=0; j<gamepad_button_count(i); j++;)
            {
            if (gamepad_button_check_pressed(i,j))
                global.gp[i,9] = j;
            }
        }
    else
        {
        if (global.gp[i,0])
            {
            global.gp[i,0] = false;
            global.gp[i,1] = "";
            global.gp[i,2] = 0;
            global.gp[i,3] = 0;
            //global.gp[i,4] = 0.05;
            global.gp[i,5] = false;
            global.gp[i,6] = false;
            global.gp[i,7] = false;
            global.gp[i,8] = false;
            global.gp[i,9] = -1;
            global.gpcount--;
            }
        }
    }
