var probe_direction = argument[0];
if(argument_count > 1) var probe_speed = argument[1]; else var probe_speed = 8;

probe = instance_create_depth(x - 4, y - 8, 0, interaction_probe);

with (probe)
{
	motion_set(probe_direction, probe_speed);
}