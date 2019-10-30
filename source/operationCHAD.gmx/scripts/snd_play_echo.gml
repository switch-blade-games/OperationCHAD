/// snd_play_echo(snd,decay,delay,?pitch,?volume);

var _id = argument[0];
var _gain = 1;
var _time = get_timer()+argument[2];
var _decay = argument[1];
var _delay = argument[2];
var _pitch = 0;
if (argument_count > 3)
    var _pitch = argument[3];
if (argument_count > 4)
    var _gain = argument[4];

ds_list_add(global.echo_list,_id);      // snd_id
ds_list_add(global.echo_list,_gain);    // gain
ds_list_add(global.echo_list,_time);    // time
ds_list_add(global.echo_list,_decay);   // decay
ds_list_add(global.echo_list,_delay);   // delay
ds_list_add(global.echo_list,_pitch);   // pitch
global.echo_num++;
