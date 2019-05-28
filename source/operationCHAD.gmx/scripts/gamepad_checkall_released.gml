/// gamepad_checkall_released(function);

// if argument1 is true, it will return the value of the gamepad's function
// if argument1 is false, it will only return true or false

if (argument0 == gp_axislv) {
    axis = 5;
    }
if (argument0 == gp_axislh) {
    axis = 6;
    }
if (argument0 == gp_axisrv) {
    axis = 7;
    }
if (argument0 == gp_axisrh) {
    axis = 8;
    }

switch(argument0)
    {
    case gp_axislh: case gp_axislv:
    case gp_axisrh: case gp_axisrv:
        for(i = 0; i < 4; i++)
            {
            if (gamepad_is_connected(i))
                {
                if (abs(gamepad_axis_value(i,argument0)) < 0.05)
                    {
                    if (global.gp[i,axis] == true)
                        {
                        global.gp[i,axis] = false;
                        return(true);
                        }
                    }
                }
            }
    break;
    default:
        for(i = 0; i < 4; i++)
            {
            if (gamepad_is_connected(i))
                {
                if (gamepad_button_check_released(i,argument0)) {
                    return(true);
                    }
                }
            }
    break;
    }

return(false);
