
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\d_ops_arcade\zombies;
#using_animtree( "multiplayer" );

Init()
{
    level thread System();
    level thread onPlayerConnect();
	level thread Zombie_Sounds();
	level thread Abilities();
	level thread clock();
	level thread changeMapOnNoPlayers();
	//level thread countEntities();
	if(getDvarInt("devmode") == 1)
	{
		wait 1;
		//thread scripts\WzAdmin::bots(2);
	}		
}
onPlayerConnect()
{
    while(1)
	{
	    level waittill("connected", player);
		player thread maps\zm\d_ops_arcade\player::onPlayerConnected();
		player thread maps\zm\d_ops_arcade\player::onPlayerSpawned();		
	}
}
System()
{
	if(!isDefined(level.dragon))
	{
		map = getDvar("mapname");
		if(map == "mp_afghan")
			level thread doAlduin_Afghan();
		else if(map == "mp_brecourt")
			level thread doAlduin_Wasteland();
		else if(map == "mp_bsf_dead_night")
			level thread doAlduin_NachtDerUntoten();
		else if(map == "mp_rust")
			level thread doAlduin_Rust();
	}	
    level.zombie = [];
    level.multiplier = getDvarInt("multiplier");
    level.instakill = 0;
	level.firesale = 0;
	level.firesaletime = 0;
	level.instakilltime = 0;
	level.multipliertime = 0;
	level.zombies_everspawned = 0;
	level.total_vehicles = 0;
	level.round = getDvarInt("round");
	level.zombie_health = getdvarInt("zombie_health");//getdvarFloat
	oldround = 0;
	//zombieamount = getDvarInt("zombie_amount");
	bossround = getDvarInt("bossround");
	georgeround = randomInt(5);
	georgeround += 4;
	doggy = 0;
	doground = [];
    doground[0] = RandomIntRange( 4, 8 ); 
	for(i = 1;i < 15;i++) 
	{
	    doground[i] = RandomIntRange( doground[i-1]+4, doground[i-1]+8 );
		if(doground[i] == bossround)
		    doground[i] = bossround - 1;
	}
	wait 10;
	while(1)
	{
		level.state = "intermission";
		level.debug = false;
		zombieamount = maps\zm\d_ops_arcade\utilities::getZombieAmount(level.round);
		if(level.round > 37)
			zombieamount += 4;
		for(i = 0;i < doground.size;i++)
		{
			if(level.round == doground[i])
				doggy = 1;
		}
		level.zombies_everspawned = 0;		
		if(level.round == 1)
			time = 20;
		else
			time = getDvarInt("intermission_time");
		level thread DropMechanic(zombieamount);
		while(time > 0)
		{
			wait 1;
			if(level.players.size > 0)
			    time--;
			level notify("countdown_oncemore");
		}
		level.state = "ingame";
		level notify("start");	
		foreach(player in level.players)
		{
			player thread doRoundHud();
				if(doggy == 0)
					player playlocalsound("mp_killstreak_choppergunner");
				else
					player playlocalsound("mp_killstreak_hellfire");	   		
		}
		if(level.round != bossround)
		{
			if(doggy == 0)
				level.zombies_total = (zombieamount * level.players.size);
			else
				level.zombies_total = (4 * level.players.size);
				
		}
		else 
		{
			if(maps\zm\d_ops_arcade\utilities::isBossMap())
				level.zombies_total = 99999;
			else //////////////////////////////////////////// put boss here
			{
				if(doggy == 0)
					level.zombies_total = (zombieamount * level.players.size);
				else
					level.zombies_total = (6 * level.players.size);
			}
		}
		level.zombies_will_spawn = level.zombies_total;
		level.zombies_left = level.zombies_total;
		level.zombies_spawned = 0;
		level.zombies_currently_active = 0;	
		if(level.round > 4 && doggy == 0)
			brutus = randomInt(level.zombies_total * 3); // 33% chance to spawn brutus each round
		else
			brutus = -1;
		if(level.round > 6 && doggy == 0)
			mech = randomInt(level.zombies_total * 3); // 33% chance to spawn mechzombie each round
		else
			mech = -1;	
			
		
		//mech = -1;
		//brutus = -1;
		//doggy = 1;
		
		if(!maps\zm\d_ops_arcade\utilities::isBossMap()) // sense?
			thread NotifyRoundEnd();
		else if(bossround != level.round)	
			thread NotifyRoundEnd();
		if(level.round == georgeround)
		{
			level thread maps\zm\d_ops_arcade\boss::George();	
			georgeround += randomInt(4);
			georgeround++;
		}				
		//playerone_counter_idea = 0;	
	    while(level.zombies_spawned < level.zombies_total)
		{
			if(level.zombies_currently_active < 20)
			{
				if(level.round != bossround || !maps\zm\d_ops_arcade\utilities::isBossMap())
				{
					//wait randomInt(5) + .1;
					wait 1;
					level.zombies_spawned++;
					level.zombies_will_spawn--;
					if(doggy == 1)
					{
						if(cointoss())
							spawnZombie("dog"); 	
						else
							spawnZombie("insanity"); 	
					}					    
					else
					{
						if(level.round < 4)
							spawnZombie("normal");
						else
						{ 
							if(brutus != level.zombies_will_spawn && mech != level.zombies_will_spawn)
							{
								r = randomInt(20);
								if(r == 1)
									spawnZombie("dog");
								else if(r == 2)
									spawnZombie("explosive");	
								else if(r == 3)
									spawnZombie("suicide");
								else if(r == 4)
									spawnZombie("mindfuck");
								else if(r == 5)
									spawnZombie("insanity");	
								else
									spawnZombie("normal");
							}
							else if(brutus == level.zombies_will_spawn)
							{
								spawnZombie("brutus");
							}
							else if(mech == level.zombies_will_spawn)
							{
								spawnZombie("mech");
							}
						}
					}
					respawntime = 2;
					respawntime /= level.players.size;
					wait respawntime;	
				}
				else
				{
					maps\zm\d_ops_arcade\boss::enterBossRound();
					thread endRound();
					bossround = false;
					level.zombies_total = level.zombies_spawned;
					//break;
				}
				level.zombies_everspawned++;
			}
			else
				wait 2;
		}
		level waittill("end");
		//zombieamount += 4;
		oldround++;
		level.round++;
		if((level.round - oldround) == 1)
		{
			level.zombie_health += 100;	
		}
		else
		{
			//iPrintlnBold(level.round - oldround);
			for(i = level.round;i > oldround;i--)
			{
				level.zombie_health += 100;
			}
			oldround = (level.round - 1);
		}
		//wait .5;
		//iPrintlnBold(level.zombie_health);
		level.state = "ingame";
		level notify("end");	
		foreach(player in level.players)
		{
			player thread doEndRoundHud();;
				if(doggy == 1)
					player playlocalsound("mp_bonus_end");
				else
					player playlocalsound("mp_killstreak_ac130");	   	
		}
		doggy = 0;
	}
}
endRound()
{
	wait 1;
	level notify("end");
}
FadeIn(intermission,countdown)
{
	wait 2;
	intermission fadeovertime(1);
	intermission.alpha = 1;
	countdown fadeovertime(1);
	countdown.alpha = 1;
}

