/// gamepad_check(slot,function,info);

// if argument2 is true, it will return the value of the gamepad's function
// if argument2 is false, it will only return true or false

var _slot = argument[0];
var _func = argument[1];
var _info = argument[2];

if (!global.gp[_slot,0])
    return(false);

switch(_func)
    {
    case gp_axislh: case gp_axislv:
    case gp_axisrh: case gp_axisrv:
        if (abs(gamepad_axis_value(_slot,_func)) > global.gp[_slot,4])
            {
            if (_info)
                return(gamepad_axis_value(_slot,_func));
            else
                return(true);
            }
        break;
    
    default:
        if (abs(gamepad_button_value(_slot,_func)) > global.gp[_slot,4])
            {
            if (_info)
                return(gamepad_button_value(_slot,_func));
            else
                return(true);
            }
        break;
    }

return(false);
