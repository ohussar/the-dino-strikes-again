if(state == "item") exit;
if(!instance_exists(obj_dino)) exit;

x = obj_dino.x   - lengthdir_x(recoil, recoilDir);
y = obj_dino.y+2 - lengthdir_y(recoil, recoilDir);

if(point_distance(x, y, mouse_x, mouse_y) > 4){
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	if(sign(x-mouse_x) != 0)
		image_yscale = -sign(x-mouse_x);
}

shootTimer--;
recoil-=recoilRecoverMult;
if(recoil<0) recoil = 0;
if(recoil > 5){
	obj_dino.hsp -= lengthdir_x(1, recoilDir);
	obj_dino.vsp -= lengthdir_y(1, recoilDir);
}
if(shootTimer <= 0 && obj_dino.getGunShoot() && magazine > 0 && reloadTimer == -1){
	magazine--;
	shootTimer = shootsPerSecond;
	recoil = targetRecoil;
	var target_dir = point_direction(x, y, mouse_x, mouse_y);
	recoilDir = target_dir;
	var k = 0;
	repeat(bulletsPerShot){
		
		var dir = target_dir + random_range(-spread, spread) - bulletSpacing * k;
		var d = dir;
		
		var lenOffX = dcos(d) * barrelSizex + dsin(d) * barrelSizey;
		var lenOffY = -dsin(d) * barrelSizex + dcos(d) * barrelSizey;
		
		
		var blt = instance_create_layer(x + lenOffX, y + lenOffY, "Instances", obj_bullet);
		
		blt.speed = bulletSpeed;
		blt.direction = dir;
		blt.image_angle = dir;
		blt.damage = damage;
		if(collision_line(obj_dino.x, obj_dino.y, blt.x, blt.y, obj_wall, true, true)){
			instance_destroy(blt);
		}
		break;
		k++;
	}
	
}

var key_reload = keyboard_check_pressed(ord("R"));

if(key_reload && ammo > 0 && magazine < magSize) {
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