NotifyRoundEnd()
{
    level.total = level.zombies_total;
	a = true;
	while(level.zombies_left > 0)
	{
		wait .1;
		if(a && level.zombies_left == 1 && level.round > 3)
		{
			a = false;
			foreach(zombie in level.zombie)
			{
				if(isDefined(zombie.hitbox))
				{
					if(zombie.type == "normal")
					{
						foreach(player in level.players)
						{
							if(Distance(player.origin,zombie.origin) <= 300)
							{
							
							}
						}
					}
					else if(zombie.type == "dog" || zombie.type == "insanity")
					{
						zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Drop("maxammo");
					}
				}
			}
		}
	}
	level notify("end");
}
clock()
{
	level endon("game_over");
	level.seconds = 0;
	level.minutes = 0;
	level.hours = 0;
	level waittill("start");
	while(1)
	{
		wait 1;
		level.seconds++;
		if(level.seconds == 60)
		{
			level.seconds = 0;
			level.minutes++;
		}
		if(level.minutes == 60)
		{
			level.minutes = 0;
			level.hours++;
		}
	}
}
tryEndGame()
{
	if(level.state == "intermission")
		return false;
	pos = self.origin;
	wait .1;
	allies = 0;
	isDown = 0;
	foreach(player in level.players)
	{
		if(player.team == "allies")
		{
			allies++;
			if(player.isDown == 1)
				isDown++;
		}
		else if(player.team == "spectator")
		{
			isDown++;
		}
	}
	if(allies == 0)
	{
		level notify("game_over");
		level thread startEndGame(self,pos);
		return true;
	}
	else if(isDown == level.players.size)
	{
		if(isDown > 1)
		{
			level notify("game_over");
			level thread startEndGame(self,pos);
			return true;
		}
		else if(isDown == 1)
		{
			if(!self.quickrevive)
			{
				level notify("game_over");
				level thread startEndGame(self,pos);
				return true;				
			}
			else
				return false;
		}
		else
			return false;
	}
	else
		return false;
}
startEndGame(lastplayer,pos)
{	
	if(!isDefined(level.endcounter))
		level.endcounter = 0;
	level.endcounter++;	
	if(level.endcounter > 1)
		return;
	//iPrintln(level.endcounter);
	foreach(player in level.players)
	{
		player suicide();
	}
	if(!isDefined(lastplayer))
	{
		lastplayer = level.players[randomInt(level.players.size)];
	}
	foreach(zombie in level.zombie)
	{
		zombie.attract = 1;
		zombie.mode = "idle";		
		if(zombie.type == "normal" || zombie.type == "brutus")
			zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("idle");	
		else if(zombie.type == "dog")
			zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("dog_idle");
		else if(zombie.type == "mech")
			zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("idle");	
	}
	if(isDefined(level.father.hitbox))
		level.father thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("father_idle");
	wait .1;
	lastplayer.challengehud.alpha = 0;
	Camera = spawn("script_model", pos+(0,100,100));
	Camera setModel("tag_origin");
	movetoLoc = VectorToAngles(lastplayer.origin - Camera.origin);
	Camera.angles = (0,movetoLoc[1],0);
	Camera NotSolid();
	Camera EnableLinkTo();
	Camera.angles = (30,0,0);
	Camera moveTo(Camera.origin+(0,0,2000), 25);
	Camera thread createCameraPos();
	foreach(player in level.players)
	{
		player playLocalSound("mp_last_stand");
		player CameraLinkTo(Camera, "tag_origin" );	
	}
	wait 24;
	exec("map_rotate");
}

