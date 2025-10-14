#include maps\zm\gametypes\mapedit;

CreateMap_mp_bo2_town()
{
	map = getDvar("mapname");
	CreateCloudBank();
	if(map == "mp_bo2_town")
	{
		CreateGum((1241, -287, -11),(0, -89.5276, 0));
		thread handleDoors();
		deleteTownFx();
		/*
		thread door_bar_back()
		thread door_bank();
		thread door_bank_back();
		thread door_house();
		*/
		//CreatePap((-459.519, -2418.84, 656.834),(0, 130.743, 0));
		CreatePap((-482.576, -2369.05, 659.672),(0, 91.3458, 0));
		thread createTeleporter((-340.951, -865.969, 117.125),(-332.456, -2361.45, 646.509),15);
		CreatePerk("SpeedCola",(-716,567,56),(0,0,0),1);
		CreatePerk("DoubleTap",(739.3,-966.2,51.1),(0,0,-50),1);
		CreatePerk("StaminUp",(392.9,996.3,55.9),(0,0,-50),1);
		CreatePerk("Juggernog",(-400.4,-1218.7,229.1),(0,0,-50),1);
		CreatePerk("QuickRevive",(438.3,649.7,207.0),(0,0,-50),1);
		thread CreateBox((469, -941, -11),(0, 180, 0));
		thread CreateBox((858, 488, 157),(0, 90, 0));
		CreateWeapon("m21_fmj_zm", (-274, 1147, -11));
		CreateWeapon("kar98k_tactical_mp", (-257, -685, -11));
		CreateWeapon("mp40_mp", (-796, -644, 169));
		//CreatePap((70.3681, -93.9261, -25.875),(0, 182.461, 0));
		level.spawns_humans[0] = (-291.071, 356.484, -11.875);
		level.spawns_humans[1] = (131.375, 255.81, -19.875);
		///thread CreateAirplaneFly((8.67773, 98.321, 90.9894), (151.286, -1476.81, 137.898), (-5.67342, -1468.72, 153.834),(-100.665, -1467.78, 146.369),(238.13, -1455.72, 146.904),(0, -28.6139, 0));
		thread Lava();
		level.spawns_zombies[0] = (948.196, 622.502, 150.125);
		level.spawns_zombies[1] = (921.017, 357.421, 150.125);
		level.spawns_zombies[2] = (1003.02, 364.541, 150.125);
		level.spawns_zombies[3] = (1137.82, 645.026, 106.087);
		level.spawns_zombies[4] = (604.676, 761.341, 150.125);
		level.spawns_zombies[5] = (1125.68, 871.843, -11.875);
		level.spawns_zombies[6] = (900.269, 1126.51, -11.875);
		level.spawns_zombies[7] = (904.223, 856.017, -11.875);
		level.spawns_zombies[8] = (737.318, 741.097, -11.875);
		level.spawns_zombies[9] = (794.691, 534.123, -11.875);
		level.spawns_zombies[10] = (50.2762, 1428.2, -19.875);
		level.spawns_zombies[11] = (79.2515, 1100.11, -19.875);
		level.spawns_zombies[12] = (-160.723, 1152.99, -11.875);
		level.spawns_zombies[13] = (2.98342, 655.368, -25.875);
		level.spawns_zombies[14] = (-119.039, 672.494, -25.875);
		level.spawns_zombies[15] = (178.725, 708.421, -19.875);
		level.spawns_zombies[16] = (33.9852, 499.014, -19.875);
		level.spawns_zombies[17] = (186.108, 276.748, -19.875);
		level.spawns_zombies[18] = (-97.6242, 131.607, -25.875);
		level.spawns_zombies[19] = (-158.895, 8.50601, -19.875);
		level.spawns_zombies[20] = (114.231, 63.6561, -25.875);
		level.spawns_zombies[21] = (139.048, -79.4915, -25.875);
		level.spawns_zombies[22] = (570.392, -153.433, -19.875);
		level.spawns_zombies[23] = (792.83, 28.9185, -19.875);
		level.spawns_zombies[24] = (944.103, -233.101, -11.875);
		level.spawns_zombies[25] = (1111.18, -75.1733, -19.875);
		level.spawns_zombies[26] = (1308.29, -278.196, 52.0659);
		level.spawns_zombies[27] = (-525.589, -35.9945, -19.875);
		level.spawns_zombies[28] = (-319.626, -364.803, -11.875);
		level.spawns_zombies[29] = (-734.543, -328.373, -11.875);
		level.spawns_zombies[30] = (-646.931, 125.796, -19.875);
		level.spawns_zombies[31] = (-1043.17, -638.311, 195.973);
		level.spawns_zombies[32] = (-986.722, -909.781, 168.125);
		level.spawns_zombies[33] = (-669.831, -1101.13, 179.125);
		level.spawns_zombies[34] = (-454.913, -1138.49, 179.125);
		level.spawns_zombies[35] = (-499.652, -895.94, 168.125);
		level.spawns_zombies[36] = (-771.828, -660.113, 168.125);
		level.spawns_zombies[37] = (-800.83, -407.939, 168.125);
		level.spawns_zombies[38] = (-787.035, -560.182, -11.875);
		level.spawns_zombies[39] = (-492.604, -587.918, -11.875);
		level.spawns_zombies[40] = (-473.442, -373.018, -11.875);
		level.spawns_zombies[41] = (114.165, -255.34, -17.2304);
		level.spawns_zombies[42] = (242.778, -542.634, -19.875);
		level.spawns_zombies[43] = (-344.312, -943.889, -11.875);
		level.spawns_zombies[44] = (-231.368, -1117.43, -11.875);
		level.spawns_zombies[45] = (-421.946, -1127.48, -5.875);
		level.spawns_zombies[46] = (264.477, -1299, 97.3644);
		level.spawns_zombies[47] = (-76.1292, -1273.4, 83.3146);
		level.spawns_zombies[48] = (402.199, -1228, -11.8746);
		level.spawns_zombies[49] = (682.492, -805.9, -11.875);
		level.spawns_zombies[50] = (299.935, -802.244, -11.875);
		level.spawns_zombies[51] = (122.525, -985.279, -19.875);
		level.spawns_zombies[52] = (636.768, -475.045, -11.875);
		level.spawns_zombies[53] = (-593.159, 621.346, 0.125006);
		level.spawns_zombies[54] = (-510.094, 921.008, 0.125006);
		level.spawns_zombies[55] = (-806.031, 750.463, 0.3227);
		level.spawns_zombies[56] = (-808.813, 451.934, 0.125);
		level.spawns_zombies[57] = (-796.844, 1199.49, 0.124999);
		level.spawns_zombies[58] = (-427.774, 1217.65, 0.124999);
		level.spawns_zombies[59] = (-399.239, 1379.43, 0.124999);
		level thread deleteFire();
	}
}