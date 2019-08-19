/// projectile_step();

// returns true if the projectile has reached its target

x = lerp(arc_x,target_x,time);
y = lerp(arc_y,target_y,time)-sin(time*pi)*arc_h;

if (time < 1)
    {
    time += arc_t;
    return(false);
    }
return(true);
