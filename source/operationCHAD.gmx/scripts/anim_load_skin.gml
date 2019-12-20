/// anim_load_skin(sheetpath,jsonpath);

// tag lookup
if (!ds_exists(tag_map,ds_type_map))
    tag_map = ds_map_create();
ds_map_clear(tag_map);
// tag/frame data
tag_info = -1;
frame_info = -1;
anim_info = -1;
img_speed = -1;

if (file_exists(argument[0])) and (file_exists(argument[1]))
    {
    // load the texture
    spr_index = sprite_add(argument[0],1,true,0,0,0);
    
    // load and read json
    var json = "";
    var file = file_text_open_read(argument[1]);
    var eof = file_text_eof(file);
    while(!eof)
        {
        json = string(json)+string(file_text_readln(file));
        eof = file_text_eof(file);
        }
    
    // decode and parse json
    info_map = json_decode(json);
    if (info_map > -1)
        {
        // first read meta data
        if (ds_map_exists(info_map,"meta"))
            {
            var meta_map = info_map[?"meta"];
            // read texture atlas size
            if (ds_map_exists(meta_map,"size"))
                {
                size_map = meta_map[?"size"];
                
                spr_w = 1024; spr_h = 1024;
                if (ds_map_exists(size_map,"w"))
                    spr_w = real(size_map[?"w"]);
                if (ds_map_exists(size_map,"h"))
                    spr_h = real(size_map[?"h"]);
                }
            
            // load tags
            if (ds_map_exists(meta_map,"frameTags"))
                {
                tag_list = meta_map[?"frameTags"];
                for(var i=0; i<ds_list_size(tag_list); i++;)
                    {
                    var tags_map = tag_list[|i];
                    
                    // tag name
                    if (ds_map_exists(tags_map,"name"))
                        tag_info[tags,TAG_NAME] = tags_map[?"name"];
                    // tag start
                    if (ds_map_exists(tags_map,"from"))
                        tag_info[tags,TAG_START] = real(tags_map[?"from"]);
                    // tag end
                    if (ds_map_exists(tags_map,"to"))
                        tag_info[tags,TAG_END] = real(tags_map[?"to"]);
                    
                    // add to tag lookup
                    ds_map_add(tag_map,tag_info[tags,TAG_NAME],tags);
                    // calculate number of frames
                    if (tag_info[tags,TAG_END]+1 > frames)
                        frames = tag_info[tags,TAG_END]+1;
                    
                    // increment
                    tags++;
                    }
                }
            }
        
        // init frame info array
        for(var i=frames; i>=0; i--;)
            {
            frame_info[i,FRAME_TEX_X] = 0;
            frame_info[i,FRAME_TEX_Y] = 0;
            frame_info[i,FRAME_TEX_W] = 0;
            frame_info[i,FRAME_TEX_H] = 0;
            }
        
        // next read frame data
        if (ds_map_exists(info_map,"frames"))
            {
            var frames_map = info_map[?"frames"];
            // loop through frames
            var frames_key = ds_map_find_first(frames_map);
            while(ds_map_exists(frames_map,frames_key))
                {
                // determine frame index
                pos = string_pos(".ase",frames_key)-1;
                len = 1;
                var char = string_char_at(frames_key,pos);
                while(string_digits(char) != "")
                    {
                    pos--;
                    len++;
                    char = string_char_at(frames_key,pos);
                    }
                index = real(string_copy(frames_key,pos,len));
                
                // load frame info
                frame_map = frames_map[?frames_key];
                if (ds_map_exists(frame_map,"frame"))
                    {
                    tex_map = frame_map[?"frame"];
                    
                    // tex x
                    if (ds_map_exists(tex_map,"x"))
                        frame_info[index,FRAME_TEX_X] = tex_map[?"x"];
                    // tex y
                    if (ds_map_exists(tex_map,"y"))
                        frame_info[index,FRAME_TEX_Y] = tex_map[?"y"];
                    // tex w
                    if (ds_map_exists(tex_map,"w"))
                        frame_info[index,FRAME_TEX_W] = tex_map[?"w"];
                    // tex h
                    if (ds_map_exists(tex_map,"h"))
                        frame_info[index,FRAME_TEX_H] = tex_map[?"h"];
                    }
            
                frames_key = ds_map_find_next(frames_map,frames_key);
                }
            }
        }
    ds_map_destroy(info_map);
    
    file_text_close(file);
    }

// define animations
anim_create(aState.flat_idle);
anim_create(aState.flat_fire,0,1,2,1,0,4,3,4);
anim_create(aState.walk_move,0,1,0,1,0,2,0,2);
anim_create(aState.walk_fire,0,1,0,1,0,2,0,2);
anim_create(aState.ramp_u_idle);
anim_create(aState.ramp_u_duck);
anim_create(aState.ramp_u_fire,0,1,2,1,0,4,3,4);
anim_create(aState.ramp_d_idle);
anim_create(aState.ramp_d_duck);
anim_create(aState.ramp_d_fire,0,1,2,1,0,4,3,4);
anim_create(aState.duck_idle);
anim_create(aState.duck_fire);
anim_create(aState.wc_idle);
anim_create(aState.wc_move);
anim_create(aState.wc_fire,0,1,2,3,4,5,6,7);
anim_create(aState.mb_idle);
anim_create(aState.mb_move);
anim_create(aState.mb_fire,0,1,2,1,0,4,3,4);
anim_create(aState.moto_idle);
anim_create(aState.moto_fire,0,1,2,3,4,5,6,7);
anim_create(aState.roll);
anim_create(aState.dead_roll);
anim_create(aState.dead);

