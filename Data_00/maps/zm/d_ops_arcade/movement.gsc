#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\d_ops_arcade\utilities;

Init()
{
	level.waypoints = [];
	if(level.script == "mp_afghan")
	{
		level.waypoints[0] = spawnstruct();
		level.waypoints[0].origin = (-357.609, -730.935, -131.58); 
		level.waypoints[0].number = 0; 
		level.waypoints[0].children_size = 3; 
		level.waypoints[0].children = []; 
		level.waypoints[0].children[0] = 4; 
		level.waypoints[0].children[1] = 1; 
		level.waypoints[0].children[2] = 87; 
		level.waypoints[1] = spawnstruct();
		level.waypoints[1].origin = (25.4578, -114.817, 1.33039); 
		level.waypoints[1].number = 1; 
		level.waypoints[1].children_size = 3; 
		level.waypoints[1].children = []; 
		level.waypoints[1].children[0] = 0; 
		level.waypoints[1].children[1] = 87; 
		level.waypoints[1].children[2] = 78; 
		level.waypoints[2] = spawnstruct();
		level.waypoints[2].origin = (481.191, 75.4835, -17.5965); 
		level.waypoints[2].number = 2; 
		level.waypoints[2].children_size = 2; 
		level.waypoints[2].children = []; 
		level.waypoints[2].children[0] = 3; 
		level.waypoints[2].children[1] = 87; 
		level.waypoints[3] = spawnstruct();
		level.waypoints[3].origin = (620.363, -337.277, 42.2857); 
		level.waypoints[3].number = 3; 
		level.waypoints[3].children_size = 3; 
		level.waypoints[3].children = []; 
		level.waypoints[3].children[0] = 5; 
		level.waypoints[3].children[1] = 2; 
		level.waypoints[3].children[2] = 4; 
		level.waypoints[4] = spawnstruct();
		level.waypoints[4].origin = (213.89, -552.958, -10.3767); 
		level.waypoints[4].number = 4; 
		level.waypoints[4].children_size = 2; 
		level.waypoints[4].children = []; 
		level.waypoints[4].children[0] = 3; 
		level.waypoints[4].children[1] = 0; 
		level.waypoints[5] = spawnstruct();
		level.waypoints[5].origin = (1492.47, -186.389, 128.545); 
		level.waypoints[5].number = 5; 
		level.waypoints[5].children_size = 3; 
		level.waypoints[5].children = []; 
		level.waypoints[5].children[0] = 6; 
		level.waypoints[5].children[1] = 16; 
		level.waypoints[5].children[2] = 3; 
		level.waypoints[6] = spawnstruct();
		level.waypoints[6].origin = (1789.18, -145.351, 136.125); 
		level.waypoints[6].number = 6; 
		level.waypoints[6].children_size = 2; 
		level.waypoints[6].children = []; 
		level.waypoints[6].children[0] = 7; 
		level.waypoints[6].children[1] = 5; 
		level.waypoints[7] = spawnstruct();
		level.waypoints[7].origin = (1965.78, 8.43251, 136.125); 
		level.waypoints[7].number = 7; 
		level.waypoints[7].children_size = 2; 
		level.waypoints[7].children = []; 
		level.waypoints[7].children[0] = 8; 
		level.waypoints[7].children[1] = 6; 
		level.waypoints[8] = spawnstruct();
		level.waypoints[8].origin = (2276.01, -87.8973, 136.125); 
		level.waypoints[8].number = 8; 
		level.waypoints[8].children_size = 2; 
		level.waypoints[8].children = []; 
		level.waypoints[8].children[0] = 9; 
		level.waypoints[8].children[1] = 7; 
		level.waypoints[9] = spawnstruct();
		level.waypoints[9].origin = (3124.79, 37.4607, 136.559); 
		level.waypoints[9].number = 9; 
		level.waypoints[9].children_size = 3; 
		level.waypoints[9].children = []; 
		level.waypoints[9].children[0] = 10; 
		level.waypoints[9].children[1] = 12; 
		level.waypoints[9].children[2] = 8; 
		level.waypoints[10] = spawnstruct();
		level.waypoints[10].origin = (3498.15, -72.1467, 157.274); 
		level.waypoints[10].number = 10; 
		level.waypoints[10].children_size = 2; 
		level.waypoints[10].children = []; 
		level.waypoints[10].children[0] = 11; 
		level.waypoints[10].children[1] = 9; 
		level.waypoints[11] = spawnstruct();
		level.waypoints[11].origin = (3700.18, 1189.86, 93.4963); 
		level.waypoints[11].number = 11; 
		level.waypoints[11].children_size = 3; 
		level.waypoints[11].children = []; 
		level.waypoints[11].children[0] = 12; 
		level.waypoints[11].children[1] = 86; 
		level.waypoints[11].children[2] = 10; 
		level.waypoints[12] = spawnstruct();
		level.waypoints[12].origin = (3062.84, 1126.06, 64.1244); 
		level.waypoints[12].number = 12; 
		level.waypoints[12].children_size = 5; 
		level.waypoints[12].children = []; 
		level.waypoints[12].children[0] = 45; 
		level.waypoints[12].children[1] = 11; 
		level.waypoints[12].children[2] = 9; 
		level.waypoints[12].children[3] = 13; 
		level.waypoints[12].children[4] = 14; 
		level.waypoints[13] = spawnstruct();
		level.waypoints[13].origin = (2793.39, 787.874, 200.125); 
		level.waypoints[13].number = 13; 
		level.waypoints[13].children_size = 1; 
		level.waypoints[13].children = []; 
		level.waypoints[13].children[0] = 12; 
		level.waypoints[14] = spawnstruct();
		level.waypoints[14].origin = (2455.29, 1323.28, 17.5501); 
		level.waypoints[14].number = 14; 
		level.waypoints[14].children_size = 4; 
		level.waypoints[14].children = []; 
		level.waypoints[14].children[0] = 12; 
		level.waypoints[14].children[1] = 24; 
		level.waypoints[14].children[2] = 18; 
		level.waypoints[14].children[3] = 15; 
		level.waypoints[15] = spawnstruct();
		level.waypoints[15].origin = (2386.11, 463.018, 64.0143); 
		level.waypoints[15].number = 15; 
		level.waypoints[15].children_size = 3; 
		level.waypoints[15].children = []; 
		level.waypoints[15].children[0] = 16; 
		level.waypoints[15].children[1] = 18; 
		level.waypoints[15].children[2] = 14; 
		level.waypoints[16] = spawnstruct();
		level.waypoints[16].origin = (1367.48, 210.674, -3.53825); 
		level.waypoints[16].number = 16; 
		level.waypoints[16].children_size = 4; 
		level.waypoints[16].children = []; 
		level.waypoints[16].children[0] = 17; 
		level.waypoints[16].children[1] = 15; 
		level.waypoints[16].children[2] = 5; 
		level.waypoints[16].children[3] = 88; 
		level.waypoints[17] = spawnstruct();
		level.waypoints[17].origin = (1530.33, 1130.54, 41.1104); 
		level.waypoints[17].number = 17; 
		level.waypoints[17].children_size = 4; 
		level.waypoints[17].children = []; 
		level.waypoints[17].children[0] = 21; 
		level.waypoints[17].children[1] = 20; 
		level.waypoints[17].children[2] = 16; 
		level.waypoints[17].children[3] = 19; 
		level.waypoints[18] = spawnstruct();
		level.waypoints[18].origin = (2179.44, 766.73, 34.9293); 
		level.waypoints[18].number = 18; 
		level.waypoints[18].children_size = 3; 
		level.waypoints[18].children = []; 
		level.waypoints[18].children[0] = 15; 
		level.waypoints[18].children[1] = 19; 
		level.waypoints[18].children[2] = 14; 
		level.waypoints[19] = spawnstruct();
		level.waypoints[19].origin = (1915.6, 1103.28, 90.111); 
		level.waypoints[19].number = 19; 
		level.waypoints[19].children_size = 4; 
		level.waypoints[19].children = []; 
		level.waypoints[19].children[0] = 84; 
		level.waypoints[19].children[1] = 20; 
		level.waypoints[19].children[2] = 18; 
		level.waypoints[19].children[3] = 17; 
		level.waypoints[20] = spawnstruct();
		level.waypoints[20].origin = (1778.94, 896.194, 53.0449); 
		level.waypoints[20].number = 20; 
		level.waypoints[20].children_size = 2; 
		level.waypoints[20].children = []; 
		level.waypoints[20].children[0] = 19; 
		level.waypoints[20].children[1] = 17; 
		level.waypoints[21] = spawnstruct();
		level.waypoints[21].origin = (1432.76, 1508.97, 61.5985); 
		level.waypoints[21].number = 21; 
		level.waypoints[21].children_size = 4; 
		level.waypoints[21].children = []; 
		level.waypoints[21].children[0] = 56; 
		level.waypoints[21].children[1] = 17; 
		level.waypoints[21].children[2] = 22; 
		level.waypoints[21].children[3] = 33; 
		level.waypoints[22] = spawnstruct();
		level.waypoints[22].origin = (2084.14, 1616.57, -6.06446); 
		level.waypoints[22].number = 22; 
		level.waypoints[22].children_size = 4; 
		level.waypoints[22].children = []; 
		level.waypoints[22].children[0] = 21; 
		level.waypoints[22].children[1] = 85; 
		level.waypoints[22].children[2] = 23; 
		level.waypoints[22].children[3] = 24; 
		level.waypoints[23] = spawnstruct();
		level.waypoints[23].origin = (2454.65, 1777.21, 90.3247); 
		level.waypoints[23].number = 23; 
		level.waypoints[23].children_size = 3; 
		level.waypoints[23].children = []; 
		level.waypoints[23].children[0] = 31; 
		level.waypoints[23].children[1] = 24; 
		level.waypoints[23].children[2] = 22; 
		level.waypoints[24] = spawnstruct();
		level.waypoints[24].origin = (2287.4, 1410.87, 33.4564); 
		level.waypoints[24].number = 24; 
		level.waypoints[24].children_size = 4; 
		level.waypoints[24].children = []; 
		level.waypoints[24].children[0] = 14; 
		level.waypoints[24].children[1] = 23; 
		level.waypoints[24].children[2] = 22; 
		level.waypoints[24].children[3] = 26; 
		level.waypoints[25] = spawnstruct();
		level.waypoints[25].origin = (2231.32, 1242.86, 172.186); 
		level.waypoints[25].number = 25; 
		level.waypoints[25].children_size = 2; 
		level.waypoints[25].children = []; 
		level.waypoints[25].children[0] = 26; 
		level.waypoints[25].children[1] = 27; 
		level.waypoints[26] = spawnstruct();
		level.waypoints[26].origin = (2298.22, 1349.73, 118.073); 
		level.waypoints[26].number = 26; 
		level.waypoints[26].children_size = 2; 
		level.waypoints[26].children = []; 
		level.waypoints[26].children[0] = 24; 
		level.waypoints[26].children[1] = 25; 
		level.waypoints[27] = spawnstruct();
		level.waypoints[27].origin = (1975.33, 1315.32, 247.534); 
		level.waypoints[27].number = 27; 
		level.waypoints[27].children_size = 2; 
		level.waypoints[27].children = []; 
		level.waypoints[27].children[0] = 25; 
		level.waypoints[27].children[1] = 28; 
		level.waypoints[28] = spawnstruct();
		level.waypoints[28].origin = (1700.69, 1407.74, 325.945); 
		level.waypoints[28].number = 28; 
		level.waypoints[28].children_size = 2; 
		level.waypoints[28].children = []; 
		level.waypoints[28].children[0] = 27; 
		level.waypoints[28].children[1] = 29; 
		level.waypoints[29] = spawnstruct();
		level.waypoints[29].origin = (1430.1, 1497.47, 402.126); 
		level.waypoints[29].number = 29; 
		level.waypoints[29].children_size = 1; 
		level.waypoints[29].children = []; 
		level.waypoints[29].children[0] = 28; 
		level.waypoints[30] = spawnstruct();
		level.waypoints[30].origin = (1963.39, 2424.45, -0.928275); 
		level.waypoints[30].number = 30; 
		level.waypoints[30].children_size = 2; 
		level.waypoints[30].children = []; 
		level.waypoints[30].children[0] = 33; 
		level.waypoints[30].children[1] = 31; 
		level.waypoints[31] = spawnstruct();
		level.waypoints[31].origin = (2137.69, 2242.44, 59.5758); 
		level.waypoints[31].number = 31; 
		level.waypoints[31].children_size = 4; 
		level.waypoints[31].children = []; 
		level.waypoints[31].children[0] = 30; 
		level.waypoints[31].children[1] = 32; 
		level.waypoints[31].children[2] = 23; 
		level.waypoints[31].children[3] = 38; 
		level.waypoints[32] = spawnstruct();
		level.waypoints[32].origin = (2007.13, 1970.48, 130.883); 
		level.waypoints[32].number = 32; 
		level.waypoints[32].children_size = 2; 
		level.waypoints[32].children = []; 
		level.waypoints[32].children[0] = 31; 
		level.waypoints[32].children[1] = 34; 
		level.waypoints[33] = spawnstruct();
		level.waypoints[33].origin = (1898.34, 2181.49, 32.3613); 
		level.waypoints[33].number = 33; 
		level.waypoints[33].children_size = 2; 
		level.waypoints[33].children = []; 
		level.waypoints[33].children[0] = 21; 
		level.waypoints[33].children[1] = 30; 
		level.waypoints[34] = spawnstruct();
		level.waypoints[34].origin = (1981.4, 1927.57, 171.486); 
		level.waypoints[34].number = 34; 
		level.waypoints[34].children_size = 2; 
		level.waypoints[34].children = []; 
		level.waypoints[34].children[0] = 32; 
		level.waypoints[34].children[1] = 35; 
		level.waypoints[35] = spawnstruct();
		level.waypoints[35].origin = (1959.92, 2115.96, 212.433); 
		level.waypoints[35].number = 35; 
		level.waypoints[35].children_size = 2; 
		level.waypoints[35].children = []; 
		level.waypoints[35].children[0] = 34; 
		level.waypoints[35].children[1] = 37; 
		level.waypoints[36] = spawnstruct();
		level.waypoints[36].origin = (1926.79, 2249.35, 336.351); 
		level.waypoints[36].number = 36; 
		level.waypoints[36].children_size = 1; 
		level.waypoints[36].children = []; 
		level.waypoints[36].children[0] = 37; 
		level.waypoints[37] = spawnstruct();
		level.waypoints[37].origin = (1943.69, 2170.53, 263.009); 
		level.waypoints[37].number = 37; 
		level.waypoints[37].children_size = 2; 
		level.waypoints[37].children = []; 
		level.waypoints[37].children[0] = 35; 
		level.waypoints[37].children[1] = 36; 
		level.waypoints[38] = spawnstruct();
		level.waypoints[38].origin = (2896.62, 2736.4, 103.194); 
		level.waypoints[38].number = 38; 
		level.waypoints[38].children_size = 4; 
		level.waypoints[38].children = []; 
		level.waypoints[38].children[0] = 31; 
		level.waypoints[38].children[1] = 39; 
		level.waypoints[38].children[2] = 41; 
		level.waypoints[38].children[3] = 43; 
		level.waypoints[39] = spawnstruct();
		level.waypoints[39].origin = (2794.13, 3576.11, 121.663); 
		level.waypoints[39].number = 39; 
		level.waypoints[39].children_size = 3; 
		level.waypoints[39].children = []; 
		level.waypoints[39].children[0] = 38; 
		level.waypoints[39].children[1] = 46; 
		level.waypoints[39].children[2] = 40; 
		level.waypoints[40] = spawnstruct();
		level.waypoints[40].origin = (3449.24, 3606.06, 128.125); 
		level.waypoints[40].number = 40; 
		level.waypoints[40].children_size = 2; 
		level.waypoints[40].children = []; 
		level.waypoints[40].children[0] = 39; 
		level.waypoints[40].children[1] = 41; 
		level.waypoints[41] = spawnstruct();
		level.waypoints[41].origin = (3501.45, 2895.97, 129.732); 
		level.waypoints[41].number = 41; 
		level.waypoints[41].children_size = 3; 
		level.waypoints[41].children = []; 
		level.waypoints[41].children[0] = 40; 
		level.waypoints[41].children[1] = 38; 
		level.waypoints[41].children[2] = 42; 
		level.waypoints[42] = spawnstruct();
		level.waypoints[42].origin = (3984.58, 2871.63, 128.06); 
		level.waypoints[42].number = 42; 
		level.waypoints[42].children_size = 2; 
		level.waypoints[42].children = []; 
		level.waypoints[42].children[0] = 41; 
		level.waypoints[42].children[1] = 43; 
		level.waypoints[43] = spawnstruct();
		level.waypoints[43].origin = (3408.43, 2286.98, -25.113); 
		level.waypoints[43].number = 43; 
		level.waypoints[43].children_size = 3; 
		level.waypoints[43].children = []; 
		level.waypoints[43].children[0] = 42; 
		level.waypoints[43].children[1] = 38; 
		level.waypoints[43].children[2] = 44; 
		level.waypoints[44] = spawnstruct();
		level.waypoints[44].origin = (3507.85, 1629.84, 50.6757); 
		level.waypoints[44].number = 44; 
		level.waypoints[44].children_size = 3; 
		level.waypoints[44].children = []; 
		level.waypoints[44].children[0] = 43; 
		level.waypoints[44].children[1] = 45; 
		level.waypoints[44].children[2] = 86; 
		level.waypoints[45] = spawnstruct();
		level.waypoints[45].origin = (3025.82, 1354.15, 64.125); 
		level.waypoints[45].number = 45; 
		level.waypoints[45].children_size = 3; 
		level.waypoints[45].children = []; 
		level.waypoints[45].children[0] = 44; 
		level.waypoints[45].children[1] = 86; 
		level.waypoints[45].children[2] = 12; 
		level.waypoints[46] = spawnstruct();
		level.waypoints[46].origin = (2097.14, 3662.12, 217.556); 
		level.waypoints[46].number = 46; 
		level.waypoints[46].children_size = 4; 
		level.waypoints[46].children = []; 
		level.waypoints[46].children[0] = 39; 
		level.waypoints[46].children[1] = 47; 
		level.waypoints[46].children[2] = 49; 
		level.waypoints[46].children[3] = 48; 
		level.waypoints[47] = spawnstruct();
		level.waypoints[47].origin = (2001.89, 4130.98, 259.73); 
		level.waypoints[47].number = 47; 
		level.waypoints[47].children_size = 2; 
		level.waypoints[47].children = []; 
		level.waypoints[47].children[0] = 46; 
		level.waypoints[47].children[1] = 48; 
		level.waypoints[48] = spawnstruct();
		level.waypoints[48].origin = (1326.71, 3671.16, 240.917); 
		level.waypoints[48].number = 48; 
		level.waypoints[48].children_size = 3; 
		level.waypoints[48].children = []; 
		level.waypoints[48].children[0] = 47; 
		level.waypoints[48].children[1] = 51; 
		level.waypoints[48].children[2] = 46; 
		level.waypoints[49] = spawnstruct();
		level.waypoints[49].origin = (1980.79, 2873.76, 307.651); 
		level.waypoints[49].number = 49; 
		level.waypoints[49].children_size = 2; 
		level.waypoints[49].children = []; 
		level.waypoints[49].children[0] = 50; 
		level.waypoints[49].children[1] = 46; 
		level.waypoints[50] = spawnstruct();
		level.waypoints[50].origin = (1895.44, 2641.56, 377.673); 
		level.waypoints[50].number = 50; 
		level.waypoints[50].children_size = 2; 
		level.waypoints[50].children = []; 
		level.waypoints[50].children[0] = 51; 
		level.waypoints[50].children[1] = 49; 
		level.waypoints[51] = spawnstruct();
		level.waypoints[51].origin = (764.257, 3284.68, 237.725); 
		level.waypoints[51].number = 51; 
		level.waypoints[51].children_size = 4; 
		level.waypoints[51].children = []; 
		level.waypoints[51].children[0] = 72; 
		level.waypoints[51].children[1] = 52; 
		level.waypoints[51].children[2] = 48; 
		level.waypoints[51].children[3] = 50; 
		level.waypoints[52] = spawnstruct();
		level.waypoints[52].origin = (479.155, 2678.94, 277.079); 
		level.waypoints[52].number = 52; 
		level.waypoints[52].children_size = 2; 
		level.waypoints[52].children = []; 
		level.waypoints[52].children[0] = 51; 
		level.waypoints[52].children[1] = 66; 
		level.waypoints[53] = spawnstruct();
		level.waypoints[53].origin = (433.949, 2178.62, 193.66); 
		level.waypoints[53].number = 53; 
		level.waypoints[53].children_size = 2; 
		level.waypoints[53].children = []; 
		level.waypoints[53].children[0] = 66; 
		level.waypoints[53].children[1] = 54; 
		level.waypoints[54] = spawnstruct();
		level.waypoints[54].origin = (597.633, 1829.46, 139.065); 
		level.waypoints[54].number = 54; 
		level.waypoints[54].children_size = 3; 
		level.waypoints[54].children = []; 
		level.waypoints[54].children[0] = 53; 
		level.waypoints[54].children[1] = 55; 
		level.waypoints[54].children[2] = 58; 
		level.waypoints[55] = spawnstruct();
		level.waypoints[55].origin = (563.516, 1468.37, 134.176); 
		level.waypoints[55].number = 55; 
		level.waypoints[55].children_size = 3; 
		level.waypoints[55].children = []; 
		level.waypoints[55].children[0] = 57; 
		level.waypoints[55].children[1] = 54; 
		level.waypoints[55].children[2] = 56; 
		level.waypoints[56] = spawnstruct();
		level.waypoints[56].origin = (1005.98, 1516.13, 121.768); 
		level.waypoints[56].number = 56; 
		level.waypoints[56].children_size = 2; 
		level.waypoints[56].children = []; 
		level.waypoints[56].children[0] = 55; 
		level.waypoints[56].children[1] = 21; 
		level.waypoints[57] = spawnstruct();
		level.waypoints[57].origin = (170.438, 1277.18, 165.038); 
		level.waypoints[57].number = 57; 
		level.waypoints[57].children_size = 2; 
		level.waypoints[57].children = []; 
		level.waypoints[57].children[0] = 58; 
		level.waypoints[57].children[1] = 55; 
		level.waypoints[58] = spawnstruct();
		level.waypoints[58].origin = (30.0312, 1536.41, 197.69); 
		level.waypoints[58].number = 58; 
		level.waypoints[58].children_size = 3; 
		level.waypoints[58].children = []; 
		level.waypoints[58].children[0] = 59; 
		level.waypoints[58].children[1] = 57; 
		level.waypoints[58].children[2] = 54; 
		level.waypoints[59] = spawnstruct();
		level.waypoints[59].origin = (-410.264, 1494.47, 199.898); 
		level.waypoints[59].number = 59; 
		level.waypoints[59].children_size = 4; 
		level.waypoints[59].children = []; 
		level.waypoints[59].children[0] = 60; 
		level.waypoints[59].children[1] = 73; 
		level.waypoints[59].children[2] = 76; 
		level.waypoints[59].children[3] = 58; 
		level.waypoints[60] = spawnstruct();
		level.waypoints[60].origin = (-448.837, 1921.11, 200.125); 
		level.waypoints[60].number = 60; 
		level.waypoints[60].children_size = 2; 
		level.waypoints[60].children = []; 
		level.waypoints[60].children[0] = 79; 
		level.waypoints[60].children[1] = 59; 
		level.waypoints[61] = spawnstruct();
		level.waypoints[61].origin = (-314.46, 2113.99, 138.165); 
		level.waypoints[61].number = 61; 
		level.waypoints[61].children_size = 2; 
		level.waypoints[61].children = []; 
		level.waypoints[61].children[0] = 62; 
		level.waypoints[61].children[1] = 80; 
		level.waypoints[62] = spawnstruct();
		level.waypoints[62].origin = (-226.834, 2254.09, 132.586); 
		level.waypoints[62].number = 62; 
		level.waypoints[62].children_size = 2; 
		level.waypoints[62].children = []; 
		level.waypoints[62].children[0] = 63; 
		level.waypoints[62].children[1] = 61; 
		level.waypoints[63] = spawnstruct();
		level.waypoints[63].origin = (-64.5644, 2197.75, 198.641); 
		level.waypoints[63].number = 63; 
		level.waypoints[63].children_size = 2; 
		level.waypoints[63].children = []; 
		level.waypoints[63].children[0] = 64; 
		level.waypoints[63].children[1] = 62; 
		level.waypoints[64] = spawnstruct();
		level.waypoints[64].origin = (89.1346, 2301.64, 171.212); 
		level.waypoints[64].number = 64; 
		level.waypoints[64].children_size = 2; 
		level.waypoints[64].children = []; 
		level.waypoints[64].children[0] = 65; 
		level.waypoints[64].children[1] = 63; 
		level.waypoints[65] = spawnstruct();
		level.waypoints[65].origin = (118.152, 2580.23, 192.192); 
		level.waypoints[65].number = 65; 
		level.waypoints[65].children_size = 3; 
		level.waypoints[65].children = []; 
		level.waypoints[65].children[0] = 66; 
		level.waypoints[65].children[1] = 64; 
		level.waypoints[65].children[2] = 67; 
		level.waypoints[66] = spawnstruct();
		level.waypoints[66].origin = (362.768, 2528.14, 247.186); 
		level.waypoints[66].number = 66; 
		level.waypoints[66].children_size = 3; 
		level.waypoints[66].children = []; 
		level.waypoints[66].children[0] = 52; 
		level.waypoints[66].children[1] = 65; 
		level.waypoints[66].children[2] = 53; 
		level.waypoints[67] = spawnstruct();
		level.waypoints[67].origin = (-317.059, 2547.13, 133.685); 
		level.waypoints[67].number = 67; 
		level.waypoints[67].children_size = 1; 
		level.waypoints[67].children = []; 
		level.waypoints[67].children[0] = 65; 
		level.waypoints[68] = spawnstruct();
		level.waypoints[68].origin = (-505.115, 2564.77, -55.875); 
		level.waypoints[68].number = 68; 
		level.waypoints[68].children_size = 2; 
		level.waypoints[68].children = []; 
		level.waypoints[68].children[0] = 82; 
		level.waypoints[68].children[1] = 69; 
		level.waypoints[69] = spawnstruct();
		level.waypoints[69].origin = (-424.511, 2886.46, -23.875); 
		level.waypoints[69].number = 69; 
		level.waypoints[69].children_size = 2; 
		level.waypoints[69].children = []; 
		level.waypoints[69].children[0] = 68; 
		level.waypoints[69].children[1] = 70; 
		level.waypoints[70] = spawnstruct();
		level.waypoints[70].origin = (25.4345, 3069.19, 40.125); 
		level.waypoints[70].number = 70; 
		level.waypoints[70].children_size = 2; 
		level.waypoints[70].children = []; 
		level.waypoints[70].children[0] = 69; 
		level.waypoints[70].children[1] = 71; 
		level.waypoints[71] = spawnstruct();
		level.waypoints[71].origin = (59.3382, 3229.88, 104.125); 
		level.waypoints[71].number = 71; 
		level.waypoints[71].children_size = 2; 
		level.waypoints[71].children = []; 
		level.waypoints[71].children[0] = 70; 
		level.waypoints[71].children[1] = 83; 
		level.waypoints[72] = spawnstruct();
		level.waypoints[72].origin = (556.576, 3222.29, 224.125); 
		level.waypoints[72].number = 72; 
		level.waypoints[72].children_size = 2; 
		level.waypoints[72].children = []; 
		level.waypoints[72].children[0] = 83; 
		level.waypoints[72].children[1] = 51; 
		level.waypoints[73] = spawnstruct();
		level.waypoints[73].origin = (-1076.56, 1481.46, 142.368); 
		level.waypoints[73].number = 73; 
		level.waypoints[73].children_size = 3; 
		level.waypoints[73].children = []; 
		level.waypoints[73].children[0] = 59; 
		level.waypoints[73].children[1] = 74; 
		level.waypoints[73].children[2] = 75; 
		level.waypoints[74] = spawnstruct();
		level.waypoints[74].origin = (-1192.94, 1320.8, 73.7154); 
		level.waypoints[74].number = 74; 
		level.waypoints[74].children_size = 2; 
		level.waypoints[74].children = []; 
		level.waypoints[74].children[0] = 73; 
		level.waypoints[74].children[1] = 75; 
		level.waypoints[75] = spawnstruct();
		level.waypoints[75].origin = (-969.76, 885.829, 179.824); 
		level.waypoints[75].number = 75; 
		level.waypoints[75].children_size = 3; 
		level.waypoints[75].children = []; 
		level.waypoints[75].children[0] = 73; 
		level.waypoints[75].children[1] = 74; 
		level.waypoints[75].children[2] = 76; 
		level.waypoints[76] = spawnstruct();
		level.waypoints[76].origin = (-547.188, 880.249, 188.563); 
		level.waypoints[76].number = 76; 
		level.waypoints[76].children_size = 3; 
		level.waypoints[76].children = []; 
		level.waypoints[76].children[0] = 75; 
		level.waypoints[76].children[1] = 59; 
		level.waypoints[76].children[2] = 77; 
		level.waypoints[77] = spawnstruct();
		level.waypoints[77].origin = (-618.145, 483.578, 132.17); 
		level.waypoints[77].number = 77; 
		level.waypoints[77].children_size = 2; 
		level.waypoints[77].children = []; 
		level.waypoints[77].children[0] = 78; 
		level.waypoints[77].children[1] = 76; 
		level.waypoints[78] = spawnstruct();
		level.waypoints[78].origin = (-398.571, 177.541, 44.1114); 
		level.waypoints[78].number = 78; 
		level.waypoints[78].children_size = 2; 
		level.waypoints[78].children = []; 
		level.waypoints[78].children[0] = 1; 
		level.waypoints[78].children[1] = 77; 
		level.waypoints[79] = spawnstruct();
		level.waypoints[79].origin = (-448.537, 1987.98, 138.412); 
		level.waypoints[79].number = 79; 
		level.waypoints[79].children_size = 2; 
		level.waypoints[79].children = []; 
		level.waypoints[79].children[0] = 80; 
		level.waypoints[79].children[1] = 60; 
		level.waypoints[80] = spawnstruct();
		level.waypoints[80].origin = (-443.088, 2042, 84.39); 
		level.waypoints[80].number = 80; 
		level.waypoints[80].children_size = 3; 
		level.waypoints[80].children = []; 
		level.waypoints[80].children[0] = 61; 
		level.waypoints[80].children[1] = 81; 
		level.waypoints[80].children[2] = 79; 
		level.waypoints[81] = spawnstruct();
		level.waypoints[81].origin = (-472.551, 2251.36, 35.0313); 
		level.waypoints[81].number = 81; 
		level.waypoints[81].children_size = 2; 
		level.waypoints[81].children = []; 
		level.waypoints[81].children[0] = 82; 
		level.waypoints[81].children[1] = 80; 
		level.waypoints[82] = spawnstruct();
		level.waypoints[82].origin = (-485.191, 2326.82, -39.875); 
		level.waypoints[82].number = 82; 
		level.waypoints[82].children_size = 2; 
		level.waypoints[82].children = []; 
		level.waypoints[82].children[0] = 81; 
		level.waypoints[82].children[1] = 68; 
		level.waypoints[83] = spawnstruct();
		level.waypoints[83].origin = (390.136, 3207.96, 164.526); 
		level.waypoints[83].number = 83; 
		level.waypoints[83].children_size = 2; 
		level.waypoints[83].children = []; 
		level.waypoints[83].children[0] = 71; 
		level.waypoints[83].children[1] = 72; 
		level.waypoints[84] = spawnstruct();
		level.waypoints[84].origin = (2003.24, 1370.33, 30.4023); 
		level.waypoints[84].number = 84; 
		level.waypoints[84].children_size = 2; 
		level.waypoints[84].children = []; 
		level.waypoints[84].children[0] = 85; 
		level.waypoints[84].children[1] = 19; 
		level.waypoints[85] = spawnstruct();
		level.waypoints[85].origin = (2041.76, 1513.81, 3.4303); 
		level.waypoints[85].number = 85; 
		level.waypoints[85].children_size = 2; 
		level.waypoints[85].children = []; 
		level.waypoints[85].children[0] = 22; 
		level.waypoints[85].children[1] = 84; 
		level.waypoints[86] = spawnstruct();
		level.waypoints[86].origin = (3416.35, 1432.67, 67.7031); 
		level.waypoints[86].number = 86; 
		level.waypoints[86].children_size = 3; 
		level.waypoints[86].children = []; 
		level.waypoints[86].children[0] = 44; 
		level.waypoints[86].children[1] = 45; 
		level.waypoints[86].children[2] = 11; 
		level.waypoints[87] = spawnstruct();
		level.waypoints[87].origin = (161.437, 83.2193, 8.4199); 
		level.waypoints[87].number = 87; 
		level.waypoints[87].children_size = 3; 
		level.waypoints[87].children = []; 
		level.waypoints[87].children[0] = 0; 
		level.waypoints[87].children[1] = 1; 
		level.waypoints[87].children[2] = 2; 
		level.waypoints[88] = spawnstruct();
		level.waypoints[88].origin = (1524.67, 391.349, 79.3158); 
		level.waypoints[88].number = 88; 
		level.waypoints[88].children_size = 2; 
		level.waypoints[88].children = []; 
		level.waypoints[88].children[0] = 16; 
		level.waypoints[88].children[1] = 89; 
		level.waypoints[89] = spawnstruct();
		level.waypoints[89].origin = (1623.1, 519.983, 152.462); 
		level.waypoints[89].number = 89; 
		level.waypoints[89].children_size = 1; 
		level.waypoints[89].children = []; 
		level.waypoints[89].children[0] = 88; 
	}
	else if(level.script == "mp_rust")
	{
		level.waypoints[0] = spawnstruct();
		level.waypoints[0].origin = (-177.761, 291.285, -231.906);
		level.waypoints[0].number = 0;
		level.waypoints[0].children_size = 3;
		level.waypoints[0].children = [];
		level.waypoints[0].children[0] = 1;
		level.waypoints[0].children[1] = 3;
		level.waypoints[0].children[2] = 40;
		level.waypoints[1] = spawnstruct();
		level.waypoints[1].origin = (-420.877, 239.657, -247.875);
		level.waypoints[1].number = 1;
		level.waypoints[1].children_size = 3;
		level.waypoints[1].children = [];
		level.waypoints[1].children[0] = 2;
		level.waypoints[1].children[1] = 0;
		level.waypoints[1].children[2] = 4;
		level.waypoints[2] = spawnstruct();
		level.waypoints[2].origin = (-420.141, -179.458, -219.268);
		level.waypoints[2].number = 2;
		level.waypoints[2].children_size = 2;
		level.waypoints[2].children = [];
		level.waypoints[2].children[0] = 1;
		level.waypoints[2].children[1] = 3;
		level.waypoints[3] = spawnstruct();
		level.waypoints[3].origin = (218.624, -203.273, -231.123);
		level.waypoints[3].number = 3;
		level.waypoints[3].children_size = 4;
		level.waypoints[3].children = [];
		level.waypoints[3].children[0] = 0;
		level.waypoints[3].children[1] = 2;
		level.waypoints[3].children[2] = 39;
		level.waypoints[3].children[3] = 40;
		level.waypoints[4] = spawnstruct();
		level.waypoints[4].origin = (-429.24, 702.25, -236.287);
		level.waypoints[4].number = 4;
		level.waypoints[4].children_size = 3;
		level.waypoints[4].children = [];
		level.waypoints[4].children[0] = 1;
		level.waypoints[4].children[1] = 5;
		level.waypoints[4].children[2] = 7;
		level.waypoints[5] = spawnstruct();
		level.waypoints[5].origin = (-166.464, 704.3, -243.54);
		level.waypoints[5].number = 5;
		level.waypoints[5].children_size = 4;
		level.waypoints[5].children = [];
		level.waypoints[5].children[0] = 34;
		level.waypoints[5].children[1] = 4;
		level.waypoints[5].children[2] = 40;
		level.waypoints[5].children[3] = 6;
		level.waypoints[6] = spawnstruct();
		level.waypoints[6].origin = (91.7465, 1130.43, -237.377);
		level.waypoints[6].number = 6;
		level.waypoints[6].children_size = 3;
		level.waypoints[6].children = [];
		level.waypoints[6].children[0] = 11;
		level.waypoints[6].children[1] = 7;
		level.waypoints[6].children[2] = 5;
		level.waypoints[7] = spawnstruct();
		level.waypoints[7].origin = (-428.044, 1160.98, -232.49);
		level.waypoints[7].number = 7;
		level.waypoints[7].children_size = 4;
		level.waypoints[7].children = [];
		level.waypoints[7].children[0] = 4;
		level.waypoints[7].children[1] = 8;
		level.waypoints[7].children[2] = 11;
		level.waypoints[7].children[3] = 6;
		level.waypoints[8] = spawnstruct();
		level.waypoints[8].origin = (-424.222, 1454.5, -235.876);
		level.waypoints[8].number = 8;
		level.waypoints[8].children_size = 2;
		level.waypoints[8].children = [];
		level.waypoints[8].children[0] = 7;
		level.waypoints[8].children[1] = 9;
		level.waypoints[9] = spawnstruct();
		level.waypoints[9].origin = (-423.271, 1746.27, -237.569);
		level.waypoints[9].number = 9;
		level.waypoints[9].children_size = 2;
		level.waypoints[9].children = [];
		level.waypoints[9].children[0] = 8;
		level.waypoints[9].children[1] = 10;
		level.waypoints[10] = spawnstruct();
		level.waypoints[10].origin = (208.662, 1750.61, -230.268);
		level.waypoints[10].number = 10;
		level.waypoints[10].children_size = 2;
		level.waypoints[10].children = [];
		level.waypoints[10].children[0] = 9;
		level.waypoints[10].children[1] = 11;
		level.waypoints[11] = spawnstruct();
		level.waypoints[11].origin = (335.335, 1232.73, -237.362);
		level.waypoints[11].number = 11;
		level.waypoints[11].children_size = 6;
		level.waypoints[11].children = [];
		level.waypoints[11].children[0] = 10;
		level.waypoints[11].children[1] = 6;
		level.waypoints[11].children[2] = 7;
		level.waypoints[11].children[3] = 12;
		level.waypoints[11].children[4] = 19;
		level.waypoints[11].children[5] = 13;
		level.waypoints[12] = spawnstruct();
		level.waypoints[12].origin = (606.819, 972.642, -200.121);
		level.waypoints[12].number = 12;
		level.waypoints[12].children_size = 2;
		level.waypoints[12].children = [];
		level.waypoints[12].children[0] = 11;
		level.waypoints[12].children[1] = 13;
		level.waypoints[13] = spawnstruct();
		level.waypoints[13].origin = (724.688, 1196.99, -172.259);
		level.waypoints[13].number = 13;
		level.waypoints[13].children_size = 3;
		level.waypoints[13].children = [];
		level.waypoints[13].children[0] = 11;
		level.waypoints[13].children[1] = 12;
		level.waypoints[13].children[2] = 14;
		level.waypoints[14] = spawnstruct();
		level.waypoints[14].origin = (1032.48, 1145.38, -234.996);
		level.waypoints[14].number = 14;
		level.waypoints[14].children_size = 4;
		level.waypoints[14].children = [];
		level.waypoints[14].children[0] = 20;
		level.waypoints[14].children[1] = 15;
		level.waypoints[14].children[2] = 41;
		level.waypoints[14].children[3] = 13;
		level.waypoints[15] = spawnstruct();
		level.waypoints[15].origin = (1508.82, 1123.87, -233.992);
		level.waypoints[15].number = 15;
		level.waypoints[15].children_size = 3;
		level.waypoints[15].children = [];
		level.waypoints[15].children[0] = 14;
		level.waypoints[15].children[1] = 41;
		level.waypoints[15].children[2] = 16;
		level.waypoints[16] = spawnstruct();
		level.waypoints[16].origin = (1472.63, 1629.21, -203.745);
		level.waypoints[16].number = 16;
		level.waypoints[16].children_size = 3;
		level.waypoints[16].children = [];
		level.waypoints[16].children[0] = 17;
		level.waypoints[16].children[1] = 18;
		level.waypoints[16].children[2] = 15;
		level.waypoints[17] = spawnstruct();
		level.waypoints[17].origin = (994.341, 1662.86, -99.7701);
		level.waypoints[17].number = 17;
		level.waypoints[17].children_size = 3;
		level.waypoints[17].children = [];
		level.waypoints[17].children[0] = 26;
		level.waypoints[17].children[1] = 16;
		level.waypoints[17].children[2] = 25;
		level.waypoints[18] = spawnstruct();
		level.waypoints[18].origin = (1228.89, 1781.98, -224.459);
		level.waypoints[18].number = 18;
		level.waypoints[18].children_size = 2;
		level.waypoints[18].children = [];
		level.waypoints[18].children[0] = 19;
		level.waypoints[18].children[1] = 16;
		level.waypoints[19] = spawnstruct();
		level.waypoints[19].origin = (775.114, 1785.77, -224.3);
		level.waypoints[19].number = 19;
		level.waypoints[19].children_size = 3;
		level.waypoints[19].children = [];
		level.waypoints[19].children[0] = 11;
		level.waypoints[19].children[1] = 18;
		level.waypoints[19].children[2] = 20;
		level.waypoints[20] = spawnstruct();
		level.waypoints[20].origin = (865.64, 1503.11, -237.314);
		level.waypoints[20].number = 20;
		level.waypoints[20].children_size = 2;
		level.waypoints[20].children = [];
		level.waypoints[20].children[0] = 19;
		level.waypoints[20].children[1] = 14;
		level.waypoints[21] = spawnstruct();
		level.waypoints[21].origin = (-66.8131, 1564.63, -129.794);
		level.waypoints[21].number = 21;
		level.waypoints[21].children_size = 1;
		level.waypoints[21].children = [];
		level.waypoints[21].children[0] = 22;
		level.waypoints[22] = spawnstruct();
		level.waypoints[22].origin = (-75.2998, 1786.8, -49.3155);
		level.waypoints[22].number = 22;
		level.waypoints[22].children_size = 3;
		level.waypoints[22].children = [];
		level.waypoints[22].children[0] = 21;
		level.waypoints[22].children[1] = 23;
		level.waypoints[22].children[2] = 24;
		level.waypoints[23] = spawnstruct();
		level.waypoints[23].origin = (-417.127, 1805.48, -48.3318);
		level.waypoints[23].number = 23;
		level.waypoints[23].children_size = 1;
		level.waypoints[23].children = [];
		level.waypoints[23].children[0] = 22;
		level.waypoints[24] = spawnstruct();
		level.waypoints[24].origin = (260.103, 1726.15, -47.8849);
		level.waypoints[24].number = 24;
		level.waypoints[24].children_size = 2;
		level.waypoints[24].children = [];
		level.waypoints[24].children[0] = 22;
		level.waypoints[24].children[1] = 25;
		level.waypoints[25] = spawnstruct();
		level.waypoints[25].origin = (468.023, 1653.22, -46.875);
		level.waypoints[25].number = 25;
		level.waypoints[25].children_size = 2;
		level.waypoints[25].children = [];
		level.waypoints[25].children[0] = 24;
		level.waypoints[25].children[1] = 17;
		level.waypoints[26] = spawnstruct();
		level.waypoints[26].origin = (949.977, 1101.01, -8.30771);
		level.waypoints[26].number = 26;
		level.waypoints[26].children_size = 3;
		level.waypoints[26].children = [];
		level.waypoints[26].children[0] = 28;
		level.waypoints[26].children[1] = 27;
		level.waypoints[26].children[2] = 17;
		level.waypoints[27] = spawnstruct();
		level.waypoints[27].origin = (568.719, 1057.04, 19.1645);
		level.waypoints[27].number = 27;
		level.waypoints[27].children_size = 1;
		level.waypoints[27].children = [];
		level.waypoints[27].children[0] = 26;
		level.waypoints[28] = spawnstruct();
		level.waypoints[28].origin = (885.246, 777.677, 10.125);
		level.waypoints[28].number = 28;
		level.waypoints[28].children_size = 3;
		level.waypoints[28].children = [];
		level.waypoints[28].children[0] = 30;
		level.waypoints[28].children[1] = 29;
		level.waypoints[28].children[2] = 26;
		level.waypoints[29] = spawnstruct();
		level.waypoints[29].origin = (1147.66, 750.144, -3.24119);
		level.waypoints[29].number = 29;
		level.waypoints[29].children_size = 1;
		level.waypoints[29].children = [];
		level.waypoints[29].children[0] = 28;
		level.waypoints[30] = spawnstruct();
		level.waypoints[30].origin = (513.273, 791.289, 113.021);
		level.waypoints[30].number = 30;
		level.waypoints[30].children_size = 2;
		level.waypoints[30].children = [];
		level.waypoints[30].children[0] = 31;
		level.waypoints[30].children[1] = 28;
		level.waypoints[31] = spawnstruct();
		level.waypoints[31].origin = (513.412, 508.536, -29.4871);
		level.waypoints[31].number = 31;
		level.waypoints[31].children_size = 2;
		level.waypoints[31].children = [];
		level.waypoints[31].children[0] = 32;
		level.waypoints[31].children[1] = 30;
		level.waypoints[32] = spawnstruct();
		level.waypoints[32].origin = (515.193, 132.089, -239.725);
		level.waypoints[32].number = 32;
		level.waypoints[32].children_size = 3;
		level.waypoints[32].children = [];
		level.waypoints[32].children[0] = 40;
		level.waypoints[32].children[1] = 35;
		level.waypoints[32].children[2] = 31;
		level.waypoints[33] = spawnstruct();
		level.waypoints[33].origin = (425.055, 396.749, -239.875);
		level.waypoints[33].number = 33;
		level.waypoints[33].children_size = 3;
		level.waypoints[33].children = [];
		level.waypoints[33].children[0] = 40;
		level.waypoints[33].children[1] = 34;
		level.waypoints[33].children[2] = 35;
		level.waypoints[34] = spawnstruct();
		level.waypoints[34].origin = (473.295, 700.302, -240.249);
		level.waypoints[34].number = 34;
		level.waypoints[34].children_size = 2;
		level.waypoints[34].children = [];
		level.waypoints[34].children[0] = 33;
		level.waypoints[34].children[1] = 5;
		level.waypoints[35] = spawnstruct();
		level.waypoints[35].origin = (1042.18, 333.117, -242.733);
		level.waypoints[35].number = 35;
		level.waypoints[35].children_size = 5;
		level.waypoints[35].children = [];
		level.waypoints[35].children[0] = 43;
		level.waypoints[35].children[1] = 41;
		level.waypoints[35].children[2] = 32;
		level.waypoints[35].children[3] = 36;
		level.waypoints[35].children[4] = 33;
		level.waypoints[36] = spawnstruct();
		level.waypoints[36].origin = (1035.68, -100.031, -239.92);
		level.waypoints[36].number = 36;
		level.waypoints[36].children_size = 3;
		level.waypoints[36].children = [];
		level.waypoints[36].children[0] = 37;
		level.waypoints[36].children[1] = 38;
		level.waypoints[36].children[2] = 35;
		level.waypoints[37] = spawnstruct();
		level.waypoints[37].origin = (1547.36, -204.583, -222.944);
		level.waypoints[37].number = 37;
		level.waypoints[37].children_size = 3;
		level.waypoints[37].children = [];
		level.waypoints[37].children[0] = 36;
		level.waypoints[37].children[1] = 42;
		level.waypoints[37].children[2] = 43;
		level.waypoints[38] = spawnstruct();
		level.waypoints[38].origin = (584.892, -13.3116, -221.038);
		level.waypoints[38].number = 38;
		level.waypoints[38].children_size = 2;
		level.waypoints[38].children = [];
		level.waypoints[38].children[0] = 36;
		level.waypoints[38].children[1] = 39;
		level.waypoints[39] = spawnstruct();
		level.waypoints[39].origin = (568.849, -166.927, -227.991);
		level.waypoints[39].number = 39;
		level.waypoints[39].children_size = 2;
		level.waypoints[39].children = [];
		level.waypoints[39].children[0] = 38;
		level.waypoints[39].children[1] = 3;
		level.waypoints[40] = spawnstruct();
		level.waypoints[40].origin = (136.418, 246.35, -243.682);
		level.waypoints[40].number = 40;
		level.waypoints[40].children_size = 5;
		level.waypoints[40].children = [];
		level.waypoints[40].children[0] = 3;
		level.waypoints[40].children[1] = 32;
		level.waypoints[40].children[2] = 33;
		level.waypoints[40].children[3] = 0;
		level.waypoints[40].children[4] = 5;
		level.waypoints[41] = spawnstruct();
		level.waypoints[41].origin = (1509.49, 688.599, -230.221);
		level.waypoints[41].number = 41;
		level.waypoints[41].children_size = 4;
		level.waypoints[41].children = [];
		level.waypoints[41].children[0] = 15;
		level.waypoints[41].children[1] = 42;
		level.waypoints[41].children[2] = 35;
		level.waypoints[41].children[3] = 14;
		level.waypoints[42] = spawnstruct();
		level.waypoints[42].origin = (1621.75, 683.319, -225.671);
		level.waypoints[42].number = 42;
		level.waypoints[42].children_size = 3;
		level.waypoints[42].children = [];
		level.waypoints[42].children[0] = 41;
		level.waypoints[42].children[1] = 37;
		level.waypoints[42].children[2] = 43;
		level.waypoints[43] = spawnstruct();
		level.waypoints[43].origin = (1589.66, 251.384, -234.516);
		level.waypoints[43].number = 43;
		level.waypoints[43].children_size = 3;
		level.waypoints[43].children = [];
		level.waypoints[43].children[0] = 42;
		level.waypoints[43].children[1] = 37;
		level.waypoints[43].children[2] = 35;
	}
}
/*
searchPlayer()
{
	goal = level;
	maxDistance = 99999;
	foreach(player in level.players)
	{
		currentDistance = Distance(self.origin,player.origin);
		if(currentDistance < maxDistance && player.protected == 0 && player.isDown == 0 && player.hidden == 0 && player.team == "allies")
		{
			maxDistance = currentDistance;
			goal = player;
		}
	}
	if(goal != level)
		self notify("detected");
	return goal;
}
Zombie_CheckAttack()
{
	self endon("zombie_dead");
	self.attacks = false;
	while(1)
	{
		if(self.attract == 0)
		{
			self.goal = self searchPlayer();
			if(self.goal != level && Distance(self.origin,self.goal.origin) <= 60)
			{
				self.attacks = true;
				self maps\zm\d_ops_arcade\zombies::Zombie_Attack(self.goal);		
				wait 1;
				self.attacks = false;
			}
		}
		wait .15;
	}
}
Movement()
{
	self endon("zombie_dead");
	self.reachedWaypoints = [];
	self.myWaypoint = undefined;
	self thread WayPointSettings();
	self thread Zombie_CheckAttack();
	while(true)
	{
		waitFrame();
		if(self.attract == 1 && !self.attacks)
		{
			self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("idle");
		}
		else if(!self.attacks)
		{
			self.goal = self searchPlayer();
			oldGoal = self.goal;
			trace = BulletTrace(self.origin+(0,0,40), self.goal.origin+(0,0,40), false, level.zombie);
			if(self.goal == level)
			{
				self.goal = self getWaypoint();
			}
			else if(Distance(trace["position"],self.goal.origin) > 40)
			{
				self.goal = self getWaypoint(self.goal);
			}
			movetoLoc = VectorToAngles(self.goal.origin - self.origin );	
			self RotateTo((0,movetoLoc[1],0), 0.3);	
			//else
			//{
				maxDistance = Distance(self.origin, self.goal.origin);
				end = (self.origin+(0,0,70)) + vector_Scal(AnglesToForward(self.angles),(maxDistance/10));
				pos = bullettrace(end + (0,0,30),end - (0,0,200),false,self.hitbox);
				zombiecounter = 0;
				//foreach(zombie in level.zombie)
				//{
				//	if(Distance(zombie.origin,pos["position"].origin) < 5 && zombie != self)
				//		wait .2;
				//}
				self MoveTo(pos["position"], (maxDistance / (self.speed*1000)));				
			//}
		}	
	}
}
WayPointSettings()
{
	self endon("zombie_dead");
	self.oldWaypoint = self.origin;
	self.invalidWaypoints = [];
	self.invalidWaypointsCounter = 0;
	deleteInvalid = 0;
	while(true)
	{
		wait .2;
		self.hitted++;
		deleteInvalid++;
		foreach(waypoint in level.waypoints)
		{
			if(Distance(self.origin,waypoint.origin) <= 30)
			{
				self.oldWaypoint = self.myWaypoint;
				self.myWaypoint = undefined;
			}
		}
		if(deleteInvalid == 100)
		{
			foreach(invalid in self.invalidWaypoints)
			{
				invalid delete();
			}
			invalidWaypointsCounter = 0;
		}
	}
}
getWaypoint(player)
{
	validWaypoints = [];
	counter = 0;
	if(!isDefined(player) && !isDefined(self.myWaypoint))
	{			
		foreach(waypoint in level.waypoints)
		{
			z = waypoint.origin[2] - self.origin[2];
			trace = BulletTrace(self.origin+(0,0,40), waypoint.origin+(0,0,40), true, level.zombie.hitbox);
			success = BulletTracePassed(self.origin+(0,0,40), waypoint.origin+(0,0,40), true, level.zombie.hitbox);
			//if(Distance(trace["position"],self.goal.origin) < 40 && z < 75)
			if(success && z < 75)
			{
				valid = true;
				for(i = 0;i < self.invalidWaypointsCounter;i++)
				{
					if(waypoint == self.invalidWaypoints[i])
						valid = false;
				}
				if(valid)
				{
					validWaypoints[counter] = waypoint;
					counter++;
				}				
			}
		}
		if(counter > 0)
			self.myWaypoint = validWaypoints[randomInt(counter)];
	}
	else if(isDefined(player))
	{
		foreach(waypoint in level.waypoints) // Wegpunkte, die: dem Spieler näher sind als der Spieler zum Zombie, also alle dazwischen|  +   | Wegpunkt nicht zu hoch|  +  | Wegpunkt in Sicht vom Zombie oder 300co weg ??
		{
			if(Distance(player.origin,waypoint.origin) < Distance(player.origin,self.origin))
			{
				if(waypoint.origin[2] >  self.origin[2])
					z = waypoint.origin[2] - self.origin[2];
				else
					z = self.origin[2] - waypoint.origin[2];
				if(z < 80)
				{
					success = BulletTracePassed(self.origin+(0,0,30), waypoint.origin+(0,0,30), false, level.zombie.hitbox);
					if(success && Distance(player.origin,waypoint.origin) > 300) // success verhindert dass die zombies durch die mauer gehen aber sie hängen dann fest am waypoint
					{
						validWaypoints[counter] = waypoint;
						counter++;				
					}
				}	
			}
		}
		maxDistance = 99999;
		newWaypoint = player;
		foreach(waypoint in validWaypoints)
		{	
			if(Distance(waypoint.origin,self.origin) > 60)
			{
				if(Distance(waypoint.origin,self.origin) < maxDistance) //  && BulletTracePassed(self.origin+(0,0,40), waypoint.origin+(0,0,40), false, level.zombie.hitbox)
				{
					maxDistance = Distance(waypoint.origin,self.origin);
					newWaypoint = waypoint;
				}
			}
		}
		if(newWaypoint == player)
		{
			self.invalidWaypoints[self.invalidWaypointsCounter] = self.oldWaypoint;
			self.invalidWaypointsCounter++;
			newWaypoint = self.oldWaypoint;
		}
		self.myWaypoint = newWaypoint;
	}
	if(self.myWaypoint == player || !isDefined(self.myWaypoint))
	{
		foreach(waypoint in level.waypoints)
		{
			z = waypoint.origin[2] - self.origin[2];
			//trace = BulletTrace(self.origin+(0,0,40), waypoint.origin+(0,0,40), true, level.zombie.hitbox);
			success = BulletTracePassed(self.origin+(0,0,40), waypoint.origin+(0,0,40), true, undefined);//level.zombie.hitbox
			if(success && z < 75)
			{
				valid = true;
				for(i = 0;i < self.invalidWaypointsCounter;i++)
				{
					if(waypoint == self.invalidWaypoints[i])
						valid = false;
				}
				if(valid)
				{
					validWaypoints[counter] = waypoint;
					counter++;
				}				
			}
		}
		if(counter > 0)
			self.myWaypoint = validWaypoints[randomInt(counter)];
		else
			self thread maps\zm\d_ops_arcade\zombies::Zombie_Death(2,2);
	}
	return self.myWaypoint;
}


if(counter > 0)
		{
			counter = 0;
			path = [];
			foreach(waypoint in validPoint)
			{
				maxDistance = 0;
				foreach(child in waypoint.children)
				{
					if(Distance(child.origin,target.origin) < Distance(target.origin,waypoint.origin))
					{
						path[counter] = child;					
						maxDistance += Distance(child.origin,path[counter-1].origin);
						counter++;
					}
				}
				oldDistance = maxDistance;
			}
			
			
			foreach(waypoint in validPoint)
			{
				path[0] = waypoint;
				foreach(otherWaypoint in validPoint)
				{
					if(waypoint != otherWaypoint)
					{
						success = BulletTracePassed(target.origin+(0,0,25), otherWaypoint.origin+(0,0,25), true, undefined);
						if(!success)
						{
							for(i = 1;i < path.size;i++)
							{
								if(!success)
									success = BulletTracePassed(path[i].origin+(0,0,25), otherWaypoint.origin+(0,0,25), true, undefined);
							}							
						}
						if(success)
						{
							path[counter] = otherWaypoint;
							counter++;
						}
					}
				}
			}
			for(i = 0;i < path.size;i++)
			{
				for(j = i;j < path.size;j++)
				{
					if(path[i] > path[j])
					{
						temp = path[i];
						path[i] = path[j];
						path[j] = temp;
					}
				}				
			}

*/




