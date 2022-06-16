// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damageListener(){
	
	var blt = instance_place(x, y+z, obj_bullet)
	if(blt != noone && instance_exists(blt)){
		var can = true;
		if(blt.pierce == true){
			var i;
			for(var i = 0; i < array_length(blt.pierceList); i++){
				if(blt.pierceList[i] == id){
					can = false;
					return;
				}
			}
			if(can)
				blt.pierceList[array_length(blt.pierceList)] = id;
		}
		if(can){
			var dir = point_direction(x, y+z, obj_dino.x, obj_dino.y);
			hp -= blt.damage;
			hit = 5;

			xscale = clamp(abs(1.2 * -dsin(dir)), 0.7, 1.2);
			yscale = clamp(abs(1.2 *  dcos(dir)), 0.7, 1.2);
			if(blt.pierce) blt.pierceAct();
			if(!blt.pierce) instance_destroy(blt);
		}
	}
}