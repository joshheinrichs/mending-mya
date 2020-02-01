/// @description Insert description here
// You can write your code in this editor

if (mouse_check_button_pressed(mb_left) and position_meeting(mouse_x,mouse_y,oGrabbable))
{
	show_debug_message("grab")
	grabbed = instance_position(mouse_x,mouse_y,oGrabbable)
	grabbed.phy_active = false;
}
if(mouse_check_button_released(mb_left) and grabbed != noone)
{
	show_debug_message("release")
	grabbed.phy_active = true;
	grabbed = noone
}

if (grabbed != noone)
{
	with(grabbed)
	{
		phy_position_x = mouse_x
		phy_position_y = mouse_y
	}
}

if (keyboard_check_pressed(ord("W"))) {
	show_debug_message("weld")
}
