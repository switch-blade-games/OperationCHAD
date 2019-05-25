// sub pixel movement
subx += xspeed;
suby += yspeed;
var tx = round(abs(xspeed));
var ty = round(abs(yspeed));
var rx = round(subx);
var ry = round(suby);
subx -= rx;
suby -= ry;

// horizontal collision detection/response
if (tx > 0)
    {
    var ux = sign(xspeed);
    repeat(tx)
        {
        // move up slope
        if (place_meeting(x+ux,y,par_solid) and !place_meeting(x+ux,y-1,par_solid))
            y -= 1;
        
        // move down slope
        if (!place_meeting(x+ux,y,par_solid) and !place_meeting(x+ux,y+1,par_solid) and place_meeting(x+ux,y+2,par_solid))
            y += 1;
        
        if (!place_meeting(x+ux,y,par_solid))
            x += ux;
        else
            {
            // stop before moving into the wall
            xspeed = 0;
            break;
            }
        }
    }

// vertical collision detection/response
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
