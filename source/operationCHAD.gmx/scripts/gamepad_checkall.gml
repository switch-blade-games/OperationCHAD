/// gamepad_checkall(function,info);

// if argument1 is true, it will return the value of the gamepad's function
// if argument1 is false, it will only return true or false

var _func = argument[0];
var _info = argument[1];

if (global.gpcount == 0)
    return(false);

switch(argument[0])
    {
    case gp_axislh: case gp_axislv:
    case gp_axisrh: case gp_axisrv:
        for(i=0; i<4; i++;)
            {
            if (!global.gp[i,0])
                continue;
            
            if (abs(gamepad_axis_value(i,_func)) > global.gp[i,4])
                {
                if (_info)
                    return(gamepad_axis_value(i,_func));
                else
                    return(true);
                }
            }
        break;
    
    default:
        for(i=0; i<4; i++;)
            {
            if (!global.gp[i,0])
                continue;
            
            if (abs(gamepad_button_value(i,_func)) > global.gp[i,4])
                {
                if (_info)
                    return(gamepad_button_value(i,_func));
                else
                    return(true);
                }
            }
        break;
    }

return(false);
