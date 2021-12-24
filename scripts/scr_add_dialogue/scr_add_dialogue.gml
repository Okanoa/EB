var priority_queue_to_use = argument[0]
var message = argument[1]
if(argument_count > 2) var priority = argument[2]; else var priority = 0;

ds_priority_add(priority_queue_to_use,message,priority);