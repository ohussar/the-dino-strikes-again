if(instance_exists(to_follow))
{
	
	var xx = camera_get_view_x(cam);
	var yy = camera_get_view_y(cam);
	
	var to_x = to_follow.x - size_w/2;
	var to_y = to_follow.y - size_h/2;
	
	var f = 0.25;
	
	xx = lerp(xx, to_x, f);
	yy = lerp(yy, to_y, f);
	
	camera_set_view_pos(cam, xx, yy);
	
}