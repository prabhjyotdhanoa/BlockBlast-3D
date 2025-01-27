// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function print_3d_array(arr_3d){
	for(var i = 0; i < array_length(arr_3d); i++){
		show_debug_message("Row: "+string(i));
		for(var j = 0; j < array_length(arr_3d[i]); j++){
			show_debug_message(string(arr_3d[i][j]));
		}
	}
	
	return;
}