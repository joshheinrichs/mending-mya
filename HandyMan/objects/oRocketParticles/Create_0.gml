/// @description Insert description here
// You can write your code in this editor
DGpartSystem1 = part_system_create_layer("Particles", false);

particle1 = part_type_create();
part_type_shape(particle1,pt_shape_pixel);
part_type_size(particle1,0.10,0.38,-0.19,1);
part_type_scale(particle1,1.66,2.86);
part_type_color3(particle1,7147325,732674,10545510);
part_type_alpha3(particle1,0.81,0.31,0.09);
part_type_speed(particle1,1.36,2.68,-0.26,4);
part_type_direction(particle1,124,248,-1,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,28,219,0.40,4,0);
part_type_blend(particle1,1);
part_type_life(particle1,32,49);