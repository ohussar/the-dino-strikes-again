jumpTimer--;

if(jumpTimer <= 0){
	jumpTimer = 90;
	zsp = -5;
}

zsp+=0.25;
z+=zsp;
if(z>0){ 
	z = 0;
	zsp = 0;	
}
var can = 0;
if(z > 0 || zsp != 0){
	can = 1;
}

var target = obj_dino;

if(instance_exists(target)){
	var targetDir = point_direction(x, y, target.x, target.y);
	var spd = 1.2;
	
	var targetHsp = lengthdir_x(spd, targetDir) * can;
	var targetVsp = lengthdir_y(spd, targetDir) * can;
	
	hsp = lerp(hsp, targetHsp, .6);
	vsp = lerp(vsp, targetVsp, .6);
	
	if(hsp != 0){
		image_xscale = sign(hsp);	
	}	
}

collision();