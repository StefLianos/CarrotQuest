/// @description Create vars
speed_ = [0,0];
direction_= 0;
max_speed_ = 5;
gravity_ = 1;
acceleration_ = 5;
friction_ = .3;
jump_height_ = -20;
hit_ = false;

//stats
//max_health_ = 15;
//health_=15;
//max_xp_ = 100;
//xp_ = 0; 
//lvl_ = 1;

//keybinding
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);


//alarm 2 set
alarm[2] = 10;

//scale variables
x_scale_ = image_xscale;
y_scale_ = image_yscale;


//hide solid layer
//var solid_layer = layer_get_id("Solids");
//layer_set_visible(solid_layer,false);
