// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_cube(real_x, real_y, real_z, cube_col, vbuff, linebuff){

	//to draw smth
	//we make a vertex buffer, add vertieces to it
	//then end the vertex buffer

	if cube_col != 0 {
		var size = 128;
	
	//flat bottom tri 1
	vertex_add_point(vbuff,real_x, real_y,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y+size,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y+size,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	
	//flat bottom tri 2
	vertex_add_point(vbuff,real_x+size, real_y+size,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	
	
	//flat top tri 1
	vertex_add_point(vbuff,real_x, real_y,			real_z-size, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y+size,			real_z-size, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y+size,			real_z-size, 0, 0, 1, 0, 1, cube_col, 1);
	
	//flat top tri 2
	vertex_add_point(vbuff,real_x+size, real_y+size,			real_z-size, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y,			real_z-size, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y,			real_z-size, 0, 0, 1, 0, 1, cube_col, 1);
	
	
	//east tri 1
	vertex_add_point(vbuff,real_x, real_y,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y,		real_z-size, 1, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y+size,		real_z, 1, 0, 1, 0, 1, cube_col, 1);
	
	//east tri 2
	vertex_add_point(vbuff,real_x, real_y,			real_z-size, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y+size,		real_z-size, 1, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y+size,		real_z, 1, 0, 1, 0, 1, cube_col, 1);
	
	
	//west tri 1
	vertex_add_point(vbuff,real_x+size, real_y,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y,		real_z-size, 1, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y+size,		real_z, 1, 0, 1, 0, 1, cube_col, 1);
	
	//west tri 2
	vertex_add_point(vbuff,real_x+size, real_y,			real_z-size, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y+size,		real_z-size, 1, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y+size,		real_z, 1, 0, 1, 0, 1, cube_col, 1);
	
	
	//North tri 1
	vertex_add_point(vbuff,real_x, real_y+size,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y+size,		real_z-size, 1, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y+size,		real_z, 1, 0, 1, 0, 1, cube_col, 1);
	
	//North tri 2
	vertex_add_point(vbuff,real_x+size, real_y+size,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y+size,		real_z-size, 1, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y+size,		real_z-size, 1, 0, 1, 0, 1, cube_col, 1);
	
	
	//south tri 1
	vertex_add_point(vbuff,real_x, real_y,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y,		real_z-size, 1, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y,		real_z, 1, 0, 1, 0, 1, cube_col, 1);
	
	//south tri 2
	vertex_add_point(vbuff,real_x+size, real_y,			real_z, 0, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x+size, real_y,		real_z-size, 1, 0, 1, 0, 1, cube_col, 1);
	vertex_add_point(vbuff,real_x, real_y,		real_z-size, 1, 0, 1, 0, 1, cube_col, 1);
		
		
		
		
	//line buffer
	//flat bottom tri 1
	vertex_add_point(linebuff,real_x, real_y,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y+size,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y+size,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	
	//flat bottom tri 2
	vertex_add_point(linebuff,real_x+size, real_y+size,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	
	
	//flat top tri 1
	vertex_add_point(linebuff,real_x, real_y,			real_z-size, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y+size,			real_z-size, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y+size,			real_z-size, 0, 0, 1, 0, 1, c_white, 1);
	
	//flat top tri 2
	vertex_add_point(linebuff,real_x+size, real_y+size,			real_z-size, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y,			real_z-size, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y,			real_z-size, 0, 0, 1, 0, 1, c_white, 1);
	
	
	//east tri 1
	vertex_add_point(linebuff,real_x, real_y,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y,		real_z-size, 1, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y+size,		real_z, 1, 0, 1, 0, 1, c_white, 1);
	
	//east tri 2
	vertex_add_point(linebuff,real_x, real_y,			real_z-size, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y+size,		real_z-size, 1, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y+size,		real_z, 1, 0, 1, 0, 1, c_white, 1);
	
	
	//west tri 1
	vertex_add_point(linebuff,real_x+size, real_y,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y,		real_z-size, 1, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y+size,		real_z, 1, 0, 1, 0, 1, c_white, 1);
	
	//west tri 2
	vertex_add_point(linebuff,real_x+size, real_y,			real_z-size, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y+size,		real_z-size, 1, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y+size,		real_z, 1, 0, 1, 0, 1, c_white, 1);
	
	
	//North tri 1
	vertex_add_point(linebuff,real_x, real_y+size,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y+size,		real_z-size, 1, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y+size,		real_z, 1, 0, 1, 0, 1, c_white, 1);
	
	//North tri 2
	vertex_add_point(linebuff,real_x+size, real_y+size,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y+size,		real_z-size, 1, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y+size,		real_z-size, 1, 0, 1, 0, 1, c_white, 1);
	
	
	//south tri 1
	vertex_add_point(linebuff,real_x, real_y,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y,		real_z-size, 1, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y,		real_z, 1, 0, 1, 0, 1, c_white, 1);
	
	//south tri 2
	vertex_add_point(linebuff,real_x+size, real_y,			real_z, 0, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x+size, real_y,		real_z-size, 1, 0, 1, 0, 1, c_white, 1);
	vertex_add_point(linebuff,real_x, real_y,		real_z-size, 1, 0, 1, 0, 1, c_white, 1);
	}
	
	
}