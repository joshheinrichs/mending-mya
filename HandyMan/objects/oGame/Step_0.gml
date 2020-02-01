/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(ord("1"))) {
	room_goto(rJosh)	
}
if (keyboard_check_pressed(ord("2"))) {
	room_goto(rAlex)
}


if (mouse_check_button_pressed(mb_left) and position_meeting(mouse_x,mouse_y,oGrabbable))
{
	show_debug_message("grab")
	grabbed = instance_position(mouse_x,mouse_y,oGrabbable)
	//grabbed.phy_kinematic = true;
}
if(mouse_check_button_released(mb_left) and grabbed != noone)
{
	show_debug_message("release")
	//grabbed.phy_kinematic = false;
	grabbed = noone
}

if (grabbed != noone)
{
	with(grabbed)
	{
		phy_linear_velocity_x = 0
		phy_linear_velocity_y = 0
		phy_angular_velocity = 0
		phy_position_x = mouse_x
		phy_position_y = mouse_y
	}
	
	if (keyboard_check_direct(ord("E"))) {
		grabbed.phy_angular_velocity = 100
	}
	if (keyboard_check_direct(ord("Q"))) {
		grabbed.phy_angular_velocity = -100
	}
	
	if (keyboard_check_pressed(ord("W"))) {
		show_debug_message("weld")
		if (ds_map_exists(joint_map, grabbed)) {
			joint = ds_map_find_value(joint_map, grabbed)
			ds_map_delete(joint_map, grabbed)
			physics_joint_delete(joint)
		} else {
			joint = physics_joint_weld_create(grabbed, oBox, mouse_x, mouse_y, 0, 10000, 0, false)
			ds_map_add(joint_map, grabbed, joint)
		}
	}
}

