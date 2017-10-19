/// @description 
if(instance_exists(o_bunny) && instance_exists(o_bunny_2))
{
	
	if(o_bunny.combat_ == true && o_bunny_2.combat_ == true)
	{
				
		//start qte combat
		if(first_round_ == true)
		{
			finish_ = false;
			
			for(i=0;i<15;i++)
			{
				ds_stack_push(stack,choose("A","X","Y","B"));
			}
			
			
			go_next_ = true;
			
			
		}
		
		
		//pop first
		if(go_next_ == true && alarm[0]<=0)
		{			
			target = ds_stack_pop(stack);
			
			go_next_ = false;
			first_round_ = false;			
		}
		
		
		//end
		else if(ds_stack_empty(stack))
		{						
			if(o_bunny.combat_points > o_bunny_2.combat_points)
			{
				o_bunny_2.tagged_ = true;
				o_bunny_2.lol_ = true;
				o_bunny_2.alarm[1] = 120;
				
				o_bunny.tagged_ = false;
				finish_ = true;
				
				direction_ = "r"	
			}
			else if(o_bunny.combat_points < o_bunny_2.combat_points)
			{
				o_bunny.tagged_ = true;
				o_bunny.lol_ = true;
				o_bunny.alarm[1] = 120;
				o_bunny_2.tagged_ = false;
				finish_ = true;
				
				direction_ = "l"
			}
			else
			{
				direction_ = "c"
			}
			
			target = " ";
			first_round_ = true;
			go_next_ = false;
			finish_ = true;
			
			o_bunny.combat_points = 0;
			o_bunny_2.combat_points = 0;
			
			o_bunny.combat_ = false;
			o_bunny_2.combat_ = false;
		}
	}
	
	//carrot sound
	var sound_size = ds_stack_size(stack); 
		
	if(sound_size  == 13 || sound_size == 10 || sound_size == 8 || sound_size == 4)
	{
		if(!audio_is_playing(sd_crunch))
		{
			audio_play_sound(sd_crunch,9,false);
		}
	}
}

show_debug_message(string(target));