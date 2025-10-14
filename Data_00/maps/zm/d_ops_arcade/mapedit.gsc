#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\d_ops_arcade\utilities;

Init()
{
    level.spawns_humans = [];
	level.spawns_zombies = [];
	level.spawns_helis = [];
	level.vending_machines = [];
	level.magical_boxes = [];
	//level.rainar = [];
	level.meteorar = [];
	level.rain = 0;
	level.meteor = 0;
	thread CreateMap();
}
CreateMap()
{
    map = getDvar("mapname");
	CreateCloudBank();
	if(map == "mp_crash" || map == "mp_crash_tropical")
	{
		level.spawns_humans[0] = (624.584, 536.073, 135.673);
		level.spawns_zombies[0] = (650.261, 364.112, 143.285);
		level.spawns_zombies[1] = (370.869, 685.957, 136.048);
		level.spawns_zombies[2] = (455.259, 970.939, 127.68);
		level.spawns_zombies[3] = (634.452, 961.879, 167.988);
		level.spawns_zombies[4] = (895.714, 750.478, 142.301);
		level.spawns_zombies[5] = (1044.99, 1089.19, 128.789);
		level.spawns_zombies[6] = (1376.81, 1130.28, 136.125);
		level.spawns_zombies[7] = (1687.08, 1150.53, 136.125);
		level.spawns_zombies[8] = (1653.69, 1373.14, 136.125);
		level.spawns_zombies[9] = (1340.58, 771.512, 144.125);
		level.spawns_zombies[10] = (1377.89, 370.811, 135.276);
		level.spawns_zombies[11] = (1131.4, 411.537, 135.849);
		level.spawns_zombies[12] = (1526.94, 653.829, 140.125);
		level.spawns_zombies[13] = (1646.81, 519.221, 140.125);
		level.spawns_zombies[14] = (1780.14, 728.93, 308.125);
		level.spawns_zombies[15] = (1595.16, 684.754, 308.125);
		level.spawns_zombies[16] = (1588.36, 477.731, 308.125);
		level.spawns_zombies[17] = (1804.88, 441.17, 308.125);
		level.spawns_zombies[18] = (1770.81, 704.875, 460.125);
		level.spawns_zombies[19] = (1584.21, 688.661, 580.125);
		level.spawns_zombies[20] = (1650.01, 513.727, 580.125);
		level.spawns_zombies[21] = (1792.9, 760.127, 580.125);
		level.spawns_zombies[22] = (1521.71, 358.08, 308.125);
		level.spawns_zombies[23] = (1471.66, 574.491, 308.125);
		level.spawns_zombies[24] = (1802.38, 388.875, 244.125);
		level.spawns_zombies[25] = (1766.9, 130.15, 133.603);
		level.spawns_zombies[26] = (1539.52, 173.717, 132.372);
		level.spawns_zombies[27] = (1603.98, -41.2368, 109.156);
		level.spawns_zombies[28] = (1319.55, 37.631, 152.125);
		level.spawns_zombies[29] = (1587.27, -329.535, 68.125);
		level.spawns_zombies[30] = (1342.4, -428.841, 69.7062);
		level.spawns_zombies[31] = (1018.08, -532.152, 86.4992);
		level.spawns_zombies[32] = (634.05, -491.39, 158.707);
		level.spawns_zombies[33] = (411.646, -296.922, 132.295);
		level.spawns_zombies[34] = (214.27, -25.89, 127.047);
		level.spawns_zombies[35] = (273.35, 286.46, 136.159);
		level.spawns_zombies[36] = (189.812, 767.009, 130.967);
		level.spawns_zombies[37] = (-24.2495, 16.1672, 136.125);
		level.spawns_zombies[38] = (65.9692, -385.167, 136.125);
		level.spawns_zombies[39] = (138.982, -721, 136.125);
		level.spawns_zombies[40] = (33.7716, -913.438, 136.125);
		level.spawns_zombies[41] = (360.225, -616.55, 136.125);
		level.spawns_zombies[42] = (399.83, -816.349, 200.125);
		level.spawns_zombies[43] = (247.196, -799.585, 272.125);
		level.spawns_zombies[44] = (339.139, -574.692, 272.125);
		level.spawns_zombies[45] = (109.048, -879.065, 272.125);
		level.spawns_zombies[46] = (-21.9985, -578.108, 272.125);
		level.spawns_zombies[47] = (-167.332, -565, 104.117);
		level.spawns_zombies[48] = (-316.231, -267.88, 111.727);
		level.spawns_zombies[49] = (-329.698, 71.8227, 134.439);
		level.spawns_zombies[50] = (-277.975, 445.876, 222.402);
		level.spawns_zombies[51] = (-595.693, 443.604, 233.812);
		level.spawns_zombies[52] = (-437.856, 760.17, 234.542);
		level.spawns_zombies[53] = (-433.233, 1141.66, 243.145);
		level.spawns_zombies[54] = (-54.7436, 1133.51, 206.805);
		level.spawns_zombies[55] = (-341.562, 1520.12, 235.878);
		level.spawns_zombies[56] = (-187.558, 1855.52, 229.155);
		level.spawns_zombies[57] = (-396.85, 2103.74, 243.706);
		level.spawns_zombies[58] = (39.9805, 2077.19, 236.125);
		level.spawns_zombies[59] = (42.0193, 1815.36, 224.125);
		level.spawns_zombies[60] = (398.704, 1864.9, 127.84);
		level.spawns_zombies[61] = (395.764, 1604.11, 126.183);
		level.spawns_zombies[62] = (180.935, 1402.74, 129.319);
		level.spawns_zombies[63] = (360.479, 1305.43, 137.125);
		level.spawns_zombies[64] = (604.382, 1176.23, 137.125);
		level.spawns_zombies[65] = (560.476, 1386.16, 143.569);
		level.spawns_zombies[66] = (350.885, 1404.8, 273.125);
		level.spawns_zombies[67] = (352.724, 1164.39, 273.125);
		level.spawns_zombies[68] = (-489.746, 1431.79, 277.557);
		level.spawns_zombies[69] = (-765.477, 1307.52, 244.995);
		level.spawns_zombies[70] = (-517.577, 1747.92, 256.125);
		level.spawns_zombies[71] = (-600.658, 2089.33, 254.125);
		level.spawns_zombies[72] = (-845.315, 1937.82, 254.125);
		level.spawns_zombies[73] = (-883.347, 2200.6, 390.125);
		level.spawns_zombies[74] = (-841.63, 1919.54, 390.125);
		level.spawns_zombies[75] = (-634.837, 2133.25, 390.125);
		level.spawns_zombies[76] = (-492.274, 2042.05, 390.125);
		level.spawns_zombies[77] = (-710.825, 1797.15, 408.125);
		level.spawns_zombies[78] = (-701.567, 1510.11, 413.719);
		level.spawns_zombies[79] = (-564.168, 1668.42, 416.168);
		level.spawns_zombies[80] = (-263.379, -779.986, 103.263);
		level.spawns_zombies[81] = (-240.019, -1140.39, 78.2674);
		level.spawns_zombies[82] = (-250.701, -1650.45, 56.8712);
		level.spawns_zombies[83] = (-531.654, -1714.94, 91.4705);
		level.spawns_zombies[84] = (-99.7062, -1968.08, 183.677);
		level.spawns_zombies[85] = (291.6, -1941.77, 125.896);
		level.spawns_zombies[86] = (478.921, -1727.13, 124.374);
		level.spawns_zombies[87] = (694.787, -1413.9, 63.6782);
		level.spawns_zombies[88] = (1117.08, -1212.03, 66.92);
		level.spawns_zombies[89] = (1496.38, -1103.21, 65.125);
		level.spawns_zombies[90] = (1625.82, -1498.06, 66.125);
		level.spawns_zombies[91] = (1638.63, -1902.68, 66.125);
		level.spawns_zombies[92] = (1402.1, -1881.98, 202.125);
		level.spawns_zombies[93] = (1628.65, -1884.23, 202.125);
		level.spawns_zombies[94] = (1633.46, -1658.52, 226.125);
		level.spawns_zombies[95] = (1401.83, -1561.46, 226.125);
		level.spawns_zombies[96] = (1576.19, -1384.49, 227.125);
		level.spawns_zombies[97] = (1288.21, -1440.91, 226.125);
		level.spawns_zombies[98] = (1246.19, -1694.51, 64.125);
		level.spawns_zombies[99] = (681.379, -1256.02, 133.66);
		level.spawns_zombies[100] = (511.38, -1095.56, 96.125);
		level.spawns_zombies[101] = (710.87, -808.09, 91.9653);
		level.spawns_zombies[102] = (914.035, -859.774, 304.125);
		level.spawns_zombies[103] = (1066.1, -1077.23, 304.125);
		level.spawns_zombies[104] = (832.515, 970.337, 135.605);
		thread Fx_Fire((398.465, 458.519, 185.321));
		thread Fx_Fire((725.363, 911.564, 164.728));
	}
	else if(map == "mp_raid")
	{
		level.spawns_humans[0] = (4438, 3212, 33);
		level.spawns_zombies[0] = (4253, 2710, 30);
		level.spawns_zombies[1] = (4456, 2975, 30);
		level.spawns_zombies[2] = (4308, 3540, 30);
		level.spawns_zombies[3] = (4266, 4083, 26);
		level.spawns_zombies[4] = (4037, 2609, 31);
		level.spawns_zombies[5] = (3728, 2886, 28);
		level.spawns_zombies[6] = (3704, 3286, 32);
		level.spawns_zombies[7] = (4036, 3446, 30);
		level.spawns_zombies[8] = (3740, 3749, 32);
		level.spawns_zombies[9] = (3457, 4083, 34);
		level.spawns_zombies[10] = (2804, 3899, -7);
		level.spawns_zombies[11] = (2983, 4472, -7);
		level.spawns_zombies[12] = (2757, 4306, -7);
		level.spawns_zombies[13] = (2585, 3857, -7);
		level.spawns_zombies[14] = (2452, 3847, -7);
		level.spawns_zombies[15] = (1803, 3930, 40);
		level.spawns_zombies[16] = (1615, 3978, 40);
		level.spawns_zombies[17] = (1099, 3931, -5);
		level.spawns_zombies[18] = (1417, 4524, -7);
		level.spawns_zombies[19] = (999, 4067, -7);
		level.spawns_zombies[20] = (1001, 4646, -6);
		level.spawns_zombies[21] = (522, 4073, -7);
		level.spawns_zombies[22] = (612, 3825, -6);
		level.spawns_zombies[23] = (280, 2980, 111);
		level.spawns_zombies[24] = (383, 2986, 111);
		level.spawns_zombies[25] = (-401, 2988, 112);
		level.spawns_zombies[26] = (-413, 3265, 111);
		level.spawns_zombies[27] = (59, 2570, 172);
		level.spawns_zombies[28] = (468, 2445, 168);
		level.spawns_zombies[29] = (845, 2679, 110);
		level.spawns_zombies[30] = (1535, 2835, 114);
		level.spawns_zombies[31] = (1281, 3250, 114);
		level.spawns_zombies[32] = (1127, 3375, 114);
		level.spawns_zombies[33] = (1665, 3256, 114);
		level.spawns_zombies[34] = (1889, 3150, 54);
		level.spawns_zombies[35] = (2589, 2795, 54);
		level.spawns_zombies[36] = (1891, 2800, 54);
		level.spawns_zombies[37] = (2589, 3158, 54);
		level.spawns_zombies[38] = (2678, 2246, 144);
		level.spawns_zombies[39] = (3032, 1927, 178);
		level.spawns_zombies[40] = (3149, 1965, 178);
		level.spawns_zombies[41] = (2719, 1221, 108);
		level.spawns_zombies[42] = (2240, 918, 108);
		level.spawns_zombies[43] = (1564, 1437, 151);
		level.spawns_zombies[44] = (1951, 1835, 67);
		level.spawns_zombies[45] = (1784, 2275, 139);
		level.spawns_zombies[46] = (1319, 2151, 166);
		level.spawns_zombies[47] = (732, 1483, 166);
		level.spawns_zombies[48] = (1165, 1666, 166);
		level.spawns_zombies[49] = (3095, 2285, 190);
		level.spawns_zombies[50] = (2836, 2522, 110);
		level.spawns_zombies[51] = (3269, 2884, 100);
		level.spawns_zombies[52] = (2796, 2892, 100);
		level.spawns_zombies[53] = (3881, 2337, 30);
		level.spawns_zombies[54] = (3396, 2690, 30);
		level.spawns_zombies[55] = (3462, 2100, 30);
	}
	else if(map == "mp_bo2plaza")
	{
		level.spawns_humans[0] = (-2901, -352, -133);
		level.spawns_zombies[0] = (-2676, -130, -185);
		level.spawns_zombies[1] = (-2898, 130, -185);
		level.spawns_zombies[2] = (-3153, 311, -185);
		level.spawns_zombies[3] = (-3323, 662, -185);
		level.spawns_zombies[4] = (-3582, 958, -185);
		level.spawns_zombies[5] = (-3375, 1397, -185);
		level.spawns_zombies[6] = (-2967, 1383, -185);
		level.spawns_zombies[7] = (-3041, 1791, -173);
		level.spawns_zombies[8] = (-2788, 2085, -137);
		level.spawns_zombies[9] = (-3110, 2430, -137);
		level.spawns_zombies[10] = (-2901, 2679, -137);
		level.spawns_zombies[11] = (-2876, 3063, -137);
		level.spawns_zombies[12] = (-2578, 3160, -137);
		level.spawns_zombies[13] = (-2237, 3376, -137);
		level.spawns_zombies[14] = (-1869, 3020, -137);
		level.spawns_zombies[15] = (-1754, 3369, -155);
		level.spawns_zombies[16] = (-1421, 3167, -185);
		level.spawns_zombies[17] = (-1244, 3058, -185);
		level.spawns_zombies[18] = (-1068, 3276, -185);
		level.spawns_zombies[19] = (-1165, 3608, -185);
		level.spawns_zombies[20] = (-1386, 3760, -185);
		level.spawns_zombies[21] = (-923, 3787, -185);
		level.spawns_zombies[22] = (-640, 3832, -185);
		level.spawns_zombies[23] = (-392, 3800, -185);
		level.spawns_zombies[24] = (-142, 3690, -185);
		level.spawns_zombies[25] = (-219, 3379, -185);
		level.spawns_zombies[26] = (38, 3311, -185);
		level.spawns_zombies[27] = (310, 3330, -185);
		level.spawns_zombies[28] = (138, 3163, -185);
		level.spawns_zombies[29] = (279, 2917, -185);
		level.spawns_zombies[30] = (549, 2842, -185);
		level.spawns_zombies[31] = (700, 3062, -185);
		level.spawns_zombies[32] = (644, 3394, -185);
		level.spawns_zombies[33] = (-208, 2868, -185);
		level.spawns_zombies[34] = (-302, 2568, -185);
		level.spawns_zombies[35] = (-549, 2415, -185);
		level.spawns_zombies[36] = (-691, 2631, -185);
		level.spawns_zombies[37] = (-905, 2489, -185);
		level.spawns_zombies[38] = (-939, 2754, -185);
		level.spawns_zombies[39] = (-1197, 2710, -185);
		level.spawns_zombies[40] = (-1536, 2688, -185);
		level.spawns_zombies[41] = (-1366, 2326, -145);
		level.spawns_zombies[42] = (-1720, 2263, -81);
		level.spawns_zombies[43] = (-2031, 2340, -81);
		level.spawns_zombies[44] = (-2124, 2064, -81);
		level.spawns_zombies[45] = (-1746, 1896, -81);
		level.spawns_zombies[46] = (-2163, 1773, -108);
		level.spawns_zombies[47] = (-2176, 1464, -185);
		level.spawns_zombies[48] = (-2500, 1585, -185);
		level.spawns_zombies[49] = (-2501, 1286, -185);
		level.spawns_zombies[50] = (-2317, 1061, -185);
		level.spawns_zombies[51] = (-2100, 801, -185);
		level.spawns_zombies[52] = (-2336, 463, -185);
		level.spawns_zombies[53] = (-2649, 454, -185);
		level.spawns_zombies[54] = (-3448, -25, -185);
		level.spawns_zombies[55] = (-3346, 178, -185);
		level.spawns_zombies[56] = (-2769, 636, -185);
		level.spawns_zombies[57] = (-2926, 837, -185);
		level.spawns_zombies[58] = (-2658, 901, -185);
		level.spawns_zombies[59] = (-3084, 1005, -185);
		level.spawns_zombies[60] = (-2294, -184, -185);
		level.spawns_zombies[61] = (-2027, -143, -185);
		level.spawns_zombies[62] = (-1755, -216, -133);
		level.spawns_zombies[63] = (-1817, 102, -133);
		level.spawns_zombies[64] = (-1712, 352, -133);
		level.spawns_zombies[65] = (-1729, 603, -133);
		level.spawns_zombies[66] = (-1413, 835, -79);
		level.spawns_zombies[67] = (-1012, 785, -79);
		level.spawns_zombies[68] = (-981, 966, -79);
		level.spawns_zombies[69] = (-683, 966, -79);
		level.spawns_zombies[70] = (-663, 1397, -79);
		level.spawns_zombies[71] = (-548, 1573, -79);
		level.spawns_zombies[72] = (-274, 1977, -133);
		level.spawns_zombies[73] = (-24, 2088, -133);
		level.spawns_zombies[74] = (196, 2061, -133);
		level.spawns_zombies[75] = (480, 2032, -133);
		level.spawns_zombies[76] = (393, 2309, -185);
		level.spawns_zombies[77] = (418, 2528, - 185);
		level.spawns_zombies[78] = (-2040, 273, -133);
		level.spawns_zombies[79] = (-2207, 381, -133);
		level.spawns_zombies[80] = (-2390, 126, -133);
		level.spawns_zombies[81] = (-2698, 2258, -137);
		level.spawns_zombies[82] = (-2617, 2529, -137);
		level.spawns_zombies[83] = (-2391, 2430, -137);
		level.spawns_zombies[84] = (-2208, 2502, -137);
		level.spawns_zombies[85] = (-2128, 2713, -137);
		level.spawns_zombies[86] = (-2026, 2962, -137);
		level.spawns_zombies[87] = (-530, 3205, -185);
		level.spawns_zombies[88] = (-753, 2969, -185);
		level.spawns_zombies[89] = (-817, 3260, -185);
		level.spawns_zombies[90] = (-737, 3376, -56);
		level.spawns_zombies[91] = (-592, 2953, -56);
		level.spawns_zombies[92] = (-3017, 936, -56);
		level.spawns_zombies[93] = (-2562, 815, -56);
	}
	else if(map == "mp_shipment_snow")
	{
		level.spawns_humans[0] = (492, 368, 252.125);
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
	else if(map == "mp_firingrange")
	{
		level.spawns_humans[0] = (-1044, 961, 2);
		level.spawns_zombies[0] = (-1283, 811, -52);
		level.spawns_zombies[1] = (-904, 1041, -52);
		level.spawns_zombies[2] = (-614, 917, -52);
		level.spawns_zombies[3] = (-680, 1136, -52);
		level.spawns_zombies[4] = (-351, 1145, -52);
		level.spawns_zombies[5] = (-359, 1486, -52);
		level.spawns_zombies[6] = (-690, 1583, -55);
		level.spawns_zombies[7] = (-367, 827, -60);
		level.spawns_zombies[8] = (-1136, 1375, -52);
		level.spawns_zombies[9] = (-952, 1603, -52);
		level.spawns_zombies[10] = (-853, 1871, -53);
		level.spawns_zombies[11] = (-513, 1842, -50);
		level.spawns_zombies[12] = (-474, 2159, -50);
		level.spawns_zombies[13] = (-184, 2259, -54);
		level.spawns_zombies[14] = (-19, 2439, -56);
		level.spawns_zombies[15] = (140, 2260, -56);
		level.spawns_zombies[16] = (263, 2568, -54);
		level.spawns_zombies[17] = (642, 2585, -53);
		level.spawns_zombies[18] = (524, 2414, -53);
		level.spawns_zombies[19] = (1114, 2496, -56);
		level.spawns_zombies[20] = (1154, 2275, -56);
		level.spawns_zombies[21] = (1603, 2372, -72);
		level.spawns_zombies[22] = (1531, 1963, -55);
		level.spawns_zombies[23] = (1693, 1541, -52);
		level.spawns_zombies[24] = (1911, 1732, -53);
		level.spawns_zombies[25] = (2092, 1379, -54);
		level.spawns_zombies[26] = (2236, 1556, -55);
		level.spawns_zombies[27] = (2522, 1442, -54);
		level.spawns_zombies[28] = (2633, 1613, -53);
		level.spawns_zombies[29] = (1826, 1274, -52);
		level.spawns_zombies[30] = (1583, 1153, -48);
		level.spawns_zombies[31] = (1527, 967, -48);
		level.spawns_zombies[32] = (1299, 1224, -54);
		level.spawns_zombies[33] = (1430, 1478, -53);
		level.spawns_zombies[34] = (1273, 1820, -52);
		level.spawns_zombies[35] = (1156, 1985, -52);
		level.spawns_zombies[36] = (783, 1906, -55);
		level.spawns_zombies[37] = (626, 2012, -60);
		level.spawns_zombies[38] = (728, 1750, -57);
		level.spawns_zombies[39] = (433, 1867, -55);
		level.spawns_zombies[40] = (361, 1574, -61);
		level.spawns_zombies[41] = (110, 1551, -55);
		level.spawns_zombies[42] = (277, 1812, -55);
		level.spawns_zombies[43] = (173, 1310, -53);
		level.spawns_zombies[44] = (547, 1414, -59);
		level.spawns_zombies[45] = (529, 1305, -45);
		level.spawns_zombies[46] = (663, 1187, -52);
		level.spawns_zombies[47] = (847, 1440, -50);
		level.spawns_zombies[48] = (701, 1517, -48);
		level.spawns_zombies[49] = (276, 1054, -53);
		level.spawns_zombies[50] = (118, 1148, -55);
		level.spawns_zombies[51] = (52, 812, -52);
		level.spawns_zombies[52] = (79, 638, -52);
		level.spawns_zombies[53] = (8, 390, -52);
		level.spawns_zombies[54] = (-165, 474, -50);
		level.spawns_zombies[55] = (-251, 244, -100);
		level.spawns_zombies[56] = (-110, 74, -114);
		level.spawns_zombies[57] = (-148, -90, -117);
		level.spawns_zombies[58] = (-77, -293, -114);
		level.spawns_zombies[59] = (-297, -230, -114);
		level.spawns_zombies[60] = (-556, -26, -115);
		level.spawns_zombies[61] = (-791, -157, -116);
		level.spawns_zombies[62] = (-751, 63, -117);
		level.spawns_zombies[63] = (-715, -442, -118);
		level.spawns_zombies[64] = (-487, -551, -118);
		level.spawns_zombies[65] = (-700, -624, -118);
		level.spawns_zombies[66] = (-561, -773, -118);
		level.spawns_zombies[67] = (-386, -793, -118);
		level.spawns_zombies[68] = (-213, -549, -118);
		level.spawns_zombies[69] = (-28, -579, -117);
		level.spawns_zombies[70] = (-122, -725, -118);
		level.spawns_zombies[71] = (125, -787, -118);
		level.spawns_zombies[72] = (240, -658, -118);
		level.spawns_zombies[73] = (374, -445, -118);
		level.spawns_zombies[74] = (256, -362, -118);
		level.spawns_zombies[75] = (415, -143, -118);
		level.spawns_zombies[76] = (633, -107, -96);
		level.spawns_zombies[77] = (599, 41, -105);
		level.spawns_zombies[78] = (870, 24, -114);
		level.spawns_zombies[79] = (1025, 245, -117);
		level.spawns_zombies[80] = (1266, 319, -118);
		level.spawns_zombies[81] = (1301, 543, -118);
		level.spawns_zombies[82] = (1034, 709, -52);
		level.spawns_zombies[83] = (1197, 765, -62);
		level.spawns_zombies[84] = (1399, 1010, 118);
		level.spawns_zombies[85] = (-225, 1958, 0);
		level.spawns_zombies[86] = (36, 2056, 0);
		level.spawns_zombies[87] = (298, 2116, 0);
		level.spawns_zombies[88] = (1233, 1421,	-42);
		level.spawns_zombies[89] = (1166, 1621, -42);
		level.spawns_zombies[90] = (900, 1693, -42);
		level.spawns_zombies[91] = (1259, 1476, 102);
		level.spawns_zombies[92] = (1069, 1257, 102);
		level.spawns_zombies[93] = (900, 1034, 102);
		level.spawns_zombies[94] = (941, 1025, -42);
		level.spawns_zombies[95] = (1066, 1215, -42);
		level.spawns_zombies[96] = (1801, 2096, -40);
		level.spawns_zombies[97] = (1990,2240, -40);
		level.spawns_zombies[98] = (1863, 2441, -40);
		level.spawns_zombies[99] = (-71, 1047, -54);
		level.spawns_zombies[100] = (-93, 1243, -54);
		level.spawns_zombies[101] = (-91, 1286, 104);
		level.spawns_zombies[102] = (-150, 975, 104);
		level.spawns_zombies[103] = (919, -129, -18);
	}
	else if(map == "mp_mountain")
	{
		level.spawns_humans[0] = (3461, -3306, 353);
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
	else if(map == "mp_radiation_sh")
	{
		level.spawns_humans[0] = (848, 2112, 83);
	}
	else if(map == "mp_asylum")
	{
		level.spawns_humans[0] = (649, -1214, 73);
		level.spawns_zombies[0] = (497, -1368, 8);
		level.spawns_zombies[1] = (445, -1559, 8);
		level.spawns_zombies[2] = (221, -1743, 0);
		level.spawns_zombies[3] = (-16, -1778, -13);
		level.spawns_zombies[4] = (-286, -1742, -43);
		level.spawns_zombies[5] = (-495, -1738, -48);
		level.spawns_zombies[6] = (-718, -1725, -48);
		level.spawns_zombies[7] = (-1110, -1705, -46);
		level.spawns_zombies[8] = (-1315, -1760, -46);
		level.spawns_zombies[9] = (-1100, -1416, -36);
		level.spawns_zombies[10] = (-1492, -1225, 38);
		level.spawns_zombies[11] = (-1321, 944, 45);
		level.spawns_zombies[12] = (-1071, -941, 53);
		level.spawns_zombies[13] = (-902, -1135, 57);
		level.spawns_zombies[14] = (-567, -1004, 63);
		level.spawns_zombies[15] = (-469, -1146, 67);
		level.spawns_zombies[16] = (-196, -1156, 66);
		level.spawns_zombies[17] = (678, -1185, 20);
		level.spawns_zombies[18] = (940, -1031, 35);
		level.spawns_zombies[19] = (271, -998, 38);
		level.spawns_zombies[20] = (-7, -1060, 24);
		level.spawns_zombies[21] = (79, -1300, -12);
		level.spawns_zombies[22] = (-160, -1301, -4);
		level.spawns_zombies[23] = (-485, -1334, -4);
		level.spawns_zombies[24] = (-1013, -1282, -3);
		level.spawns_zombies[25] = (-62, -890, 204);
		level.spawns_zombies[26] = (-482, -900, 205);
		level.spawns_zombies[27] = (-1414, -780, 205);
		level.spawns_zombies[28] = (-1371, -375, 205);
		level.spawns_zombies[29] = (-1245, -650, 205);
		level.spawns_zombies[30] = (-1281, -352, 205);
		level.spawns_zombies[31] = (-1007, -341, 205);
		level.spawns_zombies[32] = (-715, -379, 205);
		level.spawns_zombies[33] = (-700, -148, 205);
		level.spawns_zombies[34] = (-613, -148, 205);
		level.spawns_zombies[35] = (-603, -499, 205);
		level.spawns_zombies[36] = (-295, -675, 205);
		level.spawns_zombies[37] = (44, -505, 205);
		level.spawns_zombies[38] = (306, -576, 205);
		level.spawns_zombies[39] = (-1325, 119, 217);
		level.spawns_zombies[40] = (-1322, 348, 223);
		level.spawns_zombies[41] = (-1348, 622, 234);
		level.spawns_zombies[42] = (-705, 41, 205);
		level.spawns_zombies[43] = (-890, 332, 224);
		level.spawns_zombies[44] = (-372, 521, 211);
		level.spawns_zombies[45] = (-359, 722, 208);
		level.spawns_zombies[46] = (-823, 974, 218);
		level.spawns_zombies[47] = (-1206, 938, 232);
		level.spawns_zombies[48] = (-290, 388, 156);
		level.spawns_zombies[49] = (-313, -21, 36);
		level.spawns_zombies[50] = (-204, -376, 35);
		level.spawns_zombies[51] = (15, -324, 36);
		level.spawns_zombies[52] = (270, -374, 39);
		level.spawns_zombies[53] = (735, -357, 47);
		level.spawns_zombies[54] = (733, -203, 43);
		level.spawns_zombies[55] = (561, 154, 35);
		level.spawns_zombies[56] = (368, 334, 37);
		level.spawns_zombies[57] = (163, 350, 34);
		level.spawns_zombies[58] = (466, -586, 39);
		level.spawns_zombies[59] = (981, -368, 43);
		level.spawns_zombies[60] = (1242, -624, 43);
		level.spawns_zombies[61] = (1230, -365, 43);
		level.spawns_zombies[62] = (1289, 58, 43);
		level.spawns_zombies[63] = (1761, 217, 43);
		level.spawns_zombies[64] = (1767, -116, 43);
		level.spawns_zombies[65] = (1756, -236, 43);
		level.spawns_zombies[66] = (1087, 268, 59);
		level.spawns_zombies[67] = (971, -229, 43);
		level.spawns_zombies[68] = (711, -73, 48);
		level.spawns_zombies[69] = (698, 124, 46);
		level.spawns_zombies[70] = (1027, 389, 55);
		level.spawns_zombies[71] = (1210, 858, 43);
		level.spawns_zombies[72] = (1011, 667, 52);
		level.spawns_zombies[73] = (663, 675, 43);
		level.spawns_zombies[74] = (-272, 781, 205);
		level.spawns_zombies[75] = (390, 512, 205);
		level.spawns_zombies[76] = (375, 990, 205);
		level.spawns_zombies[77] = (424, 1407, 203);
		level.spawns_zombies[78] = (516, 1640, 205);
		level.spawns_zombies[79] = (58, 1963, 205);
		level.spawns_zombies[80] = (-238, 1986, 220);
		level.spawns_zombies[81] = (-165, 1565, 212);
		level.spawns_zombies[82] = (144, 1418, 218);
		level.spawns_zombies[83] = (-218, 1400, 206);
		level.spawns_zombies[84] = (157, 1050, 208);
		level.spawns_zombies[85] = (-218, 1066, 206);
		level.spawns_zombies[86] = (572, 511, 205);
		level.spawns_zombies[87] = (928, 656, 205);
		level.spawns_zombies[88] = (1241, 371, 205);
		level.spawns_zombies[89] = (1238, 654, 205);
		level.spawns_zombies[90] = (902, 732, 207);
		level.spawns_zombies[91] = (610, 899, 205);
		level.spawns_zombies[92] = (687, 246, 205);
		level.spawns_zombies[93] = (486, 1983, 227);
		level.spawns_zombies[94] = (807, 1728, 209);
		level.spawns_zombies[95] = (1006, 1512, 205);
		level.spawns_zombies[96] = (999, 1971, 205);
		level.spawns_zombies[97] = (1525, 1951, 168);
		level.spawns_zombies[98] = (1645, 1595, 148);
		level.spawns_zombies[99] = (1912, 1430, 144);
		level.spawns_zombies[100] = (1841, 1027, 105);
		level.spawns_zombies[101] = (1557, 1223, 103);
		level.spawns_zombies[102] = (1075, 1249, 104);
		level.spawns_zombies[103] = (584, 1087, 122);
		level.spawns_zombies[104] = (511, 1414, 131);
		level.spawns_zombies[105] = (1553, 695, 43);
		level.spawns_zombies[106] = (1420, 443, 45);
	}
	else if(map == "mp_waw_castle")
	{
		level.spawns_humans[0] = (1438, -2151, -175);
		level.spawns_zombies[0] = (1604, -2918, -189);
		level.spawns_zombies[1] = (1515, -2662, -192);
		level.spawns_zombies[2] = (1863, -2246, -219);
		level.spawns_zombies[3] = (1665, -2167, -227);
		level.spawns_zombies[4] = (1386, -2399, -200);
		level.spawns_zombies[5] = (1246, -2045, -227);
		level.spawns_zombies[6] = (888, -1895, -211);
		level.spawns_zombies[7] = (445, -2032, -203);
		level.spawns_zombies[8] = (521, -2369, -204);
		level.spawns_zombies[9] = (380, -2957, -205);
		level.spawns_zombies[10] = (767, -2868, -200);
		level.spawns_zombies[11] = (501, -3154, -168);
		level.spawns_zombies[12] = (1224, -3146, -172);
		level.spawns_zombies[13] = (1534, -3160, -174);
		level.spawns_zombies[14] = (2144, -3138, -180);
		level.spawns_zombies[15] = (1835, -2790, -209);
		level.spawns_zombies[16] = (2076, -2740, -210);
		level.spawns_zombies[17] = (2660, -3144, -104);
		level.spawns_zombies[18] = (2777, -2888, -207);
		level.spawns_zombies[19] = (2821, -2625, -207);
		level.spawns_zombies[20] = (3117, -2822, -207);
		level.spawns_zombies[21] = (3557, -2518, -207);
		level.spawns_zombies[22] = (3355, -2844, -207);
		level.spawns_zombies[23] = (3904, -2688, -197);
		level.spawns_zombies[24] = (2550, -2607, 22);
		level.spawns_zombies[25] = (2738, -2605, 22);
		level.spawns_zombies[26] = (3175, -2395, -205);
		level.spawns_zombies[27] = (3460, -2167, -254);
		level.spawns_zombies[28] = (3874, -2221, -253);
		level.spawns_zombies[29] = (3891, -1831, -262);
		level.spawns_zombies[30] = (3758, -1676, -331);
		level.spawns_zombies[31] = (3711, -1458, -395);
		level.spawns_zombies[32] = (3811, -1227, -404);
		level.spawns_zombies[33] = (3473, -1438, -385);
		level.spawns_zombies[34] = (3521, -1173, -405);
		level.spawns_zombies[35] = (4070, -1101, -424);
		level.spawns_zombies[36] = (4422, -611, -353);
		level.spawns_zombies[37] = (4425, -338, -372);
		level.spawns_zombies[38] = (3916, -592, -519);
		level.spawns_zombies[39] = (3453, -748, -511);
		level.spawns_zombies[40] = (3413, -965, -463);
		level.spawns_zombies[41] = (3029, -1015, -567);
		level.spawns_zombies[42] = (2722, -1268, -560);
		level.spawns_zombies[43] = (2725, -945, -566);
		level.spawns_zombies[44] = (2310, -1273, -560);
		level.spawns_zombies[45] = (2234, -1050, -558);
		level.spawns_zombies[46] = (3418, -187, -512);
		level.spawns_zombies[47] = (3265, -369, -512);
		level.spawns_zombies[48] = (4645, -366, -245);
		level.spawns_zombies[49] = (4607, -629, -249);
		level.spawns_zombies[50] = (4534, -882, -254);
		level.spawns_zombies[51] = (4497, -1072, -244);
		level.spawns_zombies[52] = (4564, -1960, -191);
		level.spawns_zombies[53] = (4364, -1801, -191);
		level.spawns_zombies[54] = (4929, -1147, -201);
		level.spawns_zombies[55] = (4932, -854, -200);
		level.spawns_zombies[56] = (4808, -2161, -238);
		level.spawns_zombies[57] = (4434, -2184, -242);
		level.spawns_zombies[58] = (2946, -378, -516);
		level.spawns_zombies[59] = (2446, -380, -481);
		level.spawns_zombies[60] = (2238, -193, -481);
		level.spawns_zombies[61] = (2715, -704, -495);
		level.spawns_zombies[62] = (2396, -610, -494);
		level.spawns_zombies[63] = (2057, -635, -446);
		level.spawns_zombies[64] = (1973, -369, -442);
		level.spawns_zombies[65] = (2114, 86, -454);
		level.spawns_zombies[66] = (2484, -10, -490);
		level.spawns_zombies[67] = (1571, -293, -443);
		level.spawns_zombies[68] = (1646, -729, -446);
		level.spawns_zombies[69] = (1791, -1184, -437);
		level.spawns_zombies[70] = (1553, -1213, -432);
		level.spawns_zombies[71] = (2062, -960, -447);
		level.spawns_zombies[72] = (2092, -1218, -430);
		level.spawns_zombies[73] = (2681, -1492, -415);
		level.spawns_zombies[74] = (1991, -1732, -373);
		level.spawns_zombies[75] = (1991, -1899, -286);
		level.spawns_zombies[76] = (2376, -2273, -230);
		level.spawns_zombies[77] = (2867, -2313, -245);
		level.spawns_zombies[78] = (2365, -1377, -392);
		level.spawns_zombies[79] = (1333, -1411, -431);
		level.spawns_zombies[80] = (1383, -909, -431);
		level.spawns_zombies[81] = (1620, -1370, -431);
		level.spawns_zombies[82] = (1043, -1278, -418);
		level.spawns_zombies[83] = (1172, -1132, -418);
		level.spawns_zombies[84] = (1114, -401, -440);
		level.spawns_zombies[85] = (845, -896, -421);
		level.spawns_zombies[86] = (813, -1181, -420);
		level.spawns_zombies[87] = (104, -1873, -206);
		level.spawns_zombies[88] = (244, -2494, -203);
		level.spawns_zombies[89] = (69, -2784, -203);
		level.spawns_zombies[90] = (1172, -1845, -229);
		level.spawns_zombies[91] = (1442, -1708, -229);
		level.spawns_zombies[92] = (1657, -1404, -263);
		level.spawns_zombies[93] = (1385, -971, -263);
		level.spawns_zombies[94] = (1279, -601, -175);
	}
	else if(map == "mp_invasion")
	{
		level.spawns_humans[0] = (-1668.17, -2328.7, 256.125);
	   level.spawns_zombies[0] = (-799.34, -1015.2, 293.125);
	   level.spawns_zombies[1] = (-653.802, -740.459, 251.322);
	   level.spawns_zombies[2] = (-415.787, -395.966, 252.32);
	   level.spawns_zombies[3] = (-319.649, 178.755, 248.125);
	   level.spawns_zombies[4] = (-616.925, 437.541, 248.125);
	   level.spawns_zombies[5] = (-433.286, 803.71, 248.125);
	   level.spawns_zombies[6] = (-559.736, 1282.4, 248.125);
	   level.spawns_zombies[7] = (-811.563, 1135.53, 248.125);
	   level.spawns_zombies[8] = (-1107.56, -728.101, 264.125);
	   level.spawns_zombies[9] = (-1032.58, -1124.93, 253.724);
	   level.spawns_zombies[10] = (-1011.94, -1627.52, 255.715);
	   level.spawns_zombies[11] = (-789.34, -1983.13, 257.247);
	   level.spawns_zombies[12] = (-554.847, -1825.16, 264.125);
	   level.spawns_zombies[13] = (-65.7109, -1690.64, 264.125);
	   level.spawns_zombies[14] = (285.775, -2015.69, 292.424);
	   level.spawns_zombies[15] = (-58.7549, -2202.33, 291.239);
	   level.spawns_zombies[16] = (-128.513, -2470.11, 256.125);
	   level.spawns_zombies[17] = (-776.047, -2548.28, 256.125);
	   level.spawns_zombies[18] = (-1091.02, -2298.97, 264.125);
	   level.spawns_zombies[19] = (-1239.32, -2546.26, 266.125);
	   level.spawns_zombies[20] = (-1011.64, -2982.56, 266.125);
	   level.spawns_zombies[21] = (-1415.48, -2769.22, 266.125);
	   level.spawns_zombies[22] = (-1472.33, -3169.99, 256.418);
	   level.spawns_zombies[23] = (-1949.75, -3376.26, 255.587);
	   level.spawns_zombies[24] = (-2533.11, -3293.63, 256.125);
	   level.spawns_zombies[25] = (-2797.04, -3586.81, 264.947);
	   level.spawns_zombies[26] = (-2337.77, -2984.37, 408.125);
	   level.spawns_zombies[27] = (-1967.99, -2983.84, 435.254);
	   level.spawns_zombies[28] = (-2928.41, -2443.84, 416.125);
	   level.spawns_zombies[29] = (-2905.36, -2020.16, 416.125);
	   level.spawns_zombies[30] = (-3328.77, -2080.03, 256.125);
	   level.spawns_zombies[31] = (-3181.9, -2347.97, 256.125);
	   level.spawns_zombies[32] = (-3468.34, -2649.5, 256.125);
	   level.spawns_zombies[33] = (-3024.11, -2782.15, 256.125);
	   level.spawns_zombies[34] = (-2611.87, -2861.93, 257.254);
	   level.spawns_zombies[35] = (-2567.8, -2562.18, 360.125);
	   level.spawns_zombies[36] = (-2596.61, -1971.35, 256.125);
	   level.spawns_zombies[37] = (-2711.31, -1459.07, 256.125);
	   level.spawns_zombies[38] = (-2855.75, -1167.92, 359.596);
	   level.spawns_zombies[39] = (-3167.12, -1276.6, 470.662);
	   level.spawns_zombies[40] = (-2282.28, -1896.47, 268.125);
	   level.spawns_zombies[41] = (-2068, -2220.42, 268.125);
	   level.spawns_zombies[42] = (-2364.18, -1593.85, 268.125);
	   level.spawns_zombies[43] = (-2186.51, -1491.15, 268.125);
	   level.spawns_zombies[44] = (-2239.83, -1151.87, 260.438);
	   level.spawns_zombies[45] = (-2401.89, -795.971, 272.125);
	   level.spawns_zombies[46] = (-2137.47, -585.142, 272.125);
	   level.spawns_zombies[47] = (-1836.68, -610.227, 272.125);
	   level.spawns_zombies[48] = (-1791, -997.678, 258.758);
	   level.spawns_zombies[49] = (-1413.38, -834.638, 267.463);
	   level.spawns_zombies[50] = (-911.295, -880.05, 254.922);
	   level.spawns_zombies[51] = (-395.555, -673.733, 256.125);
	   level.spawns_zombies[52] = (-580.023, -97.9074, 249.164);
	   level.spawns_zombies[53] = (-775.296, 515.724, 256.125);
	   level.spawns_zombies[54] = (-564.494, 777.555, 311.046);
	   level.spawns_zombies[55] = (56.5044, -343.207, 233.809);
	   level.spawns_zombies[56] = (414.511, -623.279, 255.556);
	   level.spawns_zombies[57] = (190.731, -973.896, 361.725);
	   level.spawns_zombies[58] = (304.641, -1327.45, 286.078);
	   level.spawns_zombies[59] = (610.286, -1429.95, 288.125);
	   level.spawns_zombies[60] = (1071.84, -1165.02, 287.687);
	   level.spawns_zombies[61] = (1404.27, -723.524, 296.125);
	   level.spawns_zombies[62] = (1725.59, -954.105, 296.125);
	   level.spawns_zombies[63] = (1854.91, -1230.69, 296.125);
	   level.spawns_zombies[64] = (1990.88, -817.805, 296.125);
	   level.spawns_zombies[65] = (2295.78, -1081.67, 432.125);
	   level.spawns_zombies[66] = (1805.07, -1008.74, 432.125);
	   level.spawns_zombies[67] = (2248.03, -1675.15, 432.125);
	   level.spawns_zombies[68] = (1625.4, -1270.19, 432.125);
	   level.spawns_zombies[69] = (1330.29, -1662.42, 432.125);
	   level.spawns_zombies[70] = (1152.63, -1532.27, 432.125);
	   level.spawns_zombies[71] = (1369.17, -1084.13, 432.125);
	   level.spawns_zombies[72] = (1589.02, -861.093, 432.125);
	   level.spawns_zombies[73] = (903.094, -805.773, 432.125);
	   level.spawns_zombies[74] = (731.559, -1064.4, 432.125);
	   level.spawns_zombies[75] = (1125.7, -491.534, 432.125);
	   level.spawns_zombies[76] = (-185.183, -963.344, 267.122);
	   level.spawns_zombies[77] = (-1241.24, -1479.32, 270.125);
	   level.spawns_zombies[78] = (-1447.84, -1521.68, 270.125);
	   level.spawns_zombies[79] = (-1352.29, -1991.89, 270.125);
	   thread Fx_Fire((-1359.88, -1815.82, 393.675));
	   thread Fx_Fire((-1374.8, -1728.07, 399.419));
	   thread Fx_Fire((-1407.92, -1525.55, 411.333));
	   thread Fx_Fire((-1389.12, -1626.49, 408.099));
	   level.spawns_zombies[81] = (-1419.25, -2517.72, 266.125);
	   level.spawns_zombies[82] = (-1845.4, -1886.72, 250.425);
	   level.spawns_zombies[83] = (-1904.76, -1405.11, 269.476);
	   level.spawns_zombies[84] = (-1550.04, -1346.93, 270.125);
	   level.spawns_zombies[85] = (-1933.78, -2981.06, 272.125);
	   level.spawns_zombies[86] = (-2343.05, -2961.69, 272.125);
	   level.spawns_zombies[87] = (-2147.39, -3042.42, 418.094);
	   level.spawns_zombies[88] = (-1647.24, -3806.63, 264.125);
	   level.spawns_zombies[89] = (-1115.15, -3772.78, 258.393);
	   level.spawns_zombies[90] = (-1017.99, -3436.07, 273.049);
	   level.spawns_zombies[91] = (-760.309, -3127.62, 252.35);
	   level.spawns_zombies[92] = (-1532.75, -3696.92, 448.125);
	   level.spawns_zombies[93] = (-1357.33, -3552.92, 448.125);
	   level.spawns_zombies[94] = (-828.284, -3536.64, 384.125);
	   level.spawns_zombies[95] = (-858.126, -3678.42, 384.125);
	   level.spawns_zombies[96] = (-575.758, -3686.92, 279.015);
	   level.spawns_zombies[97] = (-345.083, -2975.47, 265.755);
	   level.spawns_zombies[98] = (-391.152, -2452.73, 256.125);
	   level.spawns_zombies[99] = (53.372, -2989.92, 272.125);
	   level.spawns_zombies[100] = (533.015, -2995.51, 239.33);
	   level.spawns_zombies[101] = (913.821, -3307.37, 263.227);
	   level.spawns_zombies[102] = (575.001, -3663.8, 243.288);
	   level.spawns_zombies[103] = (63.5461, -3727.57, 242.929);
	   level.spawns_zombies[104] = (1245.95, -2946.3, 306.125);
	   level.spawns_zombies[105] = (1224.16, -2655.21, 306.125);
	   level.spawns_zombies[106] = (986.454, -2199.89, 288.125);
	   level.spawns_zombies[107] = (1431.49, -2277.65, 288.125);
	   level.spawns_zombies[108] = (1648.81, -1874.64, 288.125);
	   level.spawns_zombies[109] = (1927.25, -1520.09, 296.125);
	   level.spawns_zombies[80] = (2127.46, -1422.72, 296.125);
	}
	else if(map == "mp_storm")
	{
		level.spawns_humans[0] = (637.22, -1287.66, -7.875);
	   level.spawns_zombies[0] = (1972.4, -1000.83, -7.875);
	   level.spawns_zombies[1] = (1847.93, -1216.12, -54.9773);
	   level.spawns_zombies[2] = (2412.58, -1260.83, -61.1417);
	   level.spawns_zombies[3] = (1776.34, -1548.07, -1.375);
	   level.spawns_zombies[4] = (1595.74, -1627.16, 0.124999);
	   level.spawns_zombies[5] = (1303.76, -1581.54, 0.124999);
	   level.spawns_zombies[6] = (1220, -1731.46, 0.125001);
	   level.spawns_zombies[7] = (773.45, -2080.46, -7.875);
	   level.spawns_zombies[8] = (292.087, -2025.77, -7.875);
	   level.spawns_zombies[9] = (326.667, -1387.81, -7.875);
	   level.spawns_zombies[10] = (523.403, -1614.46, 152.625);
	   level.spawns_zombies[11] = (523.413, -1809.15, 152.625);
	  level.spawns_zombies[12] = (182.355, -1312.36, -7.875);
	  level.spawns_zombies[13] = (-251.842, -1681.69, 16.125);
	   level.spawns_zombies[14] = (-417.148, -1853.62, 16.125);
	   level.spawns_zombies[15] = (-821.587, -1843.85, 136.125);
	   level.spawns_zombies[16] = (-802.572, -1283.01, 136.125);
	   level.spawns_zombies[17] = (-996.332, -930.815, 128.125);
	   level.spawns_zombies[18] = (-1380.7, -1070.17, 127.125);
	   level.spawns_zombies[19] = (-1531.15, -896.795, 127.379);
	   level.spawns_zombies[20] = (-1666.88, -1229.14, -8.44975);
	   level.spawns_zombies[21] = (-1387.26, -1555.51, -7.87516);
	   level.spawns_zombies[22] = (-1169.82, -1272.01, 0.117028);
	   level.spawns_zombies[23] = (-886.279, -1286.14, 0.124999);
	   level.spawns_zombies[24] = (-565.588, -1482.06, -7.875);
	  level.spawns_zombies[25] = (-230.24, -1373.2, -7.875);
	   level.spawns_zombies[26] = (137.868, -739.343, -7.875);
	   level.spawns_zombies[27] = (-169.17, -964.321, -6.875);
	   level.spawns_zombies[28] = (-589.646, -747.345, -6.875);
	   level.spawns_zombies[29] = (-1092.01, -660.234, -7.875);
	  level.spawns_zombies[30] = (-1302.42, -356.444, -7.875);
	   level.spawns_zombies[31] = (-1657.55, -45.9218, 17.9513);
	   level.spawns_zombies[32] = (-1847.95, -332.441, -9.19817);
	   level.spawns_zombies[33] = (-2295.04, 23.0924, 1.29251);
	   level.spawns_zombies[34] = (-1710.77, 245.188, -7.875);
	   level.spawns_zombies[35] = (-1717.82, 657.307, 0.124999);
	   level.spawns_zombies[36] = (-1729.53, 998.642, -7.875);
	   level.spawns_zombies[37] = (-1189.56, 1140.74, -7.875);
	   level.spawns_zombies[38] = (-845.799, 1584.92, 124.67);
	   level.spawns_zombies[39] = (-1190.36, 1628.74, 136.389);
	   level.spawns_zombies[40] = (-984.421, 1992.9, 159.175);
	   level.spawns_zombies[41] = (-1412.77, 838.183, 132.865);
	   level.spawns_zombies[42] = (-1590.16, 588.008, 137.593);
	   level.spawns_zombies[43] = (-1755.01, 725.406, 128.125);
	   level.spawns_zombies[44] = (-1920.58, 505.703, 128.125);
	   level.spawns_zombies[45] = (-1931.06, 845.718, 0.125004);
	   level.spawns_zombies[46] = (-1002.95, 352.668, -7.875);
	   level.spawns_zombies[47] = (-861.113, 949.005, -7.76745);
	   level.spawns_zombies[48] = (-447.516, 1221.25, -7.87752);
	   level.spawns_zombies[49] = (-123.341, 851.259, 109.125);
	   level.spawns_zombies[50] = (-457.129, 818.283, 99.125);
	   level.spawns_zombies[51] = (37.2968, 664.543, 99.125);
	   level.spawns_zombies[52] = (394.638, 726.501, -7.875);
	   level.spawns_zombies[53] = (303.437, 1078.69, -7.875);
	   level.spawns_zombies[54] = (-220.367, 976.862, -7.875);
	   level.spawns_zombies[55] = (715.974, 1364.48, -7.875);
	   level.spawns_zombies[56] = (1416.67, 1234.14, -7.87528);
	   level.spawns_zombies[57] = (1661.75, 936.114, 0.124998);
	   level.spawns_zombies[58] = (1704.89, 504.745, -7.7638);
	   level.spawns_zombies[59] = (1690.82, 239.604, 0.125001);
	   level.spawns_zombies[60] = (1804.61, -46.1372, -7.875);
	   level.spawns_zombies[61] = (1351.7, -34.4079, -63.875);
	   level.spawns_zombies[62] = (1131.22, 451.631, -7.875);
	   level.spawns_zombies[63] = (763.121, 761.26, 0.125001);
	   level.spawns_zombies[64] = (1010.66, 1081.49, -7.875);
	   level.spawns_zombies[65] = (714.573, 1017.96, 128.125);
	   level.spawns_zombies[66] = (805.404, 600.274, 128.125);
	   level.spawns_zombies[67] = (576.128, 223.905, 136.125);
	   level.spawns_zombies[68] = (1008.31, 292.988, 0.125001);
	   level.spawns_zombies[69] = (975.982, -56.8358, 0.125001);
	   level.spawns_zombies[70] = (874.263, -488.225, 0.125001);
	   level.spawns_zombies[71] = (823.13, -786.697, 0.125001);
	   level.spawns_zombies[72] = (428.157, -749.05, 0.125001);
	   level.spawns_zombies[73] = (293.26, -432.571, 128.125);
	   level.spawns_zombies[74] = (316.595, -635.968, 134.125);
	   level.spawns_zombies[75] = (-598.225, -550.276, 128.125);
	   level.spawns_zombies[76] = (-524.135, -96.0861, 0.125);
	   level.spawns_zombies[77] = (-864.342, -111.124, -0.86403);
	   level.spawns_zombies[78] = (-662.868, 209.218, 1.125);
	   level.spawns_zombies[79] = (-226.331, -268.54, 0.124997);
	   level.spawns_zombies[80] = (-33.4941, -205.544, 108.125);
	   level.spawns_zombies[81] = (175.117, -17.7508, 108.125);
	   level.spawns_zombies[82] = (-642.23, 159.51, 100.125);
	   level.spawns_zombies[83] = (-63.4368, 327.746, 136.125);
	   level.spawns_zombies[84] = (302.563, 329.035, 134.816);
	   level.spawns_zombies[85] = (454.545, -290.311, 0.124998);
	   level.spawns_zombies[86] = (72.2635, 27.8617, 0.124998);
	   level.spawns_zombies[87] = (-336.774, 117.682, 0.124998);
	   level.spawns_zombies[88] = (1058.88, -1248.83, -8.71103);
	   level.spawns_zombies[89] = (1504.83, -828.179, -63.8849);
	   level.spawns_zombies[90] = (1466.89, -265.669, -63.875);
	}
	else if(map == "mp_abandon")
	{
		level.spawns_humans[0] = (1503.6, 275.565, 27.2229);
	   level.spawns_zombies[0] = (1665.59, -2488.99, -8.00885);
	   level.spawns_zombies[1] = (2003.11, -2061.75, -32.3763);
	   level.spawns_zombies[2] = (2423.72, -2248.42, -35.4731);
	   level.spawns_zombies[3] = (2143.42, -2648.18, 6.28116);
	   level.spawns_zombies[4] = (2842.78, -2231.03, -52.3408);
	   level.spawns_zombies[5] = (3231.62, -1952.42, -60.5195);
	   level.spawns_zombies[6] = (3040.95, -1651.69, -20.2944);
	   level.spawns_zombies[7] = (2762.85, -1343.54, -0.720896);
	   level.spawns_zombies[8] = (2376.95, -1059.63, -20.5774);
	   level.spawns_zombies[9] = (2432.4, -1518.67, -21.1439);
	   level.spawns_zombies[10] = (2806.23, -963.454, -40.5173);
	   level.spawns_zombies[11] = (3006.47, -299.512, -56.2374);
	   level.spawns_zombies[12] = (2623.88, -386.517, -37.875);
	   level.spawns_zombies[13] = (2971.78, 171.814, 90.9446);
	   level.spawns_zombies[14] = (2713.67, 341.798, 128.125);
	   level.spawns_zombies[15] = (2450.61, 529.702, 128.125);
	   level.spawns_zombies[16] = (2071.81, 738.457, 128.125);
	   level.spawns_zombies[17] = (1924.4, 595.347, 128.125);
	   level.spawns_zombies[18] = (1999.86, 279.226, 126.125);
	   level.spawns_zombies[19] = (2238.61, 98.3706, 126.125);
	   level.spawns_zombies[20] = (1742.09, 1124.51, -62.8621);
	   level.spawns_zombies[21] = (1336.26, 1084.23, -20.3989);
	   level.spawns_zombies[22] = (976.163, 1302.32, -1.32273);
	   level.spawns_zombies[23] = (922.99, 1845.94, -3.875);
	   level.spawns_zombies[24] = (444.135, 1826.03, 10.1282);
	   level.spawns_zombies[25] = (73.1219, 1296.92, -31.875);
	   level.spawns_zombies[26] = (385.693, 1145.7, -63.875);
	   level.spawns_zombies[27] = (1234.9, 1700.84, -41.4218);
	   level.spawns_zombies[28] = (1738.44, 1905.01, -63.875);
	   level.spawns_zombies[29] = (2004.36, 2357.42, -63.875);
	   level.spawns_zombies[30] = (1631.46, 2236.7, -3.875);
	   level.spawns_zombies[31] = (1420.17, 1896.8, -3.875);
	   level.spawns_zombies[32] = (1063.12, 2105.49, -3.875);
	   level.spawns_zombies[33] = (1298.31, 2465.97, -3.875);
	   level.spawns_zombies[34] = (1459.82, 2222.77, 39.4961);
	   level.spawns_zombies[35] = (1105.11, 1019.28, 22.125);
	   level.spawns_zombies[36] = (1238.79, 776.136, 24.125);
	   level.spawns_zombies[37] = (2185.99, 1702.26, 190.75);
	   level.spawns_zombies[38] = (2469.41, 1353.21, -61.875);
	   level.spawns_zombies[39] = (2699.03, 1116.13, -62.6832);
	   level.spawns_zombies[40] = (3277.37, 840.72, -57.1665);
	   level.spawns_zombies[41] = (3004.7, 532.102, -53.2417);
	   level.spawns_zombies[42] = (2417.29, 761.099, -61.875);
	   level.spawns_zombies[43] = (2167.53, 953.896, -63.875);
	   level.spawns_zombies[44] = (2015.52, 826.717, -63.875);
	   level.spawns_zombies[45] = (1915.63, 591.753, -39.875);
	   level.spawns_zombies[46] = (2250.16, 392.53, -63.875);
	   level.spawns_zombies[47] = (3411.74, 247.337, -63.5853);
	   level.spawns_zombies[48] = (3799.77, 232.285, -31.0473);
	   level.spawns_zombies[49] = (2610.59, -1730.9, 6.06301);
	   level.spawns_zombies[50] = (2059.44, -1630.01, 200.423);
	   level.spawns_zombies[51] = (2408.18, -1172.37, 120.064);
	   level.spawns_zombies[52] = (2644.72, -866.685, 302.4);
	   level.spawns_zombies[53] = (2821.7, -677.204, 219.767);
	  level.spawns_zombies[54] = (1469.57, -666.289, -67.978);
	  level.spawns_zombies[55] = (1372.57, -1006.79, -67.875);
	  level.spawns_zombies[56] = (936.666, -653.852, -63.875);
	  level.spawns_zombies[57] = (819.612, -877.549, -135.875);
	  level.spawns_zombies[58] = (1245.71, -1197.18, -135.875);
	  level.spawns_zombies[59] = (789.522, -1253.28, -63.875);
	  level.spawns_zombies[60] = (913.465, -1671.08, -65.875);
	  level.spawns_zombies[61] = (1003.21, -1420.58, 84.125);
	  level.spawns_zombies[62] = (609.182, -1117.19, 80.125);
	  level.spawns_zombies[63] = (200.277, -1235.28, 82.125);
	  level.spawns_zombies[64] = (-68.3291, -1171.57, 80.125);
	  level.spawns_zombies[65] = (42.468, -1545.98, 56.125);
	  level.spawns_zombies[66] = (349.502, -1733.55, -55.875);
	  level.spawns_zombies[67] = (163.018, -1922.67, -57.875);
	  level.spawns_zombies[68] = (551.471, -2219.77, -57.9176);
	  level.spawns_zombies[69] = (128.913, -1344.68, -57.875);
	  level.spawns_zombies[70] = (-176.068, -1103.63, -63.875);
	  level.spawns_zombies[71] = (-703.478, -1191.6, -63.8751);
	  level.spawns_zombies[72] = (-1056.23, -962.315, -63.877);
	  level.spawns_zombies[73] = (-1148.01, -829.638, -63.875);
	  level.spawns_zombies[74] = (-729.198, -301.827, -63.875);
	  level.spawns_zombies[75] = (-411.941, -154.915, -63.875);
	  level.spawns_zombies[76] = (-214.897, -363.374, -63.875);
	  level.spawns_zombies[77] = (-410.636, -869.144, -71.875);
	  level.spawns_zombies[78] = (-660.873, 53.99, -62.875);
	  level.spawns_zombies[79] = (-820.753, 39.9056, -61.9044);
	  level.spawns_zombies[80] = (-656.824, 364.973, -68.7998);
	 level.spawns_zombies[81] = (-827.435, 837.326, -63.875);
	  level.spawns_zombies[82] = (-682.714, 1300.07, -63.875);
	  level.spawns_zombies[83] = (-108.056, 1153.36, -63.875);
	  level.spawns_zombies[84] = (-358.524, 871.444, -38.9874);
	  level.spawns_zombies[85] = (15.4741, 751.4, -67.875);
	  level.spawns_zombies[86] = (94.9054, 193.304, -67.875);
	  level.spawns_zombies[87] = (545.535, 199.699, -67.875);
	  level.spawns_zombies[88] = (713.103, 595.757, -63.2551);
	  level.spawns_zombies[89] = (1191.96, 330.002, -69.7519);
	  level.spawns_zombies[90] = (1495.53, 628.139, -67.875);
	  level.spawns_zombies[91] = (1866.41, 157.039, -67.875);
	  level.spawns_zombies[92] = (2266, -33.7139, -61.875);
	  level.spawns_zombies[93] = (1974.74, -570.546, -63.875);
	  level.spawns_zombies[94] = (1264.02, -362.138, -67.875);
	}
	else if(map == "mp_compact")
	{
		level.spawns_humans[0] = (1873.64, 1428.63, -13.1261);
		   level.spawns_zombies[0] = (188.615, 2283.99, 86.5345);
		   level.spawns_zombies[1] = (55.4639, 1801.55, 95.0582);
		   level.spawns_zombies[2] = (674.648, 2333.66, 58.6587);
		   level.spawns_zombies[3] = (583.061, 1883.8, 69.955);
		   level.spawns_zombies[4] = (34.0066, 2566.75, 142.125);
		   level.spawns_zombies[5] = (1063.17, 2164.99, 48.2698);
		   level.spawns_zombies[6] = (1058.86, 2853.23, 80.125);
		   level.spawns_zombies[7] = (1851.97, 2878.68, 31.0252);
		   level.spawns_zombies[8] = (1767.78, 3137.57, 52.67);
		   level.spawns_zombies[9] = (2315.17, 3113.54, 45.9759);
		   level.spawns_zombies[10] = (2237.77, 2592.26, 19.9121);
		   level.spawns_zombies[11] = (2679.26, 2792.25, 28.4756);
		   level.spawns_zombies[12] = (3099.89, 2763, 24.5516);
		   level.spawns_zombies[13] = (3514.45, 2705.92, 5.60894);
		   level.spawns_zombies[14] = (3520.5, 2078.6, -1.47501);
		   level.spawns_zombies[15] = (3961.71, 2087.19, -3.50097);
		   level.spawns_zombies[16] = (4185.94, 1900.46, 148.397);
		   level.spawns_zombies[17] = (3577.16, 1921.89, 131.466);
		   level.spawns_zombies[18] = (3209.82, 1916.64, 130.559);
		   level.spawns_zombies[19] = (2752.29, 1732.77, 11.3962);
		   level.spawns_zombies[20] = (2729.98, 1013.73, -5.00433);
		   level.spawns_zombies[21] = (2564.44, 1239.28, 68.125);
		   level.spawns_zombies[22] = (2439.61, 1286.38, 136.125);
		   level.spawns_zombies[23] = (2357.47, 1154.5, 136.125);
		   level.spawns_zombies[24] = (2809.98, 561.443, -7.875);
		   level.spawns_zombies[25] = (2466.85, 574.706, 0.267077);
		   level.spawns_zombies[26] = (2467.98, 197.254, -1.09495);
		   level.spawns_zombies[27] = (2353.27, -180.205, -1.47369);
		   level.spawns_zombies[28] = (2023.29, 130.031, 108.125);
		   level.spawns_zombies[29] = (2230.97, 210.841, 230.067);
		   level.spawns_zombies[30] = (2151.55, -0.210104, 228.595);
		   level.spawns_zombies[31] = (1700.65, 143.441, 4.37255);
		   level.spawns_zombies[32] = (1330.22, -170.498, -3.2722);
		   level.spawns_zombies[33] = (1417.86, -642.196, -3.52509);
		   level.spawns_zombies[34] = (1316.81, -1345.2, 1.65921);
		   level.spawns_zombies[35] = (990.048, -929.471, 13.9939);
		   level.spawns_zombies[36] = (1013.14, -661.806, 8.125);
		   level.spawns_zombies[37] = (1102.56, -259.447, 8.125);
		   level.spawns_zombies[38] = (349.741, -223.171, 8.125);
		   level.spawns_zombies[39] = (420.865, -1.38389, 1.3116);
		   level.spawns_zombies[40] = (868.948, -9.5545, 81.2108);
		   level.spawns_zombies[41] = (959.526, 6.26134, 88.125);
		   level.spawns_zombies[42] = (1260.98, -36.5931, 8.125);
		   level.spawns_zombies[43] = (995.527, 529.384, 48.125);
		   level.spawns_zombies[44] = (750.075, 911.231, 1.09296);
		   level.spawns_zombies[45] = (322.54, 914.961, -11.6867);
		   level.spawns_zombies[46] = (352.853, 473.926, -6.56168);
		   level.spawns_zombies[47] = (1129.25, 1089.02, -1.62623);
		   level.spawns_zombies[48] = (1669.62, 1028.29, -7.67023);
		   level.spawns_zombies[49] = (1816.49, 1716.42, 10.7006);
		   level.spawns_zombies[50] = (2280.71, 1932.36, -6.64437);
		   level.spawns_zombies[51] = (499.027, 1246.08, 7.64945);
		   level.spawns_zombies[52] = (736.324, 1619.48, 153.359);
		   level.spawns_zombies[53] = (1804.08, -473.203, 0.125002);
		   level.spawns_zombies[54] = (1640.96, -883.228, 1.83352);
		   level.spawns_zombies[55] = (2078.52, -1249.31, 90.325);
		   level.spawns_zombies[56] = (2101.95, -579.862, 136.125);
		   level.spawns_zombies[57] = (2476.52, -716.442, 136.125);
		   level.spawns_zombies[58] = (2366.47, -1029.76, 72.125);
		   level.spawns_zombies[59] = (2304.2, -447.433, 0.125001);
		   level.spawns_zombies[60] = (1716.36, 2069.56, 0.125);
		   level.spawns_zombies[61] = (2023.22, 2214.59, 0.125);
		   level.spawns_zombies[62] = (1713.01, 2343.79, 136.125);
		   level.spawns_zombies[63] = (1874.24, 2061.51, 136.125);
		
	}
	else if(map == "mp_complex")
	{
		level.spawns_humans[0] = (-152.447, -3453.59, 648.125);
		level.spawns_zombies[0] = (138.885, -2188.79, 820.125);
		  level.spawns_zombies[1] = (1.16408, -1971.58, 820.125);
		  level.spawns_zombies[2] = (-101.38, -2212.57, 816.125);
		  level.spawns_zombies[3] = (135.087, -2406.51, 816.125);
		  level.spawns_zombies[4] = (448.521, -2309.32, 820.125);
		  level.spawns_zombies[5] = (457.594, -2075.17, 760.125);
		  level.spawns_zombies[6] = (901.957, -2124.83, 672.125);
		  level.spawns_zombies[7] = (1126.51, -2404.94, 672.125);
		  level.spawns_zombies[8] = (585.228, -2498.65, 672.125);
		  level.spawns_zombies[9] = (-46.0569, -2553.51, 672.125);
		  level.spawns_zombies[10] = (-225.034, -1939.83, 672.125);
		  level.spawns_zombies[11] = (-610.709, -1763.84, 672.125);
		  level.spawns_zombies[12] = (-919.391, -1802.84, 672.125);
		  level.spawns_zombies[13] = (-1278.76, -1716.98, 674.125);
		  level.spawns_zombies[14] = (-1588.97, -2051.21, 672.125);
		  level.spawns_zombies[15] = (-1460.64, -2764.76, 672.125);
		  level.spawns_zombies[16] = (-1837.8, -2903.22, 673.125);
		  level.spawns_zombies[17] = (-2176.75, -2488.39, 672.125);
		  level.spawns_zombies[18] = (-2794.81, -2168.81, 680.125);
		  level.spawns_zombies[19] = (-1896.23, -1837.05, 672.125);
		  level.spawns_zombies[20] = (-983.797, -1534.72, 672.125);
		  level.spawns_zombies[21] = (-498.954, -1512.57, 672.125);
		  level.spawns_zombies[22] = (-18.1837, -1872.01, 672.125);
		  level.spawns_zombies[23] = (207.845, -2257.22, 672.125);
		  level.spawns_zombies[24] = (194.367, -2933.28, 648.125);
		  level.spawns_zombies[25] = (217.062, -3418.54, 652.125);
		  level.spawns_zombies[26] = (-635.262, -3471.04, 652.125);
		  level.spawns_zombies[27] = (-360.406, -2819.25, 652.125);
		  level.spawns_zombies[28] = (-282.348, -3017.01, 794.125);
		  level.spawns_zombies[29] = (-1269.73, -3298.06, 920.434);
		  level.spawns_zombies[30] = (-1601.47, -3238.63, 672.125);
		  level.spawns_zombies[31] = (-1712.33, -3559.03, 768.125);
		  level.spawns_zombies[32] = (-1406.74, -3559.43, 848.125);
		  level.spawns_zombies[66] = (-1449.97, -3134.62, 848.125);
		  level.spawns_zombies[33] = (-1740.86, -3043.22, 848.125);
		  level.spawns_zombies[34] = (-960.562, -3596.37, 848.125);
		  level.spawns_zombies[35] = (-897.634, -3902.63, 848.125);
		  level.spawns_zombies[36] = (-715.705, -3795.65, 848.125);
		  level.spawns_zombies[37] = (-201.373, -3783.87, 848.125);
		  level.spawns_zombies[38] = (325.778, -3783.49, 848.125);
		  level.spawns_zombies[39] = (288.002, -3978.83, 848.125);
		  level.spawns_zombies[40] = (639.746, -3443.33, 848.125);
		  level.spawns_zombies[41] = (501.278, -3921.18, 848.125);
		  level.spawns_zombies[42] = (794.476, -4230.65, 880.125);
		  level.spawns_zombies[43] = (432.209, -4227.19, 880.125);
		  level.spawns_zombies[44] = (945.739, -4119.05, 600.125);
		  level.spawns_zombies[45] = (775.238, -3362.02, 600.125);
		  level.spawns_zombies[46] = (784.95, -3895.33, 600.125);
		  level.spawns_zombies[47] = (1238.27, -4132.4, 600.125);
		  level.spawns_zombies[48] = (1534.12, -4102.88, 600.125);
		  level.spawns_zombies[49] = (1912.52, -3932.8, 600.125);
		  level.spawns_zombies[50] = (2278.97, -3877.93, 600.125);
		  level.spawns_zombies[51] = (2492.7, -3512.24, 600.125);
		  level.spawns_zombies[52] = (2128.37, -3157.08, 568.332);
		  level.spawns_zombies[53] = (2783.41, -2901.36, 600.125);
		  level.spawns_zombies[54] = (2063.7, -2758.81, 600.125);
		  level.spawns_zombies[55] = (2243.41, -2229.91, 600.125);
		  level.spawns_zombies[56] = (2504.99, -2449.6, 600.125);
		  level.spawns_zombies[57] = (2726.03, -2416.85, 748.125);
		  level.spawns_zombies[58] = (2430.75, -2331.1, 748.125);
		  level.spawns_zombies[59] = (1854.76, -2108.78, 592.125);
		  level.spawns_zombies[60] = (1262.84, -2105.58, 672.125);
		  level.spawns_zombies[61] = (1131.94, -1597.29, 480.125);
		  level.spawns_zombies[62] = (1778.94, -1479.32, 400.125);
		  level.spawns_zombies[63] = (1940.23, -1963.47, 488.125);
		  level.spawns_zombies[64] = (2222.34, -1985.66, 592.125);
		  level.spawns_zombies[65] = (-1219.48, -3314.71, 672.125);
	}
	else if(map == "mp_overgrown")
	{
		level.spawns_humans[0] = (323.545, -2410.08, -325.215);
		level.spawns_zombies[0] = (-733.513, -2193.13, 0.124999);
		 level.spawns_zombies[1] = (-503.96, -1865.12, 0.124999);
		  level.spawns_zombies[2] = (-290.697, -2018.69, 0.124999);
		  level.spawns_zombies[3] = (-216.483, -1897.12, 0.124999);
		  level.spawns_zombies[4] = (-391.92, -1697.94, -135.875);
		  level.spawns_zombies[5] = (-526.163, -2332.19, 0.125001);
		  level.spawns_zombies[6] = (-353.847, -2019.62, -135.875);
		  level.spawns_zombies[7] = (-452.928, -1925.55, -135.875);
		  level.spawns_zombies[8] = (-696.722, -2189.22, -135.875);
		  level.spawns_zombies[9] = (-446.254, -2403.63, -135.875);
		  level.spawns_zombies[10] = (-767.277, -1873.89, -152.288);
		  level.spawns_zombies[11] = (-905.318, -1414.89, -186.513);
		  level.spawns_zombies[12] = (-1147.34, -1366.6, -183.875);
		  level.spawns_zombies[13] = (-1426.96, -1110.15, -179.875);
		  level.spawns_zombies[14] = (-1788.92, -788.047, -183.616);
		  level.spawns_zombies[15] = (-2082.16, -1849.42, -179.602);
		  level.spawns_zombies[16] = (-2064.54, -2057.04, -179.875);
		  level.spawns_zombies[17] = (-1904.51, -3086.23, -165.659);
		  level.spawns_zombies[18] = (-1517.17, -2849.58, -169.021);
		  level.spawns_zombies[19] = (-1515.18, -3451.32, -120.706);
		  level.spawns_zombies[20] = (-1600.76, -4133.26, -121.023);
		  level.spawns_zombies[21] = (-1673.58, -4960.29, -152.07);
		  level.spawns_zombies[22] = (-1012.76, -4884.53, -153.526);
		  level.spawns_zombies[23] = (-606.349, -4921.36, -169.497);
		  level.spawns_zombies[24] = (-490.038, -5114.25, -164.777);
		  level.spawns_zombies[25] = (19.5834, -5191.54, -285.455);
		  level.spawns_zombies[26] = (-385.219, -4752.01, -142.808);
		  level.spawns_zombies[27] = (31.4627, -4205.47, -283.909);
		  level.spawns_zombies[28] = (495.245, -4567.41, -204.289);
		  level.spawns_zombies[29] = (907.243, -4330.71, -161.063);
		  level.spawns_zombies[30] = (736.08, -4075.17, -151.387);
		  level.spawns_zombies[31] = (124.43, -3966.76, -163.875);
		  level.spawns_zombies[32] = (-530.162, -3979.6, -133.766);
		  level.spawns_zombies[33] = (-512.232, -4413.58, -134.617);
		  level.spawns_zombies[34] = (-734.628, -5208.18, 60.125);
		  level.spawns_zombies[35] = (-550.456, -5183.73, 42.8157);
		  level.spawns_zombies[36] = (-727.561, -3685.16, -107.875);
		  level.spawns_zombies[37] = (-564.195, -3704.54, -87.7729);
		  level.spawns_zombies[38] = (-559.078, -3452.82, -92.1555);
		  level.spawns_zombies[39] = (-907.837, -3623.15, -107.875);
		  level.spawns_zombies[40] = (-1003.1, -3684.81, 28.125);
		  level.spawns_zombies[41] = (-738.653, -3694.59, 28.125);
		  level.spawns_zombies[42] = (-949.339, -3435.38, 28.125);
		  level.spawns_zombies[43] = (-771.011, -3206.36, -114.278);
		  level.spawns_zombies[44] = (-1462.8, -3103.18, -147.121);
		  level.spawns_zombies[45] = (-1855.07, -3310.23, -139.059);
		  level.spawns_zombies[46] = (-981.227, -2176.39, -186.458);
		  level.spawns_zombies[47] = (-1247.18, -1734.76, -179.875);
		  level.spawns_zombies[48] = (-440.762, -1601.76, -156.185);
		  level.spawns_zombies[49] = (136.046, -1621.64, -180.099);
		  level.spawns_zombies[50] = (308.973, -856.714, -181.133);
		  level.spawns_zombies[51] = (336.783, -144.995, -167.875);
		  level.spawns_zombies[52] = (318.001, 602.812, -171.909);
		  level.spawns_zombies[53] = (-134.111, 689.889, -171.095);
		  level.spawns_zombies[54] = (-110.232, 199.41, -177.515);
		  level.spawns_zombies[55] = (-477.555, 315.966, -175.875);
		  level.spawns_zombies[56] = (-580.317, 26.2896, -175.875);
		  level.spawns_zombies[57] = (-804.788, 192.049, -175.875);
		  level.spawns_zombies[58] = (-554.669, -279.638, -183.875);
		  level.spawns_zombies[59] = (-301.883, -952.281, -181.556);
		  level.spawns_zombies[60] = (221.284, -1074.58, -179.647);
		  level.spawns_zombies[61] = (539, -1259.77, -180.516);
		  level.spawns_zombies[62] = (381.486, -1701.41, -164.005);
		  level.spawns_zombies[63] = (569.669, -1489.08, -163.875);
		  level.spawns_zombies[64] = (796.914, -1902.69, -339.875);
		  level.spawns_zombies[65] = (1024.74, -1237.64, -348.762);
		  level.spawns_zombies[66] = (1292.68, -562.445, -304.34);
		  level.spawns_zombies[67] = (1285.04, -81.2629, -308.111);
		 level.spawns_zombies[68] = (802.196, 412.808, -176.211);
		  level.spawns_zombies[69] = (796.889, -204.866, -140.535);
		  level.spawns_zombies[70] = (1692.31, -552.906, -117.553);
		  level.spawns_zombies[71] = (1694.9, -139.3, -83.4597);
		  level.spawns_zombies[72] = (1889.95, -479.408, -136.303);
		  level.spawns_zombies[73] = (2489.57, -621.288, -135.124);
		  level.spawns_zombies[74] = (2509.17, -1132.03, -153.612);
		  level.spawns_zombies[75] = (2549.71, -1553.62, -167.875);
		  level.spawns_zombies[76] = (2627.07, -2011.31, -166.274);
		  level.spawns_zombies[77] = (2761.9, -2217.25, -143.875);
		  level.spawns_zombies[78] = (2495.92, -2509.56, -143.875);
		  level.spawns_zombies[79] = (1992.4, -2456.97, -167.875);
		  level.spawns_zombies[80] = (2093.4, -2940.96, -180.663);
		  level.spawns_zombies[81] = (2773.94, -2875.25, -175.875);
		  level.spawns_zombies[82] = (3335.4, -2965.44, -120.507);
		  level.spawns_zombies[83] = (3313.54, -3542.07, -119.441);
		  level.spawns_zombies[84] = (2927.59, -3933.99, -109.962);
		  level.spawns_zombies[85] = (2427.42, -4005.58, -132.376);
		  level.spawns_zombies[86] = (2142.12, -4462.11, -111.875);
		  level.spawns_zombies[87] = (1812.86, -4612.53, -111.875);
		  level.spawns_zombies[88] = (1614.81, -4217.17, -13.875);
		  level.spawns_zombies[89] = (1132.42, -4182.02, -13.875);
		  level.spawns_zombies[90] = (1361.3, -4429.01, -13.875);
		  level.spawns_zombies[91] = (1332.34, -4244.97, -119.875);
		  level.spawns_zombies[92] = (1373.39, -3972.54, -127.48);
		  level.spawns_zombies[93] = (1084.47, -3624.74, -137.594);
		  level.spawns_zombies[94] = (934.744, -3128.25, -57.6544);
		  level.spawns_zombies[95] = (765.555, -3451.53, -185.044);
		  level.spawns_zombies[96] = (539.969, -3448.13, -171.875);
		  level.spawns_zombies[97] = (613.056, -3724.63, -171.875);
		  level.spawns_zombies[98] = (558.942, -3476.06, 13.334);
		  level.spawns_zombies[99] = (431.959, -3917.15, 36.0828);
		  level.spawns_zombies[100] = (-137.667, -3953.34, 54.125);
		  level.spawns_zombies[101] = (-420.712, -4509.1, -32.175);
		  level.spawns_zombies[102] = (-630.144, -3377.95, 28.125);
		  level.spawns_zombies[103] = (86.1568, -3174.55, -289.456);
		  level.spawns_zombies[104] = (-77.4202, -2415.46, -219.545);
		  level.spawns_zombies[105] = (220.413, -3619.72, -299.52);
		  level.spawns_zombies[106] = (406.326, -1844.19, -176.182);
		  level.spawns_zombies[107] = (763.039, -2259.71, -196.337);
		  level.spawns_zombies[108] = (976.946, -2391.26, -159.875);
		  level.spawns_zombies[109] = (998.072, -2861.35, -159.875);
		  level.spawns_zombies[110] = (1041.84, -2372.3, -31.875);
		  level.spawns_zombies[111] = (1055.6, -2756.21, -31.875);
		  level.spawns_zombies[112] = (1111.47, -3220.21, -11.875);
		  level.spawns_zombies[113] = (1068.52, -2335.28, 118.125);
		 level.spawns_zombies[114] = (1258.07, -2294.86, 105.252);
		 level.spawns_zombies[115] = (-408.024, -2820.72, -202.702);
		level.spawns_zombies[116] = (-1544.86, -2048.84, -179.875);
		level.spawns_zombies[117] = (1062.17, -2764.72, -31.875);
		level.spawns_zombies[118] = (1062.38, -2651.74, 87.1232);
		level.spawns_zombies[119] = (999.429, -2371.94, 78.4532);
		level.spawns_zombies[120] = (1244.43, -2307.99, 118.385);
		level.spawns_zombies[121] = (1181.93, -2761.96, -2.53758);
	}
	else if(map == "mp_subbase")
	{
		level.spawns_humans[0] = (290.031, -557.432, 88.125);
		level.spawns_zombies[0] = (2079.12, 1715.67, 32.1247);
		level.spawns_zombies[1] = (2400.22, 1687.56, 32.1118);
		level.spawns_zombies[2] = (2531.09, 1215.82, 32.3744);
		level.spawns_zombies[3] = (1862.96, 1172.55, 32.125);
		level.spawns_zombies[4] = (758.446, 1160.42, 32.125);
		level.spawns_zombies[5] = (920.32, 1531.99, 32.125);
		level.spawns_zombies[6] = (417.067, 1565.57, 32.125);
		level.spawns_zombies[7] = (372.721, 990.008, 32.125);
		  level.spawns_zombies[8] = (399.449, 236.122, 48.125);
		   level.spawns_zombies[9] = (432.645, -275.765, 88.125);
		   level.spawns_zombies[10] = (-176.147, -56.7241, 36.1243);
		   level.spawns_zombies[11] = (-23.4055, 511.903, 32.125);
		   level.spawns_zombies[12] = (-107.081, 1141.23, 32.125);
		   level.spawns_zombies[13] = (-592.085, 1129.4, 90.1845);
		  level.spawns_zombies[14] = (-973.051, 956.933, 94.9398);
		   level.spawns_zombies[15] = (-819.039, 389.821, 184.125);
		   level.spawns_zombies[16] = (-911.711, 164.455, 184.125);
		   level.spawns_zombies[17] = (-670.306, -174.367, 185.125);
		  level.spawns_zombies[18] = (-142.441, -163.753, 224.125);
		  level.spawns_zombies[19] = (-187.214, 190.781, 176.125);
		   level.spawns_zombies[20] = (705.75, -165.087, 224.125);
		   level.spawns_zombies[21] = (1012.56, -62.9195, 224.125);
		   level.spawns_zombies[22] = (1261.7, -133.46, 224.125);
		   level.spawns_zombies[23] = (1245.38, -384.257, 80.125);
		   level.spawns_zombies[24] = (1199.75, -612.58, 72.125);
		   level.spawns_zombies[25] = (738.775, 76.0942, 312.125);
		   level.spawns_zombies[26] = (193.009, 274.072, 318.348);
		   level.spawns_zombies[27] = (-66.268, 63.4332, 314.239);
		   level.spawns_zombies[28] = (945.965, -504.295, 88.125);
		   level.spawns_zombies[29] = (676.637, -584.702, 88.125);
		   level.spawns_zombies[30] = (51.1393, -670.76, 88.125);
		   level.spawns_zombies[31] = (-169.189, -307.033, 88.125);
		   level.spawns_zombies[32] = (-509.52, -549.68, 120.125);
		   level.spawns_zombies[33] = (-991.264, -753.768, 120.328);
		   level.spawns_zombies[34] = (-1354.58, -686.645, 120.031);
		   level.spawns_zombies[35] = (-1171.78, -305.987, 120.125);
		   level.spawns_zombies[36] = (-1226.82, 83.9838, 113.086);
		   level.spawns_zombies[37] = (-1164.06, 583.083, 98.6989);
		   level.spawns_zombies[38] = (-1252.47, 878.01, 220.836);
		   level.spawns_zombies[39] = (-1121.28, 1142.35, 184.125);
		 level.spawns_zombies[40] = (-734.096, -1016.86, 257.297);
		  level.spawns_zombies[41] = (69.2079, -1099.76, 257.125);
		  level.spawns_zombies[42] = (802.346, -1356.77, 272.125);
		  level.spawns_zombies[43] = (914.245, -1023.58, 272.125);
		  level.spawns_zombies[44] = (1160.88, -1089.97, 272.125);
		  level.spawns_zombies[45] = (1166.17, -1385.96, 80.125);
		  level.spawns_zombies[46] = (613.566, -1420.41, 8.125);
		  level.spawns_zombies[47] = (408.377, -1021.96, 88.125);
		  level.spawns_zombies[48] = (1001.56, -1027.99, 88.125);
		  level.spawns_zombies[49] = (1603.82, -573.025, 0.124998);
		  level.spawns_zombies[50] = (1485.55, 232.048, 0.124998);
		  level.spawns_zombies[51] = (1473.25, 1107.21, 32.125);
		  level.spawns_zombies[52] = (1014.56, 429.67, 32.125);
		  level.spawns_zombies[53] = (1022.15, -61.4731, 32.125);
		  level.spawns_zombies[54] = (396.386, 433.943, 176.125);
		  level.spawns_zombies[55] = (668.06, -1150.36, 272.125);
		  level.spawns_zombies[56] = (1061.53, -1644.21, 0.124999);
		  level.spawns_zombies[57] = (1627.22, -1280.75, 0.329553);
		  level.spawns_zombies[58] = (707.589, -1855.37, 123.855);
		  level.spawns_zombies[59] = (990.875, -2242.5, 0.125);
		  level.spawns_zombies[60] = (1355.7, -2347.24, 0.124998);
		  level.spawns_zombies[61] = (882.492, -2506.03, 1.20423);
		  level.spawns_zombies[62] = (370.523, -2245.33, 0.72778);
		  level.spawns_zombies[63] = (-298.142, -2368.72, 0.124997);
		  level.spawns_zombies[64] = (-338.032, -3170.21, 0.124997);
		  level.spawns_zombies[65] = (-839.603, -2932.58, 0.191564);
		  level.spawns_zombies[66] = (-826.948, -2266.64, 0.124999);
		  level.spawns_zombies[67] = (-1363.91, -2065.72, 0.124999);
		  level.spawns_zombies[68] = (-1424.84, -2521.54, 41.8074);
		  level.spawns_zombies[69] = (-1438.63, -1446.1, 66.7449);
		  level.spawns_zombies[70] = (-1425.73, -1038.42, 120.125);
		  level.spawns_zombies[71] = (-1008.45, -1175.35, 120.125);
		  level.spawns_zombies[72] = (-1059.41, -1426.55, 0.124998);
		  level.spawns_zombies[73] = (-869.125, -1809.2, 70.125);
		  level.spawns_zombies[74] = (-1123.67, -1829.67, 216.125);
		  level.spawns_zombies[75] = (-1474.17, -1808.66, 255.125);
		  level.spawns_zombies[76] = (-1447.94, -1041.03, 256.125);
		  level.spawns_zombies[77] = (-993.121, -1034.36, 256.125);
		  level.spawns_zombies[78] = (-708.154, -1320.82, 257.125);
		  level.spawns_zombies[79] = (-693.093, -1747.98, 258.584);
		  level.spawns_zombies[80] = (235.794, -158.109, 224.125);
		  level.spawns_zombies[81] = (165.227, -1288.16, 53.9614);
		  level.spawns_zombies[82] = (-86.3727, -1629.92, 48.125);
		  level.spawns_zombies[83] = (-251.21, -1905.75, 48.125);
		  level.spawns_zombies[84] = (-660.227, -1702.63, 48.125);
		  level.spawns_zombies[85] = (-638.376, -1405.59, 48.125);
		  level.spawns_zombies[86] = (-342.752, -1298.47, 48.125);
	}
	else if(map == "mp_estate" || map == "mp_estate_tropical")
	{
		Fx_Fire((-1104.93, 2622.54, -64.3328));
		Fx_Fire((-1083.96, 2617.02, 14.1483));
		Fx_Fire((-973.903, 2620.05, 14.1263));
		Fx_Fire((-1053.26, 2580.97, 14.1259));
		level.spawns_humans[0] = (-949.89, 2142.99, -150.736);
		level.spawns_zombies[0] = (-2828.1, 631.153, -306.875);
		 level.spawns_zombies[1] = (-3009.31, 1059.21, -306.875);
		  level.spawns_zombies[2] = (-2922.58, 1418.78, -310.095);
		  level.spawns_zombies[3] = (-3388.11, 1170.32, -299.486);
		  level.spawns_zombies[4] = (-3751.59, 628.663, -184.529);
		  level.spawns_zombies[5] = (-3393.83, 22.5209, -306.401);
		  level.spawns_zombies[6] = (-2987.69, 17.6144, -308.752);
		  level.spawns_zombies[7] = (-2331.74, 102.451, -306.98);
		  level.spawns_zombies[8] = (-2322.76, 365.811, -306.875);
		  level.spawns_zombies[9] = (-2464.73, 664.87, -306.875);
		  level.spawns_zombies[10] = (-2737, 1095.94, -306.875);
		  level.spawns_zombies[11] = (-2607.15, 1074.89, -171.875);
		  level.spawns_zombies[12] = (-2475.39, 781.643, -171.875);
		  level.spawns_zombies[13] = (-2394.64, 323.437, -171.875);
		  level.spawns_zombies[14] = (-2934.4, 1106.4, -145.081);
		  level.spawns_zombies[15] = (-2858.08, 432.621, -161.338);
		  level.spawns_zombies[16] = (-2525.67, 485.634, -57.5364);
		  level.spawns_zombies[17] = (-2635.16, 1053.28, -59.7508);
		  level.spawns_zombies[18] = (-2161.91, 1384.39, -275.763);
		  level.spawns_zombies[19] = (-1815.66, 1691.83, -247.948);
		  level.spawns_zombies[20] = (-1849.37, 2215.02, -169.612);
		  level.spawns_zombies[21] = (-1892.73, 2701.92, -33.0471);
		  level.spawns_zombies[22] = (-1461.8, 2450.5, -123.875);
		  level.spawns_zombies[23] = (-1311.7, 2889.07, -115.481);
		  level.spawns_zombies[24] = (-1047.11, 3133.3, -116.522);
		  level.spawns_zombies[25] = (-1190.06, 3540.15, -145.9);
		  level.spawns_zombies[26] = (-1643.05, 3537.45, -248.729);
		  level.spawns_zombies[27] = (-1858.84, 3108.73, -262.302);
		  level.spawns_zombies[28] = (-2302.47, 3197.29, -325.542);
		  level.spawns_zombies[29] = (-2062.03, 3808.93, -300.149);
		  level.spawns_zombies[30] = (-1629.33, 4155.12, -173.238);
		  level.spawns_zombies[31] = (-2261.95, 4231.78, -292.89);
		 level.spawns_zombies[32] = (-2886.6, 4160.98, -305.547);
		  level.spawns_zombies[33] = (-3344.43, 3780.35, -289.827);
		  level.spawns_zombies[34] = (-3921.86, 3861.94, -315.229);
		  level.spawns_zombies[35] = (-4325.28, 3500.73, -307.719);
		  level.spawns_zombies[36] = (-4856.99, 3666.5, -290.5);
		  level.spawns_zombies[37] = (-4463.83, 2912.98, -307.93);
		  level.spawns_zombies[38] = (-4060.38, 3196.53, -307.075);
		  level.spawns_zombies[39] = (-3745.57, 3038.63, -307.075);
		  level.spawns_zombies[40] = (-3527.34, 3211.95, -307.075);
		  level.spawns_zombies[41] = (-3517.32, 2795.1, -307.075);
		  level.spawns_zombies[42] = (-3612.46, 2412.95, -307.075);
		  level.spawns_zombies[43] = (-3740.68, 2338.87, -198.075);
		  level.spawns_zombies[44] = (-3350.94, 2646.79, -164.899);
		  level.spawns_zombies[45] = (-3528.48, 2699.66, -122.522);
		  level.spawns_zombies[46] = (-3990.77, 3003.79, -198.075);
		  level.spawns_zombies[47] = (-3556.8, 3016.87, -125.073);
		  level.spawns_zombies[48] = (-3365.18, 3368.81, -198.075);
		  level.spawns_zombies[49] = (-3039.79, 3346.74, -139.075);
		  level.spawns_zombies[50] = (-2697.2, 3409.55, -139.075);
		  level.spawns_zombies[51] = (-2776.95, 3257.8, -139.075);
		  level.spawns_zombies[52] = (-2098.21, 2795.75, -50.6653);
		  level.spawns_zombies[53] = (-766.074, 3561.51, 53.9005);
		  level.spawns_zombies[54] = (-603.286, 3974.98, 75.6568);
		 level.spawns_zombies[55] = (19.4625, 4429.58, 153.308);
		  level.spawns_zombies[56] = (354.437, 4478.73, 157.253);
		  level.spawns_zombies[57] = (771.794, 4470.74, 63.0751);
		  level.spawns_zombies[58] = (1406.92, 4399.68, -5.875);
		  level.spawns_zombies[59] = (1857.83, 4284.52, -5.875);
		  level.spawns_zombies[60] = (2181.98, 3814.66, -3.25951);
		  level.spawns_zombies[61] = (1876.2, 2858.5, 133.39);
		  level.spawns_zombies[62] = (1876.59, 2483.37, 157.33);
		  level.spawns_zombies[63] = (1676.29, 2022.76, 147.16);
		  level.spawns_zombies[64] = (1226.14, 2349.37, 161.368);
		  level.spawns_zombies[65] = (797.572, 2239.96, 176.989);
		  level.spawns_zombies[66] = (865.666, 2661.44, 126.644);
		  level.spawns_zombies[67] = (544.861, 3038.91, 151.996);
		 level.spawns_zombies[68] = (751.135, 3480.63, 147.156);
		 level.spawns_zombies[69] = (264.935, 3537.51, 151.975);
		  level.spawns_zombies[70] = (-95.3474, 3116.94, 137.37);
		  level.spawns_zombies[71] = (-312.678, 3850.04, 140.202);
		  level.spawns_zombies[72] = (316.083, 3951.55, 154.835);
		  level.spawns_zombies[73] = (1231.66, 3784.48, 328.416);
		  level.spawns_zombies[74] = (1260.33, 3386.08, 318.261);
		  level.spawns_zombies[75] = (1107.57, 3453.63, 310.938);
		  level.spawns_zombies[76] = (630.197, 1592.23, 136.252);
		  level.spawns_zombies[77] = (219.943, 1850.74, 63.0716);
		  level.spawns_zombies[78] = (149.184, 2384.75, 34.4926);
		  level.spawns_zombies[79] = (-438.564, 2241.18, -78.2222);
		  level.spawns_zombies[80] = (-319.107, 1654.74, 34.9996);
		  level.spawns_zombies[81] = (-349.312, 1255.89, 96.8177);
		  level.spawns_zombies[82] = (-631.735, 856.427, -16.1506);
		  level.spawns_zombies[83] = (-442.367, 362.19, 94.4512);
		  level.spawns_zombies[84] = (-156.694, 465.282, 143.179);
		  level.spawns_zombies[85] = (-276.57, -49.0614, 89.0732);
		  level.spawns_zombies[86] = (197.361, -105.349, 121.406);
		  level.spawns_zombies[87] = (446.442, -347.068, 85.6772);
		  level.spawns_zombies[88] = (732.083, 116.875, 66.3843);
		  level.spawns_zombies[89] = (1235.74, 440.796, 56.189);
		  level.spawns_zombies[90] = (982.259, 995.269, 61.0574);
		  level.spawns_zombies[91] = (1384.37, 1196.41, 105.794);
		 level.spawns_zombies[92] = (941.434, 1373.32, 151.899);
		  level.spawns_zombies[93] = (1924.12, 389.976, 85.5821);
		  level.spawns_zombies[94] = (1672.85, -286.37, 61.7469);
		  level.spawns_zombies[95] = (1530.46, -815.61, 123.003);
		 level.spawns_zombies[96] = (1409.5, -395.008, 209.542);
		  level.spawns_zombies[97] = (1206.14, -1070.33, 133.594);
		  level.spawns_zombies[98] = (643.254, -1084.95, 92.9785);
		  level.spawns_zombies[99] = (1407.53, -151.861, 213.184);
		  level.spawns_zombies[100] = (341.195, -791.058, 83.8488);
		  level.spawns_zombies[101] = (-307.462, -774.445, 58.7398);
		  level.spawns_zombies[102] = (-829.608, -623.491, 43.125);
		  level.spawns_zombies[103] = (-699.453, -329.114, 43.625);
		  level.spawns_zombies[104] = (-444.1, -528.789, 75.625);
		  level.spawns_zombies[105] = (-75.5331, -460.732, 75.625);
		  level.spawns_zombies[106] = (-907.807, -400.895, -76.875);
		  level.spawns_zombies[107] = (-768.293, -166.242, -76.875);
		  level.spawns_zombies[108] = (-1079.84, -147.84, -66.0138);
		  level.spawns_zombies[109] = (-1469.86, -346.94, -46.1078);
		  level.spawns_zombies[110] = (-1775.52, -156.182, 53.4935);
		  level.spawns_zombies[111] = (-1261.53, -589.169, 73.0488);
		  level.spawns_zombies[112] = (-937.01, -828.769, 80.9445);
		  level.spawns_zombies[113] = (-185.592, -525.121, 326.94);
		  level.spawns_zombies[114] = (118.328, -615.086, 326.625);
		  level.spawns_zombies[115] = (-767.636, -346.644, 327.046);
		  level.spawns_zombies[116] = (-120.988, 641.67, 285.971);
		  level.spawns_zombies[117] = (113.377, 532.29, 318.125);
		  level.spawns_zombies[118] = (447.259, 390.144, 316.125);
		  level.spawns_zombies[119] = (466.908, 710.384, 318.125);
		  level.spawns_zombies[120] = (658.508, 1001.02, 319.125);
		  level.spawns_zombies[121] = (688.262, 782.166, 318.125);
		  level.spawns_zombies[122] = (282.977, 603.583, 318.125);
		  level.spawns_zombies[123] = (334.263, 1019.99, 190.125);
		  level.spawns_zombies[124] = (-59.317, 1128.96, 190.125);
		  level.spawns_zombies[125] = (273.227, 744.179, 190.125);
		  level.spawns_zombies[126] = (-1445.7, 605.928, -286.077);
		  level.spawns_zombies[127] = (-1846.85, 824.37, -331.881);
		
	}
	else if(map == "mp_derail")
	{
		level.spawns_humans[0] = (1241.63, 641.306, 118.115);
		 level.spawns_zombies[0] = (2949.17, 3406.55, 84.0746);
	   level.spawns_zombies[1] = (3514.75, 3660.21, 91.7468);
	   level.spawns_zombies[2] = (3479.53, 3025.49, 95.1028);
	   level.spawns_zombies[3] = (3541.65, 2607.93, 109.525);
	   level.spawns_zombies[4] = (3075.2, 2609.13, 77.9472);
	   level.spawns_zombies[5] = (2963.65, 3056.56, 117.312);
	   level.spawns_zombies[6] = (3049.58, 1655.3, 132.216);
	   level.spawns_zombies[7] = (3428.8, 828.305, 122.478);
	   level.spawns_zombies[8] = (3752.16, 161.789, 104.745);
	   level.spawns_zombies[9] = (3256.31, -216.776, 85.1407);
	   level.spawns_zombies[10] = (2863.37, -468.668, 168.412);
	   level.spawns_zombies[11] = (3119.64, 702.787, 167.908);
	   level.spawns_zombies[12] = (2642.38, 992.561, 132.502);
	   level.spawns_zombies[13] = (2034.98, 980.541, 105.146);
	   level.spawns_zombies[14] = (1618.23, 475.575, 115.39);
	   level.spawns_zombies[15] = (1177.67, 680.889, 115.816);
	   level.spawns_zombies[16] = (1461.4, 1255.13, 126.456);
	   level.spawns_zombies[17] = (897.089, 1375.03, 111.175);
	   level.spawns_zombies[18] = (500.264, 2086.49, 149.988);
	   level.spawns_zombies[19] = (701.82, 2782.29, 112.125);
	   level.spawns_zombies[20] = (278.882, 3248.99, 115.258);
	   level.spawns_zombies[21] = (-192.001, 3391.63, 133.719);
	   level.spawns_zombies[22] = (-136.346, 2774.94, 123.508);
	   level.spawns_zombies[23] = (-238.426, 2207.77, 245.916);
	   level.spawns_zombies[24] = (-1074.42, 3210.13, 249.125);
	   level.spawns_zombies[25] = (-805.341, 3303.28, 249.125);
	   level.spawns_zombies[26] = (-772.646, 2498.32, 325.625);
	   level.spawns_zombies[27] = (-774.377, 2959.67, 326.125);
	   level.spawns_zombies[28] = (129.496, 2627.46, 238.554);
	   level.spawns_zombies[29] = (294.348, 3527.35, 176.125);
	   level.spawns_zombies[30] = (674.627, 3619.85, 118.601);
	   level.spawns_zombies[31] = (701.796, 4179.5, 130.699);
	   level.spawns_zombies[32] = (1142.47, 4141.58, 189.467);
	   level.spawns_zombies[33] = (1645.3, 4203.33, 213.398);
	   level.spawns_zombies[34] = (1370.65, 3312.16, 129.967);
	   level.spawns_zombies[35] = (1681.67, 3011.42, 132.672);
	   level.spawns_zombies[36] = (1203.79, 2869.94, 121.894);
	   level.spawns_zombies[37] = (985.657, 2878.84, 176.125);
	   level.spawns_zombies[38] = (1031.31, 2373.54, 176.125);
	   level.spawns_zombies[39] = (995.881, 2627.46, 320.125);
	   level.spawns_zombies[40] = (596.202, 2590.9, 320.125);
	   level.spawns_zombies[41] = (303.418, 2552.56, 320.125);
	   level.spawns_zombies[42] = (192.347, 2031.59, 151.593);
	   level.spawns_zombies[43] = (-129.5, 1773.86, 95.04);
	   level.spawns_zombies[44] = (-138.712, 1306.65, 118.554);
	   level.spawns_zombies[45] = (-474.812, 1441.73, 41.8919);
	   level.spawns_zombies[46] = (-954.217, 1440.49, -15.875);
	   level.spawns_zombies[47] = (-1148.48, 1908.49, 29.1505);
	   level.spawns_zombies[48] = (-1244.07, 2467.87, 98.6054);
	  level.spawns_zombies[49] = (-1669.37, 2496.99, 141.512);
	   level.spawns_zombies[50] = (-1792.11, 2980.75, 181.936);
	   level.spawns_zombies[51] = (-1719.94, 3465.78, 212.66);
	   level.spawns_zombies[52] = (-1943.01, 3821.88, 176.774);
	   level.spawns_zombies[53] = (-1449.59, 4140.27, 147.431);
	   level.spawns_zombies[54] = (-2192.85, 2470.68, 107.489);
	   level.spawns_zombies[55] = (-2200.98, 1877.82, 76.1457);
	   level.spawns_zombies[56] = (-2331.65, 1344.46, 30.4881);
	   level.spawns_zombies[57] = (-1883.94, 1034.21, 54.1087);
	   level.spawns_zombies[58] = (-1650.44, 548.469, 93.4846);
	   level.spawns_zombies[59] = (-1750.15, 40.3167, -30.7513);
	   level.spawns_zombies[60] = (-2078.24, -331.924, 11.5929);
	   level.spawns_zombies[61] = (-2297.03, -752.169, 7.0798);
	   level.spawns_zombies[62] = (-1811.65, -864.948, -0.0235507);
	   level.spawns_zombies[63] = (-1295.08, -399.576, 54.5277);
	   level.spawns_zombies[64] = (-1379.71, -1020.24, 19.7779);
	  level.spawns_zombies[65] = (-1316.27, -1401.31, 100.825);
	   level.spawns_zombies[66] = (-1666.54, -1662.06, 56.8717);
	  level.spawns_zombies[67] = (-2170.6, -1641.14, 32.0503);
	   level.spawns_zombies[68] = (-2161.38, -1422.39, 33.125);
	  level.spawns_zombies[69] = (-2195.03, -1186.26, 33.125);
	   level.spawns_zombies[70] = (-2013.98, -1254.99, 33.125);
	  level.spawns_zombies[71] = (-908.921, -861.407, -26.4703);
	   level.spawns_zombies[72] = (-939.202, -1006.69, 183.125);
	   level.spawns_zombies[73] = (-793.496, -1177.79, 183.125);
	  level.spawns_zombies[74] = (-985.725, -1619.05, 144.27);
	   level.spawns_zombies[75] = (-525.16, -1475.1, 128.076);
	   level.spawns_zombies[76] = (104.866, -1422.48, 174.434);
	   level.spawns_zombies[77] = (-335.339, -1096.74, 75.3977);
	   level.spawns_zombies[78] = (-167.773, -609.185, 1.72537);
	   level.spawns_zombies[79] = (-433.036, -333.238, 89.6345);
	   level.spawns_zombies[80] = (-1043.83, -196.345, 72.6674);
	   level.spawns_zombies[81] = (-1199.76, 779.301, 26.4749);
	   level.spawns_zombies[82] = (-109.115, 284.375, 79.454);
	   level.spawns_zombies[83] = (585.717, 235.274, 130.038);
	   level.spawns_zombies[84] = (784.541, -249.472, 281.746);
	   level.spawns_zombies[85] = (853.01, -546.707, 276.311);
	   level.spawns_zombies[86] = (680.804, -974.314, 152.852);
	   level.spawns_zombies[87] = (477.224, -1235.57, 192.872);
	   level.spawns_zombies[88] = (704.31, -1750.84, 115.606);
	   level.spawns_zombies[89] = (445.63, -1839.79, 118.875);
	   level.spawns_zombies[90] = (-126.701, -1829.28, 141.307);
	   level.spawns_zombies[91] = (-782.619, -1948.94, 131.205);
	   level.spawns_zombies[92] = (-1077.42, -2335.4, 127.918);
	   level.spawns_zombies[93] = (-1251.32, -2695.27, 112.472);
	   level.spawns_zombies[94] = (-1730.4, -2607.06, 111.386);
	   level.spawns_zombies[95] = (-2076.28, -2184.51, 147.585);
	   level.spawns_zombies[96] = (-1025.17, -3338.01, 102.07);
	   level.spawns_zombies[97] = (-513.548, -3561.48, 90.125);
	   level.spawns_zombies[98] = (-221.262, -3673.66, 90.125);
	   level.spawns_zombies[99] = (-1.45873, -3459.13, 90.125);
	   level.spawns_zombies[100] = (-63.5512, -3002.3, 88.0168);
	   level.spawns_zombies[101] = (509.21, -2917.48, 101.648);
	   level.spawns_zombies[102] = (726.052, -3521.48, 131.266);
	   level.spawns_zombies[103] = (1053.83, -2762.62, 126.846);
	   level.spawns_zombies[104] = (1423.05, -2983.21, 161.339);
	   level.spawns_zombies[105] = (1841.46, -2523.19, 43.0765);
	   level.spawns_zombies[106] = (2349.2, -2274.86, 50.6252);
	   level.spawns_zombies[107] = (2686.42, -2459.92, 165.994);
	   level.spawns_zombies[108] = (2641.22, -2938.96, 200.553);
	   level.spawns_zombies[109] = (2160.56, -3288.08, 184.865);
	   level.spawns_zombies[110] = (1680.56, -3142.5, 87.679);
	   level.spawns_zombies[111] = (1345.56, -1981.6, 54.0562);
	   level.spawns_zombies[112] = (1305.65, -1046.15, 97.9871);
	   level.spawns_zombies[113] = (1839.76, -798.84, 79.5087);
	   level.spawns_zombies[114] = (2260.33, -925.082, 170.697);
	   level.spawns_zombies[115] = (2994.26, -1038.06, 138.634);
	   level.spawns_zombies[116] = (2987.28, -1754.28, 203.234);
	   level.spawns_zombies[117] = (2923.77, -2021.56, 58.6241);
	   level.spawns_zombies[118] = (1331.67, -364.26, 129.02);
	   level.spawns_zombies[119] = (1231.7, 119.295, 132.115);
	   level.spawns_zombies[120] = (805.938, 1041.05, 267.984);
	   level.spawns_zombies[121] = (137.546, 1503.14, 592.344);
	   level.spawns_zombies[122] = (-28.9922, 1027.91, 574.717);
	   level.spawns_zombies[123] = (216.052, 608.049, 578.029);
	   level.spawns_zombies[124] = (250.413, 1137, 567.071);
	   level.spawns_zombies[125] = (715.421, 1561.99, 112.125);
	   level.spawns_zombies[126] = (332.383, 1265.06, 106.125);
	   level.spawns_zombies[127] = (33.125, 1381.56, 192.125);
	   level.spawns_zombies[128] = (310.309, 1360.84, 298.125);
	   level.spawns_zombies[129] = (233.709, 968.121, 298.125);
	   level.spawns_zombies[130] = (311.148, 532.114, 298.125);
	   level.spawns_zombies[131] = (-107.263, 533.782, 298.125);
	   level.spawns_zombies[132] = (32.4367, 1107.25, 198.125);
	   level.spawns_zombies[133] = (-164.456, 1059.95, 198.125);
	   level.spawns_zombies[134] = (-150.504, 808.517, 106.125);
	   level.spawns_zombies[135] = (729.716, -98.1616, -15.9761);
	   level.spawns_zombies[136] = (1324.17, -318.3, -15.875);
	   level.spawns_zombies[137] = (884.846, -423.613, -15.875);
	   level.spawns_zombies[139] = (960.56, 122.335, 4.19878);
	   level.spawns_zombies[140] = (549.608, 820.895, 119.831);
	   level.spawns_zombies[141] = (262.912, 688.219, 111.786);
	   level.spawns_zombies[142] = (1409.89, 2042.03, 119.336);
	   level.spawns_zombies[143] = (1424.97, 2644.75, 256.735);
	   level.spawns_zombies[144] = (1697.07, 2581.77, 118.963);
	   level.spawns_zombies[145] = (1765.52, 1879.59, 124.615);
	   level.spawns_zombies[146] = (2204.5, 1310.42, 128.125);
	   level.spawns_zombies[147] = (2728.11, 1768.62, 128.125);
	   level.spawns_zombies[148] = (2867.49, 2504.7, 128.125);
	   level.spawns_zombies[149] = (2599.71, 3126.55, 126.801);
	   level.spawns_zombies[150] = (2352.68, 3241.14, 278.125);
	   level.spawns_zombies[151] = (1911.28, 3237.82, 278.125);
	   level.spawns_zombies[152] = (2019.41, 2894.72, 278.125);
	   level.spawns_zombies[153] = (2438.91, 2997.01, 278.125);
	   level.spawns_zombies[154] = (1884.29, 2211.42, 278.125);
	   level.spawns_zombies[155] = (2001.88, 3220.95, 414.125);
	   level.spawns_zombies[156] = (1795.15, 3235.94, 427.296);
	   level.spawns_zombies[157] = (2179.05, 3028.64, 413.125);
	   level.spawns_zombies[158] = (1981.54, 3202.86, 142.125);
	   level.spawns_zombies[159] = (2043.87, 2833.89, 142.125);
	   level.spawns_zombies[160] = (2559.58, 2704.69, 142.125);
	   level.spawns_zombies[161] = (2362.61, 2250.75, 142.125);
	   level.spawns_zombies[162] = (956.969, 298.653, 265.581);
	  level.spawns_zombies[163] = (146.689, -2536.73, 110.378);
	  level.spawns_zombies[164] = (-493.854, -2145.46, 118.125);
	  level.spawns_zombies[138] = (-820.807, -2160.68, 130.125);
	}
	else if(map == "mp_rundown")
	{
		level.spawns_humans[0] = (520.31, -581.937, 11.4777);
		level.spawns_zombies[0] = (818.455, 1425.86, 176.125);
		level.spawns_zombies[1] = (584.385, 1538.17, 176.125);
		level.spawns_zombies[2] = (904.271, 1822.27, 85.132);
		level.spawns_zombies[3] = (1304.6, 1551.19, 48.7957);
		level.spawns_zombies[4] = (1289.43, 1051.27, 14.6683);
		level.spawns_zombies[5] = (974.352, 1039.92, 15.8938);
		level.spawns_zombies[6] = (1301.26, 748.044, 12.0919);
		level.spawns_zombies[7] = (1630.02, 739.149, -2.2749);
		level.spawns_zombies[8] = (1842.04, 1135.73, -73.1876);
		level.spawns_zombies[9] = (1807.99, 1630.98, -79.5822);
		level.spawns_zombies[10] = (1999.49, 1942.22, -105.391);
		level.spawns_zombies[11] = (2290.55, 1824.07, -111.875);
		level.spawns_zombies[12] = (2217.53, 1455.21, -100.393);
		level.spawns_zombies[13] = (2495.53, 1154.89, -103.731);
		level.spawns_zombies[14] = (2256.31, 710.842, -66.6339);
		level.spawns_zombies[15] = (2127.51, 487.146, 5.14828);
		level.spawns_zombies[16] = (2198.06, 218.362, 11.4142);
		level.spawns_zombies[17] = (1791.23, 63.4057, 10.6603);
		level.spawns_zombies[18] = (1407.63, 217.901, 5.67986);
		 level.spawns_zombies[19] = (1075.87, 259.195, 41.2244);
		 level.spawns_zombies[20] = (1053.29, 548.734, 103.107);
		 level.spawns_zombies[21] = (797.231, 676.564, 85.6831);
		  level.spawns_zombies[22] = (491.905, 384.623, 12.3687);
		  level.spawns_zombies[24] = (428.018, -320.837, 13.8934);
		  level.spawns_zombies[25] = (229.946, -818.871, 10.5375);
		  level.spawns_zombies[26] = (-168.454, -784.368, 11.7351);
		   level.spawns_zombies[27] = (-502.321, -763.537, 16.0759);
		  level.spawns_zombies[28] = (-251.712, -1168.84, 12.125);
		  level.spawns_zombies[29] = (-76.5939, -1630.05, 14.1499);
		   level.spawns_zombies[30] = (-840.785, -1073.96, 16.125);
		   level.spawns_zombies[31] = (-804.895, -1513.42, 8.125);
		   level.spawns_zombies[32] = (-411.032, -1482.76, 28.125);
		   level.spawns_zombies[33] = (-471.892, -1690.05, 28.125);
		   level.spawns_zombies[34] = (-566.031, -1499.61, 164.125);
		   level.spawns_zombies[35] = (-310.701, -1634.66, 164.125);
		   level.spawns_zombies[36] = (-379.368, -1815.06, 164.125);
		   level.spawns_zombies[37] = (71.2989, -1469.88, 164.125);
		   level.spawns_zombies[38] = (468.078, -1270.45, 184.125);
		   level.spawns_zombies[39] = (781.308, -1109.2, 184.125);
		   level.spawns_zombies[40] = (708.754, -1335.29, 184.125);
		   level.spawns_zombies[41] = (514.239, -1423.11, 184.125);
		   level.spawns_zombies[42] = (261.551, -1466.58, 28.125);
		   level.spawns_zombies[43] = (18.8761, -1477.06, 28.125);
		   level.spawns_zombies[44] = (-1090.42, -439.272, 8.31681);
		   level.spawns_zombies[45] = (-1220.77, -905.381, 16.125);
		   level.spawns_zombies[46] = (-1539.01, -1381.8, 29.4105);
		   level.spawns_zombies[47] = (-1996.69, -1131.39, 44.0173);
		   level.spawns_zombies[48] = (-1861.07, -705.426, 18.9215);
		   level.spawns_zombies[49] = (-2048.16, -252.107, 38.5717);
		   level.spawns_zombies[50] = (-1914.59, 182.902, 29.5814);
		   level.spawns_zombies[51] = (-1700.54, 549.008, 13.3983);
		   level.spawns_zombies[52] = (-1359.55, 846.832, 16.125);
		   level.spawns_zombies[53] = (-1011.47, 1024.21, 16.125);
		   level.spawns_zombies[54] = (-869.165, 624.575, 17.1567);
		   level.spawns_zombies[55] = (-1240.08, 263.317, 152.125);
		   level.spawns_zombies[56] = (-1431.42, 71.7269, 152.125);
		   level.spawns_zombies[57] = (-1535.58, -219.975, 172.813);
		   level.spawns_zombies[58] = (-1634.49, -437.418, 183.359);
		   level.spawns_zombies[59] = (-1360.51, -763.007, 183.475);
		   level.spawns_zombies[60] = (-1229.16, -739.24, 176.457);
		   level.spawns_zombies[61] = (-1250.13, -49.4565, 11.7048);
		   level.spawns_zombies[62] = (-1529.46, 223.924, 20.125);
		   level.spawns_zombies[63] = (-1283.24, 460.352, 20.125);
		   level.spawns_zombies[64] = (-927.709, 366.534, 15.9338);
		   level.spawns_zombies[65] = (-427.158, 296.695, 16.125);
		   level.spawns_zombies[66] = (-730.596, 11.3512, 14.4723);
		   level.spawns_zombies[67] = (-767.243, -322.181, 48.125);
		   level.spawns_zombies[68] = (-736.969, -231.866, 184.125);
		  level.spawns_zombies[69] = (-651.037, -261.832, 184.125);
		   level.spawns_zombies[70] = (-57.8711, 235.658, 26.125);
		   level.spawns_zombies[71] = (185.103, 465, 26.125);
		   level.spawns_zombies[72] = (120.69, 266.315, 162.125);
		   level.spawns_zombies[73] = (387.176, 963.181, 16.9095);
		   level.spawns_zombies[74] = (417.32, 1159.64, 61.6066);
		   level.spawns_zombies[75] = (-85.3981, 1233.47, 15.7879);
		   level.spawns_zombies[76] = (-540.803, 1323.43, 16.7749);
		   level.spawns_zombies[77] = (43.26, 1695.08, 73.0211);
		   level.spawns_zombies[78] = (552.877, 2047.69, 99.2012);
		   level.spawns_zombies[79] = (913.056, 2353.69, 72.2388);
		   level.spawns_zombies[80] = (535.386, 2558.38, 65.9607);
		   level.spawns_zombies[81] = (312.084, 2850.69, 91.1003);
		   level.spawns_zombies[82] = (595.065, 3164.22, 58.4081);
		   level.spawns_zombies[83] = (1039.23, 3172.79, 64.125);
		   level.spawns_zombies[84] = (1540.48, 3301.52, 64.125);
		   level.spawns_zombies[85] = (1618.42, 2912.36, 59.9639);
		   level.spawns_zombies[86] = (1620.46, 2444.61, 52.4928);
		   level.spawns_zombies[87] = (1502.74, 2100.85, -3.17047);
		   level.spawns_zombies[88] = (1112.29, 2008.04, 171.835);
		   level.spawns_zombies[89] = (1324.09, 2854.83, 66.125);
		   level.spawns_zombies[90] = (1463.61, 3107.43, 66.125);
		   level.spawns_zombies[91] = (1432.09, -453.763, 23.2056);
		   level.spawns_zombies[92] = (1704.07, -494.578, 36.125);
		   level.spawns_zombies[93] = (1585.18, -859.727, 35.5404);
		   level.spawns_zombies[94] = (1643.43, -1176.31, 87.9217);
		   level.spawns_zombies[95] = (2393.55, -727.543, 79.0193);
		   level.spawns_zombies[96] = (2558.1, -957.173, 114.842);
		   level.spawns_zombies[97] = (2724.08, -1480.76, 165.828);
		   level.spawns_zombies[98] = (2585.1, -1792.92, 192.125);
		   level.spawns_zombies[99] = (1974.49, -1637.22, 198.826);
		   level.spawns_zombies[100] = (1559.28, -1587.28, 178.261);
		   level.spawns_zombies[101] = (1995.14, -1227.14, 135.726);
		   level.spawns_zombies[102] = (2777.75, -2193.86, 192.125);
		   level.spawns_zombies[103] = (3009.38, -2599.04, 192.125);
		   level.spawns_zombies[104] = (2628.43, -2575.11, 203.475);
		   level.spawns_zombies[105] = (2223.97, -2130.16, 202.654);
		   level.spawns_zombies[106] = (1684.5, -2579.57, 202.247);
		   level.spawns_zombies[107] = (1890.62, -2873.36, 203.125);
		   level.spawns_zombies[108] = (2097.76, -3129.1, 203.617);
		   level.spawns_zombies[109] = (2449.91, -2987.05, 204.044);
		   level.spawns_zombies[110] = (2072.67, -3117.08, 340.125);
		   level.spawns_zombies[111] = (1711.13, -2574.79, 340.125);
		   level.spawns_zombies[112] = (2036.73, -2277.83, 340.125);
		   level.spawns_zombies[113] = (2286.03, -2123.26, 340.125);
		   level.spawns_zombies[114] = (2532.93, -2448.27, 340.125);
		   level.spawns_zombies[115] = (2692.79, -2728.83, 340.125);
		   level.spawns_zombies[116] = (1630.9, -2226.56, 219.654);
		   level.spawns_zombies[117] = (863.742, -2768.55, 340.125);
		   level.spawns_zombies[118] = (964.725, -3019.88, 341.6);
		   level.spawns_zombies[119] = (254.012, -3067.82, 178.201);
		   level.spawns_zombies[120] = (-12.2696, -2942.9, 135.704);
		   level.spawns_zombies[121] = (361.55, -2527.67, 144.125);
		  level.spawns_zombies[122] = (501.989, -2236.33, 119.96);
		  level.spawns_zombies[123] = (114.045, -1976.71, 44.07);
		  level.spawns_zombies[124] = (-358.685, -2264.44, 38.2168);
		  level.spawns_zombies[125] = (-268.489, -1945.7, 18.8916);
		  level.spawns_zombies[126] = (236.726, -2316.15, 83.9528);
		  level.spawns_zombies[127] = (8.11235, -2647.28, 104.575);
		  level.spawns_zombies[128] = (-366.288, -2761.98, 107.24);
		 level.spawns_zombies[129] = (-544.163, -2562.09, 89.8608);
		 level.spawns_zombies[130] = (-661.063, -2184.41, 34.2273);
		 level.spawns_zombies[131] = (-330.333, -2528.1, 206.379);
		  level.spawns_zombies[132] = (-592.007, -1763.86, 144.125);
		  level.spawns_zombies[133] = (-971.171, -1364.21, 16.125);
		  level.spawns_zombies[134] = (-1212.29, -1466.22, -123.875);
		  level.spawns_zombies[135] = (-1014.93, -1024.43, -123.875);
		  level.spawns_zombies[136] = (-850.446, -604.825, -120.956);
		  level.spawns_zombies[137] = (-532.391, -374.095, -123.875);
		  level.spawns_zombies[138] = (-212.419, -100.79, -123.875);
		  level.spawns_zombies[139] = (274.462, -162.301, -123.875);
		  level.spawns_zombies[140] = (648.131, 28.2916, -123.875);
		  level.spawns_zombies[141] = (960.529, -198.13, -123.875);
		  level.spawns_zombies[142] = (1603.68, -699.259, 172.125);
		  level.spawns_zombies[143] = (1840.87, -714.275, 172.125);
		 level.spawns_zombies[23] = (1175.69, -1097.52, 148.125);
		
	}
	else if(map == "mp_nuked")
	{
		level.spawns_humans[0] = (14.8051, 74.2823, -67.5845);
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
	else if(map == "mp_dome")
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
	}
	else if(map == "mp_bloc_sh")
	{
		level.spawns_humans[0] = (1344.64, -5825.91, -23.875);
		level.spawns_zombies[0] = (1330.5, -5492.3, -24.5858);
	  level.spawns_zombies[1] = (1538.88, -5575.78, -19.4539);
	  level.spawns_zombies[2] = (1610.56, -5989.18, -23.875);
	  level.spawns_zombies[3] = (1295.85, -6252.16, -23.8793);
	  level.spawns_zombies[4] = (807.531, -6273.37, -23.875);
	  level.spawns_zombies[5] = (744.332, -5867.93, -23.875);
	  level.spawns_zombies[6] = (752.601, -5527.5, -23.7226);
	  level.spawns_zombies[7] = (952.41, -5133.13, -8.67916);
	  level.spawns_zombies[8] = (457.495, -5171.74, -19.875);
	  level.spawns_zombies[9] = (48.8226, -5444.44, -17.8858);
	  level.spawns_zombies[10] = (240.373, -6007.44, -16.4479);
	  level.spawns_zombies[11] = (44.9835, -6316.31, -21.669);
	  level.spawns_zombies[12] = (327.386, -6463.02, -23.875);
	  level.spawns_zombies[13] = (693.586, -6482, -19.875);
	  level.spawns_zombies[14] = (1096.37, -6590.38, 8.125);
	  level.spawns_zombies[15] = (1054.36, -7061.56, 145.625);
	  level.spawns_zombies[16] = (1159.53, -7131.14, 144.125);
	  level.spawns_zombies[17] = (1160.83, -6718.77, 144.125);
	  level.spawns_zombies[18] = (1485.09, -6686.17, 144.125);
	  level.spawns_zombies[19] = (1641.31, -6591.42, 152.125);
	  level.spawns_zombies[20] = (1810.25, -6743.85, 144.125);
	  level.spawns_zombies[21] = (1820.61, -7083.46, 144.125);
	  level.spawns_zombies[22] = (1662.75, -6998.91, 144.125);
	  level.spawns_zombies[23] = (1999.45, -7088.62, 144.125);
	  level.spawns_zombies[24] = (2014.09, -6730.56, 39.3148);
	  level.spawns_zombies[25] = (2280.31, -6745.85, -0.695711);
	  level.spawns_zombies[26] = (2157.25, -7235.97, 14.4623);
	  level.spawns_zombies[27] = (1980.04, -7648.16, 15.0688);
	  level.spawns_zombies[28] = (2373.57, -7765.82, 0.124999);
	  level.spawns_zombies[29] = (2796.39, -7580.29, 4.125);
	  level.spawns_zombies[30] = (2960.98, -7833.94, 0.125001);
	  level.spawns_zombies[31] = (3369.85, -7443.36, 3.10424);
	  level.spawns_zombies[32] = (3740.36, -7734.74, -5.16043);
	  level.spawns_zombies[33] = (3856.82, -7413.34, 12.5491);
	  level.spawns_zombies[34] = (4181.52, -7190.41, 11.6978);
	  level.spawns_zombies[35] = (3986.9, -6986.15, 15.8823);
	  level.spawns_zombies[36] = (3342.44, -7015.54, 2.0484);
	  level.spawns_zombies[37] = (3843.05, -6379.77, 18.1768);
	  level.spawns_zombies[38] = (3413.37, -6381.28, 0.372467);
	  level.spawns_zombies[39] = (4330.59, -6180.78, 0.125);
	  level.spawns_zombies[40] = (4632.88, -6439.02, 0.125);
	  level.spawns_zombies[41] = (4358.7, -7405.8, 19.5368);
	  level.spawns_zombies[42] = (2942.27, -6473.56, 6.17387);
	  level.spawns_zombies[43] = (2649.43, -6692.27, -4.21425);
	  level.spawns_zombies[44] = (3160.74, -6004.71, 0.551564);
	  level.spawns_zombies[45] = (3386.75, -5528.22, 0.124998);
	  level.spawns_zombies[46] = (2962.85, -5230.69, 0.125001);
	  level.spawns_zombies[47] = (2382.67, -5398.78, 0.125001);
	  level.spawns_zombies[48] = (1970.18, -5574.5, -8.82089);
	  level.spawns_zombies[49] = (2183.74, -5136.44, -17.0106);
	  level.spawns_zombies[50] = (1934.94, -4773.86, 12.125);
	  level.spawns_zombies[51] = (1774.16, -4954.04, 12.125);
	  level.spawns_zombies[52] = (1628.12, -4781.52, 12.125);
	  level.spawns_zombies[53] = (1310.4, -4744.21, 12.125);
	  level.spawns_zombies[54] = (1110.88, -4559.54, 12.125);
	  level.spawns_zombies[55] = (1095.13, -4988.29, 12.125);
	  level.spawns_zombies[56] = (1112, -5574.59, -23.875);
	  level.spawns_zombies[57] = (1164.2, -4576.92, 148.125);
	  level.spawns_zombies[58] = (1038.16, -4953.1, 148.125);
	  level.spawns_zombies[59] = (751.833, -4955.94, 148.125);
	  level.spawns_zombies[60] = (258.761, -4958.81, 148.125);
	  level.spawns_zombies[61] = (170.318, -4631.63, 148.125);
	  level.spawns_zombies[62] = (11.6893, -4704.38, 156.125);
	  level.spawns_zombies[63] = (41.7345, -4324.07, 8.79501);
	  level.spawns_zombies[64] = (-255.15, -3873.74, 0.198464);
	  level.spawns_zombies[65] = (796.418, -4776.6, 148.125);
	  level.spawns_zombies[66] = (423.869, -4766.04, 148.125);
	  level.spawns_zombies[67] = (1360.21, -4953.67, 148.125);
	  level.spawns_zombies[68] = (1806.27, -4946.18, 148.125);
	  level.spawns_zombies[69] = (1651.65, -5070.65, 148.125);
	  level.spawns_zombies[71] = (1591.62, -4770.53, 148.125);
	  level.spawns_zombies[72] = (-2.48102, -4880.8, 3.61079);
	  level.spawns_zombies[73] = (-656.761, -5189.14, 4.34726);
	  level.spawns_zombies[74] = (-1048.05, -4914.56, 6.94399);
	  level.spawns_zombies[75] = (-1438.89, -4783.16, 2.34552);
	  level.spawns_zombies[76] = (-1490.05, -3959.47, 29.8011);
	  level.spawns_zombies[77] = (-1728.68, -4416.42, 52.125);
	  level.spawns_zombies[78] = (-1787.1, -4208.34, 52.125);
	  level.spawns_zombies[79] = (-1905.58, -4038.34, 52.125);
	  level.spawns_zombies[80] = (-2124.28, -4219.08, 52.125);
	  level.spawns_zombies[81] = (-2037.31, -4974.92, 52.125);
	  level.spawns_zombies[82] = (-1948.44, -4736.91, 52.125);
	  level.spawns_zombies[83] = (-1748.65, -4961.04, 52.125);
	  level.spawns_zombies[84] = (-2118.46, -4990.27, 52.125);
	  level.spawns_zombies[85] = (-2488.42, -5192.39, 37.2729);
	  level.spawns_zombies[86] = (-1830.57, -5354.4, 25.9822);
	  level.spawns_zombies[87] = (-1192.64, -6246.33, 0.124998);
	  level.spawns_zombies[88] = (-719.939, -6572.83, -1.42771);
	  level.spawns_zombies[89] = (-212.237, -6228.24, 0.125001);
	  level.spawns_zombies[90] = (-2885.9, -4952.95, 52.125);
	  level.spawns_zombies[91] = (-2863.96, -3993.91, 52.125);
	  level.spawns_zombies[92] = (-2458.28, -4611.03, -23.875);
	  level.spawns_zombies[93] = (-2730.52, -4504.5, -23.875);
	  level.spawns_zombies[70] = (-2336.56, -4271.57, -159.875);
	  level.spawns_zombies[95] = (857.044, -6874.19, 144.125);
	  level.spawns_zombies[96] = (414.283, -6888.56, 136.902);
	  level.spawns_zombies[97] = (402.779, -6691.65, 144.125);
	  level.spawns_zombies[98] = (885.609, -6723.9, 151.125);
	  level.spawns_zombies[99] = (757.441, -6893.98, 7.11568);
	  level.spawns_zombies[100] = (872.325, -6709.23, 5.20784);
	  level.spawns_zombies[94] = (1124.23, -6778, 17.7687);
	}
	else if(map == "mp_bsf_dead_night")
	{		
		//Fx_Lava((-34.8113, -1337.77, 107.172));
		Fx_Fire((12.7787, -1085.4, 174.316));
		Fx_Fire((-599.066, -1073.83, 151.585));
		Fx_Fire((637.374, -564.81, 158.725));
		Fx_Fire((-460.87, -461.611, 162.627));
		Fx_Fire((-619.889, -975.742, 146.533));
		Fx_Fire((-725.969, -971.055, 147.632));
		Fx_Fire((-969.721, 142.137, 151.878));
		Fx_Fire((-603.737, -607.666, 282.631));
		Fx_Fire((-520.441, -937.971, 282.633));
		Fx_Fire((-3153, -214.348, 124.394));
		Fx_Fire((-3160.63, 130.353, 125.261));
		Fx_Fire((-2752.16, 104.188, 137.638));
		Fx_Fire((-2736.31, -202.872, 132.632));
		level.spawns_humans[0] = (769.515, -758.04, 106.453); 
		level.spawns_zombies[0] = (891.124, -599.926, 107.177);
		level.spawns_zombies[1] = (824.147, -839.394, 113.805);
		level.spawns_zombies[2] = (347.812, -580.704, 104.185);
		level.spawns_zombies[3] = (844.308, -962.97, 104.125);
		level.spawns_zombies[4] = (205.515, -1060.07, 109.384);
		level.spawns_zombies[5] = (191.13, -1439.21, 106.69);
		level.spawns_zombies[6] = (-185.55, -1409.63, 113.963);
		level.spawns_zombies[7] = (-458.818, -1064.32, 106.468);
		level.spawns_zombies[8] = (-519.845, -1257.83, 116.918);
		level.spawns_zombies[9] = (-883.564, -1163.97, 111.625);
		level.spawns_zombies[10] = (-438.348, -547.329, 111.732);
		level.spawns_zombies[11] = (-676.548, -576.213, 104.088);
		level.spawns_zombies[12] = (-880.798, -622.649, 104.104);
		level.spawns_zombies[13] = (-974.27, -352.557, 114.247);
		level.spawns_zombies[14] = (-593.082, -161.367, 104.125);
		level.spawns_zombies[15] = (-674.385, 46.0195, 104.125);
		level.spawns_zombies[16] = (-880.761, 129.731, 105.244);
		level.spawns_zombies[17] = (301.118, -1338.72, 105.665);
		level.spawns_zombies[18] = (-423.73, -888.95, 241.625);
		level.spawns_zombies[19] = (-451.882, -640.245, 241.625);
		level.spawns_zombies[20] = (-244.561, -576.29, 241.625);
		level.spawns_zombies[21] = (-703.328, -733.957, 240.625);
		level.spawns_zombies[22] = (-1051.3, -938.032, 240.625);
		level.spawns_zombies[23] = (-1017.68, -593.949, 240.625);
		level.spawns_zombies[24] = (-790.716, -322.608, 240.625);
		level.spawns_zombies[25] = (-944.07, 40.2697, 240.625);
		level.spawns_zombies[26] = (-632.391, -281.031, 240.625);
		level.spawns_zombies[27] = (-246.565, -269.76, 240.625);
		level.spawns_zombies[28] = (-163.753, -378.03, 240.625);
		level.spawns_zombies[29] = (37.9429, -614.811, 176.125);
		level.spawns_zombies[30] = (-133.881, -809.207, 104.161);
		level.spawns_zombies[31] = (-937.9, -802.751, 104.454);
		level.spawns_zombies[32] = (-34.7382, -1177.83, 111.624);
		level.spawns_zombies[33] = (-2614.03, -23.5572, 90.625); // ab hier geheimgang
		level.spawns_zombies[34] = (-2342.92, -81.12, 90.625);
		level.spawns_zombies[35] = (-1907.19, -291.727, 90.625);
		level.spawns_zombies[36] = (-1414.13, -439.968, 90.625);
		level.spawns_zombies[37] = (-2743.1, -81.4169, 90.625);
		level.spawns_zombies[38] = (-2812.73, 35.0279, 92.3273);
		level.spawns_zombies[39] = (-2823.62, -186.261, 90.5047);
	}
	else if(map == "mp_bo2_town")
	{
		CreateGum((861.68, 498.92, 154.329),(0, -89.5276, 0));
		thread handleDoors();
		deleteTownFx();
		/*
		thread door_bar_back()
		thread door_bank();
		thread door_bank_back();
		thread door_house();
		*/
		level.spawns_humans[0] = (-291.071, 356.484, -11.875);
		level.spawns_humans[1] = (131.375, 255.81, -19.875);
		//thread CreateAirplaneFly((8.67773, 98.321, 90.9894), (151.286, -1476.81, 137.898), (-5.67342, -1468.72, 153.834),(-100.665, -1467.78, 146.369),(238.13, -1455.72, 146.904),(0, -28.6139, 0));
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
	else if(map == "mp_afghan")
	{
	    level.spawns_humans[0] = (-1091.7, 1273.74, 97.3673);
		level.spawns_zombies[0] = (-356.095, 1660.33, 200.126);
		level.spawns_zombies[1] = (-382.975, 958.792, 202.327);
		level.spawns_zombies[2] = (-1082.99, 918.296, 180.055);
		level.spawns_zombies[3] = (-856.723, 1708.88, 214.13);		
		level.spawns_zombies[4] = (1177.1, 1849.56, 137.176);
		level.spawns_zombies[5] = (1074.26, 1137.21, 125.96);
		level.spawns_zombies[6] = (1676.24, 1506.39, 16.284);
		level.spawns_zombies[7] = (1106.47, 925.483, 145.954);
		level.spawns_zombies[8] = (1344.86, 1382.14, 72.1867);
		level.spawns_zombies[9] = (1603.93, 931.513, 55.9071);
		level.spawns_zombies[10] = (339.942, 1562.03, 172.759);
		level.spawns_zombies[11] = (-16.4879, 1729.02, 200.046);
		level.spawns_zombies[12] = (-25.4045, 1400.83, 187.878);
		level.spawns_zombies[13] = (639.731, 2105.72, 179.077);
		//level.spawns_zombies[14] = (321.415, 2641.13, 236.062);
		//level.spawns_zombies[15] = (-243.502, 2532.55, 134.054);
		level.spawns_zombies[15] = (1946.41, 1106.4, 89.1835);
		level.spawns_zombies[16] = (-14.4629, 2200.29, 198.65);
		level.spawns_zombies[17] = (932.652, 3672.02, 246.347);
		level.spawns_zombies[18] = (738.691, 3287.52, 237.281);
		level.spawns_zombies[19] = (49.4212, 3222.77, 104.125);
		level.spawns_zombies[20] = (-415.125, 2875.16, -23.875);
		level.spawns_zombies[21] = (-391.1, 2588.61, -55.875);
		level.spawns_zombies[22] = (-279.412, 2537.98, -55.875);
		level.spawns_zombies[23] = (-495.232, 205.115, 74.689);
		level.spawns_zombies[24] = (-22.1566, -339.013, -40.2329);
		level.spawns_zombies[25] = (-83.9622, -654.699, -67.6905);
		level.spawns_zombies[26] = (-739.823, 58.3132, 368.388);
		level.spawns_zombies[27] = (-950.753, 566.436, 440.125);
		level.spawns_zombies[28] = (-356.29, -859.641, -113.47);
		level.spawns_zombies[29] = (1024.93, -447.04, 62.3244);
		level.spawns_zombies[30] = (1287.56, 114.373, -18.2324);
		level.spawns_zombies[31] = (2236.46, 228.606, 125.135);
		level.spawns_zombies[32] = (2070.14, 733.021, 13.7289);
		level.spawns_zombies[33] = (2499.69, 880.157, 75.0639);
		level.spawns_zombies[34] = (2288.91, 1434.61, 27.4469);
		level.spawns_zombies[35] = (2168.04, 2688.21, 221.338);
		level.spawns_zombies[36] = (2752.45, 1579.15, 350.143);
		level.spawns_zombies[37] = (3254.05, 953.899, 66.3311);
		level.spawns_zombies[38] = (3423.06, 654.062, 59.4632);
		level.spawns_zombies[39] = (3862.29, 561.371, 77.7611);
		level.spawns_zombies[40] = (4182.88, 593.165, 74.9769);
		level.spawns_zombies[41] = (3931.73, 840.306, 75.591);
		level.spawns_zombies[42] = (3939.86, 1236.65, 134.467);
		level.spawns_zombies[43] = (3273.65, 1690.06, 42.5044);
		level.spawns_zombies[44] = (3499.14, 2267.56, -14.6534);
		level.spawns_zombies[45] = (3228.57, 2396.4, -19.7076);
		level.spawns_zombies[46] = (3761.84, 2686.39, 1.75628);
		level.spawns_zombies[47] = (3793.39, 3205.55, 375.505);
		level.spawns_zombies[48] = (3156.15, 3889.33, 332.325);
		level.spawns_zombies[49] = (3097.18, 3410.47, 253.193);
		level.spawns_zombies[50] = (2582.15, 3222.53, 295.946);
		level.spawns_zombies[51] = (2010.1, 3779.4, 244.376);
		level.spawns_zombies[52] = (1603.92, 3351.22, 250.49);
		level.spawns_zombies[53] = (1970.67, 2840.5, 323.364);
		level.spawns_zombies[54] = (1550.68, 3934.79, 253.729);	
		level.spawns_zombies[55] = (3360.4, 284.785, 144.125);
		level.spawns_zombies[56] = (3503.77, 10.4534, 150.861);
		level.spawns_zombies[57] = (3115.5, -52.6859, 129.036);
		level.spawns_zombies[58] = (2739.43, 32.0292, 135.106);
		level.spawns_zombies[59] = (2059.38, 31.2395, 136.125);
		level.spawns_zombies[60] = (1856.91, -211.071, 136.125);
		level.spawns_zombies[14] = (1706.41, 733.797, 45.2699);	
		Fx(level._effect["FOW"], (2026.13, 1442.83, 15.286));
		Fx(level._effect["FOW"], (-769.104, 2539.21, -109.588));
		Fx(level._effect["FOW"], (-2640.44, 1079.44, -867.875));
	}
	else if(map == "mp_rust")
	{
		level.spawns_humans[0] = (-39.922, 264.065, -239.875);
		level.spawns_humans[1] = (924.579, 150.022, -247.409);
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
		level.spawns_zombies[52] =  (719.423, 988.437, 267.419);
		level.spawns_zombies[53] = (576.42, 1070.35, 266.96);
		level.spawns_zombies[54] = (280.845, 552.621, -196.03);
		level.spawns_zombies[55] = (161.772, 818.87, -115.875);
		level.spawns_zombies[56] = (696.602, 829.801, -102.77);
		level.spawns_zombies[57] = (851.873, 814.438, -165.875);
		level.spawns_zombies[58] = (-145.055, -33.7113, -130.151);
		level.spawns_zombies[59] = (1737.2, 1652.74, -134.254);
		//CreateMeteorShower(level.spawns_humans[0]);		
	}
	else if(map == "mp_highrise")
	{
		level.spawns_humans[0] = (-2356.18, 6439.77, 2776.13);
		level.spawns_humans[1] = (1357.54, 7481.86, 2824.13);
		level.spawns_zombies[0] = (-556.847, 5521.17, 2776.13);
		level.spawns_zombies[1] = (-148.117, 5700.88, 2776.13);
		level.spawns_zombies[2] = (-341.929, 5954.63, 2776.13);
		level.spawns_zombies[3] = (-582.234, 6001.89, 2776.13);
		level.spawns_zombies[4] = (-1072.57, 5298.81, 2776.13);
		level.spawns_zombies[5] = (-1041.25, 6019.76, 2776.13);
		level.spawns_zombies[6] = (-838.448, 6476.27, 2776.13);
		level.spawns_zombies[7] = (-237.901, 6479.88, 2776.13);
		level.spawns_zombies[8] = (-143.867, 7113.58, 2776.13);
		level.spawns_zombies[9] = (-575.998, 7282.98, 2776.13);
		level.spawns_zombies[10] = (-915.854, 7457.3, 2776.13);
		level.spawns_zombies[11] = (-1185.84, 7241.3, 2776.13);
		level.spawns_zombies[12] = (-1505.95, 7243.58, 2776.13);
		level.spawns_zombies[13] = (-1806.02, 7441.18, 2776.13);
		level.spawns_zombies[14] = (-2032.57, 7248.08, 2776.13);
		level.spawns_zombies[15] = (-2512.6, 7288.6, 2776.13);
		level.spawns_zombies[16] = (-2444.1, 6904.35, 2776.13);
		level.spawns_zombies[17] = (-2876.78, 7039.17, 2824.13);
		level.spawns_zombies[18] = (-2553.36, 6390.68, 2776.13);
		level.spawns_zombies[19] = (-2030.65, 6263.16, 2776.13);
		level.spawns_zombies[20] = (-2091.45, 5786.85, 2776.13);
		level.spawns_zombies[21] = (-2472.97, 5457.11, 2776.13);
		level.spawns_zombies[22] = (-2513.97, 5929.63, 2776.13);
		level.spawns_zombies[23] = (-2281.85, 6074.46, 2776.13);		
		level.spawns_zombies[24] = (-1844.25, 6268.27, 2864.13);
		level.spawns_zombies[25] = (-1860.61, 6109.25, 2864.13);
		level.spawns_zombies[26] = (-1403.81, 5661.29, 2976.13);
		level.spawns_zombies[27] = (-1240.29, 5722.03, 2976.13);
		level.spawns_zombies[28] = (-1364.07, 6161.23, 2976.13);
		level.spawns_zombies[29] = (-1184.44, 6789.59, 2774.88);
		level.spawns_zombies[30] = (-1316.13, 6392, 2776.13);
		level.spawns_zombies[31] = (-1834.11, 6563.23, 2648.13);
		level.spawns_zombies[32] = (-2172.39, 6691.64, 2648.13);
		level.spawns_zombies[33] = (-2151.24, 7113.8, 2648.13);
		level.spawns_zombies[34] = (-1791.46, 6826.92, 2696.13);
		level.spawns_zombies[35] = (-1536.96, 7089.1, 2648.13);
		level.spawns_zombies[36] = (-836.32, 7047.54, 2648.13);
		level.spawns_zombies[37] = (-870.126, 6564.85, 2648.13);
		level.spawns_zombies[38] = (-1369.2, 6545.82, 2648.13);
		level.spawns_zombies[39] = (-1388.04, 6037.53, 2648.13);
		level.spawns_zombies[40] = (-1385.92, 5594.27, 2776.13);
		level.spawns_zombies[41] = (-1346.96, 5315.47, 2776.13);
		level.spawns_zombies[42] = (-1728.72, 5332.44, 2776.13);
		level.spawns_zombies[43] = (-1807.49, 5677.88, 2776.13);
		level.spawns_zombies[44] = (-1633.89, 6158.63, 2776.13);
		level.spawns_zombies[45] = (-535.624, 6734.18, 2648.13);
		level.spawns_zombies[46] = (-455.474, 6667.55, 2776.13);
		level.spawns_zombies[47] = (237.492, 6866.34, 2648.13);
		level.spawns_zombies[48] = (611.919, 6734.6, 2648.13);
		level.spawns_zombies[49] = (362.885, 6688.97, 2648.13);
		level.spawns_zombies[50] = (666.175, 6939.37, 2648.13);
		level.spawns_zombies[51] = (875.293, 6888.78, 2648.13);
		level.spawns_zombies[52] = (1088.44, 6900.4, 2824.13);
		level.spawns_zombies[53] = (797.825, 6648.09, 2824.13);
		level.spawns_zombies[54] = (350.668, 6660.22, 2824.13);
		level.spawns_zombies[55] = (405.604, 6263.02, 2824.13);
		level.spawns_zombies[56] = (579.176, 6005, 2824.13);
		level.spawns_zombies[57] = (281.853, 5694.16, 2824.13);
		level.spawns_zombies[58] = (163.847, 6311.63, 2824.13);
		level.spawns_zombies[59] = (299.764, 7106.18, 2824.13);
		level.spawns_zombies[60] = (643.188, 7242.83, 2824.13);
		level.spawns_zombies[61] = (305.473, 7458.92, 2824.13);
		level.spawns_zombies[62] = (678.213, 7596.16, 2824.13);
		level.spawns_zombies[63] = (988.654, 7409.5, 2824.13);
		level.spawns_zombies[64] = (-116.345, 6144.81, 3099.13);
		level.spawns_zombies[65] = (25.3308, 5960.69, 3020.13);
		level.spawns_zombies[66] = (17.5548, 6336.92, 3020.13);
		level.spawns_zombies[67] = (7.91584, 6765.79, 3020.13);
		level.spawns_zombies[68] = (76.9709, 7439.61, 3051.13);
		level.spawns_zombies[69] = (-103.174, 7756.23, 3024.99);
		level.spawns_zombies[70] = (-673.396, 8021.38, 2980.63);
		level.spawns_zombies[71] = (-1375.67, 8360.44, 2925.62);
		level.spawns_zombies[72] = (-2055.4, 8678.25, 2871.42);
		level.spawns_zombies[73] = (-1635.71, 8477.3, 3280.13);
		level.spawns_zombies[74] = (-1528.07, 7487.96, 2944.13);
		level.spawns_zombies[75] = (-1165.38, 7505.94, 2944.13);
		level.spawns_zombies[76] = (-1246.19, 8026.61, 2874.13);
		level.spawns_zombies[77] = (-1372.29, 7016.18, 3002.13);
		level.spawns_zombies[78] = (-1263.47, 6534.77, 3042.13);
		level.spawns_zombies[79] = (-1645.72, 5084.4, 2646.36);
		level.spawns_zombies[80] = (-299.177, 5280.6, 2667.13);
		Fx_Fire((-2739.85, 5177.29, 2995.62));
		Fx_Fire((-2721.94, 5178.9, 2935.81));
		Fx_Fire((-2724.66, 5173.12, 2885.11));
		Fx_Fire((-2789.97, 5188, 3013.6));
	}
	else if(map == "mp_brecourt")
	{
		level.spawns_humans[0]= (885.488, -695.097, -45.3186);
		level.spawns_zombies[0] = (-3226.72, 72.8727, 35.222);
		level.spawns_zombies[1] = (-3334.88, 738.799, 32.1251);
		level.spawns_zombies[2] = (-3303.74, 1486.11, 41.5626);
		level.spawns_zombies[3] = (-2616.68, 1493.98, 35.3564);
		level.spawns_zombies[4] = (-2347.6, 826.41, -20.0107);
		level.spawns_zombies[5] = (-2635.09, 60.9849, 31.5158);
		level.spawns_zombies[6] = (-2443.36, -656.019, 2.80246);
		level.spawns_zombies[7] = (-1667.33, -851.177, 14.733);
		level.spawns_zombies[8] = (-2102.57, -1823.06, -25.0474);
		level.spawns_zombies[9] = (-1651.34, -2244.66, 12.355);
		level.spawns_zombies[10] = (-1590.45, -1446.16, 44.7776);
		level.spawns_zombies[11] = (-546.882, -1330.28, 3.36232);
		level.spawns_zombies[12] = (-711.944, -871.983, 38.3765);
		level.spawns_zombies[13] = (-492.034, -570.146, 38.8031);
		level.spawns_zombies[14] = (-123.79, -392.912, 55.6173);
		level.spawns_zombies[15] = (539.694, -335.264, 107.501);
		level.spawns_zombies[16] = (243.899, -992.493, 37.1469);
		level.spawns_zombies[17] = (635.418, -1509.95, 5.48308);
		level.spawns_zombies[18] = (273.715, -1832.78, 60.4718);
		level.spawns_zombies[19] = (-310.016, -1861.36, 1.07599);
		level.spawns_zombies[20] = (-734.968, -2344.17, 42.5929);
		level.spawns_zombies[21] = (-853.73, -3097.96, 46.4448);
		level.spawns_zombies[22] = (-1410.86, -3236.78, 43.2652);
		level.spawns_zombies[23] = (-2223.74, -2466.53, 36.4848);
		level.spawns_zombies[24] = (-2363.03, -1219.93, 32.789);
		level.spawns_zombies[25] = (-2090.48, -1223.53, 38.045);
		level.spawns_zombies[26] = (64.3545, -1436.44, 44.2566);
		level.spawns_zombies[27] = (661.989, -847.463, -35.0865);
		level.spawns_zombies[28] = (798.163, -403.116, -42.1829);
		level.spawns_zombies[29] = (724.048, 63.5745, 5.43096);
		level.spawns_zombies[30] = (1304.96, -883.619, -57.1862);
		level.spawns_zombies[31] = (1012.21, -754.454, -59.0915);
		level.spawns_zombies[32] = (1832.94, -1526.88, -11.6806);
		level.spawns_zombies[33] = (2235.4, -1422.8, 87.7007);
		level.spawns_zombies[34] = (1978.11, -764.236, 27.2742);
		level.spawns_zombies[35] = (3035.19, -841.595, -21.8744);
		level.spawns_zombies[36] = (2982.83, -1459.11, -11.3079);
		level.spawns_zombies[37] = (2359.57, -1825.07, -14.0301);
		level.spawns_zombies[38] = (1868.9, -2512.9, 32.762);
		level.spawns_zombies[39] = (2107.57, -2924.78, 39.1905);
		level.spawns_zombies[40] = (1732.76, -3209.48, 32.1246);
		level.spawns_zombies[41] = (2047.1, -3615.88, 66.2511);
		level.spawns_zombies[42] = (1274.7, -3713.96, 79.6348);
		level.spawns_zombies[43] = (794.849, -2976.82, -17.3343);
		level.spawns_zombies[44] = (507.63, -3547, 58.0091);
		level.spawns_zombies[45] = (311.123, -2339.8, -9.34794);
		level.spawns_zombies[46] = (1112.27, -2129.23, 25.7945);
		level.spawns_zombies[47] = (1594.46, -2138.57, 69.1321);
		level.spawns_zombies[48] = (2710.41, -2638.4, 38.0761);
		level.spawns_zombies[49] = (3328.44, -3134.97, 42.2322);
		level.spawns_zombies[50] = (3819.73, -2520.33, 40.4325);
		level.spawns_zombies[51] = (3809.48, -1954.46, -4.86669);
		level.spawns_zombies[52] = (3525.56, -1533.84, -25.8299);
		level.spawns_zombies[53] = (4011.06, -871.198, -19.5554);
		level.spawns_zombies[54] = (3334.85, -559.568, 29.2438);
		level.spawns_zombies[55] = (3270.87, 246.544, -45.5661);
		level.spawns_zombies[56] = (4309.72, 834.553, 43.6971);
		level.spawns_zombies[57] = (3200.81, 1985.87, 32.1255);
		level.spawns_zombies[58] = (2531.82, 2181.54, 51.3109);
		level.spawns_zombies[59] = (1806.92, 2176.38, 34.4725);
		level.spawns_zombies[60] = (1084.33, 2403.8, 25.7538);
		level.spawns_zombies[61] = (566.616, 2313.59, 25.5566);
		level.spawns_zombies[62] = (62.5116, 2260.39, 8.125);
		level.spawns_zombies[63] = (7.74436, 2125.63, 8.125);
		level.spawns_zombies[64] = (249.211, 2033.21, 8.125);
		level.spawns_zombies[65] = (188.994, 1554.07, -103.426);
		level.spawns_zombies[66] = (76.3443, 1426.61, -19.632);
		level.spawns_zombies[67] = (883.993, 1414.89, -10.3165);
		level.spawns_zombies[68] = (1603.49, 967.466, -93.875);
		level.spawns_zombies[69] = (1647.68, 1160.88, -93.875);
		level.spawns_zombies[70] = (1586.05, 778.671, -93.875);
		level.spawns_zombies[71] = (1729.84, 875.954, -93.875);
		level.spawns_zombies[72] = (1823.04, 649.828, 9.17887);
		level.spawns_zombies[73] = (1674.78, 481.28, 40.4818);
		level.spawns_zombies[74] = (1448.05, 145.588, 32.7132);
		level.spawns_zombies[75] = (2289.62, 97.7525, 3.72833);
		level.spawns_zombies[76] = (2736.31, 38.2187, -1.49643);
		level.spawns_zombies[77] = (996.452, 434.868, 34.7702);
		level.spawns_zombies[78] = (479.382, 552.33, -19.2297);
		level.spawns_zombies[79] = (27.3624, 129.986, 32.9814);
		level.spawns_zombies[80] = (-592.576, 323.951, 47.2228);
		level.spawns_zombies[81] = (-912.843, 894.379, 9.30938);
		level.spawns_zombies[82] = (-1118.8, 1243.33, 77.0154);
		level.spawns_zombies[83] = (-583.478, 2151.98, -2.96416);
		level.spawns_zombies[84] = (-742.955, 1498.31, 38.469);
		level.spawns_zombies[85] = (-140.357, 2494.05, 47.8835);
		level.spawns_zombies[86] = (-809.519, 2509.69, 52.9478);
		level.spawns_zombies[87] = (-1415, 2787.43, 53.2982);
		level.spawns_zombies[88] = (-2295.71, 2137.83, 104.648);
		level.spawns_zombies[89] = (-1408.52, 2187.8, 42.925);
		level.spawns_zombies[90] = (-1189.03, 2085.45, 42.925);
		level.spawns_zombies[91] = (-1080.76, 2275.59, 58.925);
		level.spawns_zombies[92] = (-1756.32, 1753.29, 30.9609);
		level.spawns_zombies[93] = (-2272.28, 1698.04, 126.921);
		level.spawns_zombies[94] = (-2707.05, 2193.54, 66.2267);
		level.spawns_zombies[95] = (-3221.41, 1755.55, 35.8803);
		level.spawns_zombies[96] = (-2829.38, 1217.97, 23.026);
		Fx(level._effect["FOW"], (2026.13, 1442.83, 15.286));
		Fx(level._effect["FOW"], (-769.104, 2539.21, -109.588));
		Fx(level._effect["FOW"], (-2640.44, 1079.44, -867.875));
		level.spawns_helis[0] = (1995.53, -2092.54, 42.9683);
		level.spawns_helis[1] = (-299.774, -1337.97, 1.90914);
		level.spawns_helis[2] = (-1978.16, 1110.26, -22.3692);
		level.spawns_helis[3] = (-1988.53, 1142.37, -19.7251);
	}
	else if(map == "mp_quarry")
	{
		level.spawns_humans[0] = (-3425.39, 650.941, -279.875);
		level.spawns_humans[1] = (-3429.15, 609.848, -111.875);
	   level.spawns_zombies[0] = (-3100.63, 1441.46, -20.1157);
	   level.spawns_zombies[1] = (-2798.17, 1379.64, 67.326);
	   level.spawns_zombies[2] = (-2750.85, 1071.11, 56.3364);
	   level.spawns_zombies[3] = (-2740.92, 659.556, 57.4992);
	   level.spawns_zombies[4] = (-2734.41, 319.54, 21.5869);
	   level.spawns_zombies[5] = (-2251.76, 583.13, 14.803);
	   level.spawns_zombies[6] = (-1935.97, 420.097, -6.03312);
	   level.spawns_zombies[7] = (-1759.83, 527.565, 21.7515);
	   level.spawns_zombies[8] = (-2328.86, 167.497, -121.762);
	   level.spawns_zombies[9] = (-2773.73, -52.6288, -229.409);
	   level.spawns_zombies[10] = (-3056.7, -20.9892, -251.241);
	   level.spawns_zombies[11] = (-3095.32, 452.11, -302.961);
	   level.spawns_zombies[12] = (-3639.72, 398.336, -285.21);
	   level.spawns_zombies[13] = (-3713.75, 545.789, -291.905);
	   level.spawns_zombies[14] = (-3553.34, 727.466, -279.875);
	   level.spawns_zombies[15] = (-3311.9, 583.729, -279.875);
	   level.spawns_zombies[16] = (-3315.47, 755.477, -279.875);
	   level.spawns_zombies[17] = (-3068.6, 765.584, -348.033);
	   level.spawns_zombies[18] = (-2985.91, 1073.79, -378.548);
	   level.spawns_zombies[19] = (-3700.3, 1136.05, -343.978);
	   level.spawns_zombies[20] = (-4278.46, 338.498, -127.822);
	   level.spawns_zombies[21] = (-3478.79, 1408.97, 53.6236);
	   level.spawns_zombies[22] = (-3756.89, 1424.06, 93.2137);
	   level.spawns_zombies[23] = (-3935.37, 1499.41, 123.833);
	   level.spawns_zombies[24] = (-4052.45, 1204.29, 7.10928);
	   level.spawns_zombies[25] = (-4724.89, 1105.06, 140.754);
	   level.spawns_zombies[26] = (-4899.18, 1115.07, 117.395);
	   level.spawns_zombies[27] = (-4786.66, 1752.49, 149.474);
	   level.spawns_zombies[28] = (-5264.83, 1724.96, 77.0456);
	   level.spawns_zombies[29] = (-5344.16, 1029.61, 14.1604);
	   level.spawns_zombies[30] = (-5129.29, 732.656, -214.381);
	   level.spawns_zombies[31] = (-5163.53, 1222.8, -288.061);
	   level.spawns_zombies[32] = (-4988.02, 1569.45, -278.33);
	   level.spawns_zombies[33] = (-4442.34, 1583.28, -214.483);
	   level.spawns_zombies[34] = (-4356.24, 1092.84, -279.309);
	   level.spawns_zombies[35] = (-4529.79, 992.198, -191.875);
	   level.spawns_zombies[36] = (-4792.7, 1012.37, -191.875);
	   level.spawns_zombies[37] = (-4875.33, 806.372, -191.875);
	   level.spawns_zombies[38] = (-4694.36, 673.086, -191.875);
	   level.spawns_zombies[39] = (-4690.76, 1300.1, -191.875);
	   level.spawns_zombies[40] = (-4442.81, 620.464, -57.875);
	   level.spawns_zombies[41] = (-4439.53, 310.784, -57.875);
	   level.spawns_zombies[42] = (-4310.63, -302.098, -191.875);
	   level.spawns_zombies[43] = (-4456.91, -21.5135, -191.875);
	   level.spawns_zombies[44] = (-4718.33, -98.9635, -191.875);
	   level.spawns_zombies[45] = (-4919.5, -340.445, -191.875);
	   level.spawns_zombies[46] = (-4581.57, -657.27, -168.653);
	   level.spawns_zombies[47] = (-5142.07, -801.998, -177.568);
	   level.spawns_zombies[48] = (-5399.7, -100.673, -204.186);
	   level.spawns_zombies[49] = (-5304.99, -669.872, -195.185);
	   level.spawns_zombies[50] = (-5445.6, -1127.29, -188.653);
	   level.spawns_zombies[51] = (-5134.93, -1270.3, -190.786);
	   level.spawns_zombies[52] = (-5037.28, -1077.41, -191.875);
	   level.spawns_zombies[53] = (-4919.83, -1541.1, -15.875);
	   level.spawns_zombies[54] = (-4957.85, -1701.11, 8.125);
	   level.spawns_zombies[55] = (-5561.69, -1724.32, 68.125);
	   level.spawns_zombies[56] = (-5126.48, -451.661, 127.125);
	   level.spawns_zombies[57] = (-5136.88, 200.983, -84.875);
	   level.spawns_zombies[58] = (-4856.18, 210.704, -78.875);
	   level.spawns_zombies[59] = (-4628.22, 313.552, -168.371);
	   level.spawns_zombies[60] = (-4906.1, 474.837, -38.3752);
	   level.spawns_zombies[61] = (-4927.79, 208.283, 18.125);
	   level.spawns_zombies[62] = (-4129.7, 2086.09, -14.6368);
	   level.spawns_zombies[63] = (-3839.72, 1775.57, 0.125);
	   level.spawns_zombies[64] = (-2903.14, 2197.69, 30.7865);
	   level.spawns_zombies[65] = (-2485.55, 2027.94, 14.475);
	   level.spawns_zombies[66] = (-2171.19, 1857.42, 24.125);
	   level.spawns_zombies[67] = (-1624.72, 1710.43, 24.125);
	   level.spawns_zombies[68] = (-1667.04, 1297.84, 24.125);
	   level.spawns_zombies[69] = (-2181.55, 1356.65, 20.6488);
		level.spawns_zombies[70] = (-4038.7, 2524.74, 40.125);
	   level.spawns_zombies[71] = (-4254.97, 2569.13, 40.125);
		level.spawns_zombies[72] = (-3600.97, 2220.81, 169.047);
	   level.spawns_zombies[73] = (-3976.77, 133.896, 40.8632);
	   level.spawns_zombies[74] = (-3674.13, 114.667, 13.5706);
	   level.spawns_zombies[75] = (-3539.81, 538.099, -111.875);
	   level.spawns_zombies[76] = (-3299.63, 551.797, -111.875);
	   level.spawns_zombies[77] = (-3296.18, 802.699, -111.875);
	   level.spawns_zombies[78] = (-3087.03, -1283.52, 53.2385);
	   level.spawns_zombies[79] = (-3092.48, -1538.61, 160.125);
	   level.spawns_zombies[80] = (-2698.22, -1717.75, 392.125);
	   level.spawns_zombies[81] = (-3263.58, -1804.17, 416.125);
	   level.spawns_zombies[82] = (-3784.71, -1922.85, 440.125);
	   level.spawns_zombies[83] = (-1461.81, 303.217, 224.125);
	   level.spawns_zombies[84] = (-1559.14, 16.6531, 200.125);
	   level.spawns_zombies[85] = (-2519.32, 331.203, 54.125);
	   Fx(level._effect["FOW"], (-4416.03, 267.183, 1500.717));
	   Fx(level._effect["FOW"], (-2183.57, 1059.82, 1556.44));
	   Fx(level.fire_large,(-3698.58, 1515.67, 306.558));
	   Fx(level.fire_large,(-3720.86, 1630.97, 291.007));
	   Fx(level.fire_large,(-3721.49, 1757.83, 292.975));
	   Fx(level.fire_large,(-3708.42, 1861.11, 305.438));
	}
	else if(map == "mp_nightshift")
	{
		level.spawns_zombies[0] = (1029.8, 44.6311, -6.2038);
		level.spawns_zombies[1] = (1426.27, 415.237, 8.125);
		level.spawns_zombies[2] = (1370.92, -147.544, 101.468);
		level.spawns_zombies[3] = (1612.39, 75.9293, 0.124999);
		level.spawns_zombies[4] = (1628.17, -377.996, 0.124999);
		level.spawns_zombies[5] = (1932.42, -116.513, 108.125);
		level.spawns_zombies[6] = (1925.39, 107.536, 108.125);
		level.spawns_zombies[7] = (1932.15, -764.087, 107.125);
		level.spawns_zombies[8] = (1670.06, -767.264, 108.125);
		level.spawns_zombies[9] = (1324.77, -539.261, 0.125001);
		level.spawns_zombies[10] = (966.583, -734.202, 108.125);
		level.spawns_zombies[11] = (1338.47, -1004.75, 0.125001);
		level.spawns_zombies[12] = (1387.23, -1501.93, 0.124998);
		level.spawns_zombies[13] = (796.664, -1386.46, -7.875);
		level.spawns_zombies[14] = (737.914, -879.068, 0.125001);
		level.spawns_zombies[15] = (779.156, -335.696, 4.125);
		level.spawns_zombies[16] = (218.415, -748.546, 0.124999);
		level.spawns_zombies[17] = (311.157, -1286.57, 2.125);
		level.spawns_zombies[18] = (-273.907, -744.272, 0.125001);
		level.spawns_zombies[19] = (-2.03901, -516.307, 0.704293);
		level.spawns_zombies[20] = (-94.3966, -103.43, 8.125);
		level.spawns_zombies[21] = (25.3585, 210.047, 0.124998);
		level.spawns_zombies[22] = (456.198, 175.668, 0.669823);
		level.spawns_zombies[23] = (-16.9655, 535.284, 8.125);
		level.spawns_zombies[24] = (-71.4971, 861.344, 80.125);
		level.spawns_zombies[25] = (-502.927, 791.968, 80.125);
		level.spawns_zombies[26] = (-963.93, 880.239, 80.125);
		level.spawns_zombies[27] = (-1438.84, 875.462, -7.875);
		level.spawns_zombies[28] = (-1466.05, 267.178, -7.875);
		level.spawns_zombies[29] = (-1114.16, 820.715, 80.125);
		level.spawns_zombies[30] = (-952.353, 443.507, 136.125);
		level.spawns_zombies[31] = (-827.012, 233.285, 136.125);
		level.spawns_zombies[32] = (-529.714, 282.992, 149.65);
		level.spawns_zombies[33] = (-333.385, -28.2964, 176.125);
		level.spawns_zombies[34] = (-397.104, -338.149, 170.999);
		level.spawns_zombies[35] = (-213.044, -364.039, 184.125);
		level.spawns_zombies[36] = (-723.507, -275.447, 136.125);
		level.spawns_zombies[37] = (-897.635, -567.951, 136.125);
		level.spawns_zombies[38] = (-938.1, -754.994, 136.125);
		level.spawns_zombies[39] = (-342.66, -875.966, 136.125);
		level.spawns_zombies[40] = (-234.347, -860.843, 136.125);
		level.spawns_zombies[41] = (-442.419, -994.461, 136.125);
		level.spawns_zombies[42] = (-586.699, -1236.7, 136.125);
		level.spawns_zombies[43] = (-577.19, -1023.34, 136.125);
		level.spawns_zombies[44] = (-591.735, -1688.67, 136.125);
		level.spawns_zombies[45] = (-658.179, -1959.36, 136.125);
		level.spawns_zombies[46] = (-914.963, -2153.02, 80.125);
		level.spawns_zombies[47] = (-922.481, -1877.56, 0.124999);
		level.spawns_zombies[48] = (-508.225, -1898.8, 0.124999);
		level.spawns_zombies[49] = (-50.6561, -1887.18, 0.124999);
		level.spawns_zombies[50] = (337.203, -1871.63, 0.124999);
		level.spawns_zombies[51] = (831.656, -1965.02, 32.125);
		level.spawns_zombies[52] = (1048.29, -2148.7, 32.125);
		level.spawns_zombies[53] = (759.563, -2128.94, 176.125);
		level.spawns_zombies[54] = (1128.77, -2151.02, 176.125);
		level.spawns_zombies[55] = (-643.508, -526.615, -3.875);
		level.spawns_zombies[56] = (-753.237, -781.176, -3.875);
		level.spawns_zombies[57] = (-756.71, -1203.44, 136.125);
		level.spawns_zombies[58] = (-1081.18, -607.519, -13.8086);
		level.spawns_zombies[59] = (-1229.29, -951.571, -11.875);
		level.spawns_zombies[60] = (-970.06, -1226.98, 0.125001);
		level.spawns_zombies[61] = (-1614.68, -1172.4, -11.875);
		level.spawns_zombies[62] = (-1988.01, -1255.55, -7.875);
		level.spawns_zombies[63] = (-1782.37, -1537.74, -11.875);
		level.spawns_zombies[64] = (-1902.09, -2426.22, 55.3448);
		level.spawns_zombies[65] = (-1616.76, -2370.35, 43.829);
		level.spawns_zombies[66] = (-1757.09, -2316.91, 28.3773);
		level.spawns_zombies[67] = (-1459.59, -1841.1, -7.875);
		level.spawns_zombies[68] = (-1250.78, -1640.09, 0.125001);
		level.spawns_zombies[69] = (-944.309, -1673.88, 0.125001);
		level.spawns_zombies[70] = (-1948.21, -798.322, -7.60901);
		level.spawns_zombies[71] = (-1693.14, -492.081, -7.87718);
		level.spawns_zombies[72] = (-1266.33, -62.6993, -14.9975);
		level.spawns_zombies[73] = (-1865.51, -64.8571, -7.875);
		level.spawns_zombies[74] = (-2261.99, 219.736, 16.125);
		level.spawns_zombies[75] = (-2251.82, -163.841, 128.125);
		level.spawns_zombies[76] = (-2337, -679.66, 128.125);
		level.spawns_zombies[77] = (-2374.55, -385.988, 128.125);
		level.spawns_zombies[78] = (-2205, -1072.39, 120.125);
		level.spawns_humans[0] = (1361.15, -1222.91, -7.875);
		level.spawns_humans[1] = (-1579.86, -545.75, 3.0304);
	}
	else if(map == "mp_boneyard")
	{
		level.spawns_humans[0] = (721.671, 372.233, -121.705);
		level.spawns_zombies[0] = (2031.93, 737.215, -17.875);
		  level.spawns_zombies[1] = (2054.29, 339.178, -17.875);
		  level.spawns_zombies[2] = (2246.29, 567.601, -151.875);
		  level.spawns_zombies[3] = (2209.77, 153.509, -151.875);
		  level.spawns_zombies[4] = (1862.43, 351.329, -151.875);
		  level.spawns_zombies[5] = (1822.56, 698.945, -151.875);
		  level.spawns_zombies[6] = (1991.09, -212.666, -192.248);
		  level.spawns_zombies[7] = (1603.07, -477.494, -151.578);
		  level.spawns_zombies[8] = (1416.27, 124.69, -166.67);
		  level.spawns_zombies[9] = (1004.35, 109.758, -115.36);
		  level.spawns_zombies[10] = (650.069, 102.271, -139.875);
		  level.spawns_zombies[11] = (949.759, 351.798, -139.811);
		  level.spawns_zombies[12] = (1350.12, 302.422, -177.025);
		  level.spawns_zombies[13] = (1708.6, 503.937, -183.496);
		  level.spawns_zombies[14] = (1099.42, 629.617, -149.586);
		  level.spawns_zombies[15] = (645.183, 597.056, -123.221);
		  level.spawns_zombies[16] = (789.612, 969.335, -126.908);
		  level.spawns_zombies[17] = (1094.54, 1010.29, -111.454);
		  level.spawns_zombies[18] = (1721.92, 1115.26, -82.5353);
		  level.spawns_zombies[19] = (1530.99, 863.662, -127.755);
		  level.spawns_zombies[20] = (1087.05, 515.632, 190.625);
		  level.spawns_zombies[21] = (1133.73, 113.529, 7.62569);
		  level.spawns_zombies[22] = (1011.53, -167.928, -139.875);
		  level.spawns_zombies[23] = (1529.37, -167.618, -170.972);
		  level.spawns_zombies[24] = (951.619, -594.18, -139.366);
		  level.spawns_zombies[25] = (635.633, -437.133, -135.875);
		  level.spawns_zombies[26] = (626.103, -190.695, -139.875);
		  level.spawns_zombies[27] = (195.135, -461.739, -135.875);
		  level.spawns_zombies[28] = (-318.275, -410.524, -136.096);
		  level.spawns_zombies[29] = (-760.054, -376.956, -139.875);
		  level.spawns_zombies[30] = (-557.752, -79.107, -139.431);
		  level.spawns_zombies[31] = (-79.2713, -180.159, -139.875);
		  level.spawns_zombies[32] = (309.836, 21.8026, -118.435);
		  level.spawns_zombies[33] = (411.64, 394.715, -69.375);
		  level.spawns_zombies[34] = (367.524, 702.393, -69.375);
		  level.spawns_zombies[35] = (4.03902, 591.77, -67.375);
		  level.spawns_zombies[36] = (-562.516, 671.122, -67.375);
		  level.spawns_zombies[37] = (-360.852, 324.493, -127.823);
		  level.spawns_zombies[38] = (256.07, 292.548, -106.621);
		  level.spawns_zombies[39] = (-132.983, 127.902, 75.4032);
		  level.spawns_zombies[40] = (-649.014, 89.6922, 34.0316);
		  level.spawns_zombies[41] = (-543.224, 648.25, 72.5375);
		  level.spawns_zombies[42] = (261.069, 661.589, 72.5548);
		  level.spawns_zombies[43] = (429.581, 454.184, 70.7719);
		  level.spawns_zombies[44] = (2.93325, 922.391, 9.02722);
		  level.spawns_zombies[45] = (-251.394, 1140.72, -74.3574);
		  level.spawns_zombies[46] = (479.936, 1116.71, -71.875);
		  level.spawns_zombies[47] = (324.166, 1410.84, -71.875);
		  level.spawns_zombies[48] = (731.246, 1526.02, -71.875);
		  level.spawns_zombies[49] = (654.742, 1201.5, -119.875);
		  level.spawns_zombies[50] = (1089.85, 1597.28, -77.7075);
		  level.spawns_zombies[51] = (1182.93, 1323.75, -59.8725);
		  level.spawns_zombies[52] = (1494.02, 1615.86, -81.6783);
		  level.spawns_zombies[53] = (1856.21, 1470.82, -80.1178);
		  level.spawns_zombies[54] = (-348.03, 909.87, -133.285);
		  level.spawns_zombies[55] = (-858.51, 824.116, -137.036);
		  level.spawns_zombies[56] = (-963.465, 1207.12, -136.371);
		  level.spawns_zombies[57] = (-509.337, 1490.69, -88.7103);
		  level.spawns_zombies[58] = (-25.4525, 1449.66, -71.875);
		  level.spawns_zombies[59] = (-1074.17, 1420.39, 7.125);
		  level.spawns_zombies[60] = (-967.299, 478.811, -21.175);
		  level.spawns_zombies[61] = (-1157.87, 682.156, -137.875);
		  level.spawns_zombies[62] = (-1273.74, -309.898, -127.511);
		  level.spawns_zombies[63] = (-1624.04, -379.553, -127.95);
		  level.spawns_zombies[64] = (-1452.7, -36.1976, -127.917);
		  level.spawns_zombies[65] = (-1658.16, 310.757, -127.917);
		  level.spawns_zombies[66] = (-1489.29, 737.804, -127.917);
		  level.spawns_zombies[67] = (-1403.27, 361.183, -127.917);
		  level.spawns_zombies[68] = (-1504.43, 1036.39, -129.875);
		  level.spawns_zombies[69] = (-1713.42, 1632.56, -116.919);
		  level.spawns_zombies[70] = (-1339.16, -60.2635, 6.125);
		  level.spawns_zombies[71] = (-1699.83, -70.6295, 6.125);
		  level.spawns_zombies[72] = (-1318.6, 111.347, 144.125);
		  level.spawns_zombies[73] = (-1312.12, 346.02, 142.125);
		  level.spawns_zombies[74] = (-1316.86, 694.427, 142.125);
		  level.spawns_zombies[75] = (-1366.5, 825.861, 142.125);
		  level.spawns_zombies[76] = (-1691.77, 819.834, 142.125);
		  level.spawns_zombies[77] = (-433.124, -255.16, -19.4647);
	}
	else if(map == "mp_terminal")
	{
		level.spawns_zombies[0] = (2728.04, 4072.96, 80.125);
		level.spawns_zombies[1] = (2731.85, 3776.01, 80.125);
		level.spawns_zombies[2] = (2093.26, 3652, 80.125);
		level.spawns_zombies[3] = (2104.57, 3839.79, 80.125);
		level.spawns_zombies[4] = (2414.45, 3387.15, 80.125);
		level.spawns_zombies[5] = (2440.83, 4701.76, 224.125);
		level.spawns_zombies[6] = (2310.1, 4672.53, 224.125);
		level.spawns_zombies[7] = (2427.06, 5463.25, 216.125);
		level.spawns_zombies[8] = (2368.36, 5463.34, 216.125);
		level.spawns_zombies[9] = (3126.08, 4669.26, 224.125);
		level.spawns_zombies[10] = (2638.9, 5918.08, 192.125);
		level.spawns_zombies[11] = (2445.49, 6277.48, 192.125);
		level.spawns_zombies[12] = (2294.31, 6189.96, 192.125);
		level.spawns_zombies[13] = (1094.99, 6065.46, 236.125);
		level.spawns_zombies[14] = (1027.06, 5984.39, 236.125);
		level.spawns_zombies[15] = (1436.55, 5935.81, 192.125);
		level.spawns_zombies[16] = (1737.43, 6149.05, 192.125);
		level.spawns_zombies[17] = (1366.72, 6402.9, 192.125);
		level.spawns_zombies[18] = (1346.81, 7095.46, 192.125);
		level.spawns_zombies[19] = (540.428, 7374.59, 192.125);
		level.spawns_zombies[20] = (949.676, 7462.63, 192.125);
		level.spawns_zombies[21] = (612.953, 6426.71, 192.125);
		level.spawns_zombies[22] = (261.901, 6716.26, 192.125);
		level.spawns_zombies[23] = (100.408, 6313.28, 192.125);
		level.spawns_zombies[24] = (329.995, 5815.81, 192.125);
		level.spawns_zombies[25] = (-126.457, 5555.04, 224.125);
		level.spawns_zombies[26] = (-261.526, 5296.68, 193.125);
		level.spawns_zombies[27] = (49.0839, 5124.28, 193.125);
		level.spawns_zombies[28] = (236.034, 5345.04, 192.125);
		level.spawns_zombies[29] = (365.285, 4882.6, 192.125);
		level.spawns_zombies[30] = (893.772, 4901.47, 192.125);
		level.spawns_zombies[31] = (1386.73, 4849.54, 192.125);
		level.spawns_zombies[32] = (1267.99, 5391.07, 192.125);
		level.spawns_zombies[33] = (1902.97, 4911.59, 192.125);
		level.spawns_zombies[34] = (1738.09, 4617.04, 174.401);
		level.spawns_zombies[35] = (1714.48, 4215.29, 168.085);
		level.spawns_zombies[36] = (1493.43, 4069.13, 168.125);
		level.spawns_zombies[37] = (1353.92, 4252.19, 188.125);
		level.spawns_zombies[38] = (1387.85, 3788.23, 40.125);
		level.spawns_zombies[39] = (1738.04, 3682.02, 40.125);
		level.spawns_zombies[40] = (1589.51, 3344.64, 40.125);
		level.spawns_zombies[41] = (1808.2, 3050.79, 40.125);
		level.spawns_zombies[42] = (1918.47, 3198.2, 120.125);
		level.spawns_zombies[43] = (1995.33, 2723.91, 40.125);
		level.spawns_zombies[44] = (2420.68, 2877.58, 41.125);
		level.spawns_zombies[45] = (2764.15, 2754.99, 188.125);
		level.spawns_zombies[46] = (2601.6, 2691.05, 188.125);
		level.spawns_zombies[47] = (1120.58, 2787.27, 40.125);
		level.spawns_zombies[48] = (1451.04, 2730.72, 40.125);
		level.spawns_zombies[49] = (1224.12, 3171.84, 40.125);
		level.spawns_zombies[50] = (750.022, 3610.66, 40.125);
		level.spawns_zombies[51] = (282.054, 3198.75, 40.125);
		level.spawns_zombies[52] = (335.487, 2560.76, 40.125);
		level.spawns_zombies[53] = (101.711, 4349.15, 40.125);
		level.spawns_zombies[54] = (1053.35, 4458.82, 40.125);
		level.spawns_zombies[55] = (557.899, 4775.58, 44.125);
		level.spawns_zombies[56] = (601.343, 4111.34, 202.625);
		level.spawns_zombies[57] = (630.508, 3790.47, 202.625);
		level.spawns_zombies[58] = (616.516, 3451.89, 202.625);
		level.spawns_zombies[59] = (616.432, 3124.69, 202.625);
		level.spawns_zombies[60] = (1484.87, 4221.2, 364.125);
		level.spawns_zombies[61] = (1690.85, 4268.13, 368.125);
		level.spawns_zombies[62] = (2007.52, 4331.1, 304.125);
		level.spawns_zombies[63] = (2219.65, 4342.7, 304.125);
		level.spawns_zombies[64] = (2756.05, 4873.79, 192.125);
		level.spawns_humans[0] = (1067.74, 7242.01, 192.125);
	}
	else if(map == "mp_favela" || map == "mp_fav_tropical")
	{
		level.spawns_humans[0] = (-14.8494, 2349.41, 282.963);
		level.spawns_zombies[0] = (1151.21, -77.3965, 186.125);
		level.spawns_zombies[1] = (763.57, -163.706, 160.125);
	  level.spawns_zombies[2] = (602.312, 183.132, 160.58);
	  level.spawns_zombies[3] = (948.863, 724.715, 190.86);
	  level.spawns_zombies[4] = (1275.94, 591.233, 186.125);
	  level.spawns_zombies[5] = (1013.51, 365.63, 198.125);
	  level.spawns_zombies[6] = (1694.18, 772.495, 192.116);
	  level.spawns_zombies[7] = (1706.36, 1158.16, 189.409);
	  level.spawns_zombies[8] = (1264.97, 1249.66, 187.494);
	  level.spawns_zombies[9] = (1516.74, 1018.87, 312.125);
	  level.spawns_zombies[10] = (1565.74, 884.942, 312.125);
	  level.spawns_zombies[11] = (1061.55, 952.524, 314.125);
	  level.spawns_zombies[12] = (845.692, 961.894, 344.125);
	  level.spawns_zombies[13] = (879.639, 1215.84, 344.125);
	  level.spawns_zombies[14] = (650.319, 1106.54, 344.125);
	  level.spawns_zombies[15] = (668.542, 1386.37, 168.125);
	  level.spawns_zombies[16] = (974.455, 1625.24, 174.891);
	  level.spawns_zombies[17] = (1429.23, 1690.74, 185.61);
	  level.spawns_zombies[18] = (1412.9, 1325.86, 185.84);
	  level.spawns_zombies[19] = (603.27, 1942.2, 164.125);
	  level.spawns_zombies[20] = (835.733, 2248.82, 282.158);
	  level.spawns_zombies[21] = (349.179, 2226.99, 281.476);
	  level.spawns_zombies[22] = (453.483, 2735.91, 287.236);
	  level.spawns_zombies[23] = (872.126, 2767.58, 301.266);
	  level.spawns_zombies[24] = (17.7642, 2756.34, 332.96);
	  level.spawns_zombies[25] = (-249.671, 2623.47, 334.07);
	  level.spawns_zombies[26] = (-647.913, 2608.18, 314.063);
	  level.spawns_zombies[27] = (-1045.18, 2824.74, 282.86);
	  level.spawns_zombies[28] = (-878.085, 2275.51, 282.992);
	  level.spawns_zombies[29] = (-1177.36, 2209.16, 280.004);
	  level.spawns_zombies[30] = (-1346.87, 2032.66, 370.125);
	  level.spawns_zombies[31] = (-1475.07, 1793.4, 218.266);
	  level.spawns_zombies[32] = (-1041.4, 1785.62, 200.894);
	  level.spawns_zombies[33] = (-796.099, 1473.56, 246.001);
	  level.spawns_zombies[34] = (-1257.14, 1522.7, 159.077);
	  level.spawns_zombies[35] = (-1458.59, 1300.04, 184.125);
	  level.spawns_zombies[36] = (-1101.27, 1139.51, 184.125);
	  level.spawns_zombies[37] = (-1470.47, 989.169, 184.125);
	  level.spawns_zombies[38] = (-1506.27, 856.185, 144.125);
	  level.spawns_zombies[39] = (-1877.33, 793.459, 8.125);
	  level.spawns_zombies[40] = (-1283, 761.047, 8.125);
	  level.spawns_zombies[41] = (-873.52, 1027.56, 25.8569);
	  level.spawns_zombies[42] = (-988.76, 223.385, 8.125);
	  level.spawns_zombies[43] = (-1457.2, -13.663, 8.125);
	  level.spawns_zombies[44] = (-1246.02, -361.696, 3.07586);
	  level.spawns_zombies[45] = (-772.777, 364.357, 144.125);
	  level.spawns_zombies[46] = (-546.966, 202.24, 145.225);
	  level.spawns_zombies[47] = (-715.931, 24.0341, 106.125);
	  level.spawns_zombies[48] = (-972.538, -252.233, 16.125);
	  level.spawns_zombies[49] = (-797.911, -434.759, 152.125);
	  level.spawns_zombies[50] = (-727.715, -296.734, 152.125);
	  level.spawns_zombies[51] = (-542.702, -611.791, 7.59644);
	  level.spawns_zombies[52] = (-817.068, -823.609, 30.0013);
	  level.spawns_zombies[53] = (-354.314, -1057.72, 8.125);
	  level.spawns_zombies[54] = (-303.662, -545.661, 32.125);
	  level.spawns_zombies[55] = (19.7323, -594.121, 32.125);
	  level.spawns_zombies[56] = (-47.7786, -821.285, 32.125);
	  level.spawns_zombies[57] = (-310.408, -799.15, 168.125);
	  level.spawns_zombies[58] = (-296.209, -459.928, 168.125);
	  level.spawns_zombies[59] = (539.05, -472.282, 168.125);
	  level.spawns_zombies[60] = (505.308, -604.969, 168.125);
	  level.spawns_zombies[61] = (-3.58897, -643.299, 168.125);
	  level.spawns_zombies[62] = (587.773, -1124.61, 142.902);
	  level.spawns_zombies[63] = (293.074, -1112.81, 2.125);
	  level.spawns_zombies[64] = (162.295, -567.542, 16.8728);
	  level.spawns_zombies[65] = (157.775, -229.363, -3.85269);
	  level.spawns_zombies[66] = (-439.34, -120.62, -2.04982);
	  level.spawns_zombies[67] = (-24.794, -61.159, -5.875);
	  level.spawns_zombies[68] = (369.598, 88.6565, -5.875);
	  level.spawns_zombies[69] = (325.108, 757.067, 87.7955);
	  level.spawns_zombies[70] = (-117.726, 812.624, 143.632);
	  level.spawns_zombies[71] = (374.523, 916.284, 145.214);
	  level.spawns_zombies[72] = (-331.239, 361.579, 0.125);
	  level.spawns_zombies[73] = (-94.3928, 632.175, 176.125);
	  level.spawns_zombies[74] = (146.2, 414.771, 176.125);
	  level.spawns_zombies[75] = (-181.449, 301.887, 173.378);
	  level.spawns_zombies[76] = (41.828, 305.472, 312.125);
	  level.spawns_zombies[77] = (116.231, 575.849, 308.125);
	  level.spawns_zombies[78] = (-189.312, 555.579, 308.125);
	  level.spawns_zombies[79] = (-512.725, 475.717, 333.193);
	  level.spawns_zombies[80] = (-668.059, 793.208, 335.432);
	  level.spawns_zombies[81] = (-544.166, 583.387, 420.072);
	  level.spawns_zombies[82] = (-627.67, 174.739, 282.125);
	  level.spawns_zombies[83] = (-244.059, -485.834, 300.843);
	  level.spawns_zombies[84] = (229.127, -622.21, 312.125);
	  level.spawns_zombies[85] = (692.021, -566.316, 312.125);
	  level.spawns_zombies[86] = (296.228, -442.037, 297.385);
	  level.spawns_zombies[87] = (856.319, 123.569, 310.125);
	  level.spawns_zombies[88] = (1036.37, 356.403, 306.696);
	  level.spawns_zombies[89] = (643.885, 540.042, 321.048);
	  level.spawns_zombies[90] = (636.214, 727.293, 320.125);
	  level.spawns_zombies[91] = (432.875, 1105.35, 300.125);
	  level.spawns_zombies[92] = (248.992, 1001.43, 298.125);
	  level.spawns_zombies[93] = (-320.537, 1029.21, 288.125);
	  level.spawns_zombies[94] = (-615.354, 1029.53, 288.125);
	  level.spawns_zombies[95] = (-461.71, 1245.95, 288.125);
	  level.spawns_zombies[96] = (-617.679, 1205.64, 152.125);
	  level.spawns_zombies[97] = (-283.056, 1248.2, 152.125);
	  level.spawns_zombies[98] = (-293.844, 1015.65, 152.125);
	  level.spawns_zombies[99] = (-127.203, 1457.73, 152.636);
	  level.spawns_zombies[100] = (221.856, 1489.46, 150.845);
	  level.spawns_zombies[101] = (143.257, 1796.43, 312.125);
	  level.spawns_zombies[102] = (-98.7061, 1648.67, 312.125);
	  level.spawns_zombies[103] = (-335.209, 1615.93, 151.691);
	  level.spawns_zombies[104] = (-209.941, 2053.96, 266.881);
	  level.spawns_zombies[105] = (437.767, 2346.21, 283.063);
		
	}
	else if(map == "mp_seatown_snow")
	{
		level.spawns_humans[0] = (-125.175, 2556.77, 80.8324);
		  level.spawns_zombies[0] = (-1403.99, 1097.1, 166.125);
		  level.spawns_zombies[1] = (-1141.47, 1099.56, 164.125);
		  level.spawns_zombies[2] = (-876.267, 1031.67, 164.125);
		  level.spawns_zombies[3] = (-956.395, 676.465, 164.125);
		  level.spawns_zombies[4] = (-913.135, 307.155, 150.125);
		  level.spawns_zombies[5] = (-951.348, -83.1022, 150.125);
		  level.spawns_zombies[6] = (-1455.83, -109.038, 126.473);
		  level.spawns_zombies[7] = (-1877.59, -148.056, 107.205);
		  level.spawns_zombies[8] = (-1897.94, -674.329, 44.125);
		  level.spawns_zombies[9] = (-1649.26, -1165.32, 44.125);
		  level.spawns_zombies[10] = (-2079.66, -1386.52, 44.125);
		  level.spawns_zombies[11] = (-1059.72, -1009.86, 36.125);
		  level.spawns_zombies[12] = (-1136.82, -417.917, 16.635);
		  level.spawns_zombies[13] = (-551.721, -474.198, 16.0517);
		  level.spawns_zombies[14] = (-546.668, -1045.99, 35.7852);
		  level.spawns_zombies[15] = (-548.762, -1627.59, 34.0385);
		  level.spawns_zombies[16] = (-552.057, -1248.48, -455.31);
		  level.spawns_zombies[17] = (210.182, -1517.63, 134.125);
		  level.spawns_zombies[18] = (689.877, -1433.88, 158.125);
		  level.spawns_zombies[19] = (1022.33, -1259.57, 158.125);
		  level.spawns_zombies[20] = (958.347, -770.503, 158.125);
		  level.spawns_zombies[21] = (1296.11, -1111.31, 158.125);
		  level.spawns_zombies[22] = (1248.56, -726.833, 0.125001);
		  level.spawns_zombies[23] = (1025.31, -1228.24, 0.125001);
		  level.spawns_zombies[24] = (588.174, -1290.58, -0.768489);
		  level.spawns_zombies[25] = (869.959, -820.252, 3.125);
		  level.spawns_zombies[26] = (452.959, -716.446, 0.125);
		  level.spawns_zombies[27] = (53.1882, -665.882, -39.875);
		  level.spawns_zombies[28] = (-134.422, -418.015, 16.125);
		  level.spawns_zombies[29] = (-260.855, 99.879, 14.125);
		  level.spawns_zombies[30] = (-283.573, 576.959, 16.125);
		  level.spawns_zombies[31] = (-733.359, 362.271, 14.125);
		  level.spawns_zombies[32] = (-1221.07, 342.085, -42.7969);
		  level.spawns_zombies[33] = (-1361.51, 821.209, -60.9783);
		  level.spawns_zombies[34] = (-1599.85, 597.326, -69.4475);
		  level.spawns_zombies[35] = (-1568.85, 139.903, -76.5251);
		  level.spawns_zombies[36] = (-1468.41, -343.048, -141.906);
		  level.spawns_zombies[37] = (-1669.98, -775.388, -108.876);
		  level.spawns_zombies[38] = (-1628.01, 1120.75, -55.0483);
		  level.spawns_zombies[39] = (-1378.56, 1531.96, -13.6962);
		  level.spawns_zombies[40] = (-1544.35, 2080.53, 15.6508);
		  level.spawns_zombies[41] = (-1216.29, 2405.7, 17.125);
		  level.spawns_zombies[42] = (-738.505, 2417.97, 78.7371);
		  level.spawns_zombies[43] = (-617.872, 2137.57, 70.0324);
		  level.spawns_zombies[44] = (-611.194, 1542.73, 56.125);
		  level.spawns_zombies[45] = (-959.092, 1359.26, 56.125);
		  level.spawns_zombies[46] = (-695.98, 1031.84, 12.125);
		  level.spawns_zombies[47] = (-133.21, 1092.03, 16.125);
		  level.spawns_zombies[48] = (-103.686, 1466.62, 12.125);
		  level.spawns_zombies[49] = (292.753, 1479.62, 56.125);
		  level.spawns_zombies[50] = (874.352, 1348.97, 56.125);
		  level.spawns_zombies[51] = (1009.57, 910.693, 47.754);
		  level.spawns_zombies[52] = (1143.85, 452.432, -5.80916);
		  level.spawns_zombies[53] = (894.881, 397.743, -7.96017);
		  level.spawns_zombies[54] = (602.975, 972.75, 56.125);
		  level.spawns_zombies[55] = (895.454, -28.3982, -7.875);
		  level.spawns_zombies[56] = (1199.6, -264.885, -7.875);
		  level.spawns_zombies[57] = (1449.18, -394.906, 0.125001);
		  level.spawns_zombies[58] = (1457.05, 367.707, 0.125001);
		  level.spawns_zombies[59] = (1473.92, -882.4, 0.125001);
		  level.spawns_zombies[60] = (239.495, -1114.59, -39.875);
		  level.spawns_zombies[61] = (466.022, 106.261, 152.125);
		  level.spawns_zombies[62] = (216.279, -38.8927, 80.125);
		 level.spawns_zombies[63] = (400.641, 21.3681, 16.125);
		  level.spawns_zombies[64] = (659.08, 622.2, 48.125);
		  level.spawns_zombies[65] = (234.218, 413.781, 48.125);
		 level.spawns_zombies[66] = (-489.692, 486.258, 130.125);
		 level.spawns_zombies[67] = (-121.216, 495.167, 130.125);
		 level.spawns_zombies[68] = (-237.352, 663.67, 154.742);
		 level.spawns_zombies[69] = (-102.582, 236.824, 130.125);
		 level.spawns_zombies[70] = (-536.836, 233.861, 130.125);
		 level.spawns_zombies[71] = (-383.084, 1639.14, 96.125);
		 level.spawns_zombies[72] = (-444.286, 1978.7, 96.125);
		level.spawns_zombies[73] = (-108.491, 1842.19, 12.125);
		 level.spawns_zombies[74] = (283.902, 2318.01, 80.125);
		level.spawns_zombies[75] = (684.832, 1855.58, 56.125);
		 level.spawns_zombies[76] = (-132.867, -1361.66, 36.6609);
	}
	else if(map == "mp_underpass")
	{
		level.spawns_humans[0] = (1154.65, 2186.77, 384.124);
		level.spawns_zombies[0] = (1053.24, 1074.04, 632.125);
	   level.spawns_zombies[1] = (1178.55, 1081.06, 632.125);
	   level.spawns_zombies[2] = (1808.06, 653.943, 448.125);
	   level.spawns_zombies[3] = (2091.13, 544.985, 448.125);
	   level.spawns_zombies[4] = (1842.71, 510.716, 448.125);
	   level.spawns_zombies[5] = (2186.44, 130.916, 448.125);
	   level.spawns_zombies[6] = (238.312, 306.932, 352.125);
	   level.spawns_zombies[7] = (-33.1475, 894.106, 81.8936);
	   level.spawns_zombies[8] = (500.121, 898.696, 134.873);
	   level.spawns_zombies[9] = (422.367, 497.815, 175.044);
	   level.spawns_zombies[10] = (772.591, 1295.45, 336.125);
	   level.spawns_zombies[11] = (381.472, 1256.13, 346.054);
	   level.spawns_zombies[12] = (126.589, 1572.99, 384.125);
	   level.spawns_zombies[13] = (235.467, 1777.77, 384.125);
	   level.spawns_zombies[14] = (-184.529, 2135.14, 1.58706);
	   level.spawns_zombies[15] = (-202.919, 2161.05, 6.27558);
	   level.spawns_zombies[16] = (-315.882, 2469.52, 291.125);
	   level.spawns_zombies[17] = (277.62, 2475.16, 310.236);
	   level.spawns_zombies[18] = (488.231, 2322.1, 288.125);
	   level.spawns_zombies[19] = (831.389, 1884.34, 376.125);
	  level.spawns_zombies[20] = (1417.39, 1809.36, 376.125);
	   level.spawns_zombies[21] = (1403.92, 2462.18, 384.111);
	   level.spawns_zombies[22] = (1433.01, 2508.52, 378.63);
	   level.spawns_zombies[23] = (918.988, 2472.43, 385.479);
	   level.spawns_zombies[24] = (951.972, 2469.45, 386.454);
	   level.spawns_zombies[25] = (854.043, 1826.86, 377.152);
	   level.spawns_zombies[26] = (1465.74, 1766.59, 376.199);
	   level.spawns_zombies[27] = (1465.74, 1766.59, 376.199);
	   level.spawns_zombies[28] = (1128.94, 1307.85, 377.903);
	   level.spawns_zombies[29] = (1548.04, 1079.97, 379.056);
	   level.spawns_zombies[30] = (1803.91, 2625.98, 385.607);
	   level.spawns_zombies[31] = (1142.91, 2822.11, 376.125);
	   level.spawns_zombies[32] = (1138.48, 2777.81, 376.125);
	   level.spawns_zombies[33] = (1153.53, 2871.56, 376.125);
	   level.spawns_zombies[34] = (714.598, 2515.23, 496.125);
	   level.spawns_zombies[35] = (1174.31, 2776.84, 488.125);
	   level.spawns_zombies[36] = (1520.46, 2539.63, 488.125);
	   level.spawns_zombies[37] = (1520.46, 2539.63, 488.125);
	   level.spawns_zombies[38] = (1650.27, 2504.19, 496.125);
	   level.spawns_zombies[39] = (2390.09, 3359.1, 392.573);
	   level.spawns_zombies[40] = (3360.87, 1743.13, 376.27);
	   level.spawns_zombies[41] = (3233.98, 1487.28, 284.363);
	   level.spawns_zombies[42] = (2527.97, 1127.74, 280.669);
	   level.spawns_zombies[43] = (2326.55, 365.615, 292.125);
	   level.spawns_zombies[44] = (3678.12, 563.515, 288.125);
	   level.spawns_zombies[45] = (3674.14, 344.145, 288.125);
	   level.spawns_zombies[46] = (3655.92, 88.1063, 286.623);
	   level.spawns_zombies[47] = (3655.92, 88.1063, 286.623);
	   level.spawns_zombies[48] = (3690.27, -143.024, 340.125);
	   level.spawns_zombies[49] = (2808.58, 236.019, 452.125);
	   level.spawns_zombies[50] = (2808.58, 236.019, 452.125);
	   level.spawns_zombies[51] = (2529.05, 125.811, 292.125);
	   level.spawns_zombies[52] = (3477.17, -299.324, 336.125);
	   level.spawns_zombies[53] = (3411.7, -1044.61, 356.859);
	   level.spawns_zombies[54] = (2803.49, -1422.72, 410.348);
	   level.spawns_zombies[55] = (2610.48, -611.178, 357.254);
	   level.spawns_zombies[56] = (2068.46, -1540.05, 382.301);
	   level.spawns_zombies[57] = (1657.05, -1257.79, 386.523);
	   level.spawns_zombies[58] = (1362.88, -760.927, 433.835);
	   level.spawns_zombies[59] = (1167.55, 168.741, 512.125);
	   level.spawns_zombies[60] = (821.739, 95.2707, 352.125);
	   level.spawns_zombies[61] = (212.906, 102.197, 365.676);
	   level.spawns_zombies[62] = (-544.875, -239.125, 320.125);
	   level.spawns_zombies[63] = (-496.072, 355.469, 318.125);
	   level.spawns_zombies[64] = (-496.072, 355.469, 318.125);
	   level.spawns_zombies[65] = (-477.945, 14.8628, 184.125);
	   level.spawns_zombies[66] = (35.6342, 301.49, 184.125);
	   level.spawns_zombies[67] = (702.168, 1807.74, 501.685);
	   level.spawns_zombies[68] = (702.168, 1807.74, 501.685);
	   level.spawns_zombies[69] = (702.168, 1807.74, 501.685);
	   level.spawns_zombies[70] = (465.47, 1794.89, 536.125);
	   level.spawns_zombies[71] = (537.956, 1454.21, 512.125);
	   level.spawns_zombies[72] = (-491.698, 1284.71, 352.125);
	  level.spawns_zombies[73] = (-429.077, 898.88, 320.125);
	  level.spawns_zombies[74] = (-429.077, 898.88, 320.125);
	  level.spawns_zombies[75] = (-628.875, 3208.04, 392.125);
	  level.spawns_zombies[76] = (-392.899, 3007.21, 264.125);
	  level.spawns_zombies[77] = (1320.1, -89.9995, 447.038);
	  level.spawns_zombies[78] = (366.404, 3614.88, 322.13);
	  level.spawns_zombies[79] = (366.404, 3614.88, 322.13);
	  level.spawns_zombies[80] = (175.072, 3678.07, 356.125);
	  level.spawns_zombies[81] = (813.258, 3185.01, 385.582);
	  level.spawns_zombies[82] = (1416.95, 3098.88, 390.641);
	  level.spawns_zombies[83] = (1416.95, 3098.88, 390.641);
	  level.spawns_zombies[84] = (1886.67, 3197.5, 392.508);
	 level.spawns_zombies[85] = (1886.67, 3197.5, 392.508);
	  level.spawns_zombies[86] = (-324.438, 2781.75, 504.125);
	  level.spawns_zombies[87] = (-275.698, -57.1141, 682.362);
	  level.spawns_zombies[88] = (584.837, -482.029, 640.125);
	  level.spawns_zombies[89] = (2077.48, -1471.49, 385.815);
	 level.spawns_zombies[90] = (2133.65, -866.143, 370.548);
	 level.spawns_zombies[91] = (2239.14, -423.853, 366.022);	  
	}
	else if(map == "mp_checkpoint")
	{
		level.spawns_humans[0] = (352.731, 140.128, 90.8167);
		level.spawns_zombies[0] = (207.925, 163.468, 40.4589);
		level.spawns_zombies[1] = (194.608, -122.235, 35.6225);
		level.spawns_zombies[2] = (30.8894, -151.427, 35.8733);
		 level.spawns_zombies[3] = (426.824, 299.474, 72.3614);
		  level.spawns_zombies[4] = (391.298, -305.825, 50.7065);
		  level.spawns_zombies[5] = (338.352, -745.576, 8.125);
		  level.spawns_zombies[6] = (392.3, -1113.13, 0.125);
		  level.spawns_zombies[7] = (53.1156, -1185.52, 0.124998);
		  level.spawns_zombies[8] = (-254.466, -1021.51, 0.124998);
		  level.spawns_zombies[9] = (-453.511, -1149.72, -32.211);
		  level.spawns_zombies[10] = (-630.988, -955.918, -23.875);
		  level.spawns_zombies[11] = (-499.31, -1398.33, -22.2998);
		   level.spawns_zombies[12] = (-672.804, -1369.81, 96.125);
		  level.spawns_zombies[13] = (-668.01, -1192.33, 231.11);
		  level.spawns_zombies[14] = (-454.073, -974.274, 231.708);
		  level.spawns_zombies[15] = (-491.426, -724.187, 230.082);
		  level.spawns_zombies[16] = (-719.724, -672.125, 232.333);
		  level.spawns_zombies[17] = (-593.087, -455.079, 364.125);
		  level.spawns_zombies[18] = (-438.418, -199.064, 364.125);
		  level.spawns_zombies[19] = (-718.9, -195.474, 364.125);
		  level.spawns_zombies[20] = (-397.178, 33.9795, 240.125);
		   level.spawns_zombies[21] = (-523.742, 217.523, 240.125);
		   level.spawns_zombies[22] = (-386.465, 359.125, 200.125);
		   level.spawns_zombies[23] = (-97.9995, 369.689, 200.125);
		   level.spawns_zombies[24] = (152.762, 372.546, 200.125);
		  level.spawns_zombies[25] = (-138.849, 383.855, 336.125);
		  level.spawns_zombies[26] = (221.285, 449.987, 200.125);
		   level.spawns_zombies[27] = (411.03, 665.386, 8.125);
		   level.spawns_zombies[28] = (900.851, 722.92, 8.125);
		   level.spawns_zombies[29] = (1156.38, 378.181, 0.125001);
		   level.spawns_zombies[30] = (1271.55, 995.971, 0.124997);
		   level.spawns_zombies[31] = (804.59, 1164.58, -0.926934);
		   level.spawns_zombies[32] = (360.18, 1106.06, 3.30032);
		   level.spawns_zombies[33] = (-70.9926, 1143.2, 48.125);
		   level.spawns_zombies[34] = (-213.131, 1498.86, 48.642);
		   level.spawns_zombies[35] = (-641.826, 1362.37, 0.0721138);
		   level.spawns_zombies[36] = (-695.874, 1828.45, 34.0072);
		   level.spawns_zombies[37] = (-955.325, 2205.63, 6.125);
		   level.spawns_zombies[38] = (-1350.15, 2016.75, 40.125);
		   level.spawns_zombies[39] = (-1372, 1528.57, 6.125);
		   level.spawns_zombies[40] = (-887.742, 1500.72, 4.13181);
		   level.spawns_zombies[41] = (-370.98, 2151.94, -5.40878);
		   level.spawns_zombies[42] = (206.281, 2185.23, -0.520714);
		   level.spawns_zombies[43] = (647.889, 2125.9, -4.94954);
		   level.spawns_zombies[44] = (348.547, 1618.56, 13.6808);
		   level.spawns_zombies[45] = (-243.085, 1770.96, 32.125);
		   level.spawns_zombies[46] = (-529.347, 1874.15, 24.125);
		   level.spawns_zombies[47] = (662.741, 923.303, 248.125);
		   level.spawns_zombies[48] = (54.4617, 988.777, 200.125);
		   level.spawns_zombies[49] = (-343.038, 1081.93, 224.125);
		   level.spawns_zombies[50] = (-539.312, 1119.27, 224.125);
		  level.spawns_zombies[51] = (-989.779, 889.96, 132.125);
		 level.spawns_zombies[52] = (-1001.87, 645.166, 136.125);
		  level.spawns_zombies[53] = (-929.853, 368.672, 8.125);
		  level.spawns_zombies[54] = (-788.274, 859.361, -6.35755);
		  level.spawns_zombies[55] = (-440.812, 494.308, 8.125);
		  level.spawns_zombies[56] = (-43.7516, 641.164, 8.125);
		  level.spawns_zombies[57] = (103.778, 460.032, 8.125);
		  level.spawns_zombies[58] = (-321.207, 830.403, 200.125);
		  level.spawns_zombies[59] = (-347.288, 524.958, 200.125);
		  level.spawns_zombies[60] = (-502.201, 524.897, 200.125);
		  level.spawns_zombies[61] = (-602.18, 630.502, 200.125);
		  level.spawns_zombies[62] = (-769.388, 1569.17, 149.705);
		  level.spawns_zombies[63] = (-228.185, 16.6426, 60.0664);
		  level.spawns_zombies[64] = (1079.15, -1053.44, 0.125001);
		  level.spawns_zombies[65] = (1048.11, -657.084, 18.9057);
		  level.spawns_zombies[66] = (1605.97, -537.069, 6.76052);
		  level.spawns_zombies[67] = (1860.52, -939.605, 4.29222);
		  level.spawns_zombies[68] = (1466.78, -1351.04, 2.61394);
		  level.spawns_zombies[69] = (1212.47, -521.132, 136.125);
		  level.spawns_zombies[70] = (1497.17, -56.1187, 144.125);
		  level.spawns_zombies[71] = (1240.4, 86.9692, 144.125);
		  level.spawns_zombies[72] = (677.513, -55.4604, 144.125);
		  level.spawns_zombies[73] = (696.965, 471.593, 144.125);
		  level.spawns_zombies[74] = (920.276, 492.593, 144.125);
		  level.spawns_zombies[75] = (641.92, 296.564, 8.125);
		  level.spawns_zombies[76] = (771.617, -25.2876, 8.125);
		  level.spawns_zombies[77] = (944.086, -41.5239, 8.125);
		  level.spawns_zombies[78] = (1406.77, -139.562, -7.875);
		  level.spawns_zombies[79] = (1452.52, 31.712, 8.125);
		  level.spawns_zombies[80] = (1782.86, 43.4255, 8.125);
		  level.spawns_zombies[81] = (1908.4, 545.51, 0.125002);
		  level.spawns_zombies[82] = (1526.6, 532.617, 132.125);
		 level.spawns_zombies[83] = (1749.71, 330.568, 128.125);
		  level.spawns_zombies[84] = (631.153, -1653.73, 8.125);
		  level.spawns_zombies[85] = (-265.145, -1782.3, 0.125001);
		  level.spawns_zombies[86] = (-637.007, -1785.63, 0.125002);
		  level.spawns_zombies[87] = (-558.355, -2697.28, 0.192224);
		  level.spawns_zombies[88] = (37.5938, -2708.31, 0.124762);
		  level.spawns_zombies[89] = (237.971, -3169.78, 3.64555);
		  level.spawns_zombies[90] = (237.971, -3169.78, 3.64555);
		 level.spawns_zombies[91] = (402.229, -2457.36, 19.9139);
		  level.spawns_zombies[92] = (837.086, -3003.5, 41.8173);
		  level.spawns_zombies[93] = (760.039, -2319.3, 18.2367);
		  level.spawns_zombies[94] = (-895.015, -1142.16, -32.875);
		 level.spawns_zombies[95] = (-1649.2, -1056.08, 0.124998);
		 level.spawns_zombies[96] = (-1145.41, -770.485, -15.875);
		  level.spawns_zombies[97] = (-856.749, -334.219, -0.875002);
		  level.spawns_zombies[98] = (-1313.1, -304.314, -0.872946);
		  level.spawns_zombies[99] = (-1286.76, 96.2594, 0.124997);
		  level.spawns_zombies[100] = (-2115.59, 145.032, 0.124997);
		  level.spawns_zombies[101] = (-1807.45, -60.5559, 152.125);
		  level.spawns_zombies[102] = (-1648.04, 346.38, 152.125);
		  level.spawns_zombies[103] = (-1765, 767.835, 152.125);
		  level.spawns_zombies[104] = (-2059.43, 575.492, 152.125);
		  level.spawns_zombies[105] = (-895.856, -104.521, 137.125);
		  level.spawns_zombies[106] = (-1144.14, -447.008, 136.125);
		  level.spawns_zombies[107] = (-1055.23, -726.199, 136.125);
		  level.spawns_zombies[108] = (-1255.82, -1042.3, 136.125);
		  level.spawns_zombies[109] = (-1035.32, -978.816, 268.125);
		  level.spawns_zombies[110] = (-1045.52, -988.503, 268.125);
		 level.spawns_zombies[111] = (1749.11, 799.453, 40.125);
		  level.spawns_zombies[112] = (1714.2, 1503.08, 40.125);
		  level.spawns_zombies[113] = (2130.94, 1572.52, 8.125);
		  level.spawns_zombies[114] = (1987.15, 1043.55, 40.125);
		  level.spawns_zombies[115] = (1841.72, 1292.51, 40.125);
		  level.spawns_zombies[116] = (1610.85, 1046.74, 40.125);
		  level.spawns_zombies[117] = (712.331, 1229.28, 164.125);
		  level.spawns_zombies[118] = (325.109, 1216.93, 212.125);
	}
	else if(map == "mp_trailerpark")
	{
		level.spawns_humans[0] = (1659.5, -514.459, 1.99634);
		level.spawns_zombies[0] = (1095.61, -1625.13, 7.12192);
		level.spawns_zombies[1] = (781.329, -1323.33, -8.03683);
		level.spawns_zombies[2] = (875.874, -739.505, -14.8611);
		level.spawns_zombies[3] = (1080.02, -446.953, 4.29533);
		level.spawns_zombies[4] = (1144.44, -1040.28, 4.61921);
		level.spawns_zombies[5] = (1408.57, -1412.58, 2.125);
		level.spawns_zombies[6] = (1710.44, -1294.72, 23.125);
		level.spawns_zombies[7] = (1880.81, -1064.66, 23.125);
		level.spawns_zombies[8] = (1893.26, -905.62, 22.125);
		level.spawns_zombies[9] = (1355, -503.633, 31.125);
		level.spawns_zombies[10] = (1682.29, -251.182, -5.32396);
		level.spawns_zombies[11] = (1494.09, 87.3852, -0.352087);
		level.spawns_zombies[12] = (1866.6, 444.895, 3.78797);
		level.spawns_zombies[13] = (1037.31, 243.125, 2.69279);
		level.spawns_zombies[14] = (1090.09, 845.244, 6.51079);
		level.spawns_zombies[15] = (1383.98, 550.027, 1.84699);
		level.spawns_zombies[16] = (744.131, 1151.88, 11.125);
		level.spawns_zombies[17] = (327.921, 1129.62, 5.83746);
		level.spawns_zombies[18] = (466.861, 1044.93, 4.11807);
		level.spawns_zombies[19] = (9.94224, 590.404, 4.67595);
		level.spawns_zombies[20] = (-374.732, 274.167, 5.625);
		level.spawns_zombies[21] = (13.2843, 167.868, 1.24453);
		level.spawns_zombies[22] = (103.61, -167.073, -3.31592);
		level.spawns_zombies[23] = (755.188, -202.411, -5.00873);
		level.spawns_zombies[24] = (-210.932, -525.394, -13.1884);
		level.spawns_zombies[25] = (-121.142, -851.6, -12.223);
		level.spawns_zombies[26] = (-198.684, -1286.13, -7.89347);
		level.spawns_zombies[27] = (315.42, -1308.48, -8.66771);
		level.spawns_zombies[28] = (-577.767, -977.899, -0.140853);
		level.spawns_zombies[29] = (-439.067, -368.733, 2.14959);
		level.spawns_zombies[30] = (-164.728, -253.17, 33.125);
		level.spawns_zombies[31] = (-662.583, -96.1949, 33.125);
		level.spawns_zombies[32] = (-728.857, -322.999, 3.625);
		level.spawns_zombies[33] = (-740.876, 149.401, 2.66241);
		level.spawns_zombies[34] = (-1386.62, -280.518, 6.16104);
		level.spawns_zombies[35] = (-1379.04, -701.432, -5.875);
		level.spawns_zombies[36] = (-626.572, -753.622, -8.3741);
		level.spawns_zombies[37] = (-2141.25, -556.37, -15.0942);
		level.spawns_zombies[38] = (-2236.89, 98.4992, -21.4481);
		level.spawns_zombies[39] = (-2535.22, 253.94, -81.3017);
		level.spawns_zombies[40] = (-2297.98, 913.009, -102.875);
		level.spawns_zombies[41] = (-1914.12, 629.295, -2.26006);
		level.spawns_zombies[42] = (-1905.6, 61.725, 24.398);
		level.spawns_zombies[43] = (-1777.65, -299.515, 24.0145);
		level.spawns_zombies[44] = (-2157.39, -191.417, 5.125);
		level.spawns_zombies[45] = (-1619.84, 99.1509, 12.125);
		level.spawns_zombies[46] = (-1447.18, 582.749, 6.97044);
		level.spawns_zombies[47] = (-784.991, 702.54, 2.03144);
		level.spawns_zombies[48] = (-545.518, 444.884, 36.125);
		level.spawns_zombies[49] = (-448.847, 891.926, 36.125);
		level.spawns_zombies[50] = (-301.705, 1176.76, 12.6028);
		level.spawns_zombies[51] = (-907.276, 1161.67, 12.9267);
		level.spawns_zombies[52] = (-1383.52, 989.1, 13.0525);
		level.spawns_zombies[53] = (-1379.33, 1386.35, 0.491212);
		level.spawns_zombies[54] = (-1682.26, 1592.64, 2.125);
		level.spawns_zombies[55] = (-1766.02, 1367.19, 2.125);
		level.spawns_zombies[56] = (-1904.39, 1124.59, -2.61979);
		level.spawns_zombies[57] = (-1594.49, 891.609, 1.88155);
		level.spawns_zombies[58] = (-1025.13, -241.116, 6.125);
		level.spawns_zombies[59] = (-1186.96, 225.442, 31.125);
	}
}
//////////////////////// Weather /////////////////////

CreateRain(pos)
{
	/*
	if(!isDefined(pos))
		return;
	pos = pos + (0,0,1500);	
	level.rainar[level.rain] = spawnFx(level.rain_heavy, pos);
	triggerfx(level.rainar[level.rain]);
	level.rain++;
	*/
	thread onPlayerRain();
}

onPlayerRain()
{
	while(1)
	{
		level waittill("connected", player);
		player thread RainingManHalelujah();
	}
}

RainingManHalelujah()
{
	self endon("disconnect");
	self waittill("intro_complete");
	while(1)
	{
		dist = 99999;
		foreach(player in level.players)
		{
			if(player != self && Distance(self.origin,player.origin) < dist)
			{
				dist = Distance(self.origin,player.origin);
			}
		}
		if(dist > 1000)
		{
			rain = spawnFx(level.rain_heavy, self.origin+(0,0,1000));
			triggerfx(rain);
			wait 2;
			rain delete();
		}
		else
			wait 2;
	}
}
CreateMeteorShower(pos)
{
	if(!isDefined(pos))
		return;	
	thread waitForMeteors(pos);
}
waitForMeteors(pos)
{
	wait 7;
	pos = pos + (0,0,1500);	
	level.meteorar[level.meteor] = spawnFx(level.meteor_shower, pos);
	triggerfx(level.meteorar[level.meteor]);	
	level.meteor++;
}
//////////////////////// Box /////////////////////////

CreateBox(origin, angle)
{
    box = spawn("script_model", origin + (0,0,12));
	level.magical_boxes[level.magical_boxes.size+1] = box;
	//box.angles = angle+(0,270,0);
	box.angles = angle;
	box.triggered = 0;
	box.type = "box";
	box.price = getDvarInt("cost_box");
	//box.newModel = cointoss();
	box.newModel = true;
	if(!box.newModel)
		box setModel("zw2_magic_box");
	else
	{
		box setModel("fsm_box");
		box.origin = box.origin + (0,0,-15);
	}		
	//box thread Box_Radius();
	box thread Box_Fx();
	box thread CreateWalls(angle);	
	box thread Perk_Icons();

    //player notifyonplayercommand("Box", "+activate");
	trigger = Spawn( "trigger_radius", box.origin, 1, 100, 100 );
	//trigger SetCursorHint( "HINT_NOICON" );
	//trigger sethintstring("Press ^3[{+activate}] ^7for random weapon [Cost: 950]");

	while(1)
	{
		trigger waittill("trigger", user);
		user setLowerMessage("Box", "Press ^3[{+activate}] ^7to get a random Weapon - [^3" + box.price + "^7]"); 
		box thread Box_Hud(user);

        if(user usebuttonpressed() && user.score >= box.price && box.triggered == 0)
		{
	        //box thread Box_Activate(user);
			user.score -= box.price;
			//trigger sethintstring(" ");
			user clearLowerMessage("Box");

			box.triggered = 1;
			foreach(client in level.players)
			{
				if(Distance(client.origin, box.origin) <= 150)
					client playLocalSound("mp_bonus_start");
			}	
			if(!box.newModel)
				box scriptModelPlayAnim("zw2_magic_box_open");
			else
				box scriptModelPlayAnim("fsm_open_box");
			activationtime = getDvarInt("box_active_time");
			//play fx
			weapon = spawn("script_model", box.origin+(0,0,30));
			weapon.angles = box.angles;
			weapon moveTo(weapon.origin+(0,0,10),1);	
			
			number = randomint(level.gun.size);
			i = 0;
			model = undefined;
			foreach(gun in level.gun)
			{
				i++;
				if(i == number)
				{
					model = GetWeaponModel(gun);
					break;
				}
			}
			//model = getWeaponModel(level.gun[randomInt(level.gun.size)]);
			time = 0.2;
			iterator = [];
			result = "defaultweapon_mp";
			for(i = 0;i < 26;i++)
			{
				wait time;
				iterator[i] = randomInt(level.gun.size);
				//model = getWeaponModel(level.gun[iterator[i]]);
				j = 0;
				foreach(gun in level.gun)
				{
					if(iterator[i] == j)
					{
						model = GetWeaponModel(gun);
						break;
					}						
					j++;	
				}
				weapon setModel(model);		
				//if(i < 15)
				//    time = .1;
				if(i == 15)
					time = .2;
				if(i == 25)
				{
					//result = level.gun[iterator[i]];	
					number = randomint(level.gun.size);
					j = 0;
					model = undefined;
					foreach(gun in level.gun)
					{				
						if(j == number)
						{
							result = GetWeaponModel(gun);
							break;
						}
						j++;
					}
					while(user hasWeapon(result))
					{
						iterator[i] = randomInt(level.gun.size);
						j = 0;
						foreach(gun in level.gun)
						{
							if(iterator[i] == j)
							{
								model = GetWeaponModel(gun);
								result = gun;
								break;
							}						
							j++;	
						}
						weapon setModel(model);					
						waitFrame();
					}
				}		    
			}	
			if(result == "defaultweapon_mp")
			{
				weapon setModel(GetWeaponModel(level.thundergun));	
				result = level.thundergun;
			}
			box thread Box_PrepareGun(user, result, weapon, trigger);
			weapon moveTo(weapon.origin+(0,0,-20),activationtime);
	wait activationtime;
	if (box.triggered == 1)
	{
    	weapon delete();
    	wait 1; // Adjust this wait time as needed
    	if (!box.newModel)
        	box scriptModelPlayAnim("zw2_magic_box_close");
    	else
        	box scriptModelPlayAnim("fsm_close_box");
    	wait .1;
    	box.triggered = 0;
    	box notify("box_done");
	}


			user clearLowerMessage("Box");
			user notify("box_end");
			//trigger sethintstring("Press ^3[{+activate}] ^7for random weapon [Cost: 950]");

		}
		else if(user.score < box.price)
		    box iPrintln("^1Not enough Cash!");
		else
			box iPrintln("^1Box is already in use!");
	}	
}

Box_Fx()
{
	wait 15;
	playFx(level.magic_box, self.origin+(0,0,-100));
	//playFx(level.magicstream, self.origin);
}
/*
Box_Radius()
{
	level endon("game_over");
    while(1)
	{
	    wait .2;
		if(self.triggered == 1)
			continue;
        foreach(player in level.players)
		{		    
		    if(Distance(player.origin, self.origin) <= 90)
			{
			    //if(player.score >= self.price)
				//{
				    if(self.triggered == 0)
				        self thread Box_Interact(player);
				//}
			}
		}
	}
}
Box_Interact(player)
{
    player endon("box_end");
	player endon("death");
	player endon("disconnect");
    self thread Box_Hud(player);
    //player notifyonplayercommand("Box", "+activate");
	trigger = Spawn( "trigger_radius", self.origin, 1, 50, 50 );

	while(1)
	{
		trigger waittill("trigger", user);
        if(user usebuttonpressed() && user.score >= self.price && self.triggered == 0)
		{
	        self thread Box_Activate(user);
		    user.score -= self.price;
			user clearLowerMessage("Box");
			user notify("box_end");
		}
		else if(user.score < self.price)
		    self iPrintln("^1Not enough Cash!");
		else
			self iPrintln("^1Box is already in use!");
	}	
}
*/
Box_Hud(player)
{
    player endon("box_end");
    player endon("disconnect");
    player setLowerMessage("Box", "Press ^3[{+activate}] ^7to get a random Weapon - [^3" + self.price + "^7]"); 
	while(1)
	{
	    wait .1;
		if(Distance(self.origin, player.origin) > 90)
		{
			player clearLowerMessage("Box");
			player notify("box_end");
		}
	}
}
/*
Box_Activate(player) // became very iniffecient because level.gun changed to strings instead of ints, O(n^5 or sth, very bad)
{
    self endon("box_done");
    self.triggered = 1;
	foreach(client in level.players)
	{
		if(Distance(client.origin, self.origin) <= 150)
		{
			client playLocalSound("mp_bonus_start");
		}
	}	
	if(!self.newModel)
		self scriptModelPlayAnim("zw2_magic_box_open");
	else
		self scriptModelPlayAnim("fsm_open_box");
	activationtime = getDvarInt("box_active_time");
	//play fx
	weapon = spawn("script_model", self.origin+(0,0,30));
	weapon.angles = self.angles;
    weapon moveTo(weapon.origin+(0,0,10),1);	
	
	number = randomint(level.gun.size);
	i = 0;
	model = undefined;
	foreach(gun in level.gun)
	{
		i++;
		if(i == number)
		{
			model = GetWeaponModel(gun);
			break;
		}
	}
	//model = getWeaponModel(level.gun[randomInt(level.gun.size)]);
	time = 0.2;
	iterator = [];
	result = "defaultweapon_mp";
	for(i = 0;i < 26;i++)
	{
	    wait time;
	    iterator[i] = randomInt(level.gun.size);
		//model = getWeaponModel(level.gun[iterator[i]]);
		j = 0;
		foreach(gun in level.gun)
		{
			if(iterator[i] == j)
			{
				model = GetWeaponModel(gun);
				break;
			}						
			j++;	
		}
		weapon setModel(model);		
		//if(i < 15)
		//    time = .1;
		if(i == 15)
            time = .2;
		if(i == 25)
		{
			//result = level.gun[iterator[i]];	
			number = randomint(level.gun.size);
			j = 0;
			model = undefined;
			foreach(gun in level.gun)
			{				
				if(j == number)
				{
					result = GetWeaponModel(gun);
					break;
				}
				j++;
			}
			while(player hasWeapon(result))
			{
			    iterator[i] = randomInt(level.gun.size);
				j = 0;
				foreach(gun in level.gun)
				{
					if(iterator[i] == j)
					{
						model = GetWeaponModel(gun);
						result = gun;
						break;
					}						
					j++;	
				}
				weapon setModel(model);					
				waitFrame();
			}
		}		    
	}	
	if(result == "defaultweapon_mp")
	{
		weapon setModel(GetWeaponModel(level.thundergun));	
		result = level.thundergun;
	}
	self thread Box_PrepareGun(player,result,weapon);
	weapon moveTo(weapon.origin+(0,0,-20),activationtime);
	wait activationtime;
	if(self.triggered == 1) // defensive coding ^^
	{
	    player clearLowerMessage("Box");
		weapon delete();
		if(!self.newModel)
			self scriptModelPlayAnim("zw2_magic_box_close");
		else
			self scriptModelPlayAnim("fsm_close_box");
		wait 1;
		self.triggered = 0;
		self notify("box_done");
	}	
}*/
Box_PrepareGun(player, name, weapon, trigger)
{
    self endon("box_done");
    player endon("disconnect");
	player endon("pressed_button");
	//player setLowerMessage("Box", "Press ^3[{+activate}] ^7to take " + getWeaponName(name));
    while(1)
	{
	    wait .1;		
		if(Distance(self.origin, player.origin) <= 90)
			player setLowerMessage("Box", "Press ^3[{+activate}] ^7to take " + getWeaponName(name));
		else
			player clearLowerMessage("Box");
		if(Distance(self.origin, player.origin) <= 90)
		{
			if(isValidWeapon(player getCurrentWeapon()))
			{
				player notify("box_givegun");
				self thread Box_GiveGun(player, name, weapon, trigger);	
			}
		    else
			{
				player iPrintln("^1You wear an invalid Weapon for trading!");
			}
		}
	}	
}

Box_GiveGun(player, name, weapon, trigger)
{
	self endon("box_done");

	player endon("disconnect");
	player endon("box_givegun");

	for (;;)
	{
		if (player usebuttonpressed() && Distance(self.origin, player.origin) <= 90)
		{
			player notify("pressed_button");
			player clearLowerMessage("Box");

			if (player hasWeapon(name))
			{
				player clearLowerMessage("BoxDuplicate");
				player setLowerMessage("BoxDuplicate", "^1You already have this weapon!");

				wait 3;

				player clearLowerMessage("BoxDuplicate");

				return;
			}

			player _giveWeapon(name, randomInt(9), true);
			player giveMaxAmmo(name);

			weapon delete();

			if (!self.newModel)
				self scriptModelPlayAnim("zw2_magic_box_close");
			else
				self scriptModelPlayAnim("fsm_close_box");
			
			wait 0.05;

			if (isSpecialistWeapon(name))
			{
				player thread maps\zm\d_ops_arcade\weapons::SpecialistWeapon(name, player getCurrentWeapon());
			}
			else
			{
				if (player.weapon_maximum == 1)
				{
					player takeWeapon(player getCurrentWeapon());
				}
				else
				{
					player.weapon_maximum = 1;
				}

				player switchToWeapon(name);
			}

			wait 0.95;

			self.triggered = 0;

			self notify("newweapon");
			self notify("box_done");

			break;
		}

		wait 0.05;
	}
}

///////////////// Fx ///////////////

Fx_Lava(pos)
{
	level thread spawnLavaFx(pos);
}
spawnLavaFx(pos)
{
	wait 7;
	playFx(level.bloodlake, pos);
}
Fx_Fire(pos)
{
	level thread spawnFireFx(pos);
}
spawnFireFx(pos)
{
	wait 8;
	fx = spawnFx(level.fire_large, pos);
	triggerfx(fx);
	level thread FireDamage(pos);
}

Fx(fx, pos, time,loop)
{
    level thread FxSpawnWait(fx,pos,time,loop);
}
FxSpawnWait(fx,pos,time,loop)
{
	wait 5;
	level thread FxSpawn(fx,pos,time,loop);
}
FxSpawn(fx,pos,time,loop)
{  
	if(fx == "fog")
	    fx = level._effect["FOW"];
    fx = spawnFx(fx, pos);
	triggerfx(fx);	
	if(isDefined(time))
		fx thread DeleteFx(fx,pos,time,loop);
}
FireDamage(pos)
{
	while(true)
	{
		wait .13;
		foreach(player in level.players)
		{
			if(Distance(player.origin,pos) <= 100 && player.isDown == 0 && player.protected == 0 && player.team == "allies")
			{
				//iPrintln(Distance(player.origin,pos));
				player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, 2, 0, "MOD_EXPLOSIVE", "none", player.origin, player.origin, "none", 0, 0 );
			}
		}
		foreach(zombie in level.zombie)
		{
			if(Distance(zombie.origin,pos) <= 100 && isDefined(zombie.hitbox) && !zombie.burn)
			{
				zombie thread maps\zm\d_ops_arcade\zombies::Zombie_BurnDamage();
				zombie.burn = true;
			}
		}
	}
}
DeleteFx(fx,pos,time,loop)
{
	if(!isDefined(time))
		time = 1;
    wait time;
	self delete();
	if(isDefined(loop))
		level thread FxSpawn(fx,pos,time,loop);
}

////////////////// PAP //////////////////////////

CreatePap(pos,angle)
{
	ent = spawn("script_model", pos);
	ent.angles = angle;
	ent.active = false;
	ent.type = "pap";
    level.vending_machines[level.vending_machines.size+1] = ent;
	ent setModel("zw2_pap_machine");
	name = "pap";
	oldname = name;
	ent thread Perk_Think(name, oldname);
	ent thread Perk_Icons();
}

///////////////// Gumballmachine //////////////////////

CreateGum(pos,angle)
{
	oldname = "Gobblegum";	
	name = toLower(oldname);
    ent = spawn("script_model", pos);
	ent.angles = angle;
	ent.type = name;
	ent setModel("bo3_bubblegum");
	ent thread Perk_Think(name, oldname);
	ent thread Perk_Icons();
}

////////////////// Perks ////////////////////////

CreatePerk(name,pos,angle,pseudo)
{
	oldname = name;	
	name = toLower(name);
    ent = spawn("script_model", pos);
	ent.angles = angle;
	ent.type = name;
	if(ent.type == "quickrevive")
		ent.counter = 0;
    level.vending_machines[level.vending_machines.size+1] = ent;
	if(!isDefined(pseudo))
		ent setModel(getPerkModel(name));
	ent thread PerkFx(pos);
	ent thread Perk_Think(name, oldname);
	ent thread Perk_Icons();
}

Perk_Icons()
{
	level endon("end_game");
	while(true)
	{
		level waittill("connected", player);
		self thread checkPerkDistance(player);
	}
}

checkPerkDistance(player)
{
	player endon("disconnect");

	shader = getMachineIcon(self.type);

	player waittill("intro_complete");

	while(true)
	{
		wait 0.5;

		if (!IsPlayer(player))
			continue;
		
		if (!player.showIcons)
			continue;
		
		if (self canSpawnPerkHudElem(player))
		{
			icon = self createPerkIcon(shader, player);
			self deletePerkIcon(icon, player);
		}
	}
}

canSpawnPerkHudElem(player)
{
	if(VectorDot( anglesToForward( player.angles ), VectorNormalize( self.origin - player.origin ) ) < 0.766 && self isInTouch(player))
	{
		return true;
	}	
	return false;	
}

deletePerkIcon(icon,player)
{
	player endon("disconnect");
	player notify("deletePerkIconAgain_" + icon);
	player endon("deletePerkIconAgain_" + icon);
	valid = true;
	while(valid)
	{
		if(!self canSpawnPerkHudElem(player))
		{
			valid = false;
			if(isDefined(icon))
			{
				icon fadeovertime(.5);
				icon.alpha = 0;
				wait .5;
				icon destroy();
			}				
		}
		wait .3;
	}
}

createPerkIcon(shader, player)
{
	icon = NewClientHudElem(player);

	icon SetShader(shader, 120, 120);
	
	icon.alpha = 0;
	icon.color = (1, 1, 1);
	icon.x = self.origin[0];
	icon.y = self.origin[1];
	icon.z = self.origin[2] + 55;
	icon thread destroy_on_end_game();
	
	icon SetWayPoint(true, true);
	icon FadeOverTime(.5);

	icon.aplha = 1;

	return icon;
}
 
isInTouch(player)
{
	if(Distance(player.origin,self.origin) > 300 && Distance(player.origin,self.origin) < 750)
		return true;
	else
		return false;
}
FadeIcon(icon,what)
{
    if( what == "in" )
    {
        icon FadeOverTime( 0.2 );
        icon.alpha = 1;
        wait ( 0.2 );
    }
    else if( what == "out" )
    {
        icon FadeOverTime( 0.2 );
        icon.alpha = 0;
        wait ( 0.2 );
		if(isDefined(icon))
			icon destroy();
    }
    else
    {
        if( icon.alpha == 0 )
        {
            icon FadeOverTime( 0.2 );
            icon.alpha = 1;
            wait ( 0.2 );
        }
        else
        {
            icon FadeOverTime( 0.2 );
            icon.alpha = 0;
            wait ( 0.2 );
			if(isDefined(icon))
				icon destroy();
        }
    }
}
getMachineIcon(name)
{
	if(name == "box")
		name = "cardicon_weed";
	else if(name == "gobblegum")
		name = "cardicon_xray";
	else if(name == "pap")
		name = "cardicon_warpig";
	else if(name == "juggernog")
		name = "cardicon_juggernaut_2";
	else if(name == "doubletap")
		name = "cardicon_doubletap";
	else if(name == "staminup")
		name = "specialty_lightweight_upgrade";
	else if(name == "speedcola")
		name = "specialty_fastreload_upgrade";	
	else if(name == "quickrevive")
		name = "specialty_pistoldeath_upgrade";
	else if(name == "widowswine")
		name = "cardicon_devilfinger";
	return name;	
}
PerkFx(pos)
{
	wait 10;
	while(1)
	{
		playFx(level.vendingsmoke, pos);
		wait 40;
	}
}

Perk_Think(name, oldname)
{
    //level waittill("power");

	if(name == "quickrevive")
	{
		self thread onMaximalAmount(name);
		self thread CreateWalls(self.angles,true);
		self endon("maximal_quickrevive");
	}	
	else
		self thread CreateWalls(self.angles);

	if(name == "pap")
		self thread pap_hint_hotfix();
	
	while(1)
	{
		cost = getCost(name);
	    wait .25;
		foreach(player in level.players)
		{
			valid = false;
		    if(Distance(player.origin, self.origin) <= 90 && player.isDown == 0 && player.team == "allies" && player.buying == 0)
			{
				if(!isdefined( player.machine_prone ))
					player.machine_prone = [];

				if(!isdefined( player.machine_prone[ name ] ))
					player.machine_prone[ name ] = 0;

				//Prone points
				if( player getstance() == "prone" && isdefined(player.machine_prone[ name ]) && !player.machine_prone[ name ])
				{
					player playlocalsound("UK_1mc_achieve_littlebird");
					player.score += 100;
					player.machine_prone[ name ] = 1;
				}

			    if(name == "pap")
					valid = true;
	
				else if(name == "gobblegum")
				{
					valid = true;
				}
				else
				{				
					if(name == "quickrevive" && !player.quickrevive)
						valid = true;
					if(name == "juggernog" && !player.juggernog)
						valid = true;	
					if(name == "doubletap" && !player.doubletap)
						valid = true;	
					if(name == "speedcola" && !player.speedcola)
						valid = true;	
					if(name == "staminup" && !player.staminup)
						valid = true;
					
				}
				if(valid)
				{
					if(name != "pap")
					{
						player setLowerMessage("Perk_" + name, "Press ^3[{+activate}] ^7to buy " + oldname + " - [^3" + cost + "^7]"); 
						self thread Perk_Button(player, name, cost);
					}
					else
					{
						if(self.active != true)
							self Perk_Button(player, name, cost);
					}				
				}				
			}
			else
				player clearLowerMessage("Perk_" + name);
		}
	}
}

pap_hint_hotfix()
{
	level endon("end_game");
	for(;;)
	{
		foreach(player in level.players)
		{
		    if(Distance(player.origin, self.origin) <= 90 && player.isDown == 0 && player.team == "allies" && player.buying == 0 && !is_true(player.upgrade_hint))
				player setLowerMessage("Perk_pap", "Press ^3[{+activate}] ^7to upgrade your Weapon - [Cost: ^35000^7]");
			else if(Distance(player.origin, self.origin) <= 90 && is_true(player.upgrade_hint))
				player setLowerMessage("Perk_pap", "Press ^3[{+activate}] ^7for upgraded weapon"); 
			else if(Distance(player.origin, self.origin) > 90 )
				player clearLowerMessage("Perk_pap");
		}
		wait .1;
	}
}

onMaximalAmount(name)
{
	self waittill("maximal_quickrevive");
	foreach(player in level.players)
		player clearLowerMessage("Perk_" + name);
	self moveTo(self.origin+(0,0,-300), 3);
	wait 3;
	self delete();	
}

Perk_Button(player, name, cost)
{
    player endon("disconnect");
	player endon("death");
	player notify("perk_button");
	player endon("perk_button");
	//player notifyonplayercommand("Perk", "+activate");

	while(1)
	{
		if(player usebuttonpressed() && Distance(self.origin, player.origin) <= 90)
		{ 
		    if(player.score >= cost && player.isDown == 0)
			{			
				if(name == "pap")
				{
					if(!self.active)
					{
						self.active = true;
						current = player getCurrentWeapon();
						if(!isDefined(player.weaponlist[current]))
							player.weaponlist[current] = 0;

						if(isValidWeapon(current))
						{
							player clearLowerMessage("Perk_" + name);

							player giveUpgrade(self, cost);
							player clearLowerMessage("Perk_" + name);
							player.upgrade_hint = 0;

							wait 2;
						}
						else
							player iPrintln("You hold an invalid Weapon!");

						self.active = false;	
					}					
					else
						player iPrintln("Pack-a-Punch is currently in use!");
				}
				else
					player thread givePerk(name, cost);

				player notify("perk_button");
			}
		    else
				player iPrintln("^1Not enough Cash!");
		}
		wait .1;
	}
}

giveUpgrade(pap, cost)
{
	self playSound("US_1mc_armsrace");
	self endon("pap_take");
	self.buying = 1;

	self.score -= cost;
	weap = self getCurrentWeapon();
	self notify("upgraded_" + weap);
	self takeWeapon(weap);
	model = spawn("script_model", self getTagOrigin("tag_weapon"));
	start_origin = model.origin;
	model setModel(getWeaponModel(weap));
	/*
    origin_offset = ( 0, 0, 0 );
    angles_offset = ( 0, 0, 0 );
    origin_base = pap.origin;
    angles_base = pap.angles;
	forward = anglestoforward( angles_base + angles_offset );
    interact_offset = origin_offset + forward * -25;
	*/
	model moveTo(pap.origin + (0,0,30), 2);

	model.angles = pap.angles;
	forward = AnglesToForward(model.angles);
	end = (self.origin + (0,0,25)) + vector_Scal(forward, 40);
	wait 2;
	movetoLoc = VectorToAngles(model.origin - self.origin );	
	//model RotateTo((0, movetoLoc[1], 0), .1);		
	fx = spawnfx(level.magic_box, pap.origin);
	triggerfx(fx);
	wait 2;
	fx delete();
	model moveTo(start_origin, 2);
	self thread takeUpgrade(pap, weap, model);
	wait 2;

	if(isDefined(model))
		model moveTo(pap.origin + (0,0,30), 7);

	wait 7;
	self.buying = 0;
	self.weapon_maximum = 0;
	pap.active = false;
	self notify("pap_timeout");
}

takeUpgrade(pap, weap, model)
{
	self endon("disconnect");
	self endon("death");
	self endon("pap_timeout");
	self endon("pap_take");
	//self notifyonplayercommand("takeUpgrade", "+activate");
	self.upgrade_hint = 1;

	while(1)
	{
		if(Distance(self.origin, model.origin) <= 150 && self usebuttonpressed())
		{		
			weap = getCorrectUpgrade(weap);
			self giveWeapon(weap, 8, true);
			self giveMaxAmmo(weap);
			model delete();
			pap.active = false;
			if(!isDefined(self.weaponlist[weap]))
			{
				self.weaponlist[weap] = 0;
				iPrintln("^1ERROR: " + weap + " is not defined in weaponlist!\n^7(this has no change for the player ingame)");
			}
			if(self.weaponlist[weap] == 2)
			{
				self thread newGunEffect(weap);
			}
			else if(self.weaponlist[weap] == 1)
			{
				self.weaponlist[weap] = 2;
				if(isValidWonderweapon(self getCurrentWeapon()))
					self thread newGunEffect(weap);
			}
			else
			{
				self.weaponlist[weap] = 1;
			}
				
			self.buying = 0;
			wait 0.05;
			self switchToWeapon(weap);
			self notify("pap_take");			
		}
		wait .1;
	}
}
newGunEffect(weapon)
{
	r = randomInt(4);
	switch(r)
	{
		case 0:
			self thread Fireblast(weapon);
			iPrintln("fireblast");
			break;
		case 1:
			self thread Thunderblast(weapon);
			iPrintln("thunderblast");
			break;	
		case 2:
			self thread Lightning(weapon);
			iPrintln("lightning");
			break;
		case 3:
			self thread Firework(weapon);
			iPrintln("firework");
			break;				
		default:
			iPrintln("^1ERROR: unknown Guneffect attached!");
			break;
	}
}

Fireblast(weapon)
{
	self notify("newGunEffect_" + weapon);
	self endon("newGunEffect_" + weapon);
	self endon("disconnect");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getCurrentWeapon() == weapon)
		{
			pos = self getCursorPos();
			foreach(zombie in level.zombie)
			{
				if(Distance(zombie.origin,pos) <= 200 && isDefined(zombie.hitbox))
				{
					if(zombie.type == "normal" || zombie.type == "dog")
					{
						self thread Zombie_Fireblast(zombie);
					}
				}
			}
			wait 15;
		}
	}
}

