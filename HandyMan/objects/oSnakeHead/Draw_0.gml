/// @description Insert description here
// You can write your code in this editor
for(var i=0; i<5; i+=1) {
	show_debug_message("snake")
	if(i==0) {
		draw_line_width_color(x,y,body[i].x,body[i].y,8,c_green,c_green)
	}
	else {
		draw_line_width_color(body[i-1].x,body[i-1].y,body[i].x,body[i].y,8,c_green,c_green)
	}
}
draw_line_width_color(body[i-1].x,body[i-1].y,tail.x,tail.y,8,c_green,c_green)

draw_self()