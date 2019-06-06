/// gamepad_check_pressed(slot,function,info);

// if argument2 is true, it will return the value of the gamepad's function
// if argument2 is false, it will only return true or false

var _slot = argument[0];
var _func = argument[1];
var _info = argument[2];
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
        if (global.gp[_slot,0])
            {
            if (abs(gamepad_axis_value(_slot,_func)) > global.gp[_slot,4])
            and (!global.gp[_slot,_axis])
                {
                global.gp[_slot,_axis] = true;
                
                if (_info)
                    return(gamepad_axis_value(_slot,_func));
                else
                    return(true);
                }
            }
        break;
    
    default:
        if (global.gp[_slot,0])
            {
            if (gamepad_button_check_pressed(_slot,_func))
                {
                if (_info)
                    return(gamepad_button_value(_slot,_func));
                else
                    return(true);
                }
            }
        break;
    }

return(false);
