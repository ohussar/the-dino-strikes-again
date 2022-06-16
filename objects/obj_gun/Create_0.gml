outline_init();

state = "item";
outline = false;
type = "gun";

ammo = 120;
magSize = 30;
magazine = magSize;

shootsPerSecond = room_speed / 4;
shootTimer = 0;
spread = 0.7;
bulletsPerShot = 1;
bulletSpeed = 6;
bulletSpacing = 5;
barrelSizex = 20;
barrelSizey = -1;

reloadTime = room_speed * 2;
reloadTimer = -1;

recoil = 0;
targetRecoil = 10;
recoilRecoverMult = 0.7;
recoilDir = 0;

damage = 2;