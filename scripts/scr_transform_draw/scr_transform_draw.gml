///transform all sprites below this function!
///@param x
///@param y
///@param xrot
///@param yrot
///@param zrot
///@param xscale
///@param yscale
var x_ = argument0;
var y_ = argument1;
var xr = argument2;
var yr = argument3;
var zr = argument4;
var xs = argument5;
var ys = argument6;

var mat = matrix_build(x_, y_, 0, xr, yr, zr, xs, ys, 1);
matrix_set(matrix_world, mat);