Zombie_Fireblast(zombie)
{
	zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Soulburn();
	wait 3;
	if(isDefined(zombie.hitbox))
	{
		zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Death(2);
		self.kills++;
		self.pers["kills"] = self.kills;
		self.score += (50 * level.multiplier);			// Black Ops 3 is not giving points but I think its fine..				
		self.mykills++;
		self notify("killed"); 	
	}
	
}
Lightning(weapon)
{
	self notify("newGunEffect_" + weapon);
	self endon("newGunEffect_" + weapon);
	self endon("disconnect");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getCurrentWeapon() == weapon)
		{
			pos = self getCursorPos();
			foreach(zombie in level.zombie)
			{
				if(Distance(zombie.origin,pos) <= 200 && isDefined(zombie.hitbox))
				{
					if(zombie.type == "normal" || zombie.type == "dog")
					{
						self thread Zombie_Lightning(zombie);
					}
				}
			}
			wait 15;
		}
	}
}
Zombie_Lightning(zombie)
{
	zombie endon("zombie_dead");
	zombie.attract = 1;
	zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("idle");
	//zombie.hitbox thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, 500, 0, "MOD_EXPLOSIVE", "none", zombie.origin, zombie.origin, "none", 0, 0 );
	zombie.hitbox.health -= 500;
	zombie.hitbox notify("damage");
	for(i = 0;i < 30;i++)
	{
		zombie.fire = spawnFx(level.energybulb_negative,zombie.origin);
		triggerfx(zombie.fire);
		wait .1;
		zombie.fire delete();
	}
	zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("walk");
	//wait 3;
	zombie.attract = 0;
}
Firework(weapon)
{
	self notify("newGunEffect_" + weapon);
	self endon("newGunEffect_" + weapon);
	self endon("disconnect");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getCurrentWeapon() == weapon)
		{
			pos = self getCursorPos();
			thread spawnWeaponModel(weapon,pos);
			foreach(zombie in level.zombie)
			{
				if(Distance(zombie.origin,pos) <= 400 && isDefined(zombie.hitbox))
				{
					if(zombie.type == "normal" || zombie.type == "dog")
					{
						MagicBullet(weapon, pos, zombie.hitbox.origin, self);
						wait .5;
					}
				}
			}
			wait 15;
		}
	}
}

