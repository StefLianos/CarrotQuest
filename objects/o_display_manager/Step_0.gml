/// @description zoom

if(keyboard_check_pressed(ord("Z")))
{
	show_debug_message("zoom");
	zoom = zoom * 2;
	
	show_debug_message(string(zoom));
	if(zoom > max_zoom)
	{
		zoom = 1;
	}
	
	window_set_size(ideal_width*zoom,ideal_height*zoom);
	display_set_gui_size(ideal_width,ideal_height);
	surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);
	alarm[0] = 1;
}

