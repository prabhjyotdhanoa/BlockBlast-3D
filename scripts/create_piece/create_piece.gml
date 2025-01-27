// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Create a square piece
function create_piece(size, color, type) {
    var piece = array_create(size);
    for (var i = 0; i < size; i++) {
        piece[i] = array_create(size);
        for (var j = 0; j < size; j++) {
            piece[i][j] = array_create(size);
            for (var k = 0; k < size; k++) {
                piece[i][j][k] = 0 //initlaize empty block
            }
        }
    }
    // Build the piece based on type
    switch (type) {
        case "L":
            // Create an "L" shape: two flat blocks and one sticking up
            piece[0][0][0] = color; // Base block
            piece[1][0][0] = color; // Adjacent block
            piece[0][0][1] = color; // Block sticking up
            break;

        case "Square":
            // Create a simple 2x2 square
            piece[0][0][0] = color;
            piece[1][0][0] = color;
            piece[0][1][0] = color;
            piece[1][1][0] = color;
            break;

        case "Line":
            // Create a straight line (3 blocks long)
            piece[0][0][0] = color;
            piece[1][0][0] = color;
            piece[2][0][0] = color;
            break;
			
		case "YLine":
            // Create a straight line (3 blocks long)
            piece[0][0][0] = color;
            piece[0][1][0] = color;
            piece[0][2][0] = color;
            break;
			
		case "ZLine":
            // Create a straight line (3 blocks long)
            piece[0][0][0] = color;
            piece[0][0][1] = color;
            piece[0][0][2] = color;
            break;
			
		case "Dot":
            // Create a 1x1 dot
            piece[0][0][0] = color;
            break;
			
		case "2Dot":
            // Create a straight line (2 blocks long)
            piece[0][0][0] = color;
			piece[0][1][0] = color;
            break;
			
		case "RL":
            // Create a reverse L
			piece[0][0][1] = color; // Base block
            piece[1][0][1] = color; // Adjacent block
            piece[1][0][0] = color; // Block sticking up
           
            break;

        default:
            show_debug_message("Unknown piece type: " + string(type));
    }

    return piece;
}