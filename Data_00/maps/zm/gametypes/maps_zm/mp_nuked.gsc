#include maps\zm\gametypes\mapedit;

CreateMap_mp_nuked()
{
	map = getDvar("mapname");
	CreateCloudBank();
	if(map == "mp_nuked")
	{
		level.spawns_humans[0] = (14.8051, 74.2823, -67.5845);
		CreateGum((-583.967, 609.88, 79.125),(0, 20.3322, 0));
		level thread CreateMeteorPerks((631.13, -182.785, -63.7932),(0, 103.757, 0),(1247.66, 898.454, -63.875),(0, 18.2284, 0),(-58.502, 1099.98, -47.875),(0, 25.3036, 0),(-1635.62, 686.98, -62.175),(0, 70.5617, 0),(-954.048, 715.818, 79.125),(0, 70.4299, 0));
		CreatePap((-1145.82, 470.458, 77.125),(0, 159.556, 0));
		thread CreateBox((-1710.46, 960.679, -63.875),(0, 250.227, 0));
		CreateWeapon("m21_fmj_zm", (216, -48, -69));
		CreateWeapon("kar98k_tactical_mp", (-160, 205, -68));
		CreateWeapon("p38_mp", (69, 498, -36));
		CreateWeapon("mp40_mp", (-728.274, 502.714, -56.875));
		CreateWeapon("stg44_mp", (1871.54, 439.522, -63.875));
		CreateWeapon("rpd_mp", (594.269, 266.124, 79.125));
		level.spawns_zombies[0] = (247.794, 625.559, -61.9672);
	    level.spawns_zombies[1] = (-129.195, 651.557, -62.9646);
	    level.spawns_zombies[2] = (-368.503, 43.6389, -62.9157);
	   level.spawns_zombies[3] = (-374.826, 445.555, -61.3789);
	   level.spawns_zombies[4] = (-536.291, 754.171, -63.875);
	   level.spawns_zombies[5] = (4.1936, 1005.49, -61.875);
	   level.spawns_zombies[6] = (612.089, 870.714, -62.7948);
	   level.spawns_zombies[7] = (1057.35, 954.739, -63.875);
	   level.spawns_zombies[8] = (1235.83, 651.47, -57.875);
	   level.spawns_zombies[9] = (1462.81, 963.641, -59.5812);
	   level.spawns_zombies[10] = (1342.62, 1091.56, -63.875);
	   level.spawns_zombies[11] = (1609.86, 492.363, -63.875);
	   level.spawns_zombies[12] = (1844.3, 596.141, -63.875);
	   level.spawns_zombies[13] = (1989.84, 206.056, -63.875);
	   level.spawns_zombies[14] = (1637.69, 176.618, -63.875);
	   level.spawns_zombies[15] = (1229.6, 4.24181, -64.6353);
	   level.spawns_zombies[16] = (706.354, -56.8828, -64.5154);
	   level.spawns_zombies[17] = (251.406, -111.278, -69.0006);
	   level.spawns_zombies[18] = (228.722, -496.067, -60.8688);
	   level.spawns_zombies[19] = (-268.178, -148.817, -63.7201);
	   level.spawns_zombies[20] = (-747.057, -117.43, -58.5285);
	   level.spawns_zombies[21] = (-1230.94, 330.909, -58.875);
	   level.spawns_zombies[22] = (-1758.18, 225.007, -63.875);
	   level.spawns_zombies[23] = (-1916.65, 447.455, -66.0607);
	   level.spawns_zombies[24] = (-1517.3, 852.421, -63.875);
	   level.spawns_zombies[25] = (-1068.53, 934.004, -64.0646);
	   level.spawns_zombies[26] = (-1089.81, 603.539, -58.875);
	   level.spawns_zombies[27] = (-1092.93, 643.323, 77.125);
	   level.spawns_zombies[28] = (-860.203, 471.818, 79.125);
	   level.spawns_zombies[29] = (-806.296, 676.691, 79.125);
	   level.spawns_zombies[30] = (-533.27, 520.273, -56.875);
	   level.spawns_zombies[31] = (-687.327, 372.294, -56.875);
	   level.spawns_zombies[32] = (-918.056, 477.636, -56.875);
	   level.spawns_zombies[33] = (-1071.14, 221.643, -58.875);
	   level.spawns_zombies[34] = (-843.206, 111.6, -56.875);
	   level.spawns_zombies[35] = (-601.229, 161.842, -56.875);
	   level.spawns_zombies[36] = (104.063, 344.728, -37.0192);
	   level.spawns_zombies[37] = (35.5378, 583.803, -46.7315);
	   level.spawns_zombies[38] = (-638.828, 353.55, 79.125);
	   level.spawns_zombies[39] = (-75.8918, -196.707, 87.0795);
	   level.spawns_zombies[40] = (690.416, 106.447, 79.125);
	   level.spawns_zombies[41] = (881.925, 332.481, 79.125);
	   level.spawns_zombies[42] = (1056.95, 139.278, 79.125);
	   level.spawns_zombies[43] = (686.384, 78.6665, -56.875);
	   level.spawns_zombies[44] = (948.941, 294.615, -56.875);
	   level.spawns_zombies[45] = (916.603, 567.29, -56.875);
	   level.spawns_zombies[46] = (510.699, 496.608, -59.5009);
	   level.spawns_zombies[47] = (459.299, 221.771, -60.729);
	   level.spawns_zombies[48] = (566.688, 40.4157, 80.3261);
	   level.spawns_zombies[49] = (1608.38, 801.15, -63.875);
	   level.spawns_zombies[50] = (1274.21, 316.153, -57.875);
	   level.spawns_zombies[51] = (1214.28, 295.009, 77.125);
	}
}