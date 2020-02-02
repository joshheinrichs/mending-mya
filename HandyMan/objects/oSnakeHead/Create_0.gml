/// @description Insert description here
// You can write your code in this editor
event_inherited()
phy_active=true
ropeLen=2
for(i=0; i<5; i+=1)
{
	body[i]=instance_create_depth(x-((i+1)*28),y,0,oSnakeBody)
	if(i==0)
	{
		physics_joint_rope_create(self,body[0],x-12,y,body[0].x+12,body[0].y,ropeLen,true)	
	}
	else
	{
		physics_joint_rope_create(body[i-1],body[i],body[i-1].x-12,body[i-1].y,body[i].x+12,body[i].y,ropeLen,true)	
	}
}
tail=instance_create_depth(x-(i-1)*28,y,0,oSnakeAss)
physics_joint_rope_create(body[i-1],tail,body[i-1].x-12,body[i-1].y,tail.x+12,tail.y,ropeLen,true)