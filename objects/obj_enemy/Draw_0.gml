if(hit > 0){
	shader_set(shd_blink);
	drawFunc();
	shader_reset();
	hit--;
}else drawFunc();