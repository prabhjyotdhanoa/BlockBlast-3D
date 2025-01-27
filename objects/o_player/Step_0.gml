/// @description Insert description here
// You can write your code in this editor

//look_dir -= (window_mouse_get_x() - window_get_width()/2) / 10;
//look_pitch -= (window_mouse_get_y() - window_get_height()/2)/10;
//look_pitch = clamp(look_pitch, -80, 10);


//window_mouse_set(window_get_width()/2, window_get_height()/2);


if (keyboard_check_direct(vk_escape)){
	game_end();
}

var move_speed = 8;
if (keyboard_check(vk_up)){
	x += dcos(look_dir) * move_speed;
	y -= dsin(look_dir)* move_speed;
}

if (keyboard_check(vk_down)){
	x -= dcos(look_dir)* move_speed;
	y += dsin(look_dir)* move_speed;
}

if (keyboard_check(vk_left)){
	x -= dsin(look_dir)* move_speed;
	y -= dcos(look_dir)* move_speed;
}

if (keyboard_check(vk_right)){
	x += dsin(look_dir)* move_speed;
	y += dcos(look_dir)* move_speed;
}
if (keyboard_check(vk_space)){
	z -= move_speed;
}
if (keyboard_check(vk_lcontrol)){
	z += move_speed;
}

show_debug_message(string(look_dir) + " " + string(look_pitch));

if (keyboard_check(ord("R"))){
	z = -816;
x=-375;
y= 1227;
look_dir = 49;
look_pitch=-32;
}

if (keyboard_check(ord("O"))){
look_dir +=1;
}

if (keyboard_check(ord("P"))){

look_dir -= 1;

}