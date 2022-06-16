// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawGunUI(){
	var defSizex = 30;
	var defSizey = 30;
	
	defSizex *= upscale_f;
	defSizey *= upscale_f;

	var xMin = 5;
	var yMin = display_get_gui_height() - 5;

	//draw_set_color(c_black);
	//draw_set_alpha(0.7);
	//draw_rectangle(xMin, yMin, xMin + defSizex, yMin-defSizey, false);
	//draw_set_alpha(1);
	draw_sprite_ext(spr_ammodisplay, 0, xMin, yMin, upscale_f, upscale_f, 0, c_white, 1);
	draw_set_font(fnt_gui);

	var x1 = xMin + defSizex / 2 + 1;
	var y1 = yMin - defSizey / 2 - 8;
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_white);

	var font_size = (upscale_f + 2) * 12 / 2;


	draw_text_transformed(x1, y1, obj_dino.holding.magazine, upscale_f + 2, upscale_f + 2, 0);
	draw_text_transformed(x1, y1+font_size, obj_dino.holding.ammo, upscale_f, upscale_f, 0);



	draw_set_halign(-1);
	draw_set_valign(-1);
	
	if(obj_dino.holding.reloadTimer != -1){
		var barSizex = 40*upscale_f;
		var barSizey = 5*upscale_f;
		var cx = camera_get_view_x(view_camera[0])
        var cy = camera_get_view_y(view_camera[0])
		var barX = (obj_dino.x-cx)*upscale_f - barSizex/2;
		var barY = (obj_dino.bbox_top-cy)*upscale_f - 5*upscale_f - barSizey / 2;
		draw_rectangle(barX, barY, barX + barSizex * (1 - (obj_dino.holding.reloadTimer / obj_dino.holding.reloadTime)), barY - barSizey, false);
	}
}