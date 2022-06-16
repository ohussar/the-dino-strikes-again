// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createParticle(x, y, q){
	repeat(q){
		var part = instance_create_layer(x, y, "Instances", obj_particle);
		part.speed = irandom_range(1, 2);
		part.direction = random_range(0, 359);
		part.image_speed = random_range(0.7, 1.5);
	}
}