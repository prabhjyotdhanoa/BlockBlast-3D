// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Returns a random color from a predefined list.
/// @returns A color constant (e.g., c_cyan, c_yellow, etc.).
function get_random_color() {
    // Define the available colors
    var colors = [
        c_blue,
        c_yellow,
        c_lime,
        c_purple,
        c_red,
        c_orange
    ];

    // Select a random index
    var random_index = irandom(array_length(colors) - 1);

    // Return the random color
    return colors[random_index];
}