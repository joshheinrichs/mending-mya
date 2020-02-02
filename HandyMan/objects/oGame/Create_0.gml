/// @description Insert description here
// You can write your code in this editor
global.start = false
global.fixed = false

grabbed = noone
object_joints = ds_map_create()
object_welds = ds_map_create()

motor_joints = ds_list_create()

physics_world_update_speed(room_speed * 6);
physics_world_update_iterations(100);
