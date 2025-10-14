#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

// =========================================================
//
// Contains often used functions like getter & setter
//
// =========================================================


hasDrop()
{
	if(level.round < 4)
		return false;
	for(i = 0;i < level.drops;i++)
	{
		number = level.dropnumber[i];
		if(level.zombies_spawned == number)
		{
			return true;
		}		
	}	
	return false;
}
getVisibility(pos)
{
	visibility = false;
	foreach(player in level.players)
	{
		trace = BulletTrace(pos, player.origin+(0,0,40), false, undefined );
		if(Distance(trace["position"], player.origin) <= 50)
		{
			visibility = true;
			break;
		}
	}
	return visibility;
}
playFxTemp(fx,pos,time)
{
	fx = spawnfx(fx, pos);
	triggerfx(fx);
	wait time;
	fx delete();
}
isBossMap()
{
	switch(level.script)
	{
		//case "mp_brecourt":
		//	return true;
		case "mp_bsf_dead_night":
			return true;
		//case "mp_bo2_town":
		//	return true;
		default:
			return false;
	}
}
getZombieAmount(round)
{
	if(round == 1)
		return 6;
	else if(round == 2)
		return 8;
	else if(round == 3)
		return 13;
	else if(round == 4)
		return 18;
	else if(round == 5)
		return 24;
	else if(round == 6)
		return 27;
	else if(round == 7)
		return 28;
	else if(round == 8)
		return 28;
	else if(round == 9)
		return 29;
	else if(round == 10)
		return 33;
	else if(round == 11)
		return 34;
	else if(round == 12)
		return 37;
	else if(round == 13)
		return 39;
	else if(round == 14)
		return 41;
	else if(round == 15)
		return 44;	
	else if(round == 16)
		return 47;
	else if(round == 17)
		return 50;
	else if(round == 18)
		return 53;
	else if(round == 19)
		return 56;
	else if(round == 20)
		return 60;
	else if(round == 21)
		return 63;
	else if(round == 22)
		return 67;
	else if(round == 23)
		return 71;
	else if(round == 24)
		return 75;
	else if(round == 25)
		return 80;
	else if(round == 26)
		return 86;
	else if(round == 27)
		return 89;	
	else if(round == 28)
		return 94;	
	else if(round == 29)
		return 99;
	else if(round == 30)
		return 105;
	else if(round == 31)
		return 110;
	else if(round == 32)
		return 116;
	else if(round == 33)
		return 121;
	else if(round == 34)
		return 127;
	else if(round == 35)
		return 134;
	else if(round == 36)
		return 140;
	else if(round == 37)
		return 147;
	else
		return 150;			
}
getDistances(other)
{
	if(!isDefined(other))
	{
		iPrintln("ERROR: other object does not exist for Distance checking [[getDistances]]");
		return false;
	}
	return Distance(self.origin,other.origin);
}
getCorrectUpgrade(weapon, name)
{
	
	if(weapon == "m1911_mp")
		return "m1911_upg_zm";
	else if(weapon == "m21_fmj_zm")
		return "m14_upg_zm";
	else if(weapon == "kar98k_tactical_mp")
		return "kar98k_upg_zm";
	else if(weapon == "ak47_mp")
		return "ak47_upg_zm";	
	else if(weapon == "aa12_mp")
		return "aa12_upg_zm";
	else if(weapon == "at4_mp")
		return "at4_upg_zm";
	else if(weapon == "aug_mp")
		return "aug_upg_zm";
	else if(weapon == level.thundergun)
		return level.thundergun_upgrade;
	else if(weapon == level.blundergat)
		return level.blundergat_upgrade2;
	else if(weapon == "beretta_mp")
		return "beretta_upg_zm";
	else if(weapon == "beretta393_xmags_mp")
		return "beretta393_upg_zm";
	else if(weapon == "cheytac_mp")
		return "cheytac_upg_zm";
	else if(weapon == "coltanaconda_mp")
		return "coltanaconda_upg_zm";
	else if(weapon == "deserteagle_mp")
		return "deserteagle_upg_zm";
	else if(weapon == "famas_mp")
		return "famas_upg_zm";
	else if(weapon == "fn2000_mp")
		return "fn2000_upg_zm";
	else if(weapon == "kriss_mp")
		return "kriss_upg_zm";
	else if(weapon == "glock_mp")
		return "glock_upg_zm";
	else if(weapon == "masada_mp")
		return "masada_upg_zm";
	else if(weapon == "m4_mp")
		return "m4_upg_zm";
	else if(weapon == "m16_mp")
		return "m16_upg_zm";
	else if(weapon == "m79_mp")
		return "m79_upg_zm";
	else if(weapon == "mp40_mp")
		return "mp40_upg_zm";
	else if(weapon == "m240_mp")
		return "m240_upg_zm";
	else if(weapon == "mg4_mp")
		return "mg4_upg_zm";
	else if(weapon == "m1014_mp")
		return "m1014_upg_zm";
	else if(weapon == "model1887_mp")
		return "model1887_upg_zm";
	else if(weapon == "mp5k_mp")
		return "mp5k_upg_zm";
	else if(weapon == "p38_mp")
		return "p38_upg_zm";
	else if(weapon == "p90_mp")
		return "p90_upg_zm";
	else if(weapon == "pp2000_mp")
		return "pp2000_upg_zm";
	else if(weapon == "riotshield_mp")
		return "riotshield_upg_zm";
	else if(weapon == "rpd_mp")
		return "rpd_upg_zm";
	else if(weapon == "sa80_mp")
		return "sa80_upg_zm";
	else if(weapon == "scar_mp")
		return "scar_upg_zm";
	else if(weapon == "spas12_mp")
		return "spas12_upg_zm";
	else if(weapon == "striker_mp")
		return "striker_upg_zm";
	else if(weapon == "stg44_mp")
		return "stg44_upg_zm";
	else if(weapon == "tavor_mp")
		return "tavor_upg_zm";
	else if(weapon == "ump45_mp")
		return "ump45_upg_zm";
	else if(weapon == "uzi_mp")
		return "uzi_upg_zm";
	else if(weapon == "usp_mp")
		return "usp_upg_zm";
	else if(weapon == "wa2000_fmj_xmags_mp")
		return "wa2000_upg_zm";
	else
		return weapon;
}
getGumballIcon(gumball)
{
	if(gumball == "Percaholic")
		return "cardicon_ball_volleyball_1";
	else if(gumball == "3x Firesale")
		return "cardicon_aircraft_01";
	else if(gumball == "2x Nuke")
		return "cardicon_ball_baseball_1";
	else if(gumball == "2x DoublePoints")
		return "cardicon_b2";
	else if(gumball == "2x Max Ammo")
		return "cardicon_award_jets";
	else if(gumball == "Stun normal Zombies for 20s")
		return "cardicon_birdbrain";
	else if(gumball == "Droprain")
		return "cardicon_ac130_angelflare";
	else if(gumball == "2x Instakill")
		return "cardicon_animal";	
	else if(gumball == "End Round + 1600 Cash")
		return "cardicon_blast_shield";
	else if(gumball == "Punch your current Gun")
		return "cardicon_boot";
	else if(gumball == "Slow Down all Zombies")
		return "cardicon_circuit";	
	else if(gumball == "2x Firewave on taking damage")
		return "cardicon_abrams";	
	else if(gumball == "2x Random Powerup")
		return "cardicon_binoculars_1";	
	else if(gumball == "Invisible for zombies")
		return "cardicon_assad";	
	else if(gumball == "2x Teleport to a random location")
		return "";	
	else if(gumball == "Regain Ammo when getting Cash")
		return "cardicon_biohazard";	
	else
		return "unknown gumball!";
}
isValidWeapon(name)
{

	return true;
}
isValidWonderweapon(name)
{
	if(!isValidWeapon(name))
		return false;
	return true;	
}
isSpecialistWeapon(name)
{
	if(name == level.skull)
		return true;
	else if(name == level.flamethrower)
		return true;
	else if(name == level.annihilator)
		return true;
	else if(name == level.minigun)
		return true;	
	else if(name == level.sword)
		return true;		
	else 
		return false;	
}
locateSpecial()
{
	while(isDefined(self))
	{
	    self.glow = spawnFX(level.energybulb_negative, self.origin );
	    TriggerFX(self.glow);
		wait .5;
		self.glow delete();
	}
}
locateEnt() 
{
    while(isDefined(self))
	{
	    self.glow = spawnFX( level.greenfx2, self.origin );
	    TriggerFX(self.glow);
		wait .5;
		self.glow delete();
	}
}
locatePos(pos)
{
	while(1)
	{
		glow = spawnFX( level.greenfx2, pos );
	    TriggerFX(glow);
		wait .5;
		glow delete();
	}
}
getNearestPlayer(down,protected)
{
	if(!isDefined(down))
		down = false;
	if(!isDefined(protected))
		protected = false;
	MaxDistance = 99999;
	target = undefined;
	foreach(player in level.players)
	{
		if(Distance(player.origin,self.origin) < MaxDistance)
		{
			if(down == true && player.isDown == 1)
			{} // new kind of coding, kek
			else if(protected == true && player.protected == 1)	
			{}
			else			
				target = player;	
		}
	}
	if(!isDefined(target))
		target = level;
	return target;	
}
roundUp(floatVal)
{
	if (int(floatVal) != floatVal)
		return int(floatVal+1);
	else
		return int(floatVal);
}
playFxonPos(effect,pos,time)
{
	if(!isDefined(effect) || !isDefined(pos))
	{
		iPrintln("^1ERROR: Invalid use of ''^3playFxonPos^1''!");
		return;
	}
	if(!isDefined(time))
		time = -1;
	while(time != 0)
	{
		fx = spawnFx(effect,pos);
		triggerfx(fx);
		wait 1;
		fx delete();
		time--;
	}
}
invalidMap()
{
	while(1)
	{		
		iPrintln("^1This map is not supported!");
		wait 2;
		iPrintln("^4No Zombiespawn could be found!");
		wait 2;
	}
}
getSpawnPosition()
{
	if(!isDefined(level.spawns_zombies))
	{
		if(!isDefined(level.invalidmap))
		{
			level.invalidmap = true;
			invalidMap();
		}
		else
			level waittill("forever");
	}
	list = [];
	size = 0;
	foreach(player in level.players)
	{
		if(player.isDown == 0 && player.protected == 0)
		{
			list[size] = player;
			size++;
		}
	}
	if(list.size < 1)
	{
		level waittill("newPlayerAvailable");
		wait 6;
		foreach(player in level.players)
		{
			if(player.isDown == 0 && player.protected == 0 && player.team == "allies")
			{
				list[size] = player;
				size++;
			}
		}		
	}
	victim = list[randomInt(list.size)];
	distance = 500;
	validspawn = [];
	
	height = 130;
	height2 = 100;
	if(size == 1 && list[0].isInChopper)
	{
		height = 550;
		height2 = 550;
	}
		
	size = 0;
	counter = 0;
	while(counter < 5) // was 20 before
	{
		foreach(spawn in level.spawns_zombies)
		{
			if(Distance(spawn, victim.origin) < distance || counter > 3) // Distance(spawn, victim.origin) > 100 && 
			{
				if((victim.origin[2] - spawn[2]) < height && (spawn[2] - victim.origin[2]) < height2)  // height was 130
				{
					if(BulletTracePassed(spawn+(0,0,40), victim.origin+(0,0,40), false, undefined))
					{
						validspawn[size] = spawn;
						size++;
					}					
				}			
			}
		}
		if(size == 0)
		{
			distance += 100;
			counter++;
		}
		else
		{
			spawn = validspawn[randomInt(validspawn.size)];
			foreach(player in level.players)
			{
				if(Distance(spawn,player.origin) <= 60 && player.team == "allies")
				{
					end = spawn+(0,0,40) + vector_Scal(AnglesToForward(player.angles+(0,0,0)),70); 	
					bulletTrace = BulletTrace(spawn+(0,0,40), end,true);
					pos = BulletTrace(bulletTrace["position"],bulletTrace["position"]+(0,0,-200),false);
					spawn = pos["position"];
				}
			}
			return spawn;
		}
		waitFrame();
	}
	wait (1+randomInt(6)); // delay when zombie will try to spawn again
	return getSpawnPosition();
	// check if this causes a max childuse error...
}
getCursorPos(distance)
{
	if(!isDefined(distance))
		distance = 1000000;
    //forward = self getTagOrigin("tag_eye");
	forward = self.origin+(0,0,45);
    end = self vector_Scal(anglestoforward(self getPlayerAngles()),distance);
    location = BulletTrace( forward, end, 0, self)["position"];
    return location;
}
vector_scal(vec, scale)
{
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
}
getPerkCamo(name)
{
    if(name == "quickrevive")
	    return 0;
    else if(name == "juggernog")
       return 1;
	else if(name == "speedcola")
	    return 2; 
	else if(name == "doubletap")
	    return 3; 
	else if(name == "staminup")
	    return 4; 
	else	
	    return 0; 	
}
getGumCamo(name)
{
	// 0 -> green
	// 1 -> orange
	// 2 -> blau
	// 3 -> lila
	if(name == "Slow Down all Zombies")
		return 0;
	else if(name == "Percaholic" || name == "2x Firewave on taking damage")
		return 1;
	else if(name == "")
		return 2;
	else
		return 3;
}
setGround()
{
	trace1 = bulletTrace(self.origin + (0,0,40), self.origin + (0,0,300), false, self); 
	if(Distance(trace1["position"], self.origin+(0,0,40)) > 280)
	{
		self maps\zm\gametypes\zombies::Zombie_Death(4,1); ///////////////////////////////////////////////////////     //////// deleted thread
		return;
	}
    trace2 = bulletTrace(self.origin + (0,0,40), self.origin + (0,0,-40), false, self); // on first + 0,0,45, second -40
	if(trace2["surfacetype"] == "none")
	{
		if(Distance(trace2["position"],self.origin) > 200)
			self maps\zm\gametypes\zombies::Zombie_Death(10,1); /////////////////////////////////////////////////////////////// deleted thread
		else if(Distance(trace2["position"],self.origin) > 30)
			self.origin = trace2["position"];
	}
}
getCost(name)
{
    if(name == "quickrevive" && level.players.size == 1)
	    return getDvarInt("cost_perk_solo");
	else	
		return getDvarInt("cost_perk_" + name);
}