spawnWeaponModel(weapon,pos)
{
	model = spawn("script_model", pos+(0,0,50));
	model setModel(getweaponmodel(weapon));
	wait 3;
	model delete();
}

Thunderblast(weapon)
{
	self notify("newGunEffect_" + weapon);
	self endon("newGunEffect_" + weapon);
	self endon("disconnect");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getCurrentWeapon() == weapon)
		{
			pos = self getCursorPos();
			playFx(level.thundergun_smoke, self getTagOrigin("j_head"),AnglesToForward(self.angles+(0,90,0)),self GetPlayerAngles());
			foreach(zombie in level.zombie)
			{
				if(Distance(zombie.origin,pos) <= 200 && isDefined(zombie.hitbox))
				{
					if(zombie.type == "normal" || zombie.type == "dog")
					{
						self thread maps\zm\d_ops_arcade\player::Zombie_Knockback(zombie);
					}
				}
			}
			wait 15;
		}
	}
}

givePerk(name, cost) // later found out there is a disableswitchweapon cmd :| could have made a lot of stuff easier
{
    self endon("disconnect");
    self.buying = 1;
	if(isDefined(cost))
		self.score -= cost;	
	self playlocalsound("UK_1mc_achieve_littlebird"); //UK_1mc_achieve_littlebird_01
	weap = self getCurrentWeapon();
	primaryWeapons = self getWeaponsListPrimaries();
	myweapon = [];
	gumball = undefined;
	i = 0;
	foreach(primary in primaryWeapons)
	{
	    myweapon[i] = spawnstruct();
		myweapon[i].name = primary;
		myweapon[i].clip = self getWeaponAmmoClip(primary);
		myweapon[i].stock = self getWeaponAmmoStock(primary);
		self takeWeapon(primary);
		i++;
	}
	if(name == "gobblegum")
	{
		standbyweapon = level.gumball;
		gumball = level.gobblegum[randomInt(level.gobblegum.size)];
		self giveWeapon(standbyweapon, getGumCamo(gumball));
	}		
	else
	{
		standbyweapon = level.perkbottle;
		self giveWeapon(standbyweapon,getPerkCamo(name));
	}	
    wait .1;
	self switchToWeapon(standbyweapon);
	//self iPrintln(self.name + " ^7bought " + name);
	if(name != "gobblegum")
		self thread addToList(name);
	if(name == "quickrevive")
	{
		self playlocalsound("mp_killstreak_radar");
		self.quickrevive = true;
		self.revivetime = 25;
		if(level.players.size == 1)
		{
			foreach(machine in level.vending_machines)
			{
				if(machine.type == "quickrevive")
				{
					machine.counter++;
					if(machine.counter == 3)
					{
						machine notify("maximal_quickrevive");
					}
				}
			}
		}		
	}
	else if(name == "juggernog")
	{
		self playlocalsound("mp_killstreak_pavelow");
		self.maxhealth = 150;
		self.health = 150;	
		self.juggernog = true;
	}
	else if(name == "doubletap")
	{
		self playlocalsound("mp_killstreak_nuclearstrike");
		self.doubletap = true;
		self thread DoubleTap();
	}
	else if(name == "speedcola")
	{
		self playlocalsound("mp_killstreak_sentrygun");
		self.speedcola = true;
		self maps\mp\perks\_perks::givePerk("specialty_fastreload");
		self maps\mp\perks\_perks::givePerk("specialty_quickdraw");
	}
	else if(name == "staminup")
	{
		self.staminup = true;
		self playlocalsound("mp_killstreak_stealthbomber");
		self maps\mp\perks\_perks::givePerk("specialty_lightweight");
		self maps\mp\perks\_perks::givePerk("specialty_fastmantle");
		self maps\mp\perks\_perks::givePerk("specialty_fastsprintrecovery");
		self maps\mp\perks\_perks::givePerk("specialty_marathon");
		self setClientDvar("player_sprintUnlimited", 1);
		//self thread StaminUp();
	}
	wait 1;
	self playlocalsound("RU_1mc_capture"); // RU_1mc_capture_01
	if(name != "gobblegum")
	{
		self SetWaterSheeting(1,2);
	}
	else
	{
		self thread giveGumball(gumball);
	}
	wait 1;
	i = 0;
	foreach(primary in myweapon)
	{
		if(!isSpecialistWeapon(myweapon[i].name))
		{
			if(name != "pap")
				self giveWeapon(myweapon[i].name,randomInt(8),true);
			else
				self giveWeapon(myweapon[i].name,8,true);
			self setWeaponAmmoClip(myweapon[i].name, myweapon[i].clip );
			self setWeaponAmmoStock(myweapon[i].name, myweapon[i].stock );
		}	
		i++;
	}
	self switchToWeapon(weap);
	self takeWeapon(standbyweapon);
	self.buying = 0;
}
DoubleTap()
{
	self endon("disconnect");
	self endon("death");
	self endon("isDown");

	while(1)
	{
		self waittill("weapon_fired");
		MagicBullet(self getCurrentWeapon(), self getTagOrigin("tag_eye"), self getCursorPos(),self);
	}
}
StaminUp()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill_any("reload", "weapon_change");
		wait .1;
		self thread maps\mp\gametypes\_weapons::updateMoveSpeedScale( "pistol" );
	}
}
addToList(name)
{
	if(name == "juggernog")
		name = "cardicon_juggernaut_2";
	else if(name == "doubletap")
		name = "cardicon_doubletap";
	else if(name == "staminup")
		name = "specialty_lightweight_upgrade";
	else if(name == "speedcola")
		name = "specialty_fastreload_upgrade";	
	else if(name == "quickrevive")
		name = "specialty_pistoldeath_upgrade";
	else if(name == "widowswine")
		name = "cardicon_devilfinger";
	x = self.perklist.size * 20;
	icon = self createIcon(name, 20, 20);
	self.perklist[self.perklist.size] = icon;
	icon setPoint("BOTTOMLEFT", "BOTTOMLEFT", x+20,-45);
	icon thread destroy_on_end_game();
	self waittill("isDown");
	icon destroy();
}
///////////////// Spawn Weapon //////////////////////////////

