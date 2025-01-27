// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Draw the preview block at a given position
function draw_preview(array_3d, piece, px, py, pz, vbuff, linebuff) {
    for (var i = 0; i < array_length(piece); i++) {
        for (var j = 0; j < array_length(piece[i]); j++) {
            for (var k = 0; k < array_length(piece[i][j]); k++) {
                if (piece[i][j][k] != 0) {
                    // Calculate world positions
                    var world_x = px*128 + (i * 128); // Scale factor
					show_debug_message("world_x: "+string(world_x));
                    var world_y = py*128 + j * 128;
                    var world_z = (pz*128 + k *128 )*-1;

                    // Draw the block
                    draw_cube(world_x, world_y, world_z, piece[i][j][k], vbuff, linebuff); // Replace with your own cube draw function
                }
            }
        }
    }
}