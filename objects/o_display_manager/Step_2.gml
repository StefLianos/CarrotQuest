/// @description set size

//set view x and view y to player to follow it
//if(instance_exists(o_bunny) && o_bunny.tagged_ == false && o_bunny_2.tagged_ == true)
//{
//	
//	
//	global.view_x = o_bunny.x - global.view_w/2;
//	global.view_y = o_bunny.y - global.view_h/2;
//}
//else if(instance_exists(o_bunny_2) && o_bunny_2.tagged_ == false && o_bunny.tagged_ == true)
//{
//	global.view_x = o_bunny_2.x - global.view_w/2;
//	global.view_y = o_bunny_2.y - global.view_h/2;
//}

if(instance_exists(o_bunny) && instance_exists(o_bunny_2))
{
	global.view_x = (o_bunny.x + o_bunny_2.x) / 2 ;
	global.view_y = (o_bunny.y + o_bunny_2.y) / 2 ;
	
}
else
{
	global.view_x = global.view_w/2;
	global.view_y = global.view_h/2;;
}

//clamp to room
global.view_x = clamp(global.view_x,0,room_width-global.view_w);
global.view_y = clamp(global.view_y,0,room_height-global.view_h);

//set camera
camera_set_view_size(view_camera[0],ideal_width,ideal_height);
camera_set_view_pos(view_camera[0],global.view_x,global.view_y);
									


