/// @description draw bunny
//flip player sprite
if direction_ == 0
{
	var flip = 1;
}
else if direction_ == 180
{
	var flip = -1;
}
	


if hit_ == false
{
	//draw player
	draw_sprite_ext(sprite_index, image_index, x, y, x_scale_ * flip, y_scale_, 0, image_blend, image_alpha);	
}
else
{
	//draw player
	draw_sprite_ext(sprite_index, image_index, x, y, x_scale_ * flip, y_scale_, 0, image_blend, image_alpha);	
}

draw_text(x-8,y-sprite_height-15,"P1")
