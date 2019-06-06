/// gamepad_check_released(slot,function);

var _slot = argument[0];
var _func = argument[1];
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
            if (abs(gamepad_axis_value(_slot,_func)) < global.gp[_slot,4])
            and (global.gp[_slot,_axis])
                {
                global.gp[_slot,_axis] = false;
                return(true);
                }
            }
        break;
    
    default:
        if (global.gp[_slot,0])
            {
            if (gamepad_button_check_released(_slot,_func))
                return(true);
            }
        break;
    }

return(false);
