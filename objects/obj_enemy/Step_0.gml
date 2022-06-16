damageListener();

if(hp <= 0){
	instance_destroy();
}

xscale = lerp(xscale, 1, .1);
yscale = lerp(yscale, 1, .1);