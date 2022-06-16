// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collision(){
	var steps = 0;
	var _x = hsp > 0 ? ceil(x+hsp) : floor(x+hsp); 
	if(place_meeting(_x, y, obj_wall)){
		while(!place_meeting(x+sign(hsp)*0.1, y, obj_wall) && steps < 20){
			x+=sign(hsp)*0.1;
			steps++;
		}
		hsp = 0;
	}
	x+=hsp;
	steps = 0;
	var _y = vsp > 0 ? ceil(y+vsp) : floor(y+vsp); 
	if(place_meeting(x, _y, obj_wall)){
		while(!place_meeting(x, y+sign(vsp)*0.1, obj_wall) && steps < 20){
			y+=sign(vsp)*0.1;
			steps++;
		}
		vsp = 0;
	}
	y+=vsp;
	
}