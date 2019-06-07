/// gamepad_lastall();

for(var i=0; i<4; i++;)
    {
    if (global.gp[i,9] > -1)
        return(global.gp[i,9]);
    }
return(-1);
