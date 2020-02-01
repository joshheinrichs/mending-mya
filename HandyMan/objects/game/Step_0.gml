/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(ord("1"))) {
	show_debug_message("grabber")
	current_tool = tool.grabber
}
if (keyboard_check_pressed(ord("2"))) {
	show_debug_message("welder")
	current_tool = tool.welder
}

if (current_tool == tool.grabber)
{
	if (mouse_check_button_pressed(mb_left) and position_meeting(mouse_x,mouse_y,ball))
	{
		holding = true
		grabbed = instance_position(mouse_x,mouse_y,ball)
		with(grabbed)
		{
			phy_active = false;
		}
	}
	if(mouse_check_button_released(mb_left))
	{
		holding = false
		with(grabbed)
		{
			phy_active = true;	
		}
	}
	if (holding==true)
	{
		with(grabbed)
		{
			phy_position_x = mouse_x
			phy_position_y = mouse_y
		}
	}
}
if (current_tool == tool.welder)
{
	
}
