// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function buildStructType(type, object){
	switch(type){
		case "gun":
			return {ammo: object.ammo, magazine: object.magazine};
		break;
	}
}