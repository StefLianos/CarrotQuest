/// @description player movement

//check for player death
if o_player_stats.hp_ <= 0
{
	//show_debug_message("RIP");
}


//get input
//1 if right //0 if both // -1 if left
//var h_input = keyboard_check(vk_right) - keyboard_check(vk_left);
var h_input = o_input.right_key - o_input.left_key;


//direction check
if h_input == 1
{
	direction_ = 0; 
}
else if h_input == -1
{
	direction_ = 180;
}


//set move speed
if(h_input != 0)
{	
	speed_[h] += h_input*acceleration_;
	speed_[h] = clamp(speed_[h], -max_speed_, max_speed_);
	//sprite_index = s_soldier_walk;
	image_speed = 1;
}
else
{			
	speed_[h] = lerp(speed_[h],0,friction_);
	image_speed = 0;
	//image_index = 0;
}
 

//check if floor under player to allow jump
if (!place_meeting(x, y+gravity_ , o_solid))
{	
	
	//pardon jump for 1/4 second
	if (alarm[2]> 0  && o_input.jump_key)
	{
		speed_[v] = jump_height_;
		x_scale_ = image_xscale * .6;
		y_scale_ = image_yscale * 1.2;
	}
	else
	{
		//sprite_index = s_soldier_fall;
		speed_[v] += gravity_;
	}
}
else
{
	//reset pardon jump timer
	alarm[2] = 10;
	
	//if(sprite_index != s_soldier_walk)
	//{
		//sprite_index = s_soldier_idle;
	//}
	

	if (o_input.jump_key)
	{
		speed_[v] = jump_height_;
		x_scale_ = image_xscale * .6;
		y_scale_ = image_yscale * 1.2;
	}
}

//call move
scr_move(speed_);



//check landing
if place_meeting(x,y+gravity_,o_solid) && !place_meeting(x,yprevious+gravity_, o_solid)
{
	x_scale_ = image_xscale * 1.2;
	y_scale_ = image_yscale * .6;
}


//reset scale player effect
x_scale_ = lerp(x_scale_,image_xscale, .2);
y_scale_ = lerp(y_scale_,image_yscale, .2);


//xp calculation
if(o_player_stats.xp_ >= o_player_stats.xp_max_)
{	
	o_player_stats.xp_ -= o_player_stats.xp_max_;
	o_player_stats.xp_max_ += 25;
	o_player_stats.lvl_ ++;
}
