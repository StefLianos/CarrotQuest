///@description ini combat stack

stack = ds_stack_create();
keys = ds_list_create();

ds_list_add(keys,"A");
ds_list_add(keys,"X");
ds_list_add(keys,"Y");
ds_list_add(keys,"B");

target = " ";
first_round_ = true;
go_next_ = false;
finish_ = false;

direction_ = "c";

victory = false;

//alarm[0] = 15;