/// @description go through door
if(room_exists(other.new_room) && tagged_ == false)
{
	instance_destroy(o_bunny_2);
	
	room_goto(other.new_room);
	
	x = other.new_x;
	y = other.new_y;
	
	
}
