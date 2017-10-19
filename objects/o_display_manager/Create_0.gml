/// @description initialise display manager

//display properties
ideal_width = 0;
ideal_height =  360;
zoom = 1;
max_zoom =1;

aspect_ratio = display_get_width()/display_get_height();

//dinamically get width
ideal_width = round(ideal_height*aspect_ratio);


//perfect pixel scaling
if(display_get_width() mod  ideal_width != 0) //is it divisible ?
{
	//if no adjust
	var d = round(display_get_width()/ideal_width);
	ideal_width = display_get_width()/d; 

}
if(display_get_height() mod  ideal_height != 0) //is it divisible ?
{
	//if no adjust
	var d = round(display_get_height()/ideal_height);
	ideal_height = display_get_height()/d; 

}


//check for odd numbers
if(ideal_width & 1)
{
	ideal_width ++;
}

if(ideal_height & 1)
{
	ideal_height ++;
}

//get max zoom
max_zoom = floor(display_get_width()/ideal_width);


//surface resize

window_set_size(ideal_width,ideal_height);
display_set_gui_size(ideal_width,ideal_height);
surface_resize(application_surface,ideal_width,ideal_height);

alarm[0] = 1;

//create camera
camera = camera_create();

//init gml1 variables for camera
global.view_x = 0; 
global.view_y = 0;
global.view_w = ideal_width;
global.view_h = ideal_height;



room_goto_next();
