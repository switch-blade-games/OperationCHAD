/// target();

// selects a random player to attack

var _num = instance_number(par_actor);
if (_num == 1)
    {
    if (target_id == noone)
        target_id = instance_find(par_actor,0);
    target_num++;
    }
else if (_num > 1)
    {
    if (instance_exists(target_id))
        var _target_new = target_id;
    else
        var _target_new = noone;
    while(target_num > 3 and target_id == _target_new)
        _target_new = instance_find(par_actor,irandom(_num-1));
    target_id = _target_new;
    target_num++;
    }
