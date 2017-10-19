/// @description make sure we only have one instance
if(instance_number(o_bunny) > 1)
{
	instance_destroy(instance_nearest(x,y,o_bunny));
}