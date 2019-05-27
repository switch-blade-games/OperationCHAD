/// draw_text_outline(x,y,str);

draw_set_color($000000);
draw_text(argument[0]-1,argument[1]-1,argument[2]);
draw_text(argument[0]-1,argument[1]+1,argument[2]);
draw_text(argument[0]+1,argument[1]-1,argument[2]);
draw_text(argument[0]+1,argument[1]+1,argument[2]);
draw_set_color($FFFFFF);
draw_text(argument[0],argument[1],argument[2]);
