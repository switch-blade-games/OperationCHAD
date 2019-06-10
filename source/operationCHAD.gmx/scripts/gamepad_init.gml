/// gamepad_init();

enum gpinfo
    {
    connected,
    name,
    vib_l,
    vib_r,
    dead,
    last,
    lastval
    }

enum gpinput
    {
    face1,
    face2,
    face3,
    face4,
    bumpl,
    bumpr,
    trigl,
    trigr,
    select,
    start,
    lsclick,
    rsclick,
    padu,
    padd,
    padl,
    padr,
    lsu,
    lsd,
    lsl,
    lsr,
    rsu,
    rsd,
    rsl,
    rsr,
    size
    }

global.gpcount = 0;
for(var i=0; i<4; i++;)
    {
    global.gp[i,gpinfo.connected] = false;
    global.gp[i,gpinfo.name] = "";
    global.gp[i,gpinfo.vib_l] = 0;
    global.gp[i,gpinfo.vib_r] = 0;
    global.gp[i,gpinfo.dead] = 0.05;
    global.gp[i,gpinfo.last] = 0;
    global.gp[i,gpinfo.lastval] = 0;
    
    for(var j=0; j<gpinput.size; j++;)
        {
        global.gp_input[i,j] = false;
        global.gp_ilast[i,j] = false;
        }
    }

if (gamepad_is_supported())
    {
    for(i=0; i<4; i++;)
        {
        if (gamepad_is_connected(i))
            {
            global.gp[i,gpinfo.connected] = true;
            global.gp[i,gpinfo.name] = gamepad_get_description(i);
            global.gpcount++;
            
            gamepad_set_vibration(i,global.gp[i,gpinfo.vib_l],global.gp[i,gpinfo.vib_r]);
            }
        }
    return(global.gpcount);
    }

// gamepads not supported
return(-1);
