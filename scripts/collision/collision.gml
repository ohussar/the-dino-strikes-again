// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collision(){
	
	var steps = 0;
	var _x = hsp > 0 ? ceil(x+hsp) : floor(x+hsp); 
	var fh = sign(hsp)*0.1;
	
	if(place_meeting(_x, y, obj_wall)){
		while(!place_meeting(x+fh, y, obj_wall) && steps < 20){
			x+=fh;
			steps++;
		}
		hsp = 0;
	}
	x+=hsp;
	
	
	steps = 0;
	var _y = vsp > 0 ? ceil(y+vsp) : floor(y+vsp); 
	var fv = sign(vsp)*0.1;
	
	if(place_meeting(x, _y, obj_wall)){
		while(!place_meeting(x, y+fv, obj_wall) && steps < 20){
			y+=fv;
			steps++;
		}
		vsp = 0;
	}
	y+=vsp;
	
}