/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_enter))
{
	if(global.start==false)
	{
		global.start=true	
	}	
}
if(global.start==true and global.timing=false)
{
	global.timing=true
	timer=0;
}
if (global.timing==true)
{
	timer+=1;	
}
