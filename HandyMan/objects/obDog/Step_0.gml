/// @description Insert description here
// You can write your code in this editor
//if(x<0)
//{
//	global.fixed=true;
//	instance_destroy()
//	freeze_object(self)
//}
//if (global.start==true)
//{
//	phy_active=true
//}

if (global.start == false) {
	show_debug_message(phy_mass)
	// physics_set_density(self, 0.1)
	// physics_set_density(self, 0)
	freeze_object(self)
}


