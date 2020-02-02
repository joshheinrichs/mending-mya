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
	grabbed_offset_x = grabbed.x - mouse_x
	grabbed_offset_y = grabbed.y - mouse_y
}
if(mouse_check_button_released(mb_left) and grabbed != noone)
{
	show_debug_message("release")
	grabbed = noone
}

if (grabbed != noone)
{
	show_debug_message("grabbed " + string(grabbed))
	freeze_object(grabbed)
	show_debug_message("froze " + string(grabbed))
//	if (ds_map_exists(object_welds, grabbed)) {
//		welds = ds_map_find_value(object_welds, grabbed)
//		for(i = 0; i < ds_list_size(welds); i++) {
//			o = ds_list_find_value(welds, i)
//			show_debug_message("subfroze " + string(o))
//			freeze_object(o)
//		}
//	}

	grabbed.phy_position_x = mouse_x + grabbed_offset_x
	grabbed.phy_position_y = mouse_y + grabbed_offset_y
	
	if (keyboard_check_direct(ord("E"))) {
		grabbed.phy_rotation += 10
	}
	if (keyboard_check_direct(ord("Q"))) {
		grabbed.phy_rotation -= 10
	}
	
	if (keyboard_check_pressed(ord("W"))) {
		show_debug_message("weld")
	
		var o1 = grabbed
		var o2
		with(o1) {
			o2 = instance_place(x, y, oWeldable);
			show_debug_message("welding " + string(o2))
		}

		if (!ds_map_exists(joint_map, o1)) {
			// weld
			if (o2 != noone) {
				joint = physics_joint_weld_create(o1, o2, mouse_x, mouse_y, 0, 0, 10000, false)
				ds_map_add(joint_map, o1, joint)
				if (!ds_map_exists(object_welds, o1)) {
					ds_map_set(object_welds, o1, ds_list_create())
				}
				if (!ds_map_exists(object_welds, o2)) {
					ds_map_set(object_welds, o2, ds_list_create())
				}
				ds_list_add(ds_map_find_value(object_welds, o1), o2)
				ds_list_add(ds_map_find_value(object_welds, o2), o1)
			} 
		} else {
			// unweld
			if (ds_map_exists(joint_map, o1)) {
				joint = ds_map_find_value(joint_map, o1)
				ds_map_delete(joint_map, o1)
				physics_joint_delete(joint)
			}
		}
	}
}

