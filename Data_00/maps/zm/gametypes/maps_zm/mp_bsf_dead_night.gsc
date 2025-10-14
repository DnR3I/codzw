#include maps\zm\gametypes\mapedit;

CreateMap_mp_bsf_dead_night()
{
	map = getDvar("mapname");
	CreateCloudBank();
	if(map == "mp_bsf_dead_night")
	{
		thread CreateBox((-602.721, -824.936, 104.125),(0, 446.869, 0));
		CreatePerk("QuickRevive",(604.597, -914.785, 104.072),(0, 90.4614, 0));
		CreatePerk("Juggernog",(-975.816, 77.3477, 105.29),(0, 89.6924, 0));
		CreatePerk("SpeedCola",(-529.369, -469.065, 241.625),(0, 49.8999, 0));
		CreatePerk("StaminUp",(-606.736, 128.712, 240.625),(0, -34.7333, 0));
		CreatePerk("DoubleTap",(-776.669, -993, 240.625),(0, 180.385, 0));
		level.spawns_humans[0] = (-445, -625, 105); 
		CreateWeapon("kar98k_tactical_mp", (-199, -959, 105));
		CreateWeapon("m21_fmj_zm", (434, -817, 105));
		CreateGum((11, -988, 105),(0, 180, 0));
		level.spawns_zombies[0] = (-444, -980, 106);
		level.spawns_zombies[1] = (208, -980, 105);
		level.spawns_zombies[2] = (344, -564, 105);
		level.spawns_zombies[3] = (860, -978, 105);
		level.spawns_zombies[4] = (947, -590, 105);
			/////Door 1
		thread PastTheDoor((-504, -567, 108),(-619, -568, 108));
		thread PastTheDoor((-619, -568, 108),(-504, -567, 108));
		level.spawns_zombies[5] = (-956, -385, 112);
		level.spawns_zombies[6] = (-612, -164, 105);
		level.spawns_zombies[7] = (-890, 134, 107);
		CreateWeapon("p38_mp", (-787, 81, 105));
			/////Door 2
		thread PastTheDoor((-1058, -789, 148),(-1049, -949, 242));
		thread PastTheDoor((-1049, -949, 242),(-1058, -789, 148));
		CreateGum((-855, -703, 242),(0, 0, 0));
		level.spawns_zombies[8] = (-1043, -589, 242);
		level.spawns_zombies[9] = (-612, -397, 242);
		level.spawns_zombies[10] = (-965, 60, 242);
		level.spawns_zombies[11] = (-234, -463, 243);
		CreateWeapon("stg44_mp", (-855, -177, 242));
		CreateWeapon("mp40_mp", (-409, -581, 243));
		thread createTeleporter((-5, -923, 271),(-2834, -70, 131),20);
			/////Door 3
		thread PastTheDoor((-209, -586, 243),(-23, -591, 203));
		thread PastTheDoor((-23, -591, 203),(-209, -586, 243));
			////
		CreatePap((-3165.69, -64.8069, 91.5821),(0, 89.3188, 0));
		CreateWeapon(level.thundergun, (-2947, 93.5549, 90.3514));
	}
}