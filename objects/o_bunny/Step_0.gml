/// @description player movement


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
	sprite_index = s_bunny_walk;
	image_speed = 1;
	
	
}
else
{			
	speed_[h] = lerp(speed_[h],0,friction_);
	sprite_index = s_bunny_idle;
	
	
}
 

//check if floor under player to allow jump
if(!place_meeting(x, y+gravity_ , o_solid))
{	
	
	//pardon jump for 1/4 second
	if(alarm[2]> 0  && o_input.jump_key)
	{
		speed_[v] = jump_height_;
		x_scale_ = image_xscale * .6;
		y_scale_ = image_yscale * 1.2;
		sprite_index = s_bunny_jump;
		
		if(!audio_is_playing(sd_jump))
		{
			audio_play_sound(sd_jump,10,false);
		}
	
	}
	else
	{
		sprite_index = s_bunny_jump;
		speed_[v] += gravity_;
		
	}
}
else
{
	//reset pardon jump timer
	alarm[2] = 10;
	
	if(sprite_index != s_bunny_walk)
	{
		sprite_index = s_bunny_idle;
	}
	

	if (o_input.jump_key)
	{
		speed_[v] = jump_height_;
		x_scale_ = image_xscale * .6;
		y_scale_ = image_yscale * 1.2;
		sprite_index = s_bunny_jump;
		
		if(!audio_is_playing(sd_jump))
		{
			audio_play_sound(sd_jump,10,false);
		}
		
	}
}
		



//if in combat stop
if(combat_ == true)
{
	speed_[h] = 0;
	speed_[v] = 0;
	
	sprite_index = s_tickle;
	image_speed = 1;
	
}

//check if gate stop
if (place_meeting(x-1,y,o_door) && tagged_ == true)
{
	x +=8;
}
if (place_meeting(x+1,y,o_door) && tagged_ == true)
{
	x -=16;
}

//check if stunned
if(lol_ == true && !alarm[1] <= 0)
{
	sprite_index = s_lol;
	image_speed = 1;
	speed_[h] = 0;
	speed_[v] = 0;
	
}

//reset lol
if(alarm[1]<=0)
{
	lol_ = true;
}

if(place_meeting(x,y,o_victory))
{
	/// @description Win
	speed_[h] = 0;
	speed_[v] = 0;
	
	sprite_index = s_win;
	image_speed = 1;
	
	o_game.victory = true;
	
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


//combat qte
if(combat_ == true)
{
	if(o_game.target == "A")
	{
		if(gamepad_button_check_pressed(0,gp_face1))
		{
			o_game.go_next_ = true;
			combat_points += 1;
			
			if(!audio_is_playing(sd_beep))
			{
				audio_play_sound(sd_beep,15,false);
			}
			
			
			
		}
		else if(gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(0,gp_face4))
		{
			combat_points -= 1;
		}
	}
	else if(o_game.target == "X")
	{
		if(gamepad_button_check_pressed(0,gp_face3))
		{
			o_game.go_next_ = true;
			combat_points += 1;
						
			if(!audio_is_playing(sd_beep))
			{
				audio_play_sound(sd_beep,15,false);
			}
			
		}
		else if(gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(0,gp_face4))
		{
			combat_points -= 1;
			
		}
	}
	else if(o_game.target == "Y")
	{
		if(gamepad_button_check_pressed(0,gp_face4))
		{
			o_game.go_next_ = true;
			combat_points += 1;
			
			if(!audio_is_playing(sd_beep))
			{
				audio_play_sound(sd_beep,15,false);
			}
			
			
			
		}
		else if(gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(0,gp_face1))
		{
			combat_points -= 1;
			
		}
	}
	else if(o_game.target == "B")
	{
		if(gamepad_button_check_pressed(0,gp_face2) )
		{
			o_game.go_next_ = true;
			combat_points += 1;
			
			if(!audio_is_playing(sd_beep))
			{
				audio_play_sound(sd_beep,15,false);
			}
			
			
		}
		else if(gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(0,gp_face4))
		{
			combat_points -= 1;
		}
	}
}