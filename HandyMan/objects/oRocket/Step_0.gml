/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_direct(ord(" "))) {
	physics_apply_local_force(0,0,-5,0)
	DG_particle1(lengthdir_x(x+10,image_angle),y)
}
//show_debug_message("rocket " + string(image_angle))