Movement()
{
	self endon("zombie_dead");
	while(true)
	{
		waitFrame();
		if(self.attract == 0)
		{
			target = self getTarget();	
			visible = self getPlayerTarget(target);
			if(!visible)
			{
				target = self getWaypoint(target); 
			}		
			movetoLoc = VectorToAngles(target.origin - self.origin );	
			self RotateTo((0,movetoLoc[1],0), 0.3);	
			if(target != level && visible)
			{
				self attackPlayer(target);
			}
			targetDistance = Distance(self.origin,target.origin);
			if(targetDistance > 60)
			{
				end = self.origin+(0,0,70) + vector_Scal(AnglesToForward(self.angles),(targetDistance/10)); 	
				iPrintln(targetDistance);
				pos = bullettrace(end + (0,0,30),end - (0,0,200),false,self.hitbox);					
				self MoveTo(pos["position"], (targetDistance / (self.speed*1000)));	
				//iPrintln(pos["position"]);
			}				
		}
	}
}
attackPlayer(target)
{
	self endon("zombie_dead");
	if(Distance(target.origin,self.origin) <= 60)
	{
		self moveTo(self.origin,1);
		self maps\zm\d_ops_arcade\zombies::Zombie_Attack(target);
		wait .8;
	}	
}
getTarget()
{
	target = level;
	maxDistance = 99999;
	foreach(player in level.players)
	{
		if(player.isDown == 0 && player.protected == 0 && player.hidden == 0 && Distance(player.origin,self.origin) < maxDistance && player.team == "allies")
		{
			target = player;
			maxDistance = Distance(player.origin,self.origin);
		}
	}
	return target;
}
getPlayerTarget(target)
{
	if(target == level)
		return false;
	trace = BulletTrace(self.origin+(0,0,40), target.origin+(0,0,40), false,self.hitbox);
	if(Distance(trace["position"],target.origin) < 60)
		return true;
	return false;	
}
getWaypoint(target)
{
	if(target == level)
		target = level.waypoints[randomInt(level.waypoints.size)];
	else
	{
		validPoint = [];
		counter = 0;
		foreach(waypoint in level.waypoints)
		{
			if(Distance(target.origin,waypoint.origin) < Distance(target.origin,self.origin))
			{
				validPoint[counter] = waypoint;			
				counter++;
			}
		}
		maxDistance = 99999;
		foreach(waypoint in validPoint)
		{
			iPrintln(waypoint.origin);
			foreach(child in waypoint.children)
			{
				iPrintln(child.origin);
				if(Distance(child.origin,self.origin) < maxDistance)
				{
					maxDistance = Distance(child.origin,self.origin);
					target = child;
					
				}
			}
		}
	}
	return target;
}

