CreateWeapon(name,pos)
{
    ent = spawn("script_model", pos+(0,0,40));
	ent setModel(GetWeaponModel(name));
	ent thread Rotate();
	ent thread Weapon_Fx();
	ent thread Weapon_Radius(name);
}
Rotate(ending)
{
    if(isDefined(ending))
	    self endon(ending);
    while(1)
	{
	    wait .7;
		self rotateto(self.angles+(0,180,0),.7);
	}
}
Weapon_Fx()
{
    wait 5;
	playfx(level.circle_red, self.origin+(0,0,-40));
	playfx(level.circle_grey, self.origin+(0,0,-40));
	//Fx = SpawnFx(level.circle_red,self.origin+(0,0,-40));
    //Fx2 = SpawnFx(level.circle_grey,self.origin+(0,0,-40));
	//TriggerFX(Fx);
	//TriggerFX(Fx2);
}


Weapon_Radius(name)
{
    weaponname = getWeaponName(name);
    cost = getDvarInt("cost_" + name);
	if(!isDefined(cost) || cost == 0)
	    cost = 1000;
    while(1)
	{
	    wait .5;
	    foreach(player in level.players)
		{
		    if(Distance(player.origin, self.origin) <= 90 && isDefined(player.origin) && player.team == "allies" && player.isDown == 0)
			{
			    self thread Weapon_Think(player,weaponname,name,cost);				
			}
		}
	}
}

