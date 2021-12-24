var key = argument0;

if ds_map_exists(global.eventflags,key) {
	if global.eventflags[? key] != 0 {
		return key+string(global.eventflags[? key]);
	}
	return key;
}
return "";