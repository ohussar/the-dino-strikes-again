// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function itemSelector(range){
	var itemQ = array_length(itemTypes);
	var smallest_dist = infinity;
	var object = 0;
	for(var i = 0; i < itemQ; i++){
		if(instance_exists(itemQ)){
			var list = ds_list_create();
			collision_circle_list(x, y, range, itemTypes[i], true, true, list, true);
			var len = ds_list_size(list);
			for(var j = 0; j < len; j++){
				if(!instance_exists(list[|j])) continue;
				var dist = point_distance(x, y, list[|j].x, list[|j].y);
				if(dist < smallest_dist && list[|j].state == "item"){
					smallest_dist = dist;
					object = list[|j].id;
				}
			}
			ds_list_destroy(list);
		}
	}
	if(smallest_dist <= range){
		if(instance_exists(selected))
			selected.id.outline = false;
		object.outline = true;
		selected = object.id;
	}
	if(object == 0){
		if(instance_exists(selected))
			selected.id.outline = false;
		selected = 0;
	}
}	