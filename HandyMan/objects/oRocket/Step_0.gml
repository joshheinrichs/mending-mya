/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_direct(ord(" "))) {
	physics_apply_local_force(x,y,0.1,0)
}
show_debug_message("rocket " + string(image_angle))