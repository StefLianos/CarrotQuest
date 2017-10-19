/// @description 
if(alarm[0] <=  0)
{
	if(gamepad_button_check_pressed(1,gp_shoulderl))
	{
		o_bunny.tagged_ = true;
		o_bunny.tickled = true;
		o_bunny.combat_ = true;
		combat_ = true;
		
		alarm[0] = 6
	}
}
