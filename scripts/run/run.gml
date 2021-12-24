var i;
for(i = 0; i < ds_list_size(global.ui_manager.ui_stack); i+=1) {
	var obj = ds_list_find_value(global.ui_manager.ui_stack, i);
	ds_list_delete(global.ui_manager.ui_stack, i);
	instance_destroy(obj);
}

ds_list_clear(global.ui_manager.ui_stack);

scr_return_to_room()
