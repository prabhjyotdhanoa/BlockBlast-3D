/// @description Insert description here
// You can write your code in this editor
// Player input
if (keyboard_check_pressed(ord("W"))) py -= 1;
if (keyboard_check_pressed(ord("S"))) py += 1;
if (keyboard_check_pressed(ord("A"))) px -= 1;
if (keyboard_check_pressed(ord("D"))) px += 1;
if (keyboard_check_pressed(ord("Q"))) pz -= 1;
if (keyboard_check_pressed(ord("E"))) pz += 1;

current_buffs = true;
vertex_begin(current_vbuffer, vertex_format);
vertex_begin(current_linebuffer, vertex_format)
draw_preview(array_3d, piece, px, py, pz, current_vbuffer, current_linebuffer);
vertex_end(current_vbuffer);
vertex_end(current_linebuffer);




//Confirm placement
if (keyboard_check_pressed(vk_enter)) {
    if (can_place_piece(array_3d, piece, px, py, pz)) {
        place_piece(array_3d, piece, px, py, pz);
		
		if check_for_clears(array_3d){
			current_score += 100;
			show_message_async("Nice Clear! Score: "+string(current_score));
			
		}
		
		vertex_begin(vbuffer, vertex_format);
		vertex_begin(linebuffer, vertex_format);
		
		var size_x = array_length(array_3d);
		for (var i = 0; i < size_x; i++) {
		    var size_y = array_length(array_3d[i]);
		    for (var j = 0; j < size_y; j++) {
		        var size_z = array_length(array_3d[i][j]);
		        for (var k = 0; k < size_z; k++) {
		            // Check if the current position has a block (non-zero value)
		            if (array_3d[i][j][k] != 0) {
		                // Example: Draw a cube at the corresponding position
		                var color = array_3d[i][j][k]; // Use value in the array for color
		                var wx = i * s;
		                var wy = j * s;
		                var wz = k * s * -1;

		                draw_cube(wx, wy, wz, color, vbuffer, linebuffer);
		            }
		        }
		    }
		}
		
		vertex_end(vbuffer);
		vertex_end(linebuffer);
		
		
		current_piece_type = get_random_piece_type();
		piece = create_piece(1, get_random_color(), current_piece_type);
		
		
		
    } else {
        show_message_async("Cannot place here!");
    }
}

show_debug_message( "x: " + string(o_player.x) + " y: " + string(o_player.y)+" z: " + string(o_player.z));