/// @description Insert description here
// You can write your code in this editor
depth = 0
//show_debug_message(time)

if time < duration
{
	if obj_battle_menu.option = 1
	{
		time += 1
		dest = 95
		x = ease_out_quint(time,start,dest - start, duration)
		
		if time = duration
		{
			time = duration	
		}
	}

	if obj_battle_menu.option = 2
	{
		time += 1
		dest = 127
		x = ease_out_quint(time,start,dest - start, duration)
		
		if time = duration
		{
			time = duration	
		}
	}
	
	if obj_battle_menu.option = 3
	{
		time += 1
		dest = 152
		x = ease_out_quint(time,start,dest - start, duration)
		
		if time = duration
		{
			time = duration	
		}
	}
	
	if obj_battle_menu.option = 4
	{	
		time += 1
		dest = 178
		x = ease_out_quint(time,start,dest - start, duration)
		
		if time = duration
		{
			time = duration	
		}
	}
	
	if obj_battle_menu.option = 5
	{
		time += 1
		dest = 204
		x = ease_out_quint(time,start,dest - start, duration)
		
		if time = duration
		{
			time = duration	
		}
	}
	
	if obj_battle_menu.option = 6
	{
		time += 1
		dest = 239
		x = ease_out_quint(time,start,dest - start, duration)
		if time <= duration
		
		if time = duration
		{
			time = duration	
		}
	}
}