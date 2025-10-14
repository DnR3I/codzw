#include maps\zm\gametypes\mapedit;

CreateMap_mp_rust()
{
	map = getDvar("mapname");
	CreateCloudBank();
	if(map == "mp_rust")
	{
		level.spawns_humans[0] = (121, -108, -235);
		thread CreateBox((1424.13, 1302.06, -236.92),(0, 272.593, 0));
		thread CreateBox((-260, 941, -233),(0, 272.593, 0));
		CreatePerk("Juggernog",(1307.48, 164.932, -241.052),(0, 177.49, 0));
		CreatePerk("QuickRevive",(78.0749, 814.453, -237.61),(0, 267.286, 0));
		CreatePerk("SpeedCola",(641.148, 911.026, 19.5325),(0, 3.47168, 0));
		CreatePerk("DoubleTap",(730.093, 1443.13, -234),(0, 180.302, 0));
		CreateGum((713.872, 952.503, -201.042),(0, 183.104, 0));
		thread createTeleporter((698.186, 1068.27, 266.324),(1145, -9741, -126),20);
		CreatePap((2587, -9462, -285),(0, -21.2811, 0));
		CreateWeapon("kar98k_tactical_mp", (301, 574, -197)); 
		CreateWeapon("m21_fmj_zm", (-243.11, 474.123, -212.325));
		CreateWeapon("mp40_mp", (1125.26, 501.335, -242.266));
		CreateWeapon("stg44_mp", (1262.49, 1328.06, -105.875)); 
		CreateWeapon(level.thundergun, (-2816, -9079, -193)); 
		level.spawns_zombies[0] = (116.844, 182.17, -245.992);
		level.spawns_zombies[1] = (-153.664, 113.05, -218.46);
		level.spawns_zombies[2] = (-345.151, 300.038, -247.875);
		level.spawns_zombies[3] = (-398.09, -26.2637, -236.626);
		level.spawns_zombies[4] = (-182.494, -164.036, -239.875);
		level.spawns_zombies[5] = (195.453, -105.847, -227.291);
		level.spawns_zombies[6] = (480.782, -170.734, -231.485);
		level.spawns_zombies[7] = (607.794, -20.5428, -224.321);
		level.spawns_zombies[8] = (869.064, 24.3007, -241.09);
		level.spawns_zombies[9] = (677.083, 135.472, -243.297);
		level.spawns_zombies[10] = (428.405, 420.542, -239.875);
		level.spawns_zombies[11] = (387.507, 675.165, -239.875);
		level.spawns_zombies[12] = (51.3144, 663.082, -243.646);
		level.spawns_zombies[13] = (-332.194, 989.304, -136.78);
		level.spawns_zombies[14] = (-330.015, 845.671, -134.963);
		level.spawns_zombies[15] = (-432.805, 1178.87, -231.217);
		level.spawns_zombies[16] = (-436.019, 595.536, -234.816);
		level.spawns_zombies[17] = (-131.491, 1117.81, -237.757);
		level.spawns_zombies[18] = (332.731, 1249.68, -236.695);
		level.spawns_zombies[19] = (460.781, 1047.83, -222.098);
		level.spawns_zombies[20] = (549.643, 828.858, -198.937);
		level.spawns_zombies[21] = (613.979, 1567.28, -238.854);
		level.spawns_zombies[22] = (397.924, 1775.25, -235.085);
		level.spawns_zombies[23] =  (-443.813, 1707.31, -236.845);
		level.spawns_zombies[24] = (-60.9297, 1440.01, -127.888);
		level.spawns_zombies[25] = (-48.7198, 1603.15, -129.76);
		level.spawns_zombies[26] = (-292.265, 1799.26, -46.8773);
		level.spawns_zombies[27] = (303.956, 1701.13, -49.1153);
		level.spawns_zombies[28] = (997.844, 1641.38, -98.7646);
		level.spawns_zombies[29] = (1457.83, 1774.93, -224.794);
		level.spawns_zombies[30] = (822.578, 1752.36, -234.855); // deleted?
		level.spawns_zombies[31] = (1844.69, 1648.31, -103.076);
		level.spawns_zombies[32] = (1574.66, 1142.49, -225.061);
		level.spawns_zombies[33] = (1556.72, 1504.18, -235.059);
		level.spawns_zombies[34] = (1597.71, 879.817, -136.524);
		level.spawns_zombies[35] = (1534.03, 504.875, -142.875);
		level.spawns_zombies[36] = (1541.34, 277.738, -238.803);
		level.spawns_zombies[37] = (1550.11, -194.269, -222.58);
		level.spawns_zombies[38] = (1076.1, -155.771, -234.157);
		level.spawns_zombies[39] = (1301.53, 464.433, -240.641);
		level.spawns_zombies[40] = (1245.71, 947.96, -236.719);
		level.spawns_zombies[41] = (921.836, 1246.15, -235.189);
		level.spawns_zombies[42] = (845.372, 979.122, -233.655);
		level.spawns_zombies[43] = (711.269, 677.742, -234.854);
		level.spawns_zombies[44] = (711.388, 534.862, -112.531);
		level.spawns_zombies[45] = (565.577, 18.2021, -69.4253);
		level.spawns_zombies[46] = (1028.53, 780.772, -3.44002);
		level.spawns_zombies[47] = (903.314, 1086.11, -4.1947);
		level.spawns_zombies[48] = (598.171, 1066.93, 20.8403);
		level.spawns_zombies[49] = (710.962, 1353.95, 10.7052);
		level.spawns_zombies[50] = (964, 891.494, 183.326);
		level.spawns_zombies[51] = (579.393, 786.2, 73.6122);
		level.spawns_zombies[53] = (576.42, 1070.35, 266.96);
		level.spawns_zombies[54] = (280.845, 552.621, -196.03);
		level.spawns_zombies[55] = (161.772, 818.87, -115.875);
		level.spawns_zombies[56] = (696.602, 829.801, -102.77);
		level.spawns_zombies[57] = (851.873, 814.438, -165.875);
		level.spawns_zombies[58] = (-145.055, -33.7113, -130.151);
		level.spawns_zombies[59] = (1737.2, 1652.74, -134.254);	
	}
}