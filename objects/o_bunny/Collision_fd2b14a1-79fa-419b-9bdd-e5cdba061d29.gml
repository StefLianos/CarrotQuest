/// @description
if(alarm[0] <=  0)
{
	if(gamepad_button_check_pressed(0,gp_shoulderl))
	{
		o_bunny_2.tagged_ = true;
		o_bunny_2.tickled = true;
		o_bunny_2.combat_ = true;
		
		combat_ = true;
		
		alarm[0] = 6;
	}
}