/// @description draw QTE target

draw_set_color(c_white);
//draw_text_transformed(room_width/2,room_height/2-350,target,5,5,0);

var size = ds_stack_size(stack);

if(target != " ")
{
	if(size <= 3)
	{
		draw_sprite_ext(s_carrot,4,room_width/2,room_height/2-300,image_xscale/2,image_yscale/2,0,c_white,1);		
	}
	else if(size <= 6)
	{
		draw_sprite_ext(s_carrot,3,room_width/2,room_height/2-300,image_xscale/2,image_yscale/2,0,c_white,1);		
	}
	else if(size <= 9)
	{
		draw_sprite_ext(s_carrot,2,room_width/2,room_height/2-300,image_xscale/2,image_yscale/2,0,c_white,1);
	}
	else if(size <= 11)
	{
		draw_sprite_ext(s_carrot,1,room_width/2,room_height/2-300,image_xscale/2,image_yscale/2,0,c_white,1);
	}
	else if(size <= 14)
	{
		draw_sprite_ext(s_carrot,0,room_width/2,room_height/2-300,image_xscale/2,image_yscale/2,0,c_white,1);
	}
}

if(target == "A" && alarm[0]<=0)
{
	//draw_sprite_transformed(room_width/2,room_height/2-350,target,5,5,0);
	draw_sprite(s_A,0,room_width/2,room_height/2-250);
}
else if(target == "X" && alarm[0]<=0)
{
	//draw_text_transformed(room_width/2,room_height/2-350,target,5,5,0);
	draw_sprite(s_X,0,room_width/2,room_height/2-250);
}
else if(target == "B" && alarm[0]<=0)
{
	//draw_text_transformed(room_width/2,room_height/2-350,target,5,5,0);
	draw_sprite(s_B,0,room_width/2,room_height/2-250);
}
else if(target == "Y" && alarm[0]<=0)
{
	//draw_text_transformed(room_width/2,room_height/2-350,target,5,5,0);
	draw_sprite(s_Y,0,room_width/2,room_height/2-250);
}
else if(target == " ")
{
	draw_text_transformed(room_width/2,room_height/2-350,target,5,5,0);
	//draw_sprite(room_width/2,room_height/2-350,s_A);
}

if(direction_ == "c" && victory == false)
{
	//draw_text_transformed(room_width/2,room_height/2-300,"---",5,5,0);
}
else if(direction_ == "r" && victory == false)
{
	draw_sprite(s_RIGHT,0,room_width/2+350,room_height/2-300);
}	
else if(direction_ == "l" && victory == false)
{
	draw_sprite(s_LEFT,0,room_width/2-350,room_height/2-300);
}
else if(victory == true)
{
	draw_set_halign(fa_center);
	draw_text(room_width/2,room_height/2-150,"VICTORY !!!");
}
