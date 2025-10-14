#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\gametypes\utilities;
#include common_scripts\_createfx;

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
	
	thread maps\zm\gametypes\maps_zm\mp_crash::CreateMap_mp_crash();
	thread maps\zm\gametypes\maps_zm\mp_crash_tropical::CreateMap_mp_crash_tropical();
    thread maps\zm\gametypes\maps_zm\mp_raid::CreateMap_mp_raid();
	thread maps\zm\gametypes\maps_zm\mp_bo2plaza::CreateMap_mp_bo2plaza();
    thread maps\zm\gametypes\maps_zm\mp_shipment_snow::CreateMap_mp_shipment_snow();
    thread maps\zm\gametypes\maps_zm\mp_firingrange::CreateMap_mp_firingrange();
    thread maps\zm\gametypes\maps_zm\mp_mountain::CreateMap_mp_mountain();
    thread maps\zm\gametypes\maps_zm\mp_radiation_sh::CreateMap_mp_radiation_sh();
    thread maps\zm\gametypes\maps_zm\zm_factory_sh::CreateMap_zm_factory_sh();
    thread maps\zm\gametypes\maps_zm\mp_asylum::CreateMap_mp_asylum();
    thread maps\zm\gametypes\maps_zm\mp_waw_castle::CreateMap_mp_waw_castle();
    thread maps\zm\gametypes\maps_zm\mp_invasion::CreateMap_mp_invasion();
    thread maps\zm\gametypes\maps_zm\mp_storm::CreateMap_mp_storm();
    thread maps\zm\gametypes\maps_zm\mp_abandon::CreateMap_mp_abandon();
    thread maps\zm\gametypes\maps_zm\mp_compact::CreateMap_mp_compact();
    thread maps\zm\gametypes\maps_zm\mp_complex::CreateMap_mp_complex();
    thread maps\zm\gametypes\maps_zm\mp_overgrown::CreateMap_mp_overgrown();
    thread maps\zm\gametypes\maps_zm\mp_subbase::CreateMap_mp_subbase();
    thread maps\zm\gametypes\maps_zm\mp_estate::CreateMap_mp_estate();
    thread maps\zm\gametypes\maps_zm\mp_estate_tropical::CreateMap_mp_estate_tropical();
    thread maps\zm\gametypes\maps_zm\mp_derail::CreateMap_mp_derail();
    thread maps\zm\gametypes\maps_zm\mp_rundown::CreateMap_mp_rundown();
    thread maps\zm\gametypes\maps_zm\mp_nuked::CreateMap_mp_nuked();
    thread maps\zm\gametypes\maps_zm\mp_dome::CreateMap_mp_dome();
    thread maps\zm\gametypes\maps_zm\mp_bloc_sh::CreateMap_mp_bloc_sh();
    thread maps\zm\gametypes\maps_zm\mp_bsf_dead_night::CreateMap_mp_bsf_dead_night();
    thread maps\zm\gametypes\maps_zm\mp_bo2_town::CreateMap_mp_bo2_town();
    thread maps\zm\gametypes\maps_zm\mp_afghan::CreateMap_mp_afghan();
    thread maps\zm\gametypes\maps_zm\mp_rust::CreateMap_mp_rust();
    thread maps\zm\gametypes\maps_zm\mp_highrise::CreateMap_mp_highrise();
    thread maps\zm\gametypes\maps_zm\mp_brecourt::CreateMap_mp_brecourt();
    thread maps\zm\gametypes\maps_zm\mp_quarry::CreateMap_mp_quarry();
    thread maps\zm\gametypes\maps_zm\mp_nightshift::CreateMap_mp_nightshift();
    thread maps\zm\gametypes\maps_zm\mp_boneyard::CreateMap_mp_boneyard();
    thread maps\zm\gametypes\maps_zm\mp_terminal::CreateMap_mp_terminal();
    thread maps\zm\gametypes\maps_zm\mp_favela::CreateMap_mp_favela();
    thread maps\zm\gametypes\maps_zm\mp_fav_tropical::CreateMap_mp_fav_tropical();
    thread maps\zm\gametypes\maps_zm\mp_seatown_snow::CreateMap_mp_seatown_snow();
    thread maps\zm\gametypes\maps_zm\mp_underpass::CreateMap_mp_underpass();
    thread maps\zm\gametypes\maps_zm\mp_checkpoint::CreateMap_mp_checkpoint();
	thread maps\zm\gametypes\maps_zm\mp_trailerpark::CreateMap_mp_trailerpark();

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
	box thread CreateWalls(angle);	
	box thread Perk_Icons();

    //player notifyonplayercommand("Box", "+activate");
	trigger = Spawn( "trigger_radius", box.origin, 1, 50, 50 );
	//trigger SetCursorHint( "HINT_NOICON" );
	//trigger sethintstring("Press ^3[{+activate}] ^7for random weapon [Cost: 950$]");

	while(1)
	{
		trigger waittill("trigger", user);
		user setLowerMessage("Box", "Press ^3[{+activate}] ^7to get a random Weapon [Cost: ^3950$^7]"); 
		box thread Box_Hud(user);

        if(user usebuttonpressed())
        {
            // PAS ASSEZ D'ARGENT
            if(user.score < box.price)
            {
                box iPrintln("^1Not enough Cash!");

                if(isDefined(user.character))
                {
                    switch(user.character)
                    {
                        case "Richtofen":
                            user playLocalSound("US_1mc_dh_sabotage");
                            break;
                        case "Nikolai":
                            user playLocalSound("US_1mc_dh_domination");
                            break;
                        case "Dempsey":
                            user playLocalSound("US_1mc_dh_demolition");
                            break;
                        case "Takeo":
                            user playLocalSound("US_1mc_dh_searchdestroy");
                            break;
                    }
                }
                continue;
            }

            // BOX DÉJÀ EN USAGE
            if(box.triggered == 1)
            {
                box iPrintln("^1Box is already in use!");
                continue;
            }

            // ACHAT NORMAL
            user.score -= box.price;
            user clearLowerMessage("Box");

            box.triggered = 1;
            foreach(client in level.players)
            {
                if(Distance(client.origin, box.origin) <= 130)
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
    	wait 1;
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
        }
        else if(user.score < box.price)
        {
            box iPrintln("^1Not enough Cash!");
        }
        else
        {
            box iPrintln("^1Box is already in use!");
        }
    }
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
		    if(Distance(player.origin, self.origin) <= 50)
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
    player setLowerMessage("Box", "Press ^3[{+activate}] ^7to get a random Weapon [Cost: ^3" + self.price + "$^7]"); 
	while(1)
	{
	    wait .1;
		if(Distance(self.origin, player.origin) > 50)
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
		if(Distance(client.origin, self.origin) <= (50)
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
		if(Distance(self.origin, player.origin) <= 50)
			player setLowerMessage("Box", "Press ^3[{+activate}] ^7to take " + getWeaponName(name));
		else
			player clearLowerMessage("Box");
		if(Distance(self.origin, player.origin) <= 50)
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
				player thread maps\zm\gametypes\weapons::SpecialistWeapon(name, player getCurrentWeapon());
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
				zombie thread maps\zm\gametypes\zombies::Zombie_BurnDamage();
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

Perk_Think(name, oldname)
{
    // level waittill("power");

    if (name == "quickrevive")
    {
        self thread onMaximalAmount(name);
        self thread CreateWalls(self.angles, true);
        self endon("maximal_quickrevive");
    }
    else
    {
        self thread CreateWalls(self.angles);
    }

    if (name == "pap")
        self thread pap_hint_hotfix();

    self endon("game_over"); // 🔥 important pour couper à la fin

    while(1)
    {
        cost = getCost(name);
        wait 0.25;

        foreach(player in level.players)
        {
            valid = false;

            if (Distance(player.origin, self.origin) <= 50 
                && player.isDown == 0 
                && player.team == "allies" 
                && player.buying == 0)
            {
                // Initialisation sécurisée
                if (!isDefined(player.machine_prone))
                    player.machine_prone = [];
                if (!isDefined(player.machine_prone[name]))
                    player.machine_prone[name] = 0;

                // 🪙 Prone points
                if (player getStance() == "prone" && player.machine_prone[name] == 0)
                {
                    player playLocalSound("UK_1mc_achieve_littlebird");
                    player.score += 100;
                    player.machine_prone[name] = 1;
                }

                // ✅ Conditions d'achat
                if (name == "pap" || name == "gobblegum")
                    valid = true;
                else
                {                
                    if (name == "quickrevive" && !player.quickrevive) valid = true;
                    if (name == "juggernog"   && !player.juggernog)   valid = true;    
                    if (name == "doubletap"   && !player.doubletap)   valid = true;    
                    if (name == "speedcola"   && !player.speedcola)   valid = true;    
                    if (name == "staminup"    && !player.staminup)    valid = true;
                }

                // ✅ Messages / achat
                if (valid)
                {
                    if (name != "pap")
                    {
                        player setLowerMessage("Perk_" + name, "Press ^3[{+activate}] ^7to buy " + oldname + " [Cost: ^3" + cost + "$^7]"); 
                        self thread Perk_Button(player, name, cost);
                    }
                    else if (self.active != true)
                    {
                        self Perk_Button(player, name, cost);
                    }
                }
            }
            else
            {
                player clearLowerMessage("Perk_" + name);
            }
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
		    if(Distance(player.origin, self.origin) <= 50 && player.isDown == 0 && player.team == "allies" && player.buying == 0 && !is_true(player.upgrade_hint))
				player setLowerMessage("Perk_pap", "Press ^3[{+activate}] ^7to upgrade your Weapon [Cost: ^35000$^7]");
			else if(Distance(player.origin, self.origin) <= 50 && is_true(player.upgrade_hint))
				player setLowerMessage("Perk_pap", "Press ^3[{+activate}] ^7for upgraded weapon"); 
			else if(Distance(player.origin, self.origin) > 50 )
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

hasUpgradedWeapon()
{
  weapon = self getCurrentWeapon();
  if(weapon == "m1911_upg_zm" || weapon == "m14_upg_zm" || weapon == "kar98k_upg_zm" || weapon == "ak47_upg_zm" || weapon == "aa12_upg_zm" || weapon == "at4_upg_zm" || weapon == "aug_upg_zm" || weapon == "m79_mp" || weapon == "spas12_grip_xmags_mp" || weapon == "beretta_upg_zm" || weapon == "beretta393_upg_zm" || weapon == "cheytac_upg_zm" || weapon == "coltanaconda_upg_zm" || weapon == "deserteagle_upg_zm" || weapon == "famas_upg_zm" || weapon == "fn2000_upg_zm" || weapon == "kriss_upg_zm" || weapon == "glock_upg_zm" || weapon == "masada_upg_zm" || weapon == "m4_upg_zm" || weapon == "m16_upg_zm" || weapon == "m79_upg_zm" || weapon == "mp40_upg_zm" || weapon == "m240_upg_zm" || weapon == "mg4_upg_zm" || weapon == "" || weapon == "spas12_grip_xmags_mp" || weapon == "beretta_upg_zm" || weapon == "beretta393_upg_zm" || weapon == "cheytac_upg_zm" || weapon == "coltanaconda_upg_zm" || weapon == "deserteagle_upg_zm" || weapon == "famas_upg_zm" || weapon == "fn2000_upg_zm" || weapon == "kriss_upg_zm" || weapon == "glock_upg_zm" || weapon == "masada_upg_zm" || weapon == "m4_upg_zm" || weapon == "m16_upg_zm" || weapon == "m79_upg_zm" || weapon == "mp40_upg_zm" || weapon == "m240_upg_zm" || weapon == "mg4_upg_zm" || weapon == "" || weapon == "spas12_grip_xmags_mp" || weapon == "beretta_upg_zm" || weapon == "beretta393_upg_zm" || weapon == "cheytac_upg_zm" || weapon == "coltanaconda_upg_zm" || weapon == "deserteagle_upg_zm" || weapon == "famas_upg_zm" || weapon == "fn2000_upg_zm" || weapon == "kriss_upg_zm" || weapon == "glock_upg_zm" || weapon == "masada_upg_zm" || weapon == "m4_upg_zm" || weapon == "m16_upg_zm" || weapon == "m79_upg_zm" || weapon == "mp40_upg_zm" || weapon == "m240_upg_zm" || weapon == "mg4_upg_zm" || weapon == "" || weapon == "spas12_grip_xmags_mp" || weapon == "beretta_upg_zm" || weapon == "beretta393_upg_zm" || weapon == "cheytac_upg_zm" || weapon == "coltanaconda_upg_zm" || weapon == "deserteagle_upg_zm" || weapon == "famas_upg_zm" || weapon == "fn2000_upg_zm" || weapon == "kriss_upg_zm" || weapon == "glock_upg_zm" || weapon == "masada_upg_zm" || weapon == "m4_upg_zm" || weapon == "m16_upg_zm" || weapon == "m79_upg_zm" || weapon == "mp40_upg_zm" || weapon == "m240_upg_zm" || weapon == "mg4_upg_zm" || weapon == "" || weapon == "spas12_grip_xmags_mp" || weapon == "beretta_upg_zm" || weapon == "beretta393_upg_zm" || weapon == "cheytac_upg_zm" || weapon == "coltanaconda_upg_zm" || weapon == "deserteagle_upg_zm" || weapon == "famas_upg_zm" || weapon == "fn2000_upg_zm" || weapon == "kriss_upg_zm" || weapon == "glock_upg_zm" || weapon == "masada_upg_zm" || weapon == "m4_upg_zm" || weapon == "m16_upg_zm" || weapon == "m79_upg_zm" || weapon == "mp40_upg_zm" || weapon == "m240_upg_zm" || weapon == "mg4_upg_zm" || weapon == "" || weapon == "spas12_grip_xmags_mp" || weapon == "beretta_upg_zm" || weapon == "beretta393_upg_zm" || weapon == "cheytac_upg_zm" || weapon == "coltanaconda_upg_zm" || weapon == "deserteagle_upg_zm" || weapon == "famas_upg_zm" || weapon == "fn2000_upg_zm" || weapon == "kriss_upg_zm" || weapon == "glock_upg_zm" || weapon == "masada_upg_zm" || weapon == "m4_upg_zm" || weapon == "m16_upg_zm" || weapon == "m79_upg_zm" || weapon == "mp40_upg_zm" || weapon == "m240_upg_zm" || weapon == "mg4_upg_zm" || weapon == "m1014_upg_zm" || weapon == "model1887_upg_zm" || weapon == "mp5k_upg_zm" || weapon == "p38_upg_zm" || weapon == "p90_upg_zm" || weapon == "pp2000_upg_zm" || weapon == "riotshield_upg_zm" || weapon == "rpd_upg_zm" || weapon == "sa80_upg_zm" || weapon == "scar_upg_zm" || weapon == "spas12_upg_zm" || weapon == "striker_upg_zm" || weapon == "stg44_upg_zm" || weapon == "tavor_upg_zm" || weapon == "ump45_upg_zm" || weapon == "uzi_upg_zm" || weapon == "usp_upg_zm" || weapon == "wa2000_upg_zm" || weapon == "m16_fmj_gl_mp")
    return true;
  return false;
}

Perk_Button(player, name, cost)
{
    player endon("disconnect");
    player endon("death");
    player notify("perk_button");
    player endon("perk_button");

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

                        if(isValidWeapon(current) && !player hasUpgradedWeapon())
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
            {
                player iPrintln("^1Not enough Cash!");

                // 🔊 Sons selon le personnage
                if(isDefined(player.character))
                {
                    switch(player.character)
                    {
                        case "Richtofen":
                            player playLocalSound("US_1mc_dh_sabotage");
                            break;
                        case "Nikolai":
                            player playLocalSound("US_1mc_dh_domination");
                            break;
                        case "Dempsey":
                            player playLocalSound("US_1mc_dh_demolition");
                            break;
                        case "Takeo":
                            player playLocalSound("US_1mc_dh_searchdestroy");
                            break;
                    }
                }
            }
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
		if(Distance(self.origin, model.origin) <= 50 && self usebuttonpressed())
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
	zombie thread maps\zm\gametypes\zombies::Zombie_Soulburn();
	wait 3;
	if(isDefined(zombie.hitbox))
	{
		zombie thread maps\zm\gametypes\zombies::Zombie_Death(2);
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
	zombie thread maps\zm\gametypes\zombies::Zombie_Animation("idle");
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
	zombie thread maps\zm\gametypes\zombies::Zombie_Animation("walk");
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
						self thread maps\zm\gametypes\player::Zombie_Knockback(zombie);
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

Weapon_Think(player, weaponname, name, cost)
{
    player endon("disconnect");
    player notify("weapon_think_" + weaponname);
    player endon("weapon_think_" + weaponname);

    while(1)
    {
        if(Distance(self.origin, player.origin) <= 50)
        {
            if(player hasWeapon(name))
            {
                // Stoppe l’achat d’arme si déjà possédée
                player notify("weapon_buy_" + weaponname);

                // Affiche achat de munitions
                player setLowerMessage("Weapon_" + name, "Press ^3[{+activate}] ^7to buy Ammo for " + weaponname + " [Cost: ^3100$^7]");
                self thread Weapon_BuyAmmo(player, name, 100, weaponname);
            }
            else
            {
                // Stoppe l’achat de munitions si pas d’arme
                player notify("weapon_buyammo_" + weaponname);

                // Affiche achat de l’arme
                player setLowerMessage("Weapon_" + name, "Press ^3[{+activate}] ^7to buy " + weaponname + " [Cost: ^3" + cost + "$^7]");
                self thread Weapon_Buy(player, name, cost, weaponname);
            }
        }
        else
        {
            player clearLowerMessage("Weapon_" + name);

            // Stoppe les 2 quand le joueur s’éloigne
            player notify("weapon_think_" + weaponname);
            player notify("weapon_buy_" + weaponname);
            player notify("weapon_buyammo_" + weaponname);
        }
        wait .5;
    }
}

// Achat d’ARME uniquement
Weapon_Buy(player, name, cost, weaponname)
{
    player endon("disconnect");
    player endon("death");
    player notify("weapon_buy_" + weaponname);
    player endon("weapon_buy_" + weaponname);

    while(1)
    {
        if(player usebuttonpressed() && Distance(self.origin, player.origin) <= 90)
        {
            if(player.score >= cost)
            {
                player.score -= cost;

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

                // Dès que l’arme est achetée, on stoppe Weapon_Buy
                player notify("weapon_buy_" + weaponname);
            }
            else
            {
                player iPrintln("^1Not enough Cash!");
                self thread PlayNoMoneySound(player); // ta version déjà existante
            }
        }
        wait .1;
    }
}

// Achat de MUNITIONS uniquement avec anti-spam
Weapon_BuyAmmo(player, name, cost, weaponname)
{
    player endon("disconnect");
    player endon("death");
    player notify("weapon_buyammo_" + weaponname);
    player endon("weapon_buyammo_" + weaponname);

    if(!isDefined(player.lastAmmoBuyTime))
        player.lastAmmoBuyTime = 0; // variable de cooldown

    while(1)
    {
        if(player usebuttonpressed() && Distance(self.origin, player.origin) <= 90)
        {
            if(getTime() - player.lastAmmoBuyTime >= 1000) // 1000ms = 1 sec
            {
                if(player.score >= cost)
                {
                    player.score -= cost;
                    player giveMaxAmmo(name);
                    player iPrintln("^2Ammo refilled!");
                }
                else
                {
                    player iPrintln("^1Not enough Cash for Ammo!");
                    self thread PlayNoMoneySound(player); // ta fonction existante
                }

                // Mise à jour du cooldown
                player.lastAmmoBuyTime = getTime();
            }
            else
            {
                // Si le joueur spam trop vite
                player iPrintln("^3Wait before buying ammo again!");
            }
        }
        wait .1;
    }
}

// Sons quand pas assez d’argent
PlayNoMoneySound(player)
{
    if(isDefined(player.character))
    {
        switch(player.character)
        {
            case "Richtofen":
                player playLocalSound("US_1mc_dh_sabotage");
                break;
            case "Nikolai":
                player playLocalSound("US_1mc_dh_domination");
                break;
            case "Dempsey":
                player playLocalSound("US_1mc_dh_demolition");
                break;
            case "Takeo":
                player playLocalSound("US_1mc_dh_searchdestroy");
                break;
        }
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
	self.gumhud = self createIcon(icon, 32, 32);
	self.gumhud setPoint("BOTTOMRIGHT", "BOTTOMRIGHT", -43, -118);	
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
					if(zombie.type == "normal" || zombie.type == "dog")
					{
						zombie thread Zombie_SoulburnTemp();
						zombie thread maps\zm\gametypes\zombies::Zombie_Death(3);
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
					if(zombie.type == "normal")
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
	self thread maps\zm\gametypes\zombies::Zombie_Animation("idle");
	self.attract = 1;
	self moveTo(self.origin,1);
	wait time;
	self.attract = 0;
	self thread maps\zm\gametypes\zombies::Zombie_Mode();
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
	drop thread maps\zm\gametypes\zombies::Zombie_Drop(type);
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
				drop thread maps\zm\gametypes\zombies::Zombie_Drop();
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
					zombie thread maps\zm\gametypes\zombies::Zombie_Death(0);
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
					zombie thread maps\zm\gametypes\zombies::Zombie_Death();
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
    door3 SetHintString("Press ^3&&1 ^7to open the door [Cost: ^31500$]");
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press ^3[{+activate}] ^7to open the door [Cost: ^31500$^7]");
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
    door SetHintString("Press ^3&&1 ^7to open the door [Cost: ^31500$]");
	door2 SetCursorHint( "HINT_NOICON" );
    door2 SetHintString("Press ^3&&1 ^7to open the door [Cost: ^31500$]");
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press ^3[{+activate}] ^7to open the door [Cost: ^31500$^7]");
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
    door3 SetHintString("Press ^3&&1 ^7to open the door [Cost: ^32000$]");   
	for(;;)
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press ^3[{+activate}] ^7to open the door [Cost: ^32000$^7]");
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
    door SetHintString("Press ^3&&1 ^7to open the door [Cost: ^32000$^7]");
	door2 SetCursorHint( "HINT_NOICON" );
    door2 SetHintString("Press ^3&&1 ^7to open the door [Cost: ^32000$^7]");
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press ^3[{+activate}] ^7to open the door [Cost: ^32000$^7]");
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
    door SetHintString("Press ^3&&1 ^7to open the door [Cost: ^32000$]");
	door2 SetCursorHint( "HINT_NOICON" );
    door2 SetHintString("Press ^3&&1 ^7to open the door [Cost: ^32000$]");  
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press ^3[{+activate}] ^7to open the door [Cost: ^32000$^7]"); 
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
	self setLowerMessage("airplane", "Press ^3[{+activate}] ^7to fly with the airplane!");
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
					zombie thread maps\zm\gametypes\zombies::Zombie_BurnDamage();
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
    door SetHintString("Press ^3[{+activate}] ^7to open secret entrance! [Cost: ^32000$^7]");
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press ^3[{+activate}] ^7to open secret entrance! [Cost: ^32000$^7]");
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
	self setLowerMessage("secretEntrance", "Press ^3[{+activate}] ^7to open the secret door! [Cost: ^32000$^7]");
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
PastTheDoor(pos1,pos2,time,price)
{
	if(!isDefined(price))
		price = 0;
	door = spawn("script_model", pos1);
    trigger = Spawn( "trigger_radius", door.origin, 0, 50, 200 );
   	door.trigger = trigger;
	door makeTeamUsable( "allies" );
	door useTriggerRequireLookAt();
	door SetCursorHint( "HINT_NOICON" );
    door SetHintString("Press ^3[{+activate}] ^7Do you want to go behind the door ?");
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press ^3[{+activate}] ^7Do you want to go behind the door ?");
		wait 0.5;
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
    door SetHintString("Press ^3[{+activate}] ^7to teleport [Cost: ^3" + price + "$^7]");
	thread TeleFx(pos1);
	for(;;) 
	{
		trigger waittill( "trigger", player );
		player setLowerMessage("door", "Press ^3[{+activate}] ^7to teleport! [Cost: ^3" + price + "$^7]");
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
		self.papcountdown thread destroy_on_end_game();
		if(!isDefined(time))
			time = 30;
		v = true;
		while(v)
		{
			self.papcountdown.value setValue(time);
			self.papcountdown.value thread destroy_on_end_game();
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
