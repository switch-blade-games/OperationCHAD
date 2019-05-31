// sub pixel movement
subx += xspeed;
suby += yspeed;
var tx = round(abs(subx));
var ty = round(abs(suby));
var rx = tx*sign(xspeed);
var ry = ty*sign(yspeed);
subx -= rx;
suby -= ry;

xpre = x;
ypre = y;

// horizontal collision detection/response
if (tx > 0)
    {
    var ux = sign(xspeed);
    
    var xp = x;
    var yp = y;
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
    
    //if (global.ramptype)
    //    {
    var dis = point_distance(xp,yp,x,y);
    if (dis > tx)
        subx -= (dis-tx)*ux;
    //    }
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
            or ((position_meeting(bbox_left,bbox_bottom+1,par_jt) or position_meeting(bbox_right,bbox_bottom+1,par_jt))
            and (!position_meeting(bbox_left,bbox_bottom,par_jt) and !position_meeting(bbox_right,bbox_bottom,par_jt)))
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
