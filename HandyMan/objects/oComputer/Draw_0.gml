/// @description Insert description here
// You can write your code in this editor
if(position_meeting(mouse_x,mouse_y,oComputer) and mouse_check_button_pressed(mb_left) and global.start==false and comp==false)
{
	comp=true	
}

if(comp==true)
{
	draw_rectangle_color(10,10,470,260,c_dkgray,c_black,c_black,c_black,false)
	draw_rectangle_color(10,10,470,260,c_ltgray,c_ltgray,c_ltgray,c_ltgray,true)
	if(mouse_check_button_pressed(mb_left))
	{
		comp=false	
	}
}
