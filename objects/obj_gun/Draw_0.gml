if(state == "item"){
	if(outline == true){
		outline_start(1, c_white);
		draw_self();
		outline_end();
	}else draw_self();
}else{
	draw_self();
}