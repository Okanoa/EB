/// @desc script_execute_array(array)
/// @arg array

var _a = argument0;
var _len = array_length_1d(_a);

switch(_len){
	case 1:  script_execute(_a[0]); break;
	case 2:  script_execute(_a[0], _a[1]); break;
	case 3:  script_execute(_a[0], _a[1], _a[2]); break;
	case 4:  script_execute(_a[0], _a[1], _a[2], _a[3]); break;
	case 5:  script_execute(_a[0], _a[1], _a[2], _a[3], _a[4]); break;
	case 6:  script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5]); break;
	case 7:  script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6]); break;
	case 8:  script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7]); break;
	case 9:  script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8]); break;
	case 10: script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9]); break;
	case 11: script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10]); break;
	case 12: script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11]); break;
	case 13: script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12]); break;
	case 14: script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12], _a[13]); break;
	case 15: script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12], _a[13], _a[14]); break;
	case 16: script_execute(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12], _a[13], _a[14], _a[15]); break;
	default: break;
}