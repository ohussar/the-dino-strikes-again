randomize();

hsp = 0; 
vsp = 0;

state = "idle";

inventory = [];
slotIn = -1;
pastSlotIn = -1;
holding = 0;
selected = 0;
gunShoot = 0;

itemTypes = [obj_gun, obj_chest];

function getGunShoot(){
	return gunShoot;
}
