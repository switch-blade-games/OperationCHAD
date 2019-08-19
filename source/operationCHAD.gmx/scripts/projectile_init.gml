/// projectile_init(tx,ty,h,time);

// fire a projectile that will impact (tx,ty) in 'time' seconds
// 'h' is the maximum height of the projectile's arc

target_x = argument[0];
target_y = argument[1];
arc_x = x;
arc_y = y;
arc_h = argument[2];
arc_t = 1/(argument[3]*room_speed);
time = 0;
