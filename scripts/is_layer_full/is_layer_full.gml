// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Checks if a layer in a 3D array is completely filled.
/// @param array_3d The 3D array representing the grid.
/// @param layer_type The type of layer to check: "xy", "xz", or "yz".
/// @param layer_index The index of the layer to check.
/// @returns Returns true if the layer is full, false otherwise.

function is_layer_full(array_3d, layer_type, layer_index) {
    var size_x = array_length(array_3d);
    var size_y, size_z;

    switch (layer_type) {
        case "xy": // Horizontal layer (k is fixed)
            size_y = array_length(array_3d[0]);
            size_z = array_length(array_3d[0][0]);

            if (layer_index < 0 || layer_index >= size_z) return false; // Out of bounds check

            for (var i = 0; i < size_x; i++) {
                for (var j = 0; j < size_y; j++) {
                    if (array_3d[i][j][layer_index] == 0) {
                        return false; // Empty block found
                    }
                }
            }
            break;

        case "xz": // Vertical layer (j is fixed)
            size_y = array_length(array_3d[0]);
            size_z = array_length(array_3d[0][0]);

            if (layer_index < 0 || layer_index >= size_y) return false; // Out of bounds check

            for (var i = 0; i < size_x; i++) {
                for (var k = 0; k < size_z; k++) {
                    if (array_3d[i][layer_index][k] == 0) {
                        return false; // Empty block found
                    }
                }
            }
            break;

        case "yz": // Vertical layer (i is fixed)
            size_y = array_length(array_3d[0]);
            size_z = array_length(array_3d[0][0]);

            if (layer_index < 0 || layer_index >= size_x) return false; // Out of bounds check

            for (var j = 0; j < size_y; j++) {
                for (var k = 0; k < size_z; k++) {
                    if (array_3d[layer_index][j][k] == 0) {
                        return false; // Empty block found
                    }
                }
            }
            break;

        default:
            return false; // Invalid layer type
    }

    return true; // No empty blocks found, layer is full
}
