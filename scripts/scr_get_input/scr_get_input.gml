///scr_get_input


//player 1

//keyboard
//move
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);

//jump
jump_key = keyboard_check(vk_space);


//check for gamepad
if(gamepad_is_connected(0))
{
		right_key = (gamepad_axis_value(0,gp_axislh) >= 0.5);		
		left_key = (gamepad_axis_value(0,gp_axislh) <= -0.5);
		jump_key = gamepad_button_check(0,gp_face1);
}


//player 2
//keyboard
//move
right_key_2 = keyboard_check(ord("L"));
left_key_2 = keyboard_check(ord("J"));

//jump
jump_key_2 = keyboard_check(ord("I"));


//check for gamepad
if(gamepad_is_connected(1))
{
		right_key_2 = (gamepad_axis_value(1,gp_axislh) >= 0.5);		
		left_key_2 = (gamepad_axis_value(1,gp_axislh) <= -0.5);
		jump_key_2 = gamepad_button_check(1,gp_face1);
}