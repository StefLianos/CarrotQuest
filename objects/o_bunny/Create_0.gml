/// @description Create vars
speed_ = [0,0];
direction_= 0;
max_speed_ = 8;
gravity_ = 2;
acceleration_ = 4;
friction_ = .2;
jump_height_ = -15;
hit_ = false;

tagged_ = true;
combat_ = false;
tickled = false;
lol_ = false;

jump_sound = false;

combat_points = 0;


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

//alarm 0 set
alarm[0] = 6;

//alarm 2 set
alarm[2] = 10;

//scale variables
x_scale_ = image_xscale;
y_scale_ = image_yscale;

image_speed = 1;

