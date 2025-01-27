/// @description Insert description here
// You can write your code in this editor

draw_clear(c_black);

var camera = camera_get_active();
var camera_distance = 160;

var xfrom = o_player.x;
var yfrom = o_player.y;
var zfrom = o_player.z;

var xto =  xfrom + camera_distance* dcos(o_player.look_dir);	
var yto =  yfrom - camera_distance* dsin(o_player.look_dir);	
var zto =  zfrom - camera_distance* dsin(o_player.look_pitch);

 
camera_set_view_mat(camera, matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, window_get_width()/window_get_height(), 1, 32000));
camera_apply(camera); //0,0,1 is up vector


//everything must be drawn after the 3d projection has been set

if current_buffs = true{
	vertex_submit(current_vbuffer, pr_trianglelist, -1);
	vertex_submit(current_linebuffer, pr_linelist, -1);

}


vertex_submit(fvbf, pr_trianglelist, -1);
vertex_submit(vbuffer, pr_trianglelist, -1);
vertex_submit(linebuffer, pr_linelist, -1);