event_inherited();

hsp = 0;
vsp = 0;
zsp = 0;

z = 0;

jumpTimer = 0;

drawFunc = function (){
	draw_sprite_ext(spr_slime, 0, x, y+z, xscale*sign(image_xscale), yscale*sign(image_yscale), image_angle, image_blend, image_alpha);
}