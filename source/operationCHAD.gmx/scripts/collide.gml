// horizontal collision detection/response
var tx = round(abs(xspeed));
if (tx > 0)
    {
    var ux = sign(xspeed);
    repeat(tx)
        {
        if (place_meeting(x+ux,y,par_solid))
            {
            // stop before moving into the wall
            xspeed = 0;
            break;
            }
        else
            x += ux;
        }
    }

// vertical collision detection/response
var ty = round(abs(yspeed));
if (ty > 0)
    {
    // split up vertical collision checks
    // check downward independently from upward
    // lets us detect one way platforms
    
    if (yspeed > 0)
        {
        // check downward
        var uy = sign(yspeed);
        repeat(ty)
            {
            if (place_meeting(x,y+uy,par_solid))
            or (place_meeting(x,y+uy,par_jt) and !place_meeting(x,y,par_jt))
                {
                // stop before moving into the wall
                yspeed = 0;
                break;
                }
            else
                y += uy;
            }
        }
    else if (yspeed < 0)
        {
        // check upward
        var uy = sign(yspeed);
        repeat(ty)
            {
            if (place_meeting(x,y+uy,par_solid))
                {
                // stop before moving into the wall
                yspeed = 0;
                break;
                }
            else
                y += uy;
            }
        }
    }
