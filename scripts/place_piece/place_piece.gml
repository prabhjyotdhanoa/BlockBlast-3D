// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Place the piece on the board
function place_piece(array_3d, piece, px, py, pz) {
    for (var i = 0; i < array_length(piece); i++) {
        for (var j = 0; j < array_length(piece[i]); j++) {
            for (var k = 0; k < array_length(piece[i][j]); k++) {
                if (piece[i][j][k] != 0) {
                    array_3d[px + i][py + j][pz + k] = piece[i][j][k];
                }
            }
        }
    }
}