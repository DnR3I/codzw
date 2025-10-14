#include maps\zm\gametypes\mapedit;

CreateMap_mp_dome()
{
	map = getDvar("mapname");
	CreateCloudBank();
	if(map == "mp_dome")
	{
		 level.spawns_humans[0] = (-691.132, 755.165, 4.125);
		 level.spawns_zombies[0] = (-900.056, 819.191, 4.125);
		  level.spawns_zombies[1] = (-324.278, 833.086, 36.125);
		  level.spawns_zombies[2] = (64.5925, 1107.68, 36.125);
		  level.spawns_zombies[3] = (138.66, 597.442, 64.0806);
		   level.spawns_zombies[4] = (-204.634, 467.397, 36.125);
		  level.spawns_zombies[5] = (407.638, 865.365, 36.125);
		  level.spawns_zombies[6] = (682.984, 1171.81, 36.125);
		   level.spawns_zombies[7] = (944.897, 895.476, 36.125);
		   level.spawns_zombies[8] = (937.149, 494.26, 36.125);
		   level.spawns_zombies[9] = (695.533, 499.025, 36.125);
		   level.spawns_zombies[10] = (946.965, 214.989, 36.125);
		   level.spawns_zombies[11] = (1306.74, 144.688, 36.125);
		  level.spawns_zombies[12] = (1230.8, -121.571, 36.125);
		  level.spawns_zombies[13] = (1289.26, -676.641, -18.0559);
		  level.spawns_zombies[14] = (902.311, -489.525, -19.1649);
		   level.spawns_zombies[15] = (577.999, -599.115, -16.0816);
		  level.spawns_zombies[16] = (521.575, -1079.38, -65.4926);
		  level.spawns_zombies[17] = (663.553, -1515.01, -81.4481);
		  level.spawns_zombies[18] = (1065.99, -1417.73, -55.2772);
		   level.spawns_zombies[19] = (1083.79, -1004.44, -55.6341);
		   level.spawns_zombies[20] = (1226.64, -1792.03, -31.3468);
		   level.spawns_zombies[21] = (1023.87, -2192.94, -41.1769);
		   level.spawns_zombies[22] = (596.653, -2413.47, -21.6383);
		   level.spawns_zombies[23] = (290.338, -2167.83, -58.7757);
		   level.spawns_zombies[24] = (203.857, -1706.78, -89.6664);
		   level.spawns_zombies[25] = (56.1651, -1307.38, -80.8173);
		   level.spawns_zombies[26] = (185.993, -1006.9, -97.4251);
		   level.spawns_zombies[27] = (419.486, -737.274, -86.7405);
		   level.spawns_zombies[28] = (-112.491, -694.547, -51.5145);
		   level.spawns_zombies[30] = (594.212, -1890.33, -61.776);
		   level.spawns_zombies[31] = (-195.19, -2210.02, -60.1151);
		   level.spawns_zombies[32] = (-476.245, -1770.25, -75.875);
		   level.spawns_zombies[33] = (-876.746, -1782.21, -75.875);
		   level.spawns_zombies[34] = (-684.164, -1417.34, -75.875);
		   level.spawns_zombies[35] = (-982.339, -1095.16, -75.6271);
		   level.spawns_zombies[36] = (-1348.4, -1433.3, -101.796);
		   level.spawns_zombies[37] = (-1737.59, -1420.96, -87.9686);
		   level.spawns_zombies[38] = (-1599.83, -974.294, -94.5954);
		   level.spawns_zombies[39] = (-591.973, -778.708, -3.1929);
		   level.spawns_zombies[40] = (-371.563, -379.566, 0.0175921);
		   level.spawns_zombies[41] = (94.3211, -227.864, -1.37362);
		   level.spawns_zombies[42] = (418.172, -327.054, -6.2418);
		   level.spawns_zombies[43] = (-774.178, -84.3026, 4.125);
		   level.spawns_zombies[44] = (-1187.08, -165.957, 0.156797);
		   level.spawns_zombies[45] = (-1131.62, -590.152, 0.566928);
		   level.spawns_zombies[46] = (-1245.59, 300.99, 0.125);
		   level.spawns_zombies[47] = (-1541.14, 406.617, 28.2701);
		   level.spawns_zombies[48] = (-1613.01, -17.995, 28.1302);
		   level.spawns_zombies[49] = (-1636.82, -413.906, 28.3713);
		   level.spawns_zombies[50] = (-1535.86, -6.31663, -88.5934);
		   level.spawns_zombies[51] = (-1577.64, -648.946, -91.6706);		 
		   level.spawns_zombies[53] = (-1012.24, -1524.38, 106.132);
		   level.spawns_zombies[52] = (-831.567, -1340.97, 106.13);
		   level.spawns_zombies[29] = (-357.399, -1599.11, 106.131);
		   CreatePerk("QuickRevive",(-346.356, 1306.48, 36.125),(0, 84.4354, 0));
		   CreatePerk("Juggernog",(-1919.4, -961.898, -80.8737),(0, 88.1433, 0));
		   CreatePerk("SpeedCola",(-609.824, -1926.87, -75.875),(0, 178.149, 0));
		   CreatePerk("DoubleTap",(1282.94, -2159.39, -15.5047),(0, 229.911, 0));
		   CreatePerk("StaminUp",(46.5737, -632.874, -3.24856),(0, 181.005, 0));
		   CreatePap((-340.428, 77.2355, 36.125),(0, 87.9565, 0));
			CreateWeapon("mp40_mp", (-678.306, 98.2512, 4.125));
			CreateWeapon("m21_fmj_zm", (520.616, -196.928, 44.125));
			 CreateWeapon("stg44_mp", (65.0782, -2377.37, -40.2402));
			 thread CreateBox((-192.356, -1288.3, -89.5495),(0, 296.351, 0));
			 CreateWeapon("spas12_mp", (-663.449, -108.075, 4.125));
		   thread createTeleporter((-1642.97, -693.466, 28.1485),(1.72745, -8.8974, 36.125),15);
	}
}