Weapon_Think(player,weaponname,name,cost)
{
    player endon("disconnect");
	player notify("weapon_think_" + weaponname);
	player endon("weapon_think_" + weaponname);
	while(1)
	{
	    if(Distance(self.origin,player.origin) <= 90)
		{
			player setLowerMessage("Weapon_" + name, "Press ^3[{+activate}] ^7to buy " + weaponname + " - [^3" + cost + "^7]");
			self thread Weapon_Buy(player, name, cost, weaponname);
		}		
		else
		{
			player clearLowerMessage("Weapon_" + name);
			player notify("weapon_think_" + weaponname);
		}
       	wait .5;	
	}
}

Weapon_Buy(player, name, cost, weaponname)
{
	player endon("disconnect");
	player endon("death");
	player notify("weapon_buy_" + weaponname);
	player endon("weapon_buy_" + weaponname);
	//player notifyonplayercommand("Buy_Weapon","+activate");
	while(1)
	{
	    //player waittill("Buy_Weapon");
		if(player usebuttonpressed() && Distance(self.origin, player.origin) <= 90)
		{
		    if(player.score >= cost)
			{
			    player.score -= cost;
				if(!player hasWeapon(name))
				{
				    if(player.weapon_maximum == 1)
					{
					    player takeWeapon(player getCurrentWeapon());
					}
					else
					{
					    player.weapon_maximum = 1; 
					}
					player giveWeapon(name, randomInt(9), false);
					player giveMaxAmmo(name);
					player switchToWeapon(name);
					wait .1;
					player notify("newweapon");
				}
				else
				{
				    player giveMaxAmmo(name);
				}
			}
			else
			    player iPrintln("^1Not enough Cash!");
		}
		wait .1;
	}
}