getPerkModel(name)
{
	if (name == "juggernog")
		return "zw2_jugg_machine";
	else if (name == "doubletap")
		return "zw2_doubletap_machine";
	else if (name == "quickrevive")
		return "zw2_quickrevive_machine";
	else if (name == "speedcola")
		return "zw2_speedcola_machine";
	else if (name == "staminup")
		return "zw2_marathon_machine";
	else
		return "";
}

getAnim()
{
    if(!isDefined(self.hitbox))
	    return "";
	else if(self.mode == "walk")
        return "";
	else if(self.mode == "run")
        return "zw2_zombie_run";
	else if(self.mode == "sprint")
        return "zw2_zombie_sprint";
	else
        return "unknown";	
}
getZombieType()
{
    civilian = undefined;
    if(cointoss())
	    civilian = 1;
	else
    {
	    if(cointoss())
		    civilian = 1;
		else
            civilian = 0;		
	}
    if(level.currentmap == "co_hunted")
	    civilian = 1;
	return civilian;
}
getZombieSpawnModel()
{
	model = level.zombiebody[randomInt(level.zombiebody.size)];
	self setModel(model);
	self.model = model;
	/*
	if(model == "zombie_body_3")
		head = "zombie_head_3";
	else if(model == "nazi_body")
		head = "nazi_head";
	else if(model == "infantrya_body")
	{
		self thread maps\zm\gametypes\zombies::Zombie_Eyes();
		if(cointoss())
			return "ww2_zm_head_01";
		else
			return "ww2_zm_head_02";
	}
	else
		head = level.zombiehead[randomInt(level.zombiehead.size)];*/
	self.head = spawn("script_model",self getTagOrigin( "j_spine4" ));		
	self.head setModel(getZombieSpawnHead()); 
	if(self.head.model == "ww2_zm_head_01" || self.head.model == "ww2_zm_head_02")
	{
		self.head.angles = (270,180,270);
		self.head.origin += (0,0,-5);
		self.head linkto(self, "j_spine4" );
	}		
	else
	{
		self.head.angles = (270,0,270);
		self.head linkto(self, "j_spine4" );
	}		
	fx = PlayFXOnTag(level.zombie_eye, self.head, "j_spine4");
	//self thread headFx();
}
headFx()
{
	while(isDefined(self.head))
	{		
		lefteye = spawnFx(level.zombie_eye, self getTagOrigin("j_shoulderraise_le")+(0,0,10)); // j_shoulderraise_le
		righteye = spawnFx(level.zombie_eye, self getTagOrigin("j_shoulderraise_le")+(0,0,10));
		triggerfx(lefteye);
		triggerfx(righteye);
		wait 0.05;
		lefteye delete();
		righteye delete();
	}
}
getZombieSpawnModel_Old()
{
    return level.zombiebody[randomInt(level.zombiebody.size)];
}
getZombieSpawnHead()
{
	if(self.model == "zombie_body_3")
		return "zombie_head_3";
	else if(self.model == "nazi_body")
		return "nazi_head";
	else if(self.model == "infantrya_body")
	{
		if(cointoss())
			return "ww2_zm_head_01";
		else
			return "ww2_zm_head_02";
	}
	else
		return level.zombiehead[randomInt(level.zombiehead.size)];
}
getWeaponName(name)
{
	if(name == "m1911_mp")
		return "M1911";
	else if(name == "m1911_upg_zm")
		return "Hitler and Stalin";

	else if(name == "kar98k_tactical_mp")
		return "Kar98k";
	else if(name == "kar98k_upg_zm")
		return "Kleiner Krieger";

    else if(name == "mp40_mp")
	    return "Mp40";
    else if(name == "mp40_upg_zm")
	    return "NachBrenner";

	else if(name == "beretta_mp")
	    return "M9";
	else if(name == "beretta_upg_zm")
	    return "Deathbringer";

	else if(name == "coltanaconda_mp")
	    return "Colt-Anaconda";
	else if(name == "coltanaconda_upg_zm")
	    return "Ice & Fire";

	else if(name == "deserteagle_mp")
	    return "Desert-Eagle";
	else if(name == "deserteagle_upg_zm")
	    return "The Slayer";

	else if(name == "famas_mp")
	    return "Famas";
	else if(name == "famas_upg_zm")
	    return "Double Penetrator";

	else if(name == "glock_mp")
	    return "Glock";
	else if(name == "glock_upg_zm")
	    return "Hammer & Axe";

	else if(name == "m16_mp")
	    return "M16A4";
	else if(name == "m16_upg_zm")
	    return "Devourer";

	else if(name == "m1014_mp")
	    return "Benelli M4";
	else if(name == "m1014_upg_zm")
	    return "The Warrior";

	else if(name == "aa12_mp")
	    return "AA12";
	else if(name == "aa12_upg_zm")
	    return "Air Blaster 12";

	else if(name == "ump45_mp")
		return "UMP45";
	else if(name == "ump45_upg_zm")
		return "Hero of the West";

	else if(name == level.thundergun)
		return "Thundergun";
	else if(name == level.thundergun_upgrade)
		return "Zeus Cannon";

	else if(name == level.perkbottle || name == level.gumball || name == "defaultweapon_mp")
		return "";

	else if(name == "scar_mp")
        return "Scar-H";
	else if(name == "scar_upg_zm")
        return "S.C.R.A.P.E";

	else if(name == "usp_mp")
        return "USP-40";
	else if(name == "usp_upg_zm")
        return "Fast & Furious";

	else if(name == "tavor_mp")
        return "Tar-21";	
	else if(name == "tavor_upg_zm")
        return "Mars Fighter";	

	else if(name == "ak47_mp")
        return "Ak47";	
	else if(name == "ak47_upg_zm")
        return "Yuri's Revenge";	

	else if(name == "cheytac_mp")
        return "Intervention";	
	else if(name == "cheytac_upg_zm")
        return "Cheytac Heaven";	

	else if(name == "riotshield_mp")
        return "Riot Shield";
	else if(name == "riotshield_upg_zm")
        return "Rocket Shield";	

	else if(name == "spas12_mp")
        return "Spas-12";	
	else if(name == "spas12_upg_zm")
        return "Hunter";

	else if(name == "model1887_mp")
        return "Model 1887";	
	else if(name == "model1887_upg_zm")
        return "Model 1337 & Model 420";	

	else if(name == "kriss_mp")
        return "Vector";	
	else if(name == "kriss_upg_zm")
        return "Nightmare Weaver";	

	else if(name == "uzi_mp")
        return "UZI";	
	else if(name == "uzi_upg_zm")
        return "Hell & Heaven x2";

	else if(name == "masada_mp")
        return "ACR";	
	else if(name == "masada_upg_zm")
        return "Terror Rifle";	

	else if(name == "aug_mp")
        return "AUG HBAR";
	else if(name == "aug_upg_zm")
        return "Sharpshooter|^1Zoomed Out";	

	else if(name == "rpd_mp")
        return "RPD";
	else if(name == "rpd_upg_zm")
        return "Russian Chainsaw";	

	else if(name == "sa80_mp")
        return "L86 Ls";
	else if(name == "sa80_upg_zm")
        return "Big Big";

	else if(name == "m240_mp")
        return "M240";		
	else if(name == "m240_upg_zm")
        return "Terminator";	

	else if(name == "pp2000_mp")
        return "PP2000";	
	else if(name == "pp2000_upg_zm")
        return "Bom Voyage!";	

	else if(name == "mp5k_mp")
        return "MP5K";
	else if(name == "mp5k_upg_zm")
        return "MP5KSD";

	else if(name == level.dg2)
		return "Wunderwaffe DG2";

	else if(name == level.blundergat)
		return "Blundergat";	
	else if(name == level.blundergat_upgrade)
		return "Acid Gat";	
	else if(name == level.blundergat_upgrade2)
		return "The Sweeper";	

	else if(name == "stg44_mp")
		return "STG-44";
	else if(name == "stg44_upg_zm")
		return "Deutscher Vernichter";

	else if(name == "fn2000_mp")
		return "FN2000";
	else if(name == "fn2000_upg_zm")
		return "Holy Light";

	else if(name == "m21_fmj_zm")
		return "M14";
	else if(name == "m14_upg_zm")
		return "Men";

	else if(name == "mg4_mp")
		return "MG4";	
	else if(name == "mg4_upg_zm")
		return "MG4 Heaven|^1Zoomed Out";	

	else if(name == "ak47_fmj_eotech_mp")
		return "Fireaxe";	

	else if(name == "wa2000_fmj_xmags_mp")
		return "Wa2000";	
	else if(name == "wa2000_upg_zm")
		return "Little Nuker";	

	else if(name == "striker_mp")
		return "Striker-12";	
	else if(name == "striker_upg_zm")
		return "Death Striker-12";

	else if(name == "p38_mp")
		return "Walther P38";
	else if(name == "p38_upg_zm")
		return "Drittes Reich";

	else if(name == "p90_mp")
		return "P90";	
	else if(name == "p90_upg_zm")
		return "Death & Decay";	

	else if(name == "m4_mp")
		return "M4A1";	
	else if(name == "m4_upg_zm")
		return "M4A1 SOPMOD";	

	else if(name == "beretta393_xmags_mp")
		return "M93 Raffica";	
	else if(name == "beretta393_upg_zm")
		return "Shryder and Omar";	

    else
        return name;
}