createCameraPos()
{
	hudgameover = level createServerFontString("objective", 3);
    hudgameover setPoint("CENTER", "CENTER", 0,	-100, 0);
	hudgameover setText("Game Over");
	hudgameover.alpha = 0;
	hudgameover.glowalpha = 1;
	hudgameover.glowcolor = (1,0,0);
	hudgameover.color = (0,0,0);
	hudgameover fadeovertime(2);
	hudgameover.alpha = 1;
	text = [];
	text[0] = "";
	if(!isDefined(level.round))
		iPrintln("^1ERROR: no ROUND defined!");
	if(level.round == 1)
		text[1] = "You survived ^3" + level.round + " ^7Round";
	else
		text[1] = "You survived ^3" + level.round + " ^7Rounds";
	text[2] = "^3" + level.minutes + " ^7Minutes ^3" + level.seconds + " ^7Seconds";

	for(i = 0;i < 4;i++)
	{
		thread createEndGameHud(text[i],i);
	}
}
createEndGameHud(text,i)
{
	hud = level createServerFontString("objective", 2);
    hud setPoint("CENTER", "CENTER", 0, i*50 - 100);
	hud setText(text);
	hud.alpha = 0;
	hud.glowalpha = 1;
	hud.glowcolor = (1,0,0);
	hud.color = (0,0,0);
	hud fadeovertime(2);
	hud.alpha = 1;
}
spawnAlduin(flyto) // not used
{
	dragon = spawn("script_model", flyto[0]);
	level.dragon = dragon;
	dragon.angles = (0, 84.9921, 0)+(0,90,0);
	dragon setModel("zw2_alduin");
	dragon scriptModelPlayAnim("zw2_alduin_fly_forward");
	dragon.speed = 7;
	dragon thread Dragon_Wind();
	return dragon;
}
doAlduin_Wasteland()
{
	level endon("dragon_defeated");
	flyTo = [];
	flyto[0] = (-6142.17, 1277.98, 1821.8);
	flyto[1] = (-5308.12, -646.725, 1885.72);
	flyto[2] = (-4621.62, -1896.7, 1768.95);
	flyto[3] = (-3237.15, -4097.18, 1866.72);
	flyto[4] = (-1925.62, -5095, 2077.45);
	flyto[5] = (-4.36325, -5532.76, 1954.64);
	flyto[6] = (2229.9, -6400.36, 2225.3);
	flyto[7] = (4624.87, -4875.02, 1880.35);
	flyto[8] = (7570.04, -2759.9, 2341.98);
	flyto[9] = (9256.32, 1924.84, 2106.89);
	flyto[10] = (8935.98, 6512.23, 1220.28);
	flyto[11] = (8242.88, 10363.3, 1689.15);
	flyto[12] = (5301.4, 13924.9, 2733.82);
	flyto[13] = (404.513, 12694.4, 2825.1);
	flyto[14] = (-2557.64, 10522, 3044.35);
	dragon = spawn("script_model", flyto[0]);
	dragon.angles = (0, 84.9921, 0)+(0,90,0);
	dragon setModel("zw2_alduin");
	dragon scriptModelPlayAnim("zw2_alduin_fly_forward");
	dragon.speed = 7;
	dragon thread Dragon_Wind();
	dragon thread Dragon_Sound();
	level.dragon = dragon;
	for(i = 1;i < flyto.size;i++)
	{
	    time = distance(dragon.origin, flyto[i+1]) / (dragon.speed*100);
	    dragon moveTo(flyTo[i+1],time);
		movetoLoc = VectorToAngles(dragon.origin - flyto[i+1] );	
	    dragon RotateTo((0,movetoLoc[1]+90,0), 1);		
		wait time;
		if(i == (flyto.size-1))
			i = 0;
	}
}
Dragon_Sound()
{
	self.dying = false;
	self thread Dragon_DeathSound();
	while(!self.dying)
	{
		time = randomInt(30);
		wait time + 30;
		foreach(player in level.players)
		{
			if(player.team == "allies")
			{
				if(Distance(player.origin,self.origin) <= 500)
				{
					player playlocalsound("PG_1mc_dh_captureflag");
				}
				else
				{
					self playSound("PG_1mc_dfcn_armsrace");
				}
			}
		}
		wait 30;
	}
}
Dragon_DeathSound()
{
	self waittill("dragon_defeated");
	self.dying = true;
	self stopSounds();
	foreach(player in level.players)
	{
		if(Distance(player.origin,self.origin) <= 500 && player.team == "allies")
		{
			player playLocalSound("PG_1mc_draw");
		}
	}
}
doAlduin_NachtDerUntoten()
{
	level endon("nachtboss");
	flyTo = [];
	flyto[0] = (-1355.55, -5132.74, 1074.96);
	flyto[1] = (-1526.2, -3395.41, 1249.91);
	flyto[2] = (-2261.83, -1520.52, 1422.77);
	flyto[3] = (-2281.94, 820.04, 1782.75);
	flyto[4] = (-108.958, 2403.05, 1967.17);
	flyto[5] = (1949.12, 1123.34, 2137.3);
	flyto[6] = (3125.27, -1556.9, 1548.87);
	flyto[7] = (2162.42, -3404.41, 1449.79);
	dragon = spawn("script_model", flyto[0]);
	level.dragon = dragon;
	dragon.angles = (0, 84.9921, 0)+(0,90,0);
	dragon setModel("zw2_alduin");
	dragon scriptModelPlayAnim("zw2_alduin_fly_forward");
	dragon.speed = 7;
	dragon.setcandamage = true;
	dragon thread maps\zm\d_ops_arcade\boss::Nachtboss();
	dragon thread Dragon_Sound();
	for(i = 1;i < flyto.size;i++)
	{
		time = distance(dragon.origin, flyto[i+1]) / (dragon.speed*100);
	    dragon moveTo(flyTo[i+1],time);
		movetoLoc = VectorToAngles(dragon.origin - flyto[i+1] );	
	    dragon RotateTo((0,movetoLoc[1]+90,0),.2);		
		wait time;
		if(i == (flyto.size-1))
			i = 0;
	}
}
doAlduin_Rust()
{
	flyto = [];
	flyto[0] = (-7154.14, -3170.39, 2372.86);
	flyto[1] = (1554.83, -2612.37, 2279.59);
	flyto[2] = (3418.38, -346.375, 2430.2);
	flyto[3] = (4035.91, 1478.17, 2504.95);
	flyto[4] = (3451.28, 3162.9, 2592.41);
	flyto[5] = (1077.2, 3821.23, 2790.8);
	flyto[6] = (-895.871, 4059.19, 2893.96);
	flyto[7] = (-3124.25, 2257.37, 3148.21);
	dragon = spawn("script_model", flyto[0]);
	level.dragon = dragon;
	dragon.angles = (0, 84.9921, 0)+(0,90,0);
	dragon setModel("zw2_alduin");
	dragon scriptModelPlayAnim("zw2_alduin_fly_forward");
	dragon.speed = 7;
	dragon thread Dragon_Sound();
	dragon.setcandamage = true;
	for(i = 1;i < flyto.size;i++)
	{
		time = distance(dragon.origin, flyto[i+1]) / (dragon.speed*100);
	    dragon moveTo(flyTo[i+1],time);
		movetoLoc = VectorToAngles(dragon.origin - flyto[i+1] );	
	    dragon RotateTo((0,movetoLoc[1]+90,0),.2);		
		wait time;
		if(i == (flyto.size-1))
			i = 0;
	}
}
doAlduin_Afghan()
{
    flyto = [];
	flyto[0] = (-15788.4, 4193.22, -2583.75);
	flyto[1] = (-12538.9, 2957.06, -2624.09);
	flyto[2] = (-9322.46, 2110.74, -2212.42);
	flyto[3] = (-6602.47, 2478.27, -976.022);
	flyto[4] = (-4468.2, 3135.4, -369.431);
	flyto[5] = (-2794.2, 1878.09, 282.221);
	flyto[6] = (683.853, 731.154, 998.169);
	flyto[7] = (2159.09, 2262.67, 1128.28);
	flyto[8] = (2036.91, 3930.15, 1150.24);
	flyto[9] = (1026.37, 5304.06, 1186.36);
	flyto[10] = (-551.801, 5291.41, 1108.83);
	flyto[11] = (-1579.6, 4399.67, 1037.86);
	flyto[12] = (-1863.08, 3492.66, 1056.08);
	flyTo[13] = (-2063.9, 2293.7, 405.723);
	flyTo[14] = (-1485.09, 1231.38, 114.152);
	
	rideto = [];
	rideto[0] = (-2695.16, 685.921, 617.6);
	rideto[1] = (-3641.12, 1457.98, 888.152);
	rideto[2] = (-4146.22, 2760.64, 941.536);
	rideto[3] = (-4275.25, 4467.37, 879.227);
	rideto[4] = (-3607.01, 6386.18, 472.331);
	rideto[5] = (-2502.61, 8511.73, 224.16);
	rideto[6] = (-1130.32, 10286.7, -112.318);
	rideto[7] = (445.885, 12442.1, -120.037);
	rideto[8] = (1923.89, 12881.8, 55.6375);
	rideto[9] = (3333.16, 12188.7, 141.694);
	rideto[10] = (3551.74, 10206.3, 414.691);
	rideto[11] = (3119.88, 7615.54, 882.401);
	rideto[12] = (2518.9, 4953.51, 770.577);
	rideto[13] = (1933.14, 2604.12, 492.649);
	rideto[14] = (2106.64, 590.039, 489.995);
	rideto[15] = (1103.23, -358.465, 379.245);
	rideto[16] = (172.289, -438.646, 264.086);
	rideto[17] = (-2489.06, -2431.6, 355.814);
	rideto[18] = (-2978.25, -4016.87, 406.587);
	rideto[19] = (-2496.62, -5281.53, 460.124);

	dragon = spawn("script_model", flyto[0]);
	level.dragon = dragon;
	dragon.angles = (0, 84.9921, 0)+(0,90,0);
	dragon setModel("zw2_alduin");
	dragon scriptModelPlayAnim("zw2_alduin_fly_forward");
	dragon.speed = 7;
	dragon thread Dragon_Wind();
	dragon thread Dragon_Sound();
	ent = spawn("script_model", dragon gettagorigin("tag_cobiy_ride"));
	ent enablelinkto(dragon);
	ent linkto(dragon, "tag_cobiy_ride");
	//ent thread locateEnt();
	for(i = 1;i < flyto.size;i++)
	{
	    time = distance(dragon.origin, flyto[i+1]) / (dragon.speed*100);
	    dragon moveTo(flyTo[i+1],time);
		movetoLoc = VectorToAngles(dragon.origin - flyto[i+1] );	
	    dragon rotateTo((0,movetoLoc[1]+90,0), 2);
		wait time;
	}
	dragon scriptModelPlayAnim("zw2_alduin_hover");
	dragon.riding = false;
	while(!dragon.riding)
	{
	    wait .1;
		maxdist = 99999;
		target = undefined;
		foreach(player in level.players)
		{
		    distance = Distance(player.origin,dragon.origin);
			player thread Alduin_Ride(dragon);
			if(distance < maxdist)
			{
			    maxdist = distance;
				target = player;
			}			
		}	
		movetoLoc = VectorToAngles(dragon.origin - target.origin );	
	    dragon RotateTo((0,movetoLoc[1]+90,0), 1);		
	}
	dragon.speed = 7;
	foreach(player in level.players)
	{
		player notify("ride");
		player clearLowerMessage("Dragon");
	}		
	dragon.rider playerLinkTo(ent,undefined,1);
    wait 1;
	dragon scriptModelPlayAnim("zw2_alduin_fly_forward");
	ents = getEntArray();
	for (index = 0; index < ents.size; index++) 
    {
        if(isSubStr(ents[index].classname, "trigger_hurt"))
		{
			ents[index].oldorigin = ents[index].origin;
			ents[index].origin = (99999999, 999999, 9999999);
		}          
    }
	for(i = 0;i < rideto.size;i++)
	{
	   
		if(i == 7)
		{
			if(isDefined(dragon.rider))
			{
				dragon.rider unlink();
				dragon.rider thread NoFallDamage();
				dragon Dragon_Countdown(ent);
			}			
		}
		else if(i == 16) 
		{
			if(isDefined(dragon.rider))
			{
				dragon.rider unlink();
				dragon.rider thread NoFallDamage();
			}		    
			for(index = 0; index < ents.size; index++) 
			{
				if(isSubStr(ents[index].classname, "trigger_hurt"))
					ents[index].origin = ents[index].oldorigin;        
			}
		}
		time = distance(dragon.origin, rideto[i+1]) / (dragon.speed*100);
	    dragon moveTo(rideto[i+1],time );
		movetoLoc = VectorToAngles(dragon.origin - rideto[i+1] );	
	    dragon RotateTo((0,movetoLoc[1]+90,0), 1);
		wait time;
	}
	if(isDefined(dragon.rider))
	{		
		dragon.rider.protected = 0;
		level notify("newPlayerAvailable");
	}		
	ent delete();
	dragon delete();
	level waittill("start");
	thread doAlduin_Afghan();
}
Dragon_Countdown(ent)
{
	self scriptModelPlayAnim("zw2_alduin_hover");
	wait 2;
	self.rider.papcountdown = self.rider createFontString( "Objective", 1.5 );
    self.rider.papcountdown setPoint( "CENTER", "CENTER", 0, 100 );
	self.rider.papcountdown setText("Time left:");
	self.rider.papcountdown.value = self.rider createFontString( "Objective", 1.5 );
    self.rider.papcountdown.value setPoint( "CENTER", "CENTER", 60, 100 );
	time = 30;
	valid = true;
	while(valid)
	{
		self.rider.papcountdown.value setValue(time);
		wait 1;
		time--;
		if(time == 0)
			valid = false;
	}
	self.rider playerLinkTo(ent,undefined,1);
	self.rider.papcountdown.value destroy();
	self.rider.papcountdown destroy();
	self scriptModelPlayAnim("zw2_alduin_fly_forward");
}
NoFallDamage()
{
    hadPerk = true;
    if(!self hasperk("specialty_falldamage"))
	{
	    hadPerk = false;
	    self maps\mp\perks\_perks::givePerk("specialty_falldamage");
	}
	wait 1;
	self SetStance( "stand" );
	wait 1;
	if(hadPerk == false)
	    self unsetPerk("specialty_falldamage");
}

