if(initial_dead_to_input > 0) {
	initial_dead_to_input--;	
}

if(has_cursor && !selection_made) {
	if left_press then selected--;
	if right_press then selected++;

	if selected > max_selection - 1 then selected = 0;
	if selected < 0 then selected = max_selection - 1;
	
	if(accept_press > 0) {
		script_execute(asset_get_index(cursor_actions[| selected]));
	}
}

if(scr_get_active_ui() != self) {
	left_key = 0;
	left_press = 0;
	right_key = 0;
	right_press = 0;
	up_key = 0;
	down_key = 0;
	action_key = 0;
	accept_key = 0;
	accept_press = 0;
	cancel_key = 0;
	cancel_press = 0;
}