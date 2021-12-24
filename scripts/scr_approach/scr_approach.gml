///approaches
///@param current
///@param target
///@param amount

var current = argument0;
var target = argument1;
var amount = argument2;

// approach the value but do not go over

if (current < target) {
    return min(current+amount, target);
} else {
    return max(current-amount, target);
}