var key_left   =  keyboard_check(ord("A"));
var key_right  =  keyboard_check(ord("D"));
var key_up     =  keyboard_check(ord("W"));
var key_down   =  keyboard_check(ord("S"));

var h = key_right - key_left;
var v = -key_up + key_down;
var dir = point_direction(0, 0, h, v);
var mag =  h != 0 || v != 0;

var input_h = lengthdir_x(mag * 2, dir);
var input_v = lengthdir_y(mag * 2, dir);

hsp = lerp(hsp, input_h, .2);
vsp = lerp(vsp, input_v, .2);

x += hsp;
y += vsp;

switch(state){
	case "idle":
		sprite_index = spr_dino_idle;
	break;
	case "run":
		sprite_index = spr_dino_run;
	break;
}


if(mag){
	state = "run";	
	image_xscale = sign(hsp);
}else state = "idle";