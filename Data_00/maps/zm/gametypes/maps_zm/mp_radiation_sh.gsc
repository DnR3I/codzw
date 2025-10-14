#include maps\zm\gametypes\mapedit;

CreateMap_mp_radiation_sh()
{
	map = getDvar("mapname");
	CreateCloudBank();
	if(map == "mp_radiation_sh")
	{
		level.spawns_humans[0] = (848, 2112, 83);
		CreatePerk("QuickRevive",(1120, 2353, 70),(0, -40, 0));
		CreatePerk("StaminUp",(-280, 369, 125),(0, 90, 0));
		CreatePerk("DoubleTap",(971, -80, 254),(0, 180, 0));
		CreatePerk("SpeedCola",(76, -575, 125),(0, 90, 0));
		CreatePerk("Juggernog",(-34, -806, -50),(0, 180, 0));
		CreateGum((-768, 1392, 262),(0, 90, 0));
		CreateGum((643, -1444, 262),(0, 180, 0));
		thread CreateBox((744, 63, 131),(0, 90, 0));
		CreatePap((-264, -2438, -18),(0, 180, 0));
	}
}