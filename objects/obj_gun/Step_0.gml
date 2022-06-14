if(state == "item") exit;
if(!instance_exists(obj_dino)) exit;

x = obj_dino.x;
y = obj_dino.y+2;

if(point_distance(x, y, mouse_x, mouse_y) > 4){
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	if(sign(x-mouse_x) != 0)
		image_yscale = -sign(x-mouse_x);
}


