/// @description Parent objects that you don't want to have dynamic depth!

initial_dead_to_input = 30;

// ###### INPUT HANDLING VARIABLES ######
left_key = 0;
left_press = 0;
right_key = 0;
right_press = 0;
up_key = 0;
down_key = 0;
action_key = 0;
action_press = 0;
accept_key = 0;
accept_press = 0;
cancel_key = 0;
cancel_press = 0;

// ###### APPEARANCE ######
// draw_locations (gui)
x_location = 0;
y_location = 0;
// The base sprite to draw as the base or background of the UI object
menu_base = noone;
// The cursor or marker to highlight what is selected (only used if has_cursor is true)
marker = noone;

// ###### BEHAVIOR ######
// If this menu item can be closed by exiting or pressing cancel button
close_with_cancel_button = true;
// If this is true, no longer accept inputs
selection_made = false;

// Determines whether or not a cursor should be drawn for this UI object
has_cursor = false;

// ###### CURSOR STUFF - ONLY USED IF has_cursor IS TRUE ######
// item the cursor is pointing at
selected = 0;

// the number of items that the cursor can point to
max_selection = 6;

// The positions for the cursor
cursor_current_x = 0;
cursor_current_y = 0;
cursor_x = ds_list_create();
cursor_y = ds_list_create();

// The actions to take with each menu item
cursor_actions = ds_list_create();

// ###### UI STACK ######
// Pushes the UI object instance onto the ui stack, most recent one on the stack is the active UI
ds_list_add(global.ui_manager.ui_stack, self);