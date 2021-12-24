var ui_object_to_make_active = argument[0];
var ui_obj_index = ds_list_find_index(global.ui_manager.ui_stack, ui_object_to_make_active);
var list_size = ds_list_size(global.ui_manager.ui_stack);

if(ui_obj_index < 0) {
	// UI Object is not in the stack
}
else {
	if ui_obj_index == list_size - 1
		return;
	
	ds_list_delete(global.ui_manager.ui_stack, ui_obj_index);
	ds_list_add(global.ui_manager.ui_stack, ui_object_to_make_active);
}