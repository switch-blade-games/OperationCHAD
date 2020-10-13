sprite_index=choose(thot_pose_1_spr,thot_pose_1_spr,thot_pose_1_spr,thot_pose_1_spr)

image_xscale=choose(1,-1)

image_index=random(sprite_get_number(sprite_index))

image_speed=0.05+random(0.05)

if(sprite_index=thot_pose_3_spr)
    image_speed=image_speed*2


