// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Check if the piece can be placed
function can_place_piece(array_3d, piece, px, py, pz) {
    for (var i = 0; i < array_length(piece); i++) {
        for (var j = 0; j < array_length(piece[i]); j++) {
            for (var k = 0; k < array_length(piece[i][j]); k++) {
                if (piece[i][j][k] != 0) {
                    var wx = px + i;
                    var wy = py + j;
                    var wz = pz + k;
                    if (wx >= array_length(array_3d) ||wx < 0|| wy >= array_length(array_3d[wx]) || wy< 0 || wz >= array_length(array_3d[wx][wy])|| wz<0 || array_3d[wx][wy][wz] != 0) {
                        return false;
                    }
                }
            }
        }
    }
    return true;
}