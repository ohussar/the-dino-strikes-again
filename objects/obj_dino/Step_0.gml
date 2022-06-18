var key_left     =  keyboard_check(		 ord("A"));
var key_right    =  keyboard_check(		 ord("D"));
var key_up       =  keyboard_check(		 ord("W"));
var key_down     =  keyboard_check(		 ord("S"));
var key_collect  =  keyboard_check_pressed(ord("E"));
var key_shoot    =  mouse_check_button(mb_left);

gunShoot = key_shoot;


var h = key_right - key_left;
var v = -key_up + key_down;
var dir = point_direction(0, 0, h, v);
var mag =  h != 0 || v != 0;

var input_h = lengthdir_x(mag * 2, dir);
var input_v = lengthdir_y(mag * 2, dir);

hsp = lerp(hsp, input_h, .2);
vsp = lerp(vsp, input_v, .2);
collision();
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
}else state = "idle";

if(sign(x-mouse_x) != 0)
	image_xscale = -sign(x-mouse_x);
	
depth = -y;
holding.depth = depth - 5;
itemSelector(30);
// picking up items
if(instance_exists(selected)){
	if(key_collect && selected != 0){
		
		if(selected.type == "chest") {
			selected.open();
			return;
		}
		selected.outline = false;
		selected.state = "";
		
		var len = array_length(inventory);
		var t = buildStructType(selected.type, selected.id);
		inventory[len] = {obj: selected.object_index, type: selected.type, unique_component: t};
		slotIn = len;

		instance_destroy(selected);
	}
}
// slot changing handler
if(slotIn != pastSlotIn){
	
	if(holding != 0 && pastSlotIn >= 0){
		inventory[pastSlotIn].unique_component = buildStructType(inventory[pastSlotIn].type, holding);
		show_debug_message(inventory[pastSlotIn].unique_component);
		instance_destroy(holding);
	}
	pastSlotIn = slotIn;
	var inv = inventory[slotIn];
	var obj = instance_create_layer(x, y, "Instances", inv.obj);
	obj.state = "";
	
	switch(inv.type){
		case "gun":
			obj.ammo = inv.unique_component.ammo;
			obj.magazine = inv.unique_component.magazine;
		break;
	}
	holding = obj.id;
}


// change inventory slots
var max_ = 9;
var min_ = 1;

for(var i = min_; i <= max_; i++){
	if(keyboard_check_pressed(ord(string(i)))){
		slotIn = i - 1;
		if(slotIn > array_length(inventory)-1) slotIn = pastSlotIn;
	}
}