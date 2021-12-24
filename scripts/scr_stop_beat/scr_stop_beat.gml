beat_active = 0;
display_damage = total_damage;
display_count = combo_count;

if(beat_notes != noone) {
	if combo_count > 15 {
	beat_notes.ended = 1 ;
	} else {
	beat_notes.ended = -1
	}
}

if(combo_count > 1) {
	damage_display_timer = damage_display_time;
}

instance_destroy(beat_handler);
beat_input = 0;

beat_notes = noone;
