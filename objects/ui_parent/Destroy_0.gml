ds_list_delete(global.ui_manager.ui_stack, ds_list_find_index(global.ui_manager.ui_stack, self));
cursor_x = ds_list_create();
cursor_y = ds_list_create();

// The actions to take with each menu item
cursor_actions = ds_list_create();
ds_list_destroy(cursor_x);
ds_list_destroy(cursor_y);