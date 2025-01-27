// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Returns a random piece type as a string.
/// @returns A string representing a piece type.
function get_random_piece_type() {
    // Define the available piece types
    var piece_types = [
        "L",
        "Square",
        "Line",
        "YLine",
        "ZLine",
        "Dot",
		"2Dot",
		"RL"
    ];

    // Select a random index
    var random_index = irandom(array_length(piece_types) - 1);

    // Return the random piece type
    return piece_types[random_index];
}