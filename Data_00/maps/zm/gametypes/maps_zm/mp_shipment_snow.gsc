#include maps\zm\gametypes\mapedit;

CreateMap_mp_shipment_snow()
{
	map = getDvar("mapname");
	CreateCloudBank();
	if(map == "mp_shipment_snow")
	{
		level.spawns_humans[0] = (492, 368, 252.125);
		CreatePerk("Juggernog",(-848.52, -566.125, 195.125),(0, 181.022, 0));
		CreatePerk("QuickRevive",(696, 711, 195.73),(0, -87.182, 0));
		CreatePerk("DoubleTap",(-236, 1031, 195.125),(0, -87.182, 0));
		CreatePerk("SpeedCola",(-1700, -277, 195.125),(0, 181.022, 0));
		CreatePerk("StaminUp",(-745.8749, -591.06, 195.125),(0, 87.182, 0));
		thread CreateBox((-1260.94, -297.85, 196.125),(0, 356.951, 0));
		level.spawns_zombies[0] = (390, -326, 200.125);
		level.spawns_zombies[1] = (578, -72, 200.125);
		level.spawns_zombies[2] = (44, 108, 200.125);
		level.spawns_zombies[3] = (-12, -154, 200.125);
		level.spawns_zombies[4] = (-4, 224, 200);
		level.spawns_zombies[5] = (202, -236, 200);
		level.spawns_zombies[6] = (-159, -256, 200);
		level.spawns_zombies[7] = (-422, -422, 200);
		level.spawns_zombies[8] = (-450, -152, 200);
		level.spawns_zombies[9] = (-373, 235, 200);
		level.spawns_zombies[10] = (-583, 331, 200);
		level.spawns_zombies[11] = (-394, 501, 200);
		level.spawns_zombies[12] = (-138, 406, 200);
		level.spawns_zombies[13] = (160, 439, 200);
		level.spawns_zombies[14] = (321, 648, 200);
		level.spawns_zombies[15] = (599, 379, 200);
		level.spawns_zombies[16] = (390, 133, 200);
		level.spawns_zombies[17] = (222, -517, 200);
		level.spawns_zombies[18] = (-469, 922, 200);
		level.spawns_zombies[19] = (-737, 849, 200);
		level.spawns_zombies[20] = (-975, 662, 200);
		level.spawns_zombies[21] = (-1176, 834, 200);
		level.spawns_zombies[22] = (-1476, 921, 200);
		level.spawns_zombies[23] = (-1669, 766, 200);
		level.spawns_zombies[24] = (-1613, 496, 200);
		level.spawns_zombies[25] = (-1689, 77, 200);
		level.spawns_zombies[26] = (-1615, -205, 200);
		level.spawns_zombies[27] = (-1286, -99, 200);
		level.spawns_zombies[28] = (-1075, -130, 200);
		level.spawns_zombies[29] = (-833, -346, 200);
		level.spawns_zombies[30] = (-945, 189, 200);
		level.spawns_zombies[31] = (-867, 549, 200);
	}
}