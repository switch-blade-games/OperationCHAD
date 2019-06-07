/// gamepad_checkall_released(function);

var _func = argument[0];
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
            
            if (abs(gamepad_axis_value(i,_func)) < global.gp[i,4])
            and (global.gp[i,_axis])
                {
                global.gp[i,_axis] = false;
                return(true);
                }
            }
        break;
    
    default:
        for(i=0; i<4; i++;)
            {
            if (!global.gp[i,0])
                continue;
            
            if (gamepad_button_check_released(i,_func))
                return(true);
            }
        break;
    }

return(false);
