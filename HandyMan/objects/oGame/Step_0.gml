/// @description Insert description here
// You can write your code in this editor


if (mouse_check_button_pressed(mb_left) and position_meeting(mouse_x,mouse_y,oGrabbable))
{
	show_debug_message("grab")
	grabbed = instance_position(mouse_x,mouse_y,oGrabbable)	
}
if(mouse_check_button_released(mb_left) and grabbed != noone)
{
	show_debug_message("release")
	grabbed.phy_fixed_rotation = false
	grabbed = noone
	
}

if (grabbed != noone)
{
	//show_debug_message("grabbed " + string(grabbed))
	freeze_object(grabbed)
	grabbed.phy_fixed_rotation = true
	//show_debug_message("froze " + string(grabbed))
//	if (ds_map_exists(object_welds, grabbed)) {
//		welds = ds_map_find_value(object_welds, grabbed)
//		for(i = 0; i < ds_list_size(welds); i++) {
//			o = ds_list_find_value(welds, i)
//			show_debug_message("subfroze " + string(o))
//			freeze_object(o)
//		}
//	}

	grabbed.phy_position_x = mouse_x // - grabbed_offset_x
	grabbed.phy_position_y = mouse_y // - grabbed_offset_y
	
	if (keyboard_check_direct(ord("E"))) {
		grabbed.phy_rotation += 10
	}
	if (keyboard_check_direct(ord("Q"))) {
		grabbed.phy_rotation -= 10
	}
	
	if (keyboard_check_pressed(ord("W"))) {
		// show_debug_message("weld")
	
		var o2s = ds_list_create()
	
		var o1 = grabbed
		for (var i = 0; i < instance_number(oWeldable); i += 1) {
			var o = instance_find(oWeldable, i)
			if (o == o1) {
				continue
			}
			if (ds_map_exists(object_welds, o1)) {
				if (ds_list_find_index(ds_map_find_value(object_welds, o1), o) != -1) {
					continue
				}
			}
			with(o1) {
				if (place_meeting(x, y, o)) {
					if (o.object_index == oSmallMotor) {
						ds_list_clear(o2s)
					}
					ds_list_add(o2s, o)
					if (o.object_index == oSmallMotor) {
						break
					}
				}
			}
		}

		if (ds_list_size(o2s) > 0) {
			for (var i = 0; i < ds_list_size(o2s); i += 1) {
				var o2 = ds_list_find_value(o2s, i)
				// weld
				show_debug_message("weld")
				var joint
				if (o2.object_index == oSmallMotor) {
					joint = physics_joint_revolute_create(o1, o2, o2.x, o2.y, 0, 0, false, 1000, 10, true, false)
				} else {
					joint = physics_joint_revolute_create(o1, o2, mouse_x, mouse_y, 0, 0, true, 10, 10, false, false)
					// joint = physics_joint_weld_create(o1, o2, mouse_x, mouse_y, point_direction(o1.x, o1.y, mouse_x, mouse_y), 0, 0, false)
				}
				
				if (!ds_map_exists(object_welds, o1)) {
					ds_map_set(object_welds, o1, ds_list_create())
				}
				if (!ds_map_exists(object_welds, o2)) {
					ds_map_set(object_welds, o2, ds_list_create())
				}
				ds_list_add(ds_map_find_value(object_welds, o1), o2)
				ds_list_add(ds_map_find_value(object_welds, o2), o1)
				
				if (!ds_map_exists(object_joints, o1)) {
					ds_map_set(object_joints, o1, ds_map_create())
				}
				if (!ds_map_exists(object_joints, o2)) {
					ds_map_set(object_joints, o2, ds_map_create())
				}
				ds_map_add(ds_map_find_value(object_joints, o1), o2, joint)
				ds_map_add(ds_map_find_value(object_joints, o2), o1, joint)
			}
		} else {
			// unweld
			show_debug_message("unweld")
			if (ds_map_exists(object_welds, o1)) {
				var welds = ds_map_find_value(object_welds, o1)
				for (var i = 0; i < ds_list_size(welds); i += 1) {
					var weld = ds_list_find_value(welds, i)
					
					var joint = ds_map_find_value(ds_map_find_value(object_joints, o1), weld)
					
					ds_map_delete(ds_map_find_value(object_joints, o1), weld)
					ds_map_delete(ds_map_find_value(object_joints, weld), o1)
					
					var weld_welds = ds_map_find_value(object_welds, weld)
					ds_list_delete(weld_welds, ds_list_find_index(weld_welds, o1))
					
					physics_joint_delete(joint)
				}
				ds_list_clear(welds)
			}
		}
	}
}