// define animation state speeds
switch(skin_id)
    {
    case skin.stone:
        off_x = 0;
        off_y = 36;
        img_speed[aState.flat_idle] = 0.2;
        img_speed[aState.flat_fire] = 0.2;
        img_speed[aState.walk_move] = 0.22;
        img_speed[aState.walk_fire] = 0.22;
        img_speed[aState.ramp_u_idle] = 0.2;
        img_speed[aState.ramp_u_duck] = 0.2;
        img_speed[aState.ramp_u_fire] = 0.2;
        img_speed[aState.ramp_d_idle] = 0.2;
        img_speed[aState.ramp_d_duck] = 0.2;
        img_speed[aState.ramp_d_fire] = 0.2;
        img_speed[aState.duck_idle] = 0.2;
        img_speed[aState.duck_fire] = 0.2;
        img_speed[aState.wc_idle] = 0.2;
        img_speed[aState.wc_move] = 0.2;
        img_speed[aState.wc_fire] = 0.2;
        img_speed[aState.mb_idle] = 0.2;
        img_speed[aState.mb_move] = 0.2;
        img_speed[aState.mb_fire] = 0.2;
        img_speed[aState.moto_idle] = 0.2;
        img_speed[aState.moto_fire] = 0.2;
        img_speed[aState.roll] = 0.3;
        img_speed[aState.dead_roll] = 0.3;
        img_speed[aState.dead] = 0.2;
        break;
    case skin.foxford:
        off_x = 0;
        off_y = 0;
        img_speed[aState.flat_idle] = 0.2;
        img_speed[aState.flat_fire] = 0.2;
        img_speed[aState.walk_move] = 0.2;
        img_speed[aState.walk_fire] = 0.2;
        img_speed[aState.ramp_u_idle] = 0.2;
        img_speed[aState.ramp_u_duck] = 0.2;
        img_speed[aState.ramp_u_fire] = 0.2;
        img_speed[aState.ramp_d_idle] = 0.2;
        img_speed[aState.ramp_d_duck] = 0.2;
        img_speed[aState.ramp_d_fire] = 0.2;
        img_speed[aState.duck_idle] = 0.2;
        img_speed[aState.duck_fire] = 0.2;
        img_speed[aState.wc_idle] = 0.2;
        img_speed[aState.wc_move] = 0.2;
        img_speed[aState.wc_fire] = 0.2;
        img_speed[aState.mb_idle] = 0.2;
        img_speed[aState.mb_move] = 0.2;
        img_speed[aState.mb_fire] = 0.2;
        img_speed[aState.moto_idle] = 0.2;
        img_speed[aState.moto_fire] = 0.2;
        img_speed[aState.roll] = 0.3;
        img_speed[aState.dead_roll] = 0.3;
        img_speed[aState.dead] = 0.2;
        break;
    case skin.yolo:
        off_x = 0;
        off_y = 0;
        img_speed[aState.flat_idle] = 0.2;
        img_speed[aState.flat_fire] = 0.2;
        img_speed[aState.walk_move] = 0.2;
        img_speed[aState.walk_fire] = 0.2;
        img_speed[aState.ramp_u_idle] = 0.2;
        img_speed[aState.ramp_u_duck] = 0.2;
        img_speed[aState.ramp_u_fire] = 0.2;
        img_speed[aState.ramp_d_idle] = 0.2;
        img_speed[aState.ramp_d_duck] = 0.2;
        img_speed[aState.ramp_d_fire] = 0.2;
        img_speed[aState.duck_idle] = 0.2;
        img_speed[aState.duck_fire] = 0.2;
        img_speed[aState.wc_idle] = 0.2;
        img_speed[aState.wc_move] = 0.2;
        img_speed[aState.wc_fire] = 0.2;
        img_speed[aState.mb_idle] = 0.2;
        img_speed[aState.mb_move] = 0.2;
        img_speed[aState.mb_fire] = 0.2;
        img_speed[aState.moto_idle] = 0.2;
        img_speed[aState.moto_fire] = 0.2;
        img_speed[aState.roll] = 0.3;
        img_speed[aState.dead_roll] = 0.3;
        img_speed[aState.dead] = 0.2;
        break;
    case skin.pumpkin:
        off_x = 0;
        off_y = 0;
        img_speed[aState.flat_idle] = 0.2;
        img_speed[aState.flat_fire] = 0.2;
        img_speed[aState.walk_move] = 0.2;
        img_speed[aState.walk_fire] = 0.2;
        img_speed[aState.ramp_u_idle] = 0.2;
        img_speed[aState.ramp_u_duck] = 0.2;
        img_speed[aState.ramp_u_fire] = 0.2;
        img_speed[aState.ramp_d_idle] = 0.2;
        img_speed[aState.ramp_d_duck] = 0.2;
        img_speed[aState.ramp_d_fire] = 0.2;
        img_speed[aState.duck_idle] = 0.2;
        img_speed[aState.duck_fire] = 0.2;
        img_speed[aState.wc_idle] = 0.2;
        img_speed[aState.wc_move] = 0.2;
        img_speed[aState.wc_fire] = 0.2;
        img_speed[aState.mb_idle] = 0.2;
        img_speed[aState.mb_move] = 0.2;
        img_speed[aState.mb_fire] = 0.2;
        img_speed[aState.moto_idle] = 0.2;
        img_speed[aState.moto_fire] = 0.2;
        img_speed[aState.roll] = 0.3;
        img_speed[aState.dead_roll] = 0.3;
        img_speed[aState.dead] = 0.2;
        break;
    }