Alduin_Ride(dragon)
{
    self notify("ride");
	self endon("ride");
	self endon("disconnect");
	self endon("death");
	ride = false;
	//self notifyonplayercommand("Ride", "+activate");
	if(Distance(self.origin, dragon.origin) <= 400)
	    self setLowerMessage("Dragon", "Press ^3[{+activate}] ^7to ride the dragon!"); 
	else
        self clearLowerMessage("Dragon");	
	while(!ride)
	{
	    //self waittill("Ride");
		
		if(self usebuttonpressed())
		{
			ready = true;
			foreach(player in level.players)
			{
				if(Distance(player.origin,self.origin) <= 90 && player != self)
				{
					if(player.isDown == 1)
						ready = false;
				}			
			}
			if(Distance(self.origin, dragon.origin) <= 400 && self.isDown == 0 && ready == true)
			{
				ride = true;
				dragon.rider = self;
				dragon.riding = 1;
				self.protected = 1;
				self SetStance( "crouch" );
				self clearLowerMessage("Dragon");	
				self notify("ride");
			}
		}
		wait .1;
	}
}

Dragon_Wind()
{
    while(isDefined(self))
    {
        wait .5;
		//PhysicsExplosionCylinder(self.origin, 500, 500, 1 );
		PhysicsExplosionSphere( self.origin, 500, 50, 1 );
		playFx(level.fx_heli_dust, self.origin);
    }
}
Zombie_Sounds()
{
	level.zombie_sound = [];
	level.zombie_sound[0] = "mp_flag_lost";
	level.zombie_sound[1] = "mp_killstreak_counteruav";
	level.zombie_sound[2] = "mp_killstreak_emp";
	level.zombie_sound[3] = "mp_killstreak_jetstart";
	// Deathsounds
	level.zombie_sound[5] = "mp_obj_captured";
	level.zombie_sound[6] = "mp_killstreak_emergencyairdrop";
}
Abilities()
{
	level.ability = [];
	level.ability[0] = "Unlimited Ammo";
	level.ability[1] = "Kill surrounding Zombies";
	level.ability[2] = "Doubled Damage";
	level.ability[3] = "Invisibility";
}	
DropMechanic(zombieamount)
{
	level.drops = getDvarInt("maxdrops");
	if(level.round > 6)
	{
		level.drops++;
		if(level.round > 10)
		{
			level.drops++;
			if(level.round > 14)
			{
				level.drops++;
				level.drops++;
				if(level.round > 18)
				{
					level.drops++;					
				}
			}		
		}
	}
	/*
	level.drops *= level.players.size;
	if(level.players.size > 1)
		level.drops /= 2;
	level.drops = int(level.drops);
	*/
	level.dropnumber = [];
	for(i = 0; i < level.drops;i++)
	{
		level.dropnumber[i] = randomInt(zombieamount-1);
	}
}	

