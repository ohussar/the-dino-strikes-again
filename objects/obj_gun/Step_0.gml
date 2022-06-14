if(state == "item") exit;
if(!instance_exists(obj_dino)) exit;

x = obj_dino.x;
y = obj_dino.y+2;

if(point_distance(x, y, mouse_x, mouse_y) > 4){
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	if(sign(x-mouse_x) != 0)
		image_yscale = -sign(x-mouse_x);
}

shootTimer--;

if(shootTimer <= 0 && obj_dino.getGunShoot() && magazine > 0){
	magazine--;
	shootTimer = shootsPerSecond;
	var target_dir = point_direction(x, y, mouse_x, mouse_y);
	var k = 0;
	repeat(bulletsPerShot){
		
		var dir = target_dir + random_range(-spread, spread) - bulletSpacing * k;
		var d = dir;
		
		var lenOffX = dcos(d) * barrelSizex + dsin(d) * barrelSizey;
		var lenOffY = -dsin(d) * barrelSizex + dcos(d) * barrelSizey;
		
		
		var blt = instance_create_layer(x + lenOffX, y + lenOffY, "Instances", obj_bullet);
		
		blt.speed = bulletSpeed;
		blt.direction = dir;
		k++;
	}
	
}

var key_reload = keyboard_check_pressed(ord("R"));

if(key_reload) {
	reloadTimer = reloadTime;
}
if(reloadTimer>0){
	reloadTimer--;
}
if(reloadTimer == 0){
	reloadTimer = -1;
	var toFill = magSize - magazine;
	if(ammo - toFill >= 0){
		ammo -= toFill;
		magazine+=toFill;
	}
}