createBlock(origin, angles, model,isquickrevive)
{
	block = spawn("script_model", origin);
	if(isDefined(model))
	    block setModel(model);
	else 	
	    block setModel("com_plasticcase_friendly"); 
	block.angles = angles;
	block.machine = self;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	if(isDefined(isquickrevive) && isquickrevive)
	{
		block thread deleteBlock();
	}
	return block;
}

deleteBlock()
{
	self.machine waittill("maximal_quickrevive");
	self delete();
}

CreateBarrier(start,end)
{
	D = Distance((start[0], start[1], 0), (end[0], end[1], 0));
	H = Distance((0, 0, start[2]), (0, 0, end[2]));
	blocks = roundUp(D/55);
	height = roundUp(H/30);
	waittime = .1;
	CX = end[0] - start[0];
	CY = end[1] - start[1];
	CZ = end[2] - start[2];
	XA = (CX/blocks);
	YA = (CY/blocks);
	ZA = (CZ/height);
	TXA = (XA/4);
	TYA = (YA/4);
	Temp = VectorToAngles(end - start);
	Angle = (0, Temp[1], 90);
	for(h=0;h<height;h++)
	{
		block = createBlock((start + (TXA, TYA, 10) + ((0, 0, ZA) * h)), Angle,self);
		block hide();
		wait waittime/10;
		for(i=1;i<blocks;i++)
		{
			block = createBlock((start + ((XA, YA, 0) * i) + (0, 0, 10) + ((0, 0, ZA) * h)), Angle,self);
			block hide();
			wait waittime/10;
		}
		block = createBlock(((end[0], end[1], start[2]) + (TXA * -1, TYA * -1, 10) + ((0, 0, ZA) * h)), Angle,self);
		block hide();
		wait waittime/10;
	}
}