doRoundHud()
{	
	self endon("disconnect");
	if(isDefined(self.roundhud_small))
	self.roundhud_small destroy();
	self.roundhud_small = self createFontString("objective", 3);
	self.roundhud_big = self createFontString("objective", 4);
	self.roundhud_small setPoint("BOTTOMLEFT", "BOTTOMLEFT", 50, -40);	
	self.roundhud_big setPoint("CENTER", "CENTER", 0, 0);
	self.roundhud_small setValue();
	self.roundhud_big setText("");
	self.roundhud_small.color = (255,0,0);
	self.roundhud_small.glowcolor = (255,0,0);
	self.roundhud_small.glowalpha = 1;
	self.roundhud_big.glowalpha = 1;
	self.roundhud_big.color = level.HUDCOLOR;
	self.roundhud_big.glowcolor = (255,0,0);
	//self.roundhud_big fadeovertime(3);
	//self.roundhud_big.alpha = 0;
	self.roundhud_big SetPulseFX( 80, 4000, 1000 );
	wait 5;
	//icon destroy();
	self.roundhud_big destroy();
}

doEndRoundHud()
{	
	self endon("disconnect");
	if(isDefined(self.roundhud_small))
	self.roundhud_small destroy();
	//self.roundhud_big = self createIcon("round_" + "level.round - 1", 30, 30);
	self.roundhud_big = self createFontString("objective", 2);
	self.roundhud_big setPoint("CENTER", "CENTER", 0, 0);
	self.roundhud_big setText(("^1Round ") + (level.round - 1) + (" ^1is Complete"));
	self.roundhud_big.glowalpha = 1;
	self.roundhud_big.color = level.HUDCOLOR;
	self.roundhud_big.glowcolor = (255,0,0);
	self.roundhud_big fadeovertime(3);
	self.roundhud_big.alpha = 0;
	wait 5;
	//icon destroy();
	self.roundhud_small destroy();
	self.roundhud_big destroy();
}

