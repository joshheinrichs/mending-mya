/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("F")))
{
	if(window_get_fullscreen()=false)
	{
		window_set_fullscreen(true)
	}
	else
	{
		window_set_fullscreen(false)	
	}
}