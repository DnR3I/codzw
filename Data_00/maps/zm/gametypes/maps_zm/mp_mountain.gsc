#include maps\zm\gametypes\mapedit;

CreateMap_mp_mountain()
{
	map = getDvar("mapname");
	CreateCloudBank();
	if(map == "mp_mountain")
	{
		level.spawns_humans[0] = (3461, -3306, 353);
		CreatePerk("QuickRevive",(2637, -3535, 358),(0, 130, 0));
		CreatePerk("StaminUp",(2911, -1945, 466),(0, 50, 0));
		CreatePerk("DoubleTap",(3294, -598, 318),(0, 0, 0));
		CreatePerk("SpeedCola",(1823, -362, 128),(0, 300, 0));
		CreatePerk("Juggernog",(3030, 2054, 286),(0, 0, 0));
		CreateGum((3040, -1240, 454),(0, 0, 0));
		CreateGum((2914, 185, 318),(0, 220, 0));
		thread CreateBox((3033, -1249, 318),(0, 180, 0));
		CreatePap((3109, 1699, 350),(0, 360, 0));
		level.spawns_zombies[0] = (3627, -3168, 356);
		level.spawns_zombies[1] = (3077, -3186, 350);
		level.spawns_zombies[2] = (2661, -3050, 350);
		level.spawns_zombies[3] = (3347, -2479, 454);
		level.spawns_zombies[4] = (2959, -2684, 454);
		level.spawns_zombies[5] = (2558, -2719, 454);
		level.spawns_zombies[6] = (3285, -2100, 456);
		level.spawns_zombies[7] = (3185, -1458, 459);
		level.spawns_zombies[8] = (2634, -1575, 454);
		level.spawns_zombies[9] = (2884, -2145, 454);
		level.spawns_zombies[10] = (2461, -1764, 403);
		level.spawns_zombies[11] = (1907, -1792, 305);
		level.spawns_zombies[12] = (1674, -1495, 190);
		level.spawns_zombies[13] = (1714, -864, 90);
		level.spawns_zombies[14] = (1638, -396, 110);
		level.spawns_zombies[15] = (1866, -29, 128);
		level.spawns_zombies[16] = (2066, 822, 230);
		level.spawns_zombies[17] = (2368, 1249, 318);
		level.spawns_zombies[18] = (2632, 1033, 328);
		level.spawns_zombies[19] = (2817, 1255, 221);
		level.spawns_zombies[20] = (3152, 813, 326);
		level.spawns_zombies[21] = (2870, 1384, 350);
		level.spawns_zombies[22] = (3293, 2020, 286);
		level.spawns_zombies[23] = (2780, 2028, 286);
		level.spawns_zombies[24] = (2482, 1930, 286);
		level.spawns_zombies[25] = (3497, -1667, 318);
		level.spawns_zombies[26] = (3834, -1481, 318);
		level.spawns_zombies[27] = (3692, -1101, 318);
		level.spawns_zombies[28] = (3372, -1331, 318);
		level.spawns_zombies[29] = (3010, -978, 318);
		level.spawns_zombies[30] = (2603, -1191, 318);
		level.spawns_zombies[31] = (2284, -1298, 318);
		level.spawns_zombies[32] = (2092, -743, 318);
		level.spawns_zombies[33] = (2388, -778, 318);
		level.spawns_zombies[34] = (2742, -619, 318);
		level.spawns_zombies[35] = (2819, -1272, 434);
		level.spawns_zombies[36] = (3279, -1268, 454);
		level.spawns_zombies[37] = (3607, -1274, 454);
		level.spawns_zombies[38] = (3840, -890, 454);
		level.spawns_zombies[39] = (3591, -433, 454);
		level.spawns_zombies[40] = (3477, -720, 454);
		level.spawns_zombies[41] = (3752, 824, 318);
		level.spawns_zombies[42] = (2505, -178, 318);
		level.spawns_zombies[43] = (2899, -326, 319);
		level.spawns_zombies[44] = (3405, -327, 318);
		level.spawns_zombies[45] = (3003, 201, 318);
		level.spawns_zombies[46] = (2531, -60, 320);
		level.spawns_zombies[47] = (2710, 385, 318);
		level.spawns_zombies[48] = (2576, 288, 318);
		level.spawns_zombies[49] = (3756, 779, 318);
		level.spawns_zombies[50] = (3629, 268, 283);
	}
}