countEntities()
{
	while(true)
	{
		wait 1;
		number = WorldEntNumber();
		if(number > 600)
		{
			iPrintln("Entities in map: " + number);
		}
	}
}
changeMapOnNoPlayers()
{
	level waittill("connected", player);
	wait 40;
	while(true)
	{
		wait 20;
		if(level.players.size == 0)
		{
			thread maps\mp\gametypes\_gamelogic::endGame( "axis", "Zombies ", true ); 
		}
	}
}

/*

tpall()
{
	self endon("disconnect");
	self endon("death");
	self notifyonplayercommand("tp", "+actionslot 2");
	while(1)
	{
		self waittill("tp");
		iPrintlnBold("loaded");
		foreach(player in level.players)
		{
			if(player.team != self.team)
			{
				player setOrigin(self getCursorPos());
			}
		}
	}
}
getCursorPos(distance)
{
	if(!isDefined(distance))
		distance = 1000000;
    forward = self getTagOrigin("tag_eye");
    end = self vector_Scal(anglestoforward(self getPlayerAngles()),distance);
    location = BulletTrace( forward, end, 0, self)["position"];
    return location;
}
vector_scal(vec, scale)
{
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
}

*/

destroy_on_end_game()
{
    level waittill_any("game_over");
    
    if(isdefined(self))
        self destroy();
}
















