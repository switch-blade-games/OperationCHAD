/// gamepad_checkall(function,info);

// if argument1 is true, it will return the value of the gamepad's function
// if argument1 is false, it will only return true or false

switch(argument0)
    {
    case gp_axislh: case gp_axislv:
    case gp_axisrh: case gp_axisrv:
        for(i = 0; i < 4; i++)
            {
            if (gamepad_is_connected(i))
                {
                if (abs(gamepad_axis_value(i,argument0)) > 0.05)
                    {
                    if (argument1) {
                        return(gamepad_axis_value(i,argument0));
                        }
                    else
                        {
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
                if (abs(gamepad_button_value(i,argument0)) > 0.05)
                    {
                    if (argument1) {
                        return(gamepad_button_value(i,argument0));
                        }
                    else
                        {
                        return(true);
                        }
                    }
                }
            }
    break;
    }

return(false);
