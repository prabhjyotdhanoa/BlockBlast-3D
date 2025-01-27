/// @description Insert description here
// You can write your code in this editor
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);


//vertex format setup
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format=vertex_format_end();

#region create the test grass grid
//vertex buffwer - what is acc drawn to the screen

vbuffer = vertex_create_buffer();
linebuffer = vertex_create_buffer();

fvbf = vertex_create_buffer();


vertex_begin(vbuffer, vertex_format);
vertex_begin(fvbf, vertex_format);
vertex_begin(linebuffer, vertex_format);

var x1 = 400;
var y1 = 400;
var x2 = 600;
var y2 = 600;

//test grid for 3d
s = 128;
var c_col;
for (var i =0; i < room_width; i+=s){
	for (var j =0; j < room_height; j+=s){
		if ((i % (s*2) == 0 and j % (s*2) == 0) || (i % (s*2) > 0 and j % (s*2) > 0)){
			c_col = c_white;
		}
		else{
			c_col = c_aqua;
		}
		vertex_add_point(fvbf,i, j,			0, 0, 0, 1, 0, 1, c_col, 1);
		vertex_add_point(fvbf,i+s, j,		0, 0, 0, 1, 1, 0, c_col, 1);
		vertex_add_point(fvbf,i+s, j+s,		0, 0, 0, 1, 1, 1, c_col, 1);

		vertex_add_point(fvbf,i+s, j+s,		0, 0, 0, 1, 0, 1, c_col, 1);
		vertex_add_point(fvbf,i, j+s,		0, 0, 0, 1, 1, 0, c_col, 1);
		vertex_add_point(fvbf,i, j,			0, 0, 0, 1, 1, 1, c_col, 1);
	}
}


#endregion

instance_create_depth(0, 0, 0, o_player);

#region game plan

/*
high level structure
Make a 3d array (9x9x9)
Show piece to player in a scaled down version on side of screen
allow player to change where they place the piece with WASD (true north)
increase height with E, decrease height with Q
show white preview of block
press enter to confirm (cant place on top of hold blocks)
Random color for block

if entire level compete delete the level (both width and height wise)

score counter top center
if a clear happens within 3 blocks, add a combo stack (+100 *x)
if a full clear happens (+500)
*/

#endregion

#region make 3d array
//init for game data
// Define dimensions
var arr_size = 6

// Create the 3D array
array_3d = array_create(arr_size);

for (var i = 0; i < arr_size; i++) {
    array_3d[i] = array_create(arr_size);
    for (var j = 0; j < arr_size; j++) {
        array_3d[i][j] = array_create(arr_size);
        for (var k = 0; k < arr_size; k++) {
            // Initialize each element
            array_3d[i][j][k] = 0; // Or any value you'd like
        }
    }
}

//// Accessing an element
//var value = array_3d[1][2][3];
//show_debug_message("Value at [1][2][3]: " + string(value));

//// Setting an element
//array_3d[1][2][3] = 42;

//// Debugging the change
//show_debug_message("Updated value at [1][2][3]: " + string(array_3d[1][2][3]));

#endregion

#region make first piece
first_piece = create_piece(1, c_red, "Line");

//normal check if can place piece _. place piece _. preview piece


place_piece(array_3d, first_piece, 0, 3, 0);
place_piece(array_3d, first_piece, 3, 3, 0);

place_piece(array_3d, first_piece, 0, 4, 0);
place_piece(array_3d, first_piece, 3, 4, 0);

place_piece(array_3d, first_piece, 0, 5, 0);
place_piece(array_3d, first_piece, 3, 5, 0);



draw_preview(array_3d, first_piece, 0, 3, 0, vbuffer, linebuffer);
draw_preview(array_3d, first_piece, 3, 3, 0, vbuffer, linebuffer);

draw_preview(array_3d, first_piece, 0, 4, 0, vbuffer, linebuffer);
draw_preview(array_3d, first_piece, 3, 4, 0, vbuffer, linebuffer);

draw_preview(array_3d, first_piece, 0, 5, 0, vbuffer, linebuffer);
draw_preview(array_3d, first_piece, 3, 5, 0, vbuffer, linebuffer);


print_3d_array(array_3d);
print_3d_array(first_piece);

#endregion

#region variables and gameloop
current_score = 0;
current_piece_type = "Line"
piece = create_piece(1, c_yellow, current_piece_type);
px = 0;
py = 0;
pz = 0;

//main idea
/*
must vertex begin a buffer before using it/adding to it
must vertex end a buffer before submitting
buffer must be vertex end before submission

steps
copy from most recent buffer to current/new buffer, before submission
add to new buffer
do vertex end when buffer chnages are done, copy current buffer to next buffer
submit current buffer
repeat
*/

current_buffs = false;

current_vbuffer = vertex_create_buffer()
current_linebuffer = vertex_create_buffer()

vertex_end(vbuffer);
vertex_end(fvbf);
vertex_end(linebuffer);

show_message_async("CTRLS:\nWASD to move pieces \nEQ change piece height \nENTER to place piece \nR to reset camera \n ARROW KEYS + O,P to chnage camera");


