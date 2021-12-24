/// @description takes a command and checks if it should be replaced with a string of some sort
/// @param replace_command

var replace_command = argument[0];

switch(replace_command)
{
	case "player1_name":
		return "Ness";
	default:
		return "{" + replace_command+ "}";
}