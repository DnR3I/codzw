#include maps\zm\gametypes\mapedit;

CreateMap_zm_factory_sh()
{
	map = getDvar("mapname");
	CreateCloudBank();
	if(map == "zm_factory_sh")
	{
		level.spawns_humans[0] = (-56, 286, 114);
		CreateWeapon("kar98k_tactical_mp", (-64, -445, -2));
		CreateWeapon("m21_fmj_zm", (85, 372, -2));
		CreateWeapon("p38_mp", (-894, -186, 68));
		CreateWeapon("p38_mp", (990, -166, 65));
		CreateWeapon("mp40_mp", (784, 1037, 169));
		CreateWeapon("mp40_mp", (-1484, -802, 201));
		CreateWeapon("stg44_mp", (541, -3025, 157));
		CreatePerk("QuickRevive",(-1087, -1195, 68),(0, 95, 0));
		CreatePerk("StaminUp",(564, -412, 63),(0, -90, 0));
		CreatePerk("DoubleTap",(-364, -1081, 192),(0, 90, 0));
		CreatePerk("SpeedCola",(-356, -796, 63),(0, 90, 0));
		CreatePerk("Juggernog",(673, -1450, 134),(0, 90, 0));
		CreateGum((-611, -336, 70),(0, 140, 0));
		CreateGum((467, 48, 61),(0, 180, 0));
		CreateGum((-861, -1055, 200),(0, 90, 0));
		CreateGum((808, -886, 63),(0, 180, 0));
		CreateGum((567, -2108, 90),(0, -90, 0));
		thread createTeleporter((-1781, -1107, 242),(-57, 518, 102),20);
		thread createTeleporter((1266, 1262, 204),(-57, 518, 102),20);
		thread createTeleporter((297, -3181, 192),(-57, 518, 102),20);
		thread CreateBox((1180, 941, 186),(0, 0, 0));
		thread CreateBox((-1031, -1442, 83),(0, 0, 0));
		thread CreateBox((-1224, -1547, 206),(0, 90, 0));
		thread CreateBox((638, -362, 83),(0, -90, 0));
		thread CreateBox((620, -1425, 84),(0, 90, 0));
		thread CreateBox((0, -2447, 287),(0, -90, 0));
		CreatePap((-58, 575, 116),(0, 0, 0));
			/////Door 1
		thread PastTheDoor((-385, -99, 75),(-526, -105, 75));
		thread PastTheDoor((-526, -105, 75),(-385, -99, 75));
			/////Door 2
		thread PastTheDoor((-789, -287, 70),(-792, -416, 70));
		thread PastTheDoor((-792, -416, 70),(-789, -287, 70));
			/////Door 3
		thread PastTheDoor((-418, -980, 180),(-430, -1120, 203));
		thread PastTheDoor((-430, -1120, 203),(-418, -980, 180));
			/////Door 4
		thread PastTheDoor((-822, -1203, 202),(-959, -1203, 210));
		thread PastTheDoor((-959, -1203, 210),(-822, -1203, 202));
			/////Door 4
		thread PastTheDoor((-304, -469, 72),(-405, -358, 72));
		thread PastTheDoor((-405, -358, 72),(-304, -469, 72));
			/////Door 5
		thread PastTheDoor((286, 299, 48),(430, 300, 63));
		thread PastTheDoor((430, 300, 63),(286, 299, 48));
			/////Door 6
		thread PastTheDoor((756, 426, 60),(754, 265, 65));
		thread PastTheDoor((754, 265, 65),(756, 426, 60));
			/////Door 7
		thread PastTheDoor((1143, 284, 67),(1143, 424, 67));
		thread PastTheDoor((1143, 424, 67),(1143, 284, 67));
			/////Door 8
		thread PastTheDoor((1128, -987, 133),(974, -996, 166));
		thread PastTheDoor((974, -996, 166),(1128, -987, 133));
			/////Door 9
		thread PastTheDoor((315, -300, 65),(318, -166, 65));
		thread PastTheDoor((318, -166, 65),(315, -300, 65));
			/////Door 10
		thread PastTheDoor((263, -1919, 70),(262, -2077, 92));
		thread PastTheDoor((262, -2077, 92),(263, -1919, 70));
		level.spawns_zombies[0] = (-173, -595, -122);
		level.spawns_zombies[1] = (-376, 598, -2);
		level.spawns_zombies[2] = (-654, 148, 7);
		level.spawns_zombies[3] = (233, 588, 6);
		level.spawns_zombies[4] = (76, -566, 6);
		level.spawns_zombies[5] = (-569, 14, 70);
		level.spawns_zombies[6] = (-816, -65, 68);
		level.spawns_zombies[7] = (-1072, -865, 69);
		level.spawns_zombies[8] = (-460, -1170, 68);
		level.spawns_zombies[9] = (-497, -566, 68);
		level.spawns_zombies[10] = (-661, -1417, 200);
		level.spawns_zombies[11] = (-1215, -478, 203);
		level.spawns_zombies[12] = (-1421, -1544, 202);
		level.spawns_zombies[13] = (-241, -1438, 192);
		level.spawns_zombies[14] = (-300, -1014, 192);
		level.spawns_zombies[15] = (-175, -860, 62);
		level.spawns_zombies[16] = (-178, -525, 71);
		level.spawns_zombies[17] = (339, -1036, 58);
		level.spawns_zombies[18] = (160, -1740, 52);
		level.spawns_zombies[19] = (-406, -2187, 157);
		level.spawns_zombies[20] = (503, -2136, 90);
		level.spawns_zombies[21] = (78, -2836, 94);
		level.spawns_zombies[22] = (-94, -2509, 47);
		level.spawns_zombies[23] = (504, 165, 62);
		level.spawns_zombies[24] = (789, 629, 55);
		level.spawns_zombies[25] = (416, 544, 60);
		level.spawns_zombies[26] = (658, 168, 65);
		level.spawns_zombies[27] = (654, -673, 65);
		level.spawns_zombies[28] = (939, -652, 71);
		level.spawns_zombies[29] = (923, 263, 65);
		level.spawns_zombies[30] = (1255, 707, 116);
		level.spawns_zombies[31] = (1405, 1084, 169);
		level.spawns_zombies[32] = (1399, -1428, 134);
	}
}