is_true(variable)
{
	return isdefined(variable) && variable;
}
// =======================
// SAFE SOUND HELPERS
// =======================

// 3D sound sur l'entité appelante (zombie, drop, etc.)
safePlaySound(soundAlias)
{
    if (isDefined(self) && isDefined(soundAlias) && soundAlias != "")
    {
        // si self a une origin → joue direct
        if (isDefined(self.origin))
        {
            self playSound(soundAlias);
        }
        else
        {
            // fallback si pas d'origin : joue en local
            if (isPlayer(self))
                self playLocalSound(soundAlias);
        }
    }
}

// 3D sound attaché : crée un dummy lié au zombie pour spatialisation
safePlaySound3D(soundAlias, tag)
{
    if (!isDefined(self) || !isAlive(self) || !isDefined(soundAlias) || soundAlias == "")
        return;

    if (!isDefined(tag))
        tag = "j_spine4"; // par défaut attaché au torse

    ent = spawn("script_origin", self.origin);
    ent.angles = self.angles;

    ent enableLinkTo();
    ent linkTo(self, tag);

    ent playSound(soundAlias);

    ent thread deleteAfter(3); // auto clean
}

// Local sound dans le casque du joueur
safePlayLocalSound(soundAlias)
{
    if (isDefined(self) && isPlayer(self) && isDefined(soundAlias) && soundAlias != "")
    {
        self playLocalSound(soundAlias);
    }
}

// Nettoyage entité sonore temporaire
deleteAfter(time)
{
    wait time;
    if (isDefined(self))
        self delete();
}
destroy_on_end_game()
{
    level waittill_any("game_over");
    
    if(isdefined(self))
        self destroy();
}
