/// gamepad_value_all(function);

var _func = argument[0];

if (global.gpcount == 0)
    return(0);

for(var i=0; i<4; i++;)
    {
    if (!global.gp[i,gpinfo.connected])
        continue;
    
    if (global.gp_input[i,_func])
        {
        if (_func <= gpinput.padr)
            return(gamepad_button_value(i,gp_face1+_func));
        else if (_func >= gpinput.lsu)
            return(gamepad_axis_value(i,gp_face1+_func));
        }
    }

return(0);