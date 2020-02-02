/// @description Insert description here
// You can write your code in this editor
draw_self()
if(position_meeting(mouse_x,mouse_y,oComputer) and mouse_check_button_pressed(mb_left) and global.start==false and comp==false)
{
	comp=true	
}
else if(comp==true)
{
	depth=-999
	draw_rectangle_color(10,10,470,260,c_dkgray,c_black,c_black,c_black,false)
	draw_rectangle_color(10,10,470,260,c_ltgray,c_ltgray,c_ltgray,c_ltgray,true)
	//text
	draw_set_font(LCons)
	draw_set_color(c_lime)
	draw_text(20,20,"-the objective of the game is to fix Mya and help her out of the garage door")
	draw_text(20,30," as fast as possible")
	draw_text(20,40,"-pick up objects with left mouse button")
	draw_text(20,50,"-press W while holding objects over other object to weld them together")
	draw_text(20,60,"-press W on welded objects to unweld")
	draw_text(20,70,"-press Q or E to rotate held objects")
	draw_text(20,80,"-press F for fullscreen")
	draw_text(20,90,"-press play to release Mya and activate the motor and rocket")
	draw_text(20,200,"high scores:")
	draw_text(20,210,"1. " + string(high1))
	draw_text(20,220,"2. " + string(high2))
	draw_text(20,230,"3. " + string(high3))
	
	
	
	
	if(mouse_check_button_pressed(mb_left))
	{
		comp=false
		depth=100
	}
}
