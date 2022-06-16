event_inherited();

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
	var temph = 0;
	var tempv = 0;
	// repulsion between enemies
	with(obj_enemy){
		if(id != other.id){
			var dir = point_direction(other.x, other.y, x, y);
			var f = 1 / (point_distance(other.x, other.y, x, y)^4);
			temph += -dcos(dir)*f;
			tempv += +dsin(dir)*f;
			
			temph = clamp(temph, -1.5, 1.5);
			tempv = clamp(tempv, -1.5, 1.5);
			
		}
	}
	
	hsp = lerp(hsp, (targetHsp+temph)*can, .6);
	vsp = lerp(vsp, (targetVsp+tempv)*can, .6);

	if(sign(x-target.x) != 0){
		image_xscale = -sign(x-target.x);	
	}
}

collision();