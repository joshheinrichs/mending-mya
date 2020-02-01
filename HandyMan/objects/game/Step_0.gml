/// @description Insert description here
// You can write your code in this editor

if (position_meeting(mouse_x,mouse_y,ball) and mouse_check_button_pressed(mb_left))
{
	holding=true
	grabbed = instance_position(mouse_x,mouse_y,ball)
	with(grabbed)
	{
		phy_active=false;
	}
}
if (holding==true)
{
	with(grabbed)
	{
		phy_position_x=mouse_x
		phy_position_y=mouse_y
	}
	if(mouse_check_button_released(mb_left))
	{
		holding=false
		with(grabbed)
		{
			phy_active=true;	
		}
	}
}