type = "chest";
state = "item";
outline = false;
open = function(){
	createParticle(x, y, 50);
	instance_destroy();
}
outline_init();