CreateWalls(angle,isquickrevive)
{
	//fire = spawnFx(level.fire_flamethrower, self.origin+(0,0,30), AnglesToForward(self.angles+(0,90,0)),self.angles); 
	start = self.origin + AnglesToForward(self.angles+(0,0,30));
	end = self.origin + AnglesToForward(self.angles+(0,180,0)) + (0,0,70);

	D = Distance((start[0], start[1], 0), (end[0], end[1], 0));
	H = Distance((0, 0, start[2]), (0, 0, end[2]));
	blocks = roundUp(D/55);
	height = roundUp(H/30);
	waittime = .1;
	CX = end[0] - start[0];
	CY = end[1] - start[1];
	CZ = end[2] - start[2];
	XA = (CX/blocks);
	YA = (CY/blocks);
	ZA = (CZ/height);
	TXA = (XA/4);
	TYA = (YA/4);
	Temp = VectorToAngles(end - start);
	Angle = (0, Temp[1], 90);
	for(h=0;h<height;h++)
	{
		block = createBlock((start + (TXA, TYA, 10) + ((0, 0, ZA) * h)), Angle,self,isquickrevive);
		block hide();
		wait waittime/10;
		for(i=1;i<blocks;i++)
		{
			block = createBlock((start + ((XA, YA, 0) * i) + (0, 0, 10) + ((0, 0, ZA) * h)), Angle,self,isquickrevive);
			block hide();
			wait waittime/10;
		}
		block = createBlock(((end[0], end[1], start[2]) + (TXA * -1, TYA * -1, 10) + ((0, 0, ZA) * h)), Angle,self,isquickrevive);
		block hide();
		wait waittime/10;
	}
}

CreateGrids(corner1,corner2,angle)
{
	W=Distance((corner1[0],0,0),(corner2[0],0,0));
	L=Distance((0,corner1[1],0),(0,corner2[1],0));
	H=Distance((0,0,corner1[2]),(0,0,corner2[2]));
	CX=corner2[0] - corner1[0];
	CY=corner2[1] - corner1[1];
	CZ=corner2[2] - corner1[2];
	ROWS=roundUp(W/55);
	COLUMNS = roundUp(L/30);
	HEIGHT = roundUp(H/20);
	XA=CX/ROWS;
	YA=CY/COLUMNS;
	ZA=CZ/HEIGHT;
	center = spawn("script_model",corner1);
	for(r=0;r<=ROWS;r++){for(c=0;c<=COLUMNS;c++)
	{
		for(h=0;h<=HEIGHT;h++)
		{
			block = spawn("script_model",(corner1 +(XA * r,YA * c,ZA * h)));
			block setModel("com_plasticcase_friendly");
			block.angles =(0,0,0);
			block Solid();
			block LinkTo(center);
			block CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
			wait 0.01;
			}
		}
	}
	center.angles=angle;
}

/////////////////////// Gumballs //////////////////////

giveGumball(gumball)
{
	self endon("disconnect");
	self endon("death"); // why is this here?
	self endon("received_gumball");
	self iPrintln(gumball); // delete?
	self thread doGumball(gumball);
	self thread GumHud("gobblegum", gumball, getGumballIcon(gumball));
}

GumHud(text,text2,icon)
{
	if(isDefined(self.gumhud))
		self.gumhud destroy();
	self.gumhud = self createIcon(icon, 30, 30);
	self.gumhud setPoint("BOTTOMLEFT", "BOTTOMLEFT", 50, -110);	
	self.gumhud thread destroy_on_end_game();

    notifyData = spawnstruct();
	notifyData.iconName = icon; 
    notifyData.titleText = text; 
    notifyData.notifyText = text2; 

	if(text2 != "Percaholic" && text2 != "2x Firewave on taking damage")
		notifyData.notifyText2 = "Press ^3[{+actionslot 2}] ^7to activate"; 

    notifyData.glowColor = (0.3, 0.6, 0.3);
    notifyData.sound = "mp_level_up"; 
    notifyData.duration = 5; 
    notifyData.hideWhenInMenu = true; 
    self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
	
	self waittill_any("newgum", "gum_gone");
	self.gumhud destroy();
}

doGumball(gumball)
{
	self notify("newgum");
	switch(gumball)
	{
		case "Percaholic":
			self thread perkaholic();
			break;
		case "3x Firesale":
			self thread givePowerup(3, "firesale");
			break;
		case "2x Nuke":
			self thread givePowerup(2, "bomb");
			break;
		case "2x DoublePoints":
			self thread givePowerup(2, "multiplier");
			break;
		case "2x Max Ammo":
			self thread givePowerup(2, "maxammo");
			break;
		case "2x Instakill":
			self thread givePowerup(2, "instakill");
			break;	
		case "Stun normal Zombies for 20s":
			self thread stunzombies(20);
			break;
		case "Droprain":
			self thread Droprain();
			break;	
		case "End Round + 1600 Cash":
			self thread forceEndRound();
			break;
		case "Punch your current Gun":
			self thread punchcurrentgun();
			break;
		case "Slow Down all Zombies":
			self thread slowdownZombies();
			break;		
		case "2x Firewave on taking damage":
			self thread Firewave();
			break;	
		case "2x Random Powerup":                  // done
			self thread givePowerup(2);
			break;	
		case "Invisible for zombies":
			self thread Invisible();
			break;	
		case "2x Teleport to a random location":
			self thread randomTeleport();
			break;	
		case "Regain Ammo when getting Cash":
			self thread RegainAmmo();
			break;
		default:
			self iPrintlnbold("^1ERROR: Gumball Function does not exist!");
			break;
	}
}
//-------------------
perkaholic()
{
	self.quickrevive = true;
	self.revivetime = 25;
	self.maxhealth = 150;
	self.health = 150;	
	self.juggernog = true;
	self.doubletap = true;
	self thread DoubleTap();
	self.speedcola = true;
	self.staminup = true;
	self thread StaminUp();
	self thread addToList("juggernog");
	self thread addToList("doubletap");
	self thread addToList("staminup");
	self thread addToList("speedcola");
	self thread addToList("quickrevive");
}

RegainAmmo()
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	self notifyonplayercommand("5","+actionslot 2");

	//if ( level.painter_player buttonpressed( "DPAD_UP" ) )
	//else if ( level.painter_player buttonpressed( "DPAD_DOWN" ) )
	//else if ( level.painter_player buttonpressed( "DPAD_RIGHT" ) )
	//else if ( level.painter_player buttonpressed( "DPAD_LEFT" ) )

	counter = 0;
	while(1)
	{
		self waittill("5");	
		if(self.isDown == 0)
		{
			counter++;
			self Antithesis();
			if(counter == 2)
				self notify("gum_gone");
		}
		wait .1;
	}	
}

Antithesis()
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	for(i=0;i<600;i++)
	{
	    money = self.score;
		wait .1;
		if(self.score > money)
		{
		    clipCount = self GetWeaponAmmoStock(self getCurrentWeapon());
            self SetWeaponAmmoStock(self getCurrentWeapon(), (clipCount+1) );			
		}
		self notify("reload");
	}
}

Invisible()
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	self notifyonplayercommand("5","+actionslot 2");
	while(1)
	{
		self waittill("5");	
		if(self.isDown == 0)
		{
			self thread protected();
			self notify("gum_gone");
		}
		wait .1;
	}	
}

protected()
{
	self endon("disconnect");
	self.protected = 1;
	self thread Zombievision();
	self thread Zombievision();
	wait 20;
	self.protected = 0;
	self notify("endvision");
}

Zombievision()
{
    boxElem = newClientHudElem(self);
    boxElem.elemType = "bar";
    if(!level.splitScreen)
    {
        boxElem.x = -2;
        boxElem.y = -2;
    }
    boxElem.width = 1000;
    boxElem.height = 1000;
    boxElem.align = "CENTER";
    boxElem.relative = "CENTER";
    boxElem.xOffset = 0;
    boxElem.yOffset = 0;
    boxElem.children = [];
    boxElem.sort = 20;
    boxElem.color = (1,0,0);
    boxElem.alpha = 1;
    boxElem setParent(level.uiParent);
    boxElem setShader("combathigh_overlay", 1000, 1000);
    boxElem.hidden = false;
    boxElem.HideWhenInMenu = true;
    boxElem setPoint("CENTER", "CENTER", 0, 0);
	self waittill_any("death", "disconnect", "endvision");
	boxElem destroy();
}

Firewave()
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	counter = 0;
	while(1)
	{
		self waittill("get_attacked");
		if(self.isDown == 0)
		{
			counter++;
			foreach(zombie in level.zombie)
			{
				wait .1;
				if(isDefined(zombie.hitbox) && Distance(self.origin,zombie.origin) <= 300)
				{
					if(zombie.type == "normal" || zombie.type == "explosive" || zombie.type == "dog")
					{
						zombie thread Zombie_SoulburnTemp();
						zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Death(3);
					}						
				}
			}
			if(counter == 2)
				self notify("gum_gone");
		}
	}	
}

