/// @description Insert description here
// You can write your code in this editor
comp=false
high1=999
high2=999
high3=999
global.scores = ds_list_create()
ds_list_add(global.scores,oComputer.high1)
ds_list_add(global.scores,oComputer.high2)
ds_list_add(global.scores,oComputer.high3)
ds_list_sort(global.scores,true)