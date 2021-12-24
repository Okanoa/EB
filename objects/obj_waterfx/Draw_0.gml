/// @description Insert description here
// You can write your code in this editor
gpu_set_tex_filter(1)

shader_set(shd_water)
fp = 60;

shader_set_uniform_f_array(shader_get_uniform(shd_water,"pal0"),pal0)
shader_set_uniform_f_array(shader_get_uniform(shd_water,"pal1"),pal1)
shader_set_uniform_f_array(shader_get_uniform(shd_water,"pal2"),pal2)
shader_set_uniform_f_array(shader_get_uniform(shd_water,"pal3"),pal3)

shader_set_uniform_f(shader_get_uniform(shd_water,"TScroll"),floor((get_timer()/5000000)*fp)/fp)
draw_self()

shader_reset();
gpu_set_tex_filter(0)



