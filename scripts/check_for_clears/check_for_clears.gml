/// @desc Checks if any full layer exists in the 3D array. If a full layer is found, it clears it.
/// @param arr_3d The 3D array representing the grid.
/// @returns True if a layer is cleared, false otherwise.
function check_for_clears(arr_3d) {
    var size_x = array_length(arr_3d);
    var size_y = array_length(arr_3d[0]);
    var size_z = array_length(arr_3d[0][0]);
    var cleared = false;

    // Check for full XY layers (checking k axis)
    for (var k = 0; k < size_z; k++) {
        var full = true;
        for (var i = 0; i < size_x; i++) {
            for (var j = 0; j < size_y; j++) {
                if (arr_3d[i][j][k] == 0) {
                    full = false; // Found an empty spot in the layer
                    break;
                }
            }
            if (!full) break;
        }
        
        if (full) {
            // Clear the full layer
            for (var i = 0; i < size_x; i++) {
                for (var j = 0; j < size_y; j++) {
                    array_3d[i][j][k] = 0; // Clear the layer
                }
            }
            cleared = true; // Mark as cleared
        }
    }

    // Check for full XZ layers (checking j axis)
    for (var j = 0; j < size_y; j++) {
        var full = true;
        for (var i = 0; i < size_x; i++) {
            for (var k = 0; k < size_z; k++) {
                if (arr_3d[i][j][k] == 0) {
                    full = false; // Found an empty spot in the layer
                    break;
                }
            }
            if (!full) break;
        }
        
        if (full) {
            // Clear the full layer
            for (var i = 0; i < size_x; i++) {
                for (var k = 0; k < size_z; k++) {
                    array_3d[i][j][k] = 0; // Clear the layer
                }
            }
            cleared = true; // Mark as cleared
        }
    }

    // Check for full YZ layers (checking i axis)
    for (var i = 0; i < size_x; i++) {
        var full = true;
        for (var j = 0; j < size_y; j++) {
            for (var k = 0; k < size_z; k++) {
                if (arr_3d[i][j][k] == 0) {
                    full = false; // Found an empty spot in the layer
                    break;
                }
            }
            if (!full) break;
        }
        
        if (full) {
            // Clear the full layer
            for (var j = 0; j < size_y; j++) {
                for (var k = 0; k < size_z; k++) {
                    array_3d[i][j][k] = 0; // Clear the layer
                }
            }
            cleared = true; // Mark as cleared
        }
    }

    return cleared; // Return whether a layer was cleared
}