/// gamepad_checkall_pressed(function,info);

// if argument1 is true, it will return the value of the gamepad's function
// if argument1 is false, it will only return true or false

var _func = argument[0];
var _info = argument[1];
var _axis;

if (_func == gp_axislv)
    _axis = 5;
else if (_func == gp_axislh)
    _axis = 6;
else if (_func == gp_axisrv)
    _axis = 7;
else if (_func == gp_axisrh)
    _axis = 8;

switch(_func)
    {
    case gp_axislh: case gp_axislv:
    case gp_axisrh: case gp_axisrv:
        for(i=0; i<4; i++;)
            {
            if (!global.gp[i,0])
                continue;
            
            if (abs(gamepad_axis_value(i,_func)) > global.gp[i,4])
            and (!global.gp[i,_axis])
                {
                global.gp[i,_axis] = true;
                
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
            
            if (gamepad_button_check_pressed(i,_func))
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
