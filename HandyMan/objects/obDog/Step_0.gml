/// @description Insert description here
// You can write your code in this editor
if(x<0 and global.start==true)
{
	ds_list_add(global.scores,oGameAlex.timer/room_speed)
	global.fixed=true
	global.start=false
	global.timing=false
	ds_list_sort(global.scores,true)
	ds_list_delete(global.scores,4)
	oComputer.high1=ds_list_find_value(global.scores,1)
	oComputer.high2=ds_list_find_value(global.scores,2)
	oComputer.high3=ds_list_find_value(global.scores,3)
	room_goto(rAlex)
}