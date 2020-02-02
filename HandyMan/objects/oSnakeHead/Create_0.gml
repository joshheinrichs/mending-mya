/// @description Insert description here
// You can write your code in this editor
for(i=0; i<5; i+=1)
{
	body[i]=instance_create_depth(x-i*28-28,y,0,oSnakeBody)
	if(i==0)
	{
		physics_joint_rope_create(self,body[0],x-12,y,body[0].x+12,body[0].y,10,true)	
	}
	else
	{
		physics_joint_rope_create(body[i],body[i-1],body[i].x-12,body[i].y,body[i-1].x+12,body[i-1].y,10,true)	
	}
}
	tail=instance_create_depth(x-i*28-28,y,0,oSnakeAss)
	physics_joint_rope_create(tail,body[i-1],tail.x-12,tail.y,body[i-1].x+12,body[i-1].y,10,true)