Zombie_SoulburnTemp()
{	
	fire = spawnFX(level.fire_soulburn, self.origin);
	triggerfx(fire);
	wait 3;
	fire delete();			
}

stunzombies(time)
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	self notifyonplayercommand("5","+actionslot 2");
	while(1)
	{
		self waittill("5");	
		if(self.isDown == 0)
		{
			foreach(zombie in level.zombie)
			{
				if(isDefined(zombie.hitbox))
				{
					if(zombie.type == "normal" || zombie.type == "explosive")
						zombie thread stunZombieNow(time);
				}
			}
			self notify("gum_gone");
		}
		wait .1;
	}	
}

stunZombieNow(time)
{
	self endon("zombie_dead");
	level endon("game_over");
	self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("idle");
	self.attract = 1;
	self moveTo(self.origin,1);
	wait time;
	self.attract = 0;
	self thread maps\zm\d_ops_arcade\zombies::Zombie_Mode();
}

randomTeleport()
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	self notifyonplayercommand("5","+actionslot 2");
	counter = 0;
	while(1)
	{
		self waittill("5");	
		if(self.isDown == 0)
		{
			counter++;
			self setOrigin(level.spawns_zombies[randomInt(level.spawns_zombies.size)]);
			if(counter == 2)
				self notify("gum_gone");
		}
		wait .1;
	}	
}

punchcurrentgun()
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	self notifyonplayercommand("5","+actionslot 2");
	while(1)
	{
		self waittill("5");	
		if(self.isDown == 0)
		{
			//weap = self getCurrentWeapon();
			weap = getCorrectUpgrade(self getCurrentWeapon());
			self takeWeapon(weap);
			self giveWeapon(weap,8,true);
			self giveMaxAmmo(weap);
			self.weaponlist[weap] = 1;
			waitFrame();
			self switchToWeapon(weap);
			self notify("gum_gone");
		}
		wait .1;
	}	
}

givePowerup(number,type)
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	self notifyonplayercommand("5","+actionslot 2");
	valid = true;
	counter = 0;
	if(!isDefined(number))
		number = 1;
	while(valid)
	{
		self waittill("5");
		if(self.isDown == 0)
		{
			counter++;
			self thread spawnDrop(type);
			if(counter == number)
				self notify("gum_gone");
		}
		wait .1;
	}	
}

spawnDrop(type)
{
	drop = spawn("script_model", self.origin);
	drop thread maps\zm\d_ops_arcade\zombies::Zombie_Drop(type);
	waitFrame();
	drop notify("zombie_drop");
	waitFrame();
	drop delete();
}

Droprain()
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	self notifyonplayercommand("5","+actionslot 2");
	while(1)
	{
		self waittill("5");	
		if(self.isDown == 0)
		{
			drop_org = [];
			for(i = 0;i < 4;i++)
			{
				drop_org[i] = self getTagOrigin("j_head") + vector_Scal(AnglesToForward(self.angles+(0,randomInt(360),0)),100);
				drop_org[i] = BulletTrace(drop_org[i], drop_org[i]+(0,0,-50), 0, self)["position"];
				drop = spawn("script_model", drop_org[i]);
				drop thread maps\zm\d_ops_arcade\zombies::Zombie_Drop();
				wait .1;
				drop notify("zombie_drop");
				waitFrame();
				drop delete();
				wait 0.5;
			}
			self notify("gum_gone");
		}
		wait .1;
	}	
}

forceEndRound()
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	self notifyonplayercommand("5","+actionslot 2");
	while(1)
	{
		self waittill("5");
		if(self.isDown == 0)
		{
			foreach(zombie in level.zombie)
			{
				if(isDefined(zombie.hitbox))
				{
					zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Death(0);
					wait .5;
				}
			}
			self.score += 1600;
			self notify("gum_gone");
		}
		wait .1;
	}		
}

slowdownZombies()
{
	self endon("disconnect");
	level endon("game_over");
	self endon("gum_gone");
	self notifyonplayercommand("5","+actionslot 2");
	while(1)
	{
		self waittill("5");
		if(self.isDown == 0)
		{
			foreach(zombie in level.zombie)
			{
				if(isDefined(zombie.hitbox))
				{
					zombie.mode = "walk";
					zombie scriptModelPlayAnim("zw2_zombie_walk");
					zombie.speed = .7;
				}
			}
			self notify("gum_gone");
		}
		wait .1;
	}		
}
//////////////// Traps ////////////////

Doortrap(trappos, angle, activatepos1)
{
	if(!isDefined(trappos) || !isDefined(angle) || !isDefined(activatepos1))
		return;
	trap = spawn("script_model", trappos);
	trap.angles = angle;
	trap.inuse = false;
	trap thread DoorTrap_Think(activatepos1);
}

DoorTrap_Think(activatepos1)
{
	while(1)
	{
		wait .25;
		if(self.inuse)
			continue;
		foreach(player in level.players)
		{
			if(Distance(player.origin, activatepos1) <= 100)
			{
				if(player.isDown == 0)
				{
					self thread DoorTrap_Activate(player,activatepos1);
				}
			}
		}
	}
}

DoorTrap_Activate(player,activatepos1)
{
	player notify("doortrap_indistance");
	player endon("doortrap_indistance");
	//player notifyonplayercommand("Trappy", "+activate");
	indist = true;
	cost = getDvarInt("cost_trap");
	while(indist && !self.inuse)
	{
		//player waittill("Trappy");
		if(player usebuttonpressed() && Distance(player.origin, activatepos1) <= 100)
		{
			if(player.isDown == 0)
			{
				if(player.score >= cost)				
					self thread DoorTrap_DoYourFuckingJob(player, cost,activatepos1);
			}
			else
				player iPrintlnBold("You just went down - kek!");
		}
		else
			indist = false;

		wait .1;
	}
}

DoorTrap_DoYourFuckingJob(player, cost,activatepos1)
{
	self.inuse = true;
	player.score -= cost;
	wait 1.5;
	fire = spawnFx(level.fire_flamethrower, self.origin+(0,0,30), AnglesToForward(self.angles+(0,90,0)),self.angles); 
	triggerfx(fire);
	self thread TrapTrace(activatepos1);
	wait 20;
	fire delete();
	self notify("trap_done");
	wait 20;
	self.inuse = false;
}
TrapTrace(activatepos1)
{
	level endon("game_over");
	self endon("trap_done");
	while(1)
	{
		wait .25;
		trace = BulletTrace(self.origin+(0,0,30), AnglesToForward(self.angles+(0,90,0), false, undefined));
		foreach(zombie in level.zombie)
		{
			//if(isDefined(zombie.hitbox) && trace["entity"] == zombie || trace["entity"] == zombie.hitbox)			
			//{
			//	iPrintln("triggered!"); // somehow not working idk
			//}
			if(Distance(zombie.origin,activatepos1) <= 100 && isDefined(zombie.hitbox))
			{
				if(zombie.type == "normal" || zombie.type == "dog")
					zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Death();
			}
		}		
	}
}

////////////////////// Town /////////////////////

deleteTownFx()
{
	foreach ( fx in level.createFXent )
	{
		fx.model delete();
	}
}
handleDoors()
{
	level endon("game_over");
	clipbar = getEnt( "clip1", "targetname" );
	clipbar movez (-130,0.1,0,0);
	clipbar2 = getEnt( "clip2", "targetname" );
	clipbar2 movez (-140,0.1,0,0);
	clipbar3 = getEnt( "clip3", "targetname" );
	clipbar3 movez (-140,0.1,0,0);
	door = [];
	door[0] = spawnStruct();
	door[0].ent = getEnt( "door_bar1", "targetname" );
	door[0].state = "closed";
	door[1] = spawnStruct();
	door[1].ent = getEnt( "door_bar2", "targetname" );
	door[1].state = "closed";
	door[2] = spawnStruct();
	door[2].ent = getEnt( "door_bar3", "targetname" );
	door[2].state = "closed";
	door[3] = spawnStruct();
	door[3].ent = getEnt( "door_bank1", "targetname" );
	door[3].state = "closed";
	door[4] = spawnStruct();
	door[4].ent = getEnt( "door_bank2", "targetname" );
	door[4].state = "closed";
	door[5] = spawnStruct();
	door[5].ent = getEnt( "door_bank3", "targetname" );
	door[5].state = "closed";
	door[6] = spawnStruct();
	door[6].ent = getEnt( "door_house1", "targetname" );
	door[6].state = "closed";
	door[7] = spawnStruct();
	door[7].ent = getEnt( "door_house2", "targetname" );
	door[7].state = "closed";
	while(true)
	{
		wait .1;
		foreach(player in level.players)
		{
			for(i = 0;i < door.size-1;i++)
			{
				if(Distance(player.origin,door[i].ent.origin) <= 130)
				{
					if(door[i].state == "closed")
					{
						door[i] thread closeDoor(i);
						door[i].state = "opened";
						if(i == 0)
							door[i].ent rotateYaw( 120, .7 );						
						else if(i == 1)
							door[i].ent  rotateYaw( -98.5, .7 ); 
						else if(i == 2)
							door[i].ent  rotateYaw( -135, .7 );
						else if(i == 3)
							door[i].ent  rotateYaw( 120, .7 );
						else if(i == 4)
							door[i].ent  rotateYaw( -145, .7 );
						else if(i == 5)
							door[i].ent  rotateYaw( -110, .7 ); 
						else if(i == 6)
							door[i].ent  rotateYaw( 104, .7 );	
						else if(i == 7)								
							door[i].ent  rotateYaw( -130, .7 ); 
					}
				}
			}
		}		
	}			
}
closeDoor(i)
{
	wait 4;
	if(i == 0)
		self.ent  rotateYaw( -120, .7 );
	else if(i == 1)
		self.ent  rotateYaw( 98.5, .7 ); 
	else if(i == 2)
		self.ent  rotateYaw( 135, .7 );
	else if(i == 3)
		self.ent  rotateYaw( -120, .7 );
	else if(i == 4)
		self.ent  rotateYaw( 145, .7 );
	else if(i == 5)
		self.ent  rotateYaw( 110, .7 ); 
	else if(i == 6)
		self.ent  rotateYaw( -104, .7 );	
	else if(i == 7)								
		self.ent  rotateYaw( 130, .7 ); 
	wait .7;
	self.state = "closed";	
}


//following towndoorcodes are deprecated
deleteLowerMsgonDoor(trigger)
{
	near = true;
	while(near)
	{
		wait .5;
		if(Distance(self.origin,trigger.origin) > 50 || !isDefined(trigger))
		{
			near = false;
			self clearLowerMessage("door");
		}
	}
}
door_bar_back()
{
	level endon("bardoor_opened");
	door = getEnt( "door_bar1", "targetname" );
	door2 = getEnt( "door_bar2", "targetname" );
	door3 = getEnt( "door_bar3", "targetname" );
	clipbar = getEnt( "clip1", "targetname" );
	trigger = Spawn( "trigger_radius", door.origin, 0, 50, 200 );
	door3.trigger = trigger;
	door3 makeTeamUsable( "allies" );
    door3 useTriggerRequireLookAt();
	door3 SetCursorHint( "HINT_NOICON" );
    door3 SetHintString("Press ^3&&1 ^7to open the door [^31500$]");
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press [{+activate}] to open the door - [^31500^7]");
		player thread deleteLowerMsgonDoor(trigger);
		team = player.team;
    	if( team == "allies" )
        	isAllies = true;
    	else
        isAllies = false;
    	if( isAllies && player UseButtonPressed() )
    	{
        	if( player.score >= 1500 )
        	{
            	player.score -= 1500;
            	//player thread maps\mp\gametypes\_rank::scorePopup( 0-1500, 0, (1,0,0), 1 );

				door rotateYaw( 120, 1.4 );
				door2 rotateYaw( -98.5, 1.4 ); 
				door3 rotateYaw( -135, 1.4 );
				clipbar movez (-130,0.1,0,0);
				player clearLowerMessage("door");
				trigger delete();
				door makeUnusable();
				door2 makeUnusable();
				door3 makeUnusable();
				level notify("bardoor_opened");
				break;
        	}
			else
            {
                player iPrintln("^1Not enough cash for open door.  [COST: ^31500^1]");
                wait 1;
            }
            
    	}
	}
}
door_bar()
{
	level endon("bardoor_opened");
	door = getEnt( "door_bar1", "targetname" );
	door2 = getEnt( "door_bar2", "targetname" );
	door3 = getEnt( "door_bar3", "targetname" );
	clipbar = getEnt( "clip1", "targetname" );
	trigger = Spawn( "trigger_radius", (door.origin + door2.origin) / 2, 0, 50, 200 );
	door.trigger = trigger;
	door2.trigger = trigger;
	door makeTeamUsable( "allies" );
	door2 makeTeamUsable( "allies" );
	door useTriggerRequireLookAt();
	door2 useTriggerRequireLookAt();
	door SetCursorHint( "HINT_NOICON" );
    door SetHintString("Press ^3&&1 ^7to open the door [^31500$]");
	door2 SetCursorHint( "HINT_NOICON" );
    door2 SetHintString("Press ^3&&1 ^7to open the door [^31500$]");
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press [{+activate}] to open the door - [^31500^7]");
		player thread deleteLowerMsgonDoor(trigger);
		team = player.team;
    	if( team == "allies" )
        	isAllies = true;
    	else
        isAllies = false;
    	if( isAllies && player UseButtonPressed() )
    	{
        	if( player.score >= 1500 )
        	{
            	player.score -= 1500;
            	//player thread maps\mp\gametypes\_rank::scorePopup( 0-1500, 0, (1,0,0), 1 );
				
				door rotateYaw( 120, 1.4 );
				door2 rotateYaw( -98.5, 1.4 ); 
				door3 rotateYaw( -135, 1.4 );
				clipbar movez (-130,0.1,0,0);
				player clearLowerMessage("door");
				trigger delete();
				door makeUnusable();
				door2 makeUnusable();
				door3 makeUnusable();
				level notify("bardoor_opened");
				break;
        	}
			else
            {
                player iPrintln("^1Not enough cash for open door.  [COST: ^31500^1]");
                wait 1;
            }
            
    	}
	}
}
door_bank_back()
{
	level endon("bankdoor_opened");
    door = getEnt( "door_bank1", "targetname" );
    door2 = getEnt( "door_bank2", "targetname" );
    door3 = getEnt( "door_bank3", "targetname" );
    clipbar = getEnt( "clip3", "targetname" );
    trigger = Spawn( "trigger_radius", (door.origin + door2.origin) / 2, 0, 50, 200 );
   	door3.trigger = trigger;
	door3 makeTeamUsable( "allies" );
    door3 useTriggerRequireLookAt();
	door3 SetCursorHint( "HINT_NOICON" );
    door3 SetHintString("Press ^3&&1 ^7to open the door [^32000$]");   
	for(;;)
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press [{+activate}] to open the door - [^32000^7]");
		player thread deleteLowerMsgonDoor(trigger);
		team = player.team;
    	if( team == "allies" )
        	isAllies = true;
    	else
        isAllies = false;
    	if( isAllies && player UseButtonPressed() )
    	{
        	if( player.score >= 2000 )
        	{
            	player.score -= 2000;
            	//player thread maps\mp\gametypes\_rank::scorePopup( 0-2000, 0, (1,0,0), 1 );
				
				door rotateYaw( 120, 1.4 );
    			door2 rotateYaw( -145, 1.4 );
    			door3 rotateYaw( -110, 1.4 ); 
    			clipbar movez (-140,0.1,0,0);			
				trigger delete();
				player clearLowerMessage("door");
				door makeUnusable();
				door2 makeUnusable();
				door3 makeUnusable();
				level notify("bankdoor_opened");
				break;
        	}
			else
            {
                player iPrintln("^1Not enough cash to open door.  [COST: ^32000^1]");
                wait 1;
            }
            
    	}
	}
}
door_bank()
{
	level endon("bankdoor_opened");
    door = getEnt( "door_bank1", "targetname" );
    door2 = getEnt( "door_bank2", "targetname" );
    door3 = getEnt( "door_bank3", "targetname" );
    clipbar = getEnt( "clip3", "targetname" );
    trigger = Spawn( "trigger_radius", door3.origin, 0, 50, 200 );
   	door.trigger = trigger;
	door2.trigger = trigger;
	door makeTeamUsable( "allies" );
	door2 makeTeamUsable( "allies" );
	door useTriggerRequireLookAt();
	door2 useTriggerRequireLookAt();
	door SetCursorHint( "HINT_NOICON" );
    door SetHintString("Press ^3&&1 ^7to open the door [^32000$^7]");
	door2 SetCursorHint( "HINT_NOICON" );
    door2 SetHintString("Press ^3&&1 ^7to open the door [^32000$^7]");
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press [{+activate}] to open the door - [^32000^7]");
		player thread deleteLowerMsgonDoor(trigger);
		team = player.team;
    	if( team == "allies" )
        	isAllies = true;
    	else
        isAllies = false;
    	if( isAllies && player UseButtonPressed() )
    	{
        	if( player.score >= 2000 )
        	{
            	player.score -= 2000;
            	//player thread maps\mp\gametypes\_rank::scorePopup( 0-2000, 0, (1,0,0), 1 );
				
				door rotateYaw( 120, 1.4 );
    			door2 rotateYaw( -145, 1.4 );
    			door3 rotateYaw( -110, 1.4 ); 
    			clipbar movez (-140,0.1,0,0);
				player clearLowerMessage("door");
				trigger delete();
				door makeUnusable();
				door2 makeUnusable();
				door3 makeUnusable();
				level notify("bankdoor_opened");
				break;
        	}
			else
            {
                player iPrintln("^1Not enough cash to open door.  [COST: ^32000^1]");
                wait 1;
            }
            
    	}
	}
}
door_house()
{
    door = getEnt( "door_house1", "targetname" );
    door2 = getEnt( "door_house2", "targetname" );
    clipbar = getEnt( "clip2", "targetname" );
    trigger = Spawn( "trigger_radius", (door.origin + door2.origin) / 2, 0, 50, 200 );
   	door.trigger = trigger;
	door2.trigger = trigger;
	door makeTeamUsable( "allies" );
	door2 makeTeamUsable( "allies" );
	door useTriggerRequireLookAt();
	door2 useTriggerRequireLookAt();
	door SetCursorHint( "HINT_NOICON" );
    door SetHintString("Press ^3&&1 ^7to open the door [^32000$]");
	door2 SetCursorHint( "HINT_NOICON" );
    door2 SetHintString("Press ^3&&1 ^7to open the door [^32000$]");  
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press [{+activate}] to open the door - [^32000^7]"); 
		player thread deleteLowerMsgonDoor(trigger);
		team = player.team;
    	if( team == "allies" )
        	isAllies = true;
    	else
			isAllies = false;
    	if( isAllies && player UseButtonPressed() )
    	{
        	if( player.score >= 2000 )
        	{
            	player.score -= 2000;
            	//player thread maps\mp\gametypes\_rank::scorePopup( 0-2000, 0, (1,0,0), 1 );
				
				trigger waittill( "trigger");
    			door rotateYaw( 104, 1.4 );
    			door2 rotateYaw( -130, 1.4 ); 
    			clipbar movez (-130,0.1,0,0);
				player clearLowerMessage("door");
				trigger delete();
				door makeUnusable();
				door2 makeUnusable();
				break;
        	}
            else
            {
                player iPrintln("^1Not enough cash to open door.  [COST: ^32000^1]");
                wait 1;
            }
    	}
	}
}
CreateAirplaneFly(start,pos1,pos2,pos3,pos4,angle)
{
	level.plane_started = false;
	level.plane_starts = false;
	level.planeindex = 0;
	level.planear = [];
	level.planear[0] = pos1;
	level.planear[1] = pos2;
	level.planear[2] = pos3;
	level.planear[3] = pos4;
	while(1)
	{
		wait .25;
		if(level.plane_starts)
		{
			wait 60;
			level.plane_starts = false;
		}
		else
		{
			foreach(player in level.players)
			{
				if(Distance(player.origin,start) <= 100 && player.isDown == 0 && level.planeindex < 3 && !level.plane_started)
				{
					player thread hitBeamKey(start);
				}
			}
		}	
	}
}

hitBeamKey(start)
{
	self notify("hitBeamKey");
	self endon("hitBeamKey");
	//self notifyonplayercommand("pressAirplaneButton", "+activate");
	self thread planeHUD(start);
	for(;;)
	{
		//self waittill("pressAirplaneButton");
		if(self usebuttonpressed() && Distance(start, self.origin) <= 100)
		{
			if(!level.plane_starts)
				thread PlaneStartsSoon();
			self.protected = 1;	
			stuck = spawn("script_model", level.planear[level.planeindex]);
			self setOrigin(level.planear[level.planeindex]);
			self enablelinkto();
			self playerlinkto(stuck);
			level.planeindex++;
			self notify("hitBeamKey");
		}
		else
			self notify("hitBeamKey");
		
		wait .1;
	}
}

planeHUD(start)
{
	self notify("planeHUD");
	self endon("planeHUD");
	izzzzda = true;
	self setLowerMessage("airplane", "Press [{+activate}] to fly with the airplane!");
	while(izzzzda)
	{
		wait .2;
		if(Distance(start,self.origin) > 100)
		{
			self clearLowerMessage("airplane");
			izzzzda = false;
		}
	}
}
PlaneStartsSoon()
{
	level.plane_starts = true;
	wait 10;
	iPrintln("^2GO!");
	level.plane_started = true;
	// go
}
Lava()
{
	thread spawnLava();
	pos1 = (-70.8453, 663.197, -6.82397);
	pos2 = (-21.9009, 66.3761, -20.9351);
	while(1)
	{
		wait .5;
		foreach(player in level.players)
		{
			if(Distance(player.origin,pos1) <= 180)
			{
				if(player.origin[2] - pos1[2] < 20)
				{
					if(player.isDown == 0)
						player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( player, player, 10, 0, "MOD_EXPLOSIVE", "none", player.origin, player.origin, "none", 0, 0 );			
				}
			}
			if(Distance(player.origin,pos2) <= 180)
			{
				if(player.origin[2] - pos2[2] < 20)
				{
					if(player.isDown == 0)
						player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( player, player, 10, 0, "MOD_EXPLOSIVE", "none", player.origin, player.origin, "none", 0, 0 );			
				}
			}
		}
		foreach(zombie in level.zombie)
		{
			if(Distance(zombie.origin, pos1) <= 180 || Distance(zombie.origin, pos2) <= 180)
			{
				if(!zombie.burn && isDefined(zombie.hitbox))
				{
					zombie thread maps\zm\d_ops_arcade\zombies::Zombie_BurnDamage();
					zombie.burn = true;
				}			
			}
		}
	}
}
spawnLava()
{
	wait 8;	
	//playFx(level.bloodfountain,(-76.1796, 651.014, -25.875));
	//playFx(level.bloodfountain,(1720.27, -23.1608, -67.2696));
	playFx(level.bloodlake,(73.679, -40.1434, -25.875));
	playFx(level.bloodlake,(-99.4245, 72.4602, -25.875));
	playFx(level.bloodlake,(-137.154, 644.888, -25.875));	
	playFx(level.bloodlake,(24.1839, 718.88, -25.875));/*
	thread prooveLava((-370.568, 37.2417, -25.875));
	thread prooveLava((-668.508, -152.517, -25.875));
	thread prooveLava((-1003.38, -1.3908, -25.875));
	thread prooveLava((153.147, -512.893, -25.875));
	thread prooveLava((-144.015, -891.399, -25.875));
	thread prooveLava((138.382, 352.124, -25.875));
	thread prooveLava((990.437, -103.108, -25.875));
	thread prooveLava((1618.22, -32.03, -66.446));
	thread prooveLava((159.749, 961.38, -25.875));
	thread prooveLava((241.117, 1203.65, -25.875));
	thread prooveLava((468.862, 1362.41, -25.875));
	thread prooveLava((-18.086, 1131.95, -25.875));
	thread prooveLava((-84.0397, 1383.19, -25.875));
	thread prooveLava((237.617, 210.454, -25.875));
	thread prooveLava((-76.1796, 651.014, -25.875),true);
	thread prooveLava((1720.27, -23.1608, -67.2696),true);*/
}
prooveLava(pos,fountain)
{
	if(!isDefined(fountain))
		fountain = false;
	while(1)
	{
		wait .5;
		foreach(player in level.players)
		{
			if(Distance(pos,player.origin) <= 450)
			{
				thread showLava(pos,fountain);
				continue;
			}
		}
	}
}
showLava(pos,fountain)
{
	if(fountain)
		lava = spawnFx(level.bloodfountain, pos);
	else
		lava = spawnFx(level.bloodlake, pos);
	triggerfx(lava);
	wait 0.98;
	lava delete();
}
deleteFire()
{
	wait 10;
	ent = GetEnt( undefined, "targetname" );
	for(i = 0;i < ent.size;i++)
	{
		iPrintln(ent[i].targetname);
		
		waitFrame();
	}
	while(1)
	{
		iPrintln(ent.targetname);
		waitFrame();
	}

	/*
	ents = getEntArray();
    for ( index = 0; index < ents.size; index++ ) 
    {
		if(isSubStr(ents[index].targetname, "barrel_fireFX_origin"))
		{
			ents[index] delete();
		}			
	}
	*/
}
sinkBusInLava() // not used, brush still intact
{
	self giveWeapon(level.raygunm2);
	self switchToWeapon(level.raygunm2);
	wait 3;
	self dropitem(self getCurrentWeapon());
	wait 2;
	self playlocalsound("UK_1mc_arena");
	bus = getEnt( "bobbing", "targetname" );
	bus moveTo(bus.origin+(0,0,150),3);
	//bus MoveGravity( (randomInt(50),randomInt(50),500), 5 );
	lava = [];
	lava[0] = spawnFx(level.bloodfountain, (26.679, -85.067, -25.875));
	lava[1] = spawnFx(level.bloodfountain, (73.7733, 8.68183, -25.875));
	lava[2] = spawnFx(level.bloodfountain, (98.3723, 60.3686, -25.875));
	lava[3] = spawnFx(level.bloodfountain,(-73.9526, 110.915, -25.875));
	lava[4] = spawnFx(level.bloodfountain,(-126.395, 0.445853, -25.875));
	lava[5] = spawnFx(level.bloodfountain,(-117.528, -88.2454, -10.3731));
	foreach(fx in lava)
		triggerfx(fx);
	wait 3;
	foreach(fx in lava)
		fx delete();
	wait 2;
	//bus unlink();
	//bus PhysicsLaunchServer( (0,0,-150), (randomInt(5),randomInt(5),randomInt(5)) );
	bus MoveGravity( (randomInt(50),randomInt(50),-100), 5 );
	wait .3;
	lava = [];
	lava[0] = spawnFx(level.bloodfountain, (26.679, -85.067, -25.875));
	lava[1] = spawnFx(level.bloodfountain, (73.7733, 8.68183, -25.875));
	lava[2] = spawnFx(level.bloodfountain, (98.3723, 60.3686, -25.875));
	lava[3] = spawnFx(level.bloodfountain,(-73.9526, 110.915, -25.875));
	lava[4] = spawnFx(level.bloodfountain,(-126.395, 0.445853, -25.875));
	lava[5] = spawnFx(level.bloodfountain,(-117.528, -88.2454, -10.3731));
	foreach(fx in lava)
		triggerfx(fx);
	wait 1;
	foreach(fx in lava)
		fx delete();
	
	/*
	brush = getEnt("rotate", "targetname");
	//brush moveTo(brush.origin+(0,0,-300), 10);
	brush movez(-160,0.1,0,0);
	brush notSolid();
	bus notSolid();
	brush delete();
	wait 10;
	bus delete();
	*/
	
}

secretEntrance2()
{
	level endon("secretEntrance");
	door = spawn("script_model", (-967.952, -381.422, 112.521));
    trigger = Spawn( "trigger_radius", door.origin, 0, 50, 200 );
   	door.trigger = trigger;
	door makeTeamUsable( "allies" );
	door useTriggerRequireLookAt();
	door SetCursorHint( "HINT_NOICON" );
    door SetHintString("Press [{+activate}] to open secret entrance! - [^32000^7]");
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press [{+activate}] to open secret entrance! - [^32000^7]");
		player thread deleteLowerMsgonDoor(trigger);
		if(player.team == "allies" && player UseButtonPressed())
    	{
        	if(player.score >= 2000 )
			{
				player.score -= 2000;
				ents = getentarray();
				foreach(ent in ents)
				{
					if(Distance(ent.origin,(-967.952, -381.422, 112.521)) <= 200)
					{
						if(ent.targetname != "zombie")
							ent moveto(self.origin+(0,0,200),3);
					}
				}
				trigger delete();
				door delete();
				player clearLowerMessage("door");					
				level notify("secretEntrance");
			}	
		}		
	}	
}
secretEntrance()
{
	level endon("secretEntrance");
	door = spawn("script_model", (-967.952, -381.422, 112.521));
	while(true)
	{
		wait .25;
		foreach(player in level.players)
		{
			if(Distance(player.origin, door.origin) <= 100 && player.isDown == 0)
			{
				player thread pressEntranceButton((-967.952, -381.422, 112.521),door);
				
			}
		}
	}
}

pressEntranceButton(pos,door)
{
	level endon("secretEntrance");
	self notify("pressEntranceButton");
	self endon("pressEntranceButton");
	//self notifyOnPlayerCommand("Secret", "+activate");
	self thread EntranceHud(pos, door);
	//self waittill("Secret");
	if(self usebuttonpressed() && Distance(pos, self.origin) <= 100 && self.isDown == 0)
	{
		if(self.score >= 2000)
		{
			self.score -= 2000;
			door delete();	
			ents = getentarray();
			foreach(ent in ents)
			{
				if(Distance(ent.origin,(-989.374, -400.978, 112.981)) <= 200)
				{
					if(ent.targetname != "zombie")
						ent thread entmovedown();					
				}
			}
			level notify("secretEntrance");
		}
		else
			self iPrintln("^1Not enough cash!");

		wait .1;
	}
}
entmovedown()
{
	//iPrintln("working");
	self moveto(self.origin+(0,0,-200),3);
	wait 3;
	self delete();
}
EntranceHud(pos,door)
{
	self endon("pressEntranceButton");
	self clearLowerMessage("secretEntrance");
	self setLowerMessage("secretEntrance", "Press [{+activate}] to open the secret door! - [^32000^7]");
	while(true)
	{
		wait .2;
		if(!isDefined(door) || Distance(pos, self.origin) > 100 || self.isDown == 1)
		{
			self clearLowerMessage("secretEntrance");
			break;
		}
	}
}
// (-2182.45, 6405.59, 2776.13)
// (-2739.87, 6761.41, 3216.13)
createTeleporter(pos1,pos2,time,price)
{
	if(!isDefined(price))
		price = 1500;
	door = spawn("script_model", pos1);
    trigger = Spawn( "trigger_radius", door.origin, 0, 50, 200 );
   	door.trigger = trigger;
	door makeTeamUsable( "allies" );
	door useTriggerRequireLookAt();
	door SetCursorHint( "HINT_NOICON" );
    door SetHintString("Press [{+activate}] to teleport - [^3" + price + "^7]");
	thread TeleFx(pos1);
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press [{+activate}] to teleport! - [^3" + price + "^7]");
		player thread deleteLowerMsgonDoor(trigger);
		if(player.team == "allies" && player UseButtonPressed())
    	{
        	if(player.score >= price )
			{
				player.score -= price;
				player thread doBeam(pos1,pos2,time);
				player clearLowerMessage("door");					
			}	
		}		
	}	
}
TeleFx(pos1)
{
	wait 10;
	playFx(level.energybulb,pos1+(0,0,40));
}
doBeam(pos1,pos2,time)
{
	self setOrigin(pos2);
	if(isDefined(time))
		self.protected = 1;
	wait 2;
	thread locatePos((-2739.87, 6761.41, 3216.13));
	if(isDefined(time))
	{
		self.papcountdown = self createFontString( "Objective", 1.5 );
		self.papcountdown setPoint( "CENTER", "CENTER", 0, 100 );
		self.papcountdown setText("Time left:");
		self.papcountdown.value = self createFontString( "Objective", 1.5 );
		self.papcountdown.value setPoint( "CENTER", "CENTER", 60, 100 );
		if(!isDefined(time))
			time = 30;
		v = true;
		while(v)
		{
			self.papcountdown.value setValue(time);
			wait 1;
			time--;
			if(time == 0)
				v = false;
		}	
		self setOrigin(pos1);
		self.papcountdown.value destroy();
		self.papcountdown destroy();
		wait 3;
		self.protected = 0;
		level notify("newPlayerAvailable");
	}
}
getPerkName()
{
	i = randomInt(level.meteorname.size-1);
	name = level.meteorname[i];
	level.meteorname[i] = level.meteorname[level.meteorname.size-1];
	level.meteorname[level.meteorname.size-1] delete();
	return name;
}
CreateMeteorPerks(o1,a1,o2,a2,o3,a3,o4,a4,o5,a5)
{
	level.meteorname = [];
	level.meteorname[0] = "QuickRevive";
	level.meteorname[1] = "Juggernog";
	level.meteorname[2] = "SpeedCola";
	level.meteorname[3] = "DoubleTap";
	level.meteorname[4] = "StaminUp";		
	meteor = [];
	spawned = 0;
	all = 0;
	current = 0;
	if(isDefined(o1))
	{
		meteor[0] = spawnStruct();
		meteor[0].origin = o1;
		meteor[0].angles = a1;
		meteor[0].name = "QuickRevive";
		all++;
	}
	if(isDefined(o2))
	{
		meteor[1] = spawnStruct();
		meteor[1].origin = o2;
		meteor[1].angles = a2;
		meteor[1].name = "Juggernog";
		all++;
	}
	if(isDefined(o3))
	{
		meteor[2] = spawnStruct();
		meteor[2].origin = o3;
		meteor[2].angles = a3;
		meteor[2].name = "DoubleTap";
		all++;
	}
	if(isDefined(o4))
	{
		meteor[3] = spawnStruct();
		meteor[3].origin = o4;
		meteor[3].angles = a4;
		meteor[3].name = "SpeedCola";
		all++;
	}
	if(isDefined(o5))
	{
		meteor[4] = spawnStruct();
		meteor[4].origin = o5;
		meteor[4].angles = a5;
		meteor[4].name = "StaminUp";
		all++;
	}
	wait 10;
	for(h = 0;h < level.meteorname.size;h++)
	{
		//level waittill("zombie_dead");
		wait 1;
		current++;
		//current = 100;
		if(current == 100)
		{
			i = randomInt(meteor.size-1);
			rocket = spawn("script_model", (0,0,5000));
			rocket playSound("flag_spawned");
			rocket thread RocketFx();
			rocket moveTo(meteor[i].origin, 5);
			rocket thread CreateMeteorPerk(meteor[i].name, meteor[i]);
			//meteor = newMeteorAr(meteor,i);
			current = 0;
		}
		else	
			h --;
	}
}
newMeteorAr(meteor,j)
{
	/*
	meteor[i] = meteor[meteor.size-1];
	meteor[meteor.size-1] delete();
	return meteor;
	*/
	ar = [];
	for(i = 0;i < meteor.size-2;i++)
	{
		if(i != j)
			ar[i] = meteor[i];
		else
			ar[i] = meteor[meteor.size-1];
	}
	return ar;
}
CreateMeteorPerk(name,meteorperk)
{
	wait 5.5;
	Earthquake( 0.8, 2, self.origin, 1000 );
	self delete();
	CreatePerk(name, meteorperk.origin,meteorperk.angles);
}
RocketFx()
{
	for(i = 0;i < 25;i++)
	{
		playFx(level.area_explosion, self.origin);
		wait .2;
	}
}
///////////// Airfight //////////////

FlyAround(isHeli)
{
	while(true)
	{
		a = randomInt(3000);
		b = randomInt(3000);
		c = randomInt(3000);
		if(cointoss())
			a *= -1;
		if(cointoss())
			b *= -1;	
		if(cointoss())
			c *= -1;	
		if(cointoss())	
			a += self.origin[0];
		else
			a -= self.origin[0];
		if(cointoss())
			b += self.origin[1];	
		else
			b -= self.origin[1];	
		if(cointoss())
			c += self.origin[2];
		else
			c -= self.origin[2];	
		if(c < (level.spawns_humans[0][2] + 3000))
			c = 3000;
		pos = (a,b,c);
		if(!isHeli)
		{
			self moveTo(pos,distance(self.origin, pos) / 700);
			movetoLoc = VectorToAngles(self.origin - pos );	
			self RotateTo((0,movetoLoc[1] + 90,0), 3);	
			wait distance(self.origin, pos) / 700;
		}
		else
		{
			self setVehGoalPos(pos+(a, b, c),1);
			wait 10;
		}		
	}
}
////////////// CreateCloudBank /////////////////

CreateCloudBank()
{
	if(getDvarInt("foggy") == 1 && level.script != "mp_bsf_dead_night")
		thread CreatePeriodCloudBank();
}
CreatePeriodCloudBank(time)
{
	wait 5;
	fx = [];
	size = 0;
	forbidden = [];
	if(isDefined(time))
		wait time;
	else
		wait (60+randomInt(60));
	foreach(player in level.players)
	{
		for(i = 0;i < level.spawns_zombies.size-1;i++)
		{
			if(Distance(level.spawns_zombies[i], player.origin) < 700)
			{
				isForbidden = false;
				for(j = 0; j < forbidden.size-1;j++)
				{
					if(level.spawns_zombies[i] == forbidden[j])
					{
						isForbidden = true;
						break;
					}
				}
				if(!isForbidden)
				{
					fx[size] = spawnFx(level.cloudbank, level.spawns_zombies[i]);
					triggerFx(fx[size]);
					forbidden[size] = level.spawns_zombies[i];
					size++;
				}			
			}
		}
	}
	wait 40;
	foreach(fog in fx)
	{
		fog delete();
	}
	thread CreatePeriodCloudBank(time);
}
CreatePeriodCloudBank_Old(time)
{
	wait 5;
	fx = [];
	while(true)
	{
		i = 0;
		h = 0;
		if(!isDefined(time))
		{
			time = 60;
			time += randomInt(30);
		}		
		wait time;
		foreach(pos in level.spawns_zombies)
		{
			h++;
			if(h == 2)
			{
				fx[i] = spawnFx(level.cloudbank, pos);
				triggerfx(fx[i]);
				i++;
				h = 0;
			}
			
		}
		wait randomInt(30)+10;
		for(j = 0;j < fx.size-1;j++)
		{
			fx[j] delete();
		}
		wait time;
	}
}

destroy_on_end_game()
{
    level waittill_any("game_over");
    
    if(isdefined(self))
        self destroy();
}
