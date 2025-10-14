#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\d_ops_arcade\utilities;

#using_animtree( "multiplayer" );


// =========================================================
//
// Contains all playerspecific functions
// Contains all playerspecific functions
//
// =========================================================

test()
{
	if(getDvarInt("devmode") == 1)
		return;
    self endon("disconnect");
	self notifyonplayercommand("test", "+actionslot 1");
	//self setClientDvar("cg_draw2d", 0);
	//self thread playLight();
	//self setClientDvar("cg_thirdperson", 1);
	for(;;)
	{	
		self waittill("test");
		self thread Swarm();
	}
}
playLight()
{
	self endon("disconnect");
	while(true)
	{
		fx = spawnFx(level.playerlight,self.origin);
		if(self.team == "allies")
		{
			triggerfx(fx);
		}
		waitFrame();
		fx delete();
	}
}
onPlayerConnected()
{
	//if(true)
	//	return;
	//if(getDvarInt("allow_spectator") == 1)
	//    self thread noSpectator();
	if(self.name == "DvR3I PaFF")	
		self freezecontrols(false);
	else
		self freezecontrols(true);
	if(getDvar("g_gametype") == "dead_ops_arcade")
		setDvar( "z_doa", 1 ); // 0 = Disable Dead Ops Arcade | 1 = Enable Dead Ops Arcade | 2 = Enable Dead Ops Arcade First Person
	self setClientDvar("ui_hud_showobjicons", 1);
	self setClientDvar("hud_enable", 1);
	//self setClientDvar("r_specular", 0);
	//self.score = getDvarInt("start_money");
	self setCorrectScore();
	self.loadoutcounter = 0;
	self.perklist = [];
	self.droplist = [];   
	level notify("playersize");
	level notify("newPlayerAvailable");
	//self thread CashHud();
	self thread MyCash();
	self thread onDisconnect();
	self thread setWeaponValues();
	self thread maps\zm\d_ops_arcade\weapons::WonderWeapons();

		self thread test();	
	self setClientDvar("ragdoll_enable", 1);
	self AllowSpectateTeam("allies", true );
	self AllowSpectateTeam("axis", true );
	if(getDvarInt("allow_camp") == 1)
		self thread AntiCamp();
	//if(getDvarInt("allow_heli") == 1)
		//	self thread spawnHeli();
	self maps\mp\gametypes\_menus::addToTeam( "allies", true );
	self.pers["class"] = "CLASS_CUSTOM1";
	self.class = self.pers["class"];
	self maps\mp\_utility::closeMenus();
	self thread maps\mp\gametypes\_playerlogic::spawnClient();
	self waittill("spawned_player");
	self thread SpawnIntro();
	self thread doLoadout();
	self thread Ability(); 
	self thread PerkIcons();
}
onPlayerSpawned()
{
    self endon("disconnect");
	for(;;)
	{
	    self waittill("spawned_player");
	    self.character_richtofen_icon destroy();
		self.character_nikolai_icon destroy();
		self.character_dempsay_icon destroy();
		self.character_takeo_icon destroy();
		//self thread doLoadout();
		if(getDvarInt("z_doa") >= 1)
		{
			self thread changeCameraView();
		}
	}
}

doLoadout()
{
	self endon("disconnect");
    //if(getDvarInt("night") == 1)
	//    self visionsetnakedforplayer("cobra_sunset3", 0);
	if(getDvarInt("bloodscreen") == 1)
        self setClientDvar("cg_drawSplatter", 1);	
	if(isDefined(level.spawns_humans[0]))
        self setOrigin(level.spawns_humans[randomInt(level.spawns_humans.size)]);	
	//self setClientDvar("r_debugShader", 4);	
	self setClientDvar("player_sprintUnlimited", 0);
	if(self.score < 500)
	{
		self.score = 1500;
	}
	self takeAllWeapons();
	self.hud_damagefeedback.color = (1,0,0);	
	self.buying = 0;
	self.hidden = 0;
	self.isDown = 0;
	self.mykills = 0;
	self.meleekills = 0;
	self.maxhealth = 100;
	self.damage_dealed = 0;
	self.health = 100;
	self.revivetime = 50;
	self.reviverange = 0;
	self.doubledamage = false;
	self.hasspecialist = false;
	self.weapon_maximum = 0;
	self.quickrevive = false;
	self.juggernog = false;
	self.doubletap = false;
	self.speedcola = false;
	self.staminup = false;
	self.validweapon = true;
	self.oldmoney = self.score;
	self.mindfucked = false;
	self.fog_rolling_in = false;
	self.isInChopper = false;
	self thread giveStartWeapon();
	self setClientDvar("player_sprintUnlimited", 0);
	self _clearPerks();
	self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
	self SetRearViewRenderEnabled(true); 
	self thread spawnSafety();	
	self thread setPlayerModel();
	///self thread Grenadesystem();
	if(getDvarInt("streaks") == 1)
		self thread StreakSystem();

	self thread maps\zm\d_ops_arcade\weapons::ParalyzerRecovery();
	self notify("loadout_complete");
	level notify("newPlayerAvailable");
	wait 2;	
	self waittill("death");
	if(level.state == "ingame")
	{
		self notify("menuresponse", game["menu_team"], "spectator");
		endgame = self maps\zm\d_ops_arcade\zw::tryEndGame();		
		if(endgame)
			return;
		self thread teamFix();	
		level waittill("end");
		self notify("menuresponse", game["menu_team"], "allies");
		wait .1;
		self notify("menuresponse", "changeclass", "class1");
		self waittill("spawned_player");
		self thread doLoadout();
	}
	else if(level.state == "intermission")
	{
		self waittill("spawned_player");
		self thread doLoadout();
	}
}
setCorrectScore()
{
	round = level.round;
	if(round < 1 || !isDefined(level.round))
		round = 1;
	base = round * 500;
	self.score = base;
}
teamFix()
{
	level endon("end");
	self endon("disconnect");
	self waittill("spawned_player");
	waitFrame();
	if(level.state != "intermission")
	{
		self notify("menuresponse", game["menu_team"], "spectator");
		self thread teamFix();
	}
}
giveStartWeaponFirst()
{
	self endon("death");
	self endon("disconnect");
	self waittill("intro_complete");
	weapon = getDvar("start_weapon");
	self _giveWeapon(weapon);
	self giveMaxAmmo(weapon);
	wait .3;
	self switchToWeapon(weapon);
}
giveStartWeapon()
{
	self endon("death");
	self endon("disconnect");
	if(!isDefined(self.firsteverspawn))
	{
		self waittill("intro_complete");
		self.firsteverspawn = false;
	}
	weapon = getDvar("start_weapon");
	self _giveWeapon(weapon);
	self giveMaxAmmo(weapon);
	wait .3;
	self switchToWeapon(weapon);
	
}
setWeaponValues()
{
	wait 3;
	self.weaponlist = [];
	self.weaponlistsize = 2;
	self.weaponlist[getDvar("start_weapon")] = 0;
	self.weaponlist["deserteagle_akimbo_mp"] = 0;
	foreach(weapon in level.gun)
	{
		self.weaponlist[weapon] = 0;
		self.weaponlistsize++;
	}
}
spawnSafety()
{
	self endon("disconnect");
	self.protected = 1;
	wait 5;
	self notify("player_is_ready");
	self.protected = 0;
}
getValidPlayerModel(model,invalid)
{
	foreach(invi in invalid)
	{
		if(model == invi)
			return false;
	}
	return true;
}
setPlayerModel()
{
	time = randomInt(5);
	for(i = 0;i < time;i++)
	{
		waitFrame();
	}
	invalid = [];
	length = 0;
	model = undefined;
	viewmodel = undefined;
	foreach(player in level.players)
	{
		if(isDefined(player.character))
		{
			invalid[length] = player.character;
			length++;
		}
	}
	success = self getValidPlayerModel("Richtofen",invalid);
	if(success)
	{
		self.character = "Richtofen";
		model = "zw2_richtofen_pm";
		viewmodel = "zw2_richtofen_vh";	
		self playlocalsound("RU_1mc_armsrace"); 
	}
	else
	{
		success = self getValidPlayerModel("Nikolai",invalid);
		if(success)
		{
			self.character = "Nikolai";
			model = "zw2_nikolai_pm";
			viewmodel = "zw2_nikolai_vh";
			self playlocalsound("RU_1mc_boost"); 
		}
		else
		{
			success = self getValidPlayerModel("Dempsey",invalid);
			if(success)
			{
				self.character = "Dempsey";
				model = "zw2_dempsay_pm";
				viewmodel = "zw2_dempsay_vh";	
				self playlocalsound("RU_1mc_gtw"); 
			}
			else
			{
				success = self getValidPlayerModel("Dempsey",invalid);
				if(success)
				{
					self.character = "Takeo";	
					model = "zw2_takeo_pm";
					viewmodel = "zw2_takeo_vh";	
					self playlocalsound("RU_1mc_draw"); 
				}
			}
		}
	}
	if(isDefined(model))
	{
		//viewmodel = "zw2_richtofen_vh";	 // disables other viewhands
		self detach(self.headmodel);
		//self setClientDvar("cg_thirdPerson", 1);
		
		//model = "zombie_body_test";
		self setModel(model);
		//self attach("nazi_head", "j_spine4" ); 
		self SetViewModel(viewmodel);
	}	
}
noSpectator() // deprecated
{
    self endon("disconnect");
    while(1)
	{
	    wait 2;
		if(self.team == "spectator")
		{
			self notify("menuresponse", game["menu_team"], "allies");	
			wait .1;
			self notify("menuresponse", "changeclass", "class1");	
		}
	}	
}
onDisconnect()
{
	self waittill("disconnect");
	self setClientDvar("hud_enable", 1);
	self thread onDisConnectForServer();
}
onDisConnectForServer()
{
	wait 2;	
	level notify("playersize");
	endgame = self maps\zm\d_ops_arcade\zw::tryEndGame();	
}
/////////////////// Revivesystem ////////////////
revivePlayer(time)
{
	self endon("revived");
	self endon("death");
	self endon("disconnect");
	self.getRevived = false;
	current = self getCurrentWeapon();
	//lastweapon = self hasWeapon(getDvar("start_weapon"));
	primaryWeapons = self getWeaponsListPrimaries();
	c = 0;
	foreach(primary in primaryWeapons)
	{
		c++;
	}	
	if(c > 1 && !self hasWeapon(getDvar("start_weapon")))
		lastweapon = false;
	else
		lastweapon = true;
	c = 0;
	foreach(primary in primaryWeapons)
	{
		c++;
	}
	if(c > 2)
		lastweapon = false;
	self thread VisionFadeOut();
	self thread createReviveShader();
	self thread reviveCountDown();
	self thread takePerks();
	self notify("isDown");
	while(1)
	{
		wait .2;
		foreach(player in level.players)
		{
			if(player != self && player.isDown == 0 && Distance(player.origin, self.origin) <= 90 && !self.getRevived && player.reviverange == 0)
			{
				self thread revivePlayer_Triggered(player,current,lastweapon);
			}
		}
	}
}
takePerks()
{
	self.speedcola = false;
	self thread alsoTakeQuickRevive();
	self.juggernog = false;
	self.doubletap = false;
	self.staminup = false;

	self _unsetperk("specialty_fastreload");
	self _unsetperk("specialty_quickdraw");
	self _unsetperk("specialty_lightweight");
	self _unsetperk("specialty_fastmantle");
	self _unsetperk("specialty_fastsprintrecovery");
	self _unsetperk("specialty_marathon");
	self setClientDvar("player_sprintUnlimited", 0);

	self.perklist = [];
}
alsoTakeQuickRevive()
{
	self endon("disconnect");
	wait 1;
	self.quickrevive = false;
}
reviveCountDown()
{
	self endon("disconnect");
	self endon("death");
	self endon("revived");
	
	countdowntext = self createFontString("objective", 1.3);
	countdowntext setPoint("BOTTOM", "BOTTOM", 0, -70);
	if(level.players.size == 1 && self.quickrevive)
	{
		countdowntext setText("Self reviving in:");
		j = getDvarInt("selfmediation_time");
	}		
	else
	{
		countdowntext setText("Bleeding out in:");	
		j = getDvarInt("bleedout_time");
	}		
	countdowntext.hideWhenInMenu = true;
	countdowntext.color = level.HUDCOLOR;
	countdowntext.glowalpha = 1;
	countdowntext.glowcolor = (1,0,0);
	countdown = self createFontString("objective", 1.3);
	countdown setPoint("BOTTOM", "BOTTOM", 0, -50);	
	countdown.hideWhenInMenu = true;
	countdown.color = level.HUDCOLOR;
	countdown.glowalpha = 1;
	countdown.glowcolor = (1,0,0);
	self thread destroyBleedOutCountdown(countdown,countdowntext);
	self thread destroyBleedOutCountdown2(countdown,countdowntext);
	self thread eeRaygun();
	for(i = j;i > 0;i--)
	{		
		countdown setValue(i);	
		wait 1;
		if(self.getRevived)
			i++;
	}
	self notify("destroyBleedout");
}
destroyBleedOutCountdown(a,b)
{
	self waittill_any("death", "revived", "destroyBleedout");
	if(isDefined(a))
	{
		a destroy();
		b destroy();
	}
}
destroyBleedOutCountdown2(a,b)
{
	level waittill("game_over");
	if(isDefined(a))
	{
		a destroy();
		b destroy();
	}
}
eeRaygun()
{
	self endon("disconnect");
	self endon("death");
	self endon("revived");
	self notifyonPlayerCommand("F", "-activate");
	for(i = 0;i < 3;i++)
	{
		self waittill("F");
		if(self hasWeapon(level.raygunm2))
		{
			a = "^" + randomInt(10) + "Revive me ";
			b = "^:" + "PLS ";
			c = "^" + randomInt(10) + "I have the ";
			d = "^" + randomInt(10) + "RAYGUN";
			self sayAll(a + b + c + d);
		}	
	}
}

revivePlayer_Triggered(reviver,current,lastweapon)
{
	self endon("disconnect");
	self endon("death");
	self notify("newRevive");
	self endon("newRevive");
	self endon("revived");
	reviver endon("cannotrevive");	
	self thread revivePlayerHud(reviver);
	reviver notifyonplayercommand("RevivePlayer", "+activate");
	counter = 0;
	reviver AllowJump(false);
	reviver.reviverange = 1;
	while(1)
	{
		wait .1;
		if(reviver useButtonPressed() && reviver.isDown == 0)
		{
			self.getRevived = true;
			reviver disableweapons();
			counter++;
			self setMoveSpeedScale(0);
			self.progress updateBar(counter/reviver.revivetime);
			reviver.progress updateBar(counter/reviver.revivetime);
			self thread onVictimDeath(reviver);
			if(counter == reviver.revivetime)
			{
				iPrintln(reviver.name + " revived " + self.name);			
				reviver notify("revived");
				reviver AllowJump(true);
				reviver enableweapons();
				reviver clearLowerMessage("Revive");
				reviver.reviverange = 0;
				reviver.speedcola = false;
				self setMoveSpeedScale(1);
				self.lastStand = undefined;
				self.maxHealth = 100;
				self EnableWeaponSwitch();
				self setClientDvar("player_sprintUnlimited", 0);
				self _clearPerks();
				if(!lastweapon)
					self takeWeapon(getDvar("start_weapon"));
				self switchToWeapon(current);	
				//self thread giveOldWeapons();
				self thread maps\mp\gametypes\_damage::canGetAttackedAgain();
				level notify("newPlayerAvailable");
				self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
				self maps\mp\gametypes\_playerlogic::lastStandRespawnPlayer();				
				self notify("revived");	
			}
		}
		else
		{
			counter = 0;
			reviver AllowJump(true);
			self.progress updateBar(counter/reviver.revivetime);
			reviver.progress updateBar(counter/reviver.revivetime);		
			reviver enableweapons();
			self setMoveSpeedScale(1);			
			self.getRevived = false;
		}			
	}
}
giveOldWeapons()
{
	c = 0;
	primary = undefined;
	foreach(weapon in self.oldweapons)
	{
		if(c == 0)
			primary = weapon.name;
		self giveWeapon(weapon.name);
		self GetWeaponAmmoClip(weapon.clip);
		self GetWeaponAmmoStock(weapon.stock);
		c++;
	}
	self switchToWeapon(primary);
}
onVictimDeath(reviver)
{
	reviver notify("callVictimDeath");
	reviver endon("callVictimDeath");
	reviver endon("death");
	reviver endon("disconnect");
	reviver endon("revived");
	self endon("revived");
	self waittill_any("death", "disconnect");	
	reviver AllowJump(true);
	reviver enableweapons();
	reviver clearLowerMessage("Revive");
	reviver.reviverange = 0;
	reviver notify("revived");
}
revivePlayerHud(reviver)
{
	self endon("disconnect");
	reviver endon("cannotrevive");
	reviver endon("revived");
	reviver setLowerMessage("Revive", "Press ^3[{+activate}] ^7to revive your teammate!");
	reviver thread destroy_on_end_game();
	self thread revivebar("Getting revived by " + reviver.name);
	reviver thread revivebar("Reviving " + self.name);
	for(;;)
	{
		wait .2;
		if(Distance(self.origin,reviver.origin) > 90 || reviver.isDown == 1)
		{
			reviver clearLowerMessage("Revive");
			reviver.reviverange = 0;
			reviver AllowJump(true);
			reviver enableweapons();
			self.getRevived = false;
			self notify("cannotrevive");
			reviver notify("cannotrevive");
		}
	}
}
revivebar(msg)
{
	if(isDefined(self.progress))
	{
		self.progress.bar destroy(); 
		self.progress destroy();
		self.progresstext destroy();		
	}
	self.progress = createPrimaryProgressBar( -275 );
	self.progress.bar.y = 100; 
	self.progress.y = 100;
	self.progresstext = createPrimaryProgressBarText( -275 );
	self.progresstext setText(msg);
	self.progresstext.y = 80;
	self waittill_any("death","cannotrevive", "revived");
	self.progress.bar destroy(); 	
	self.progresstext destroy();
	self.progress destroy();
}
VisionFadeOut() // somehow not working
{
	self endon("disconnect");
	self endon("death");
	wait 3;
	self visionsetnakedforplayer("intro", 1);
	self waittill("revived");
	if(getDvarInt("night") == 1)
		self visionsetnakedforplayer("cobra_sunset3", 2);
}
createReviveShader()
{
	level endon("game_over");

    self.reviveIcon = newTeamHudElem( self.team );
	self.reviveIcon setShader( "specialty_pistoldeath", 8, 8 ); // waypoint_revive
	self.reviveIcon setWaypoint( true, true );
	self.reviveIcon SetTargetEnt( self );
	self thread changeIconColor();
	self.reviveicon endon("notdefinedanymore");
	self waittill_any("revived", "death", "disconnect");
	self.reviveIcon ClearTargetEnt();
	self.reviveicon destroy();
}
changeIconColor()
{
	self endon("revived");
	self endon("death");
	self endon("disconnect");
	change = 1;
	for(i = 0;i < 40;i++)
	{
		self.reviveicon.color = (1,change,change);
		wait 1;
		change -= 0.020; // 0.025
	}
}

showorhideZombiehud(zombiehud,zombiecounter,first)
{
	self endon("disconnect");
	if(level.state == "intermission")
	{
		if(!isDefined(first))
		{
			//zombiehud fadeovertime(2);
			zombiecounter fadeovertime(2);
		}		
		//zombiehud.alpha = 0;
		zombiecounter.alpha = 0;
	}
	else if(level.state == "ingame")
	{
		//zombiehud fadeovertime(2);
		zombiecounter fadeovertime(2);
		//zombiehud.alpha = 1;
		zombiecounter.alpha = 1;
	}
	level waittill_any("start", "end");
	zombiecounter setValue(level.zombies_left);
	self thread showorhideZombiehud(zombiehud,zombiecounter);
}

MyCash()
{
	self endon("disconnect");
	level endon("game_over");
	self waittill("intro_complete");
	hudbackground = self createIcon("cardicon_abduction", 240, 115);
	hudbackground setPoint("TOPLEFT", "TOPLEFT", 10, -35);
	cashhud = self createFontString("objective", 1.5);
	//cashhud setPoint("TOPRIGHT", "TOPRIGHT", -50, 70);
	cashhud setPoint("TOPLEFT", "TOPLEFT", 178, 20);
	cashhud.label = &"";
	cashhud setValue(self.score);
	cashhud.color = (0.560, 0.941, 0.972);
	cashhud.glowalpha = 1;
	cashhud.glowcolor = (0.560, 0.941, 0.972);
	cashhud.hideWhenInMenu = true;
	cashhud.foreground = true;
	cashhud thread destroy_on_end_game();
	while(true)
	{
		wait .5;
		if(self.score != self.oldmoney)
		{
			cashhud thread incrementAnim(self.oldmoney, self.score, (0.560, 0.941, 0.972));
			self.oldmoney = self.score;
		}			
	}
}
endCashHud(cashhud)
{
	self endon("disconnect");
	level waittill("playersize");
	for(i = 0;i < cashhud.size;i++)
	{
		self waittill_any("disconnect", "game_over");;
		cashhud[i] destroy();
	}
	self thread CashHud(false);
}
CashHud(waiting)
{
	self endon("disconnect");
	self notify("cashhud");
	self endon("cashhud");
	self endon("game_over");
	if(!isDefined(waiting))
		self waittill("intro_complete");
	y = 85;
	cashhud = [];
	money = self.score;
	j = 0;
	for(i = 0; i < level.players.size; i++)
	{
		if(self == level.players[i])
		{
			cashhud[i] = self createFontString("objective", 1.7);
			j = i;
		}		
		else
			cashhud[i] = self createFontString("objective", 1.3); ////// test level.players[i] instead of self
		cashhud[i] setPoint("RIGHT", "RIGHT", -10, y);
		cashhud[i] setValue(level.players[i].score);
		cashhud[i].color = (0.560, 0.941, 0.972);
		cashhud[i].glowalpha = 1;
		cashhud[i].glowcolor = (0.560, 0.941, 0.972);
		cashhud[i].hideWhenInMenu = true;
		cashhud[i].foreground = true;
		//cashhud[i] thread destroy_on_end_game();
		//self thread refreshPlayerHud(level.players[i], cashhud);
		y -= 20;
	}
	self thread endCashHud(cashhud);
	while(true)
	{
		wait .1;
		for(i = 0;i < level.players.size;i++)
		{
			if(level.players[i].score != level.players[i].oldmoney)
			{
				cashhud[i] thread incrementAnim(level.players[i].oldmoney, level.players[i].score, (0.560, 0.941, 0.972));
				level.players[i].oldmoney = level.players[i].score;
			}
		}		
	}
}
incrementAnim(old, new, col)
{
	self notify("newanim");
	self endon("disconnect");
	self endon("newanim");
	if(!isDefined(col))
		col = self.color;
    self.color = (0, 0, 0);

    diff = old - new;
    if(diff < 100 && diff > -100)
		inc = 1;
    else
		inc = 10;
    if(old > new)
	{
		for(i=old;i>=new;i-=inc)
		{
			self setValue(i);
			waitFrame();
		}
    } 
	else 
	{
		for(i = old;i <= new;i += inc)
		{
			self setValue(i);
			waitFrame();
		}
    }
    self.color = col;
    self.animInProg = false;
}
refreshPlayerHud(player, hud)
{
	level endon("playersize");
	player endon("disconnect");
	while(1)
	{
		wait .5;
		if(!isDefined(player))
			level notify("playersize");
		else
		{
			foreach(h in hud)
				h setvalue(player.score);
		}
	}
}
createText(font, scale, align, relative, x, y, text)
{
	elem = self createFontString(font, scale, self);
	elem setPoint(align, relative, x, y);
	elem setText(text);
	elem.alpha = 1;
	elem.glowalpha = 1;
	elem.sort = 100;
	elem.HideWhenInMenu = true;
	return elem;
}
//self.hud_background2 = self createRectangle("line_horizontal","TOPLEFT", "TOPLEFT", -70, 0, 250, 40, (1,0,0), 0);
//createRectangle(align, relative, x, y, width, height, color, shader, sort, alpha)
createRectangle(shader, align,relative,x,y,width,height,color,alpha) 
{
	level endon("game_over");

    precacheShader(shader);
    barElemBG = newClientHudElem( self );
    barElemBG.elemType = "bar";
    if (!level.splitScreen )
    {
       barElemBG.x = -2;
       barElemBG.y = -2;
    }
    barElemBG.width = width;
    barElemBG.height = height;
    barElemBG.align = align;
    barElemBG.relative = relative;
    barElemBG.xOffset = 0;
    barElemBG.yOffset = 0;
    barElemBG.children = [];
    barElemBG.sort = 100;
    barElemBG.color = color;
    barElemBG.alpha = alpha;
    barElemBG setParent( level.uiParent );
    barElemBG setShader( shader, width , height );
    barElemBG.hidden = false;
    barElemBG setPoint(align,relative,x,y);
	barElemBG.foreground = false;
	barElemBG.hideWhenInMenu = true;
	//barElemBG thread destroy_on_end_game();
    return barElemBG;
}
printAngle()
{
	self endon("disconnect");
	for(;;)
	{
		wait 1;
		self iprintln(self getPlayerAngles());
	}
}
AntiCamp()
{
	self endon("disconnect");
	self.anticampcounter = 0; //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	counter = 0;
	max = getDvarInt("allow_maxcamptime");
	self waittill("spawned_player");
	while(1)
	{
		oldpos = self.origin;	
		validspot = true;
		wait 1;		
		foreach(spot in level.spawns_humans)
		{
			if(Distance(self.origin,spot) < 100)
				validspot = false;
		}
		if(self.isDown == 0 && self.protected == 0 && validspot)
		{
			//iprintln(counter);
			if(Distance(self.origin, oldpos) < 120 && self.isDown == 0 && self.team == "allies")
				counter++;
			else
				counter = 0;
			if(counter > max)
			{
				self.anticampcounter++;
				counter = 0;
				spawnpos = self validdragonspawn();
				//if(BulletTracePassed(self.origin, self.origin+(0,0,1000), false, self) && BulletTracePassed(self.origin, self.origin+(10000,10000,3000), false, self))
				if(BulletTracePassed(self.origin, self.origin+(0,0,1000), false, self) && spawnpos != (0,0,0))
				{
					dragon = spawn("script_model", self.origin+spawnpos);
					dragon setModel("zw2_alduin");
					dragon scriptModelPlayAnim("zw2_alduin_fly_forward");
					dragon.speed = 12;
					dragon thread maps\zm\d_ops_arcade\zw::Dragon_Wind();
					movetoLoc = VectorToAngles(self.origin - dragon.origin);	
					dragon RotateTo((0,movetoLoc[1]-90,0), 0.3);
					time = Distance(dragon.origin, self.origin+(-10000,-10000,-10000)) / (dragon.speed*100);
					dragon moveTo(self.origin+(0,0,1500), time/2);
					if(self.anticampcounter > 1)
						self thread maps\zm\d_ops_arcade\zombies::InitiateMechThreat(self.anticampcounter);
					wait time/3;
					//self iprintlnBold("^1Dragonfire! RUN!"); // do better HUD?
					self sayAll("Watch out for the Dragonfire!");
					movetoLoc = VectorToAngles(dragon.origin - self.origin);	
					self setplayerangles((0,movetoLoc[1],0)); 
					self thread InitiateDragonFire(dragon);
					wait time/6;
					a = spawnpos[0] * -1;
					b = spawnpos[1] * -1;
					dragon moveTo(self.origin+(a,b,3000), time/2);
					wait ((time/3)*2);
					dragon delete();
				}
				else
				{
					level.spawns_zombies[level.spawns_zombies.size+1] = self.origin;
					//thread maps\zm\d_ops_arcade\zw::locatePos(level.spawns_zombies[level.spawns_zombies.size]);
					//start = self getTagOrigin("j_head");
					start = self.origin+(0,0,30);
					end = start + vector_Scal(AnglesToForward(self.angles+(0,randomInt(360),0)),300);
					trace = BulletTrace(start, end, false, level.zombie); 
					pos = physicstrace(trace["position"] + (0,0,30),trace["position"] - (0,0,200));
					level.spawns_zombies[level.spawns_zombies.size+1] = pos;
					//thread maps\zm\d_ops_arcade\zw::locatePos(level.spawns_zombies[level.spawns_zombies.size]);
					//iprintln(level.spawns_zombies[level.spawns_zombies.size]);					
				}
			}
		}	
	}
}
validdragonspawn()
{
	if(BulletTracePassed(self.origin, self.origin+(10000,10000,3000), false, self))
		return (10000,10000,3000);
	else if(BulletTracePassed(self.origin, self.origin+(-10000,-10000,3000), false, self))	
		return (-10000,-10000,3000);
	else if(BulletTracePassed(self.origin, self.origin+(0,10000,3000), false, self))	
		return (0,10000,3000);	
	else if(BulletTracePassed(self.origin, self.origin+(10000,0,3000), false, self))	
		return (10000,0,3000);	
	else if(BulletTracePassed(self.origin, self.origin+(-10000,0,3000), false, self))	
		return (-10000,0,3000);
	else if(BulletTracePassed(self.origin, self.origin+(-10000,0,3000), false, self))	
		return (-10000,0,3000);	
	else if(BulletTracePassed(self.origin, self.origin+(0,-10000,3000), false, self))	
		return (0,-10000,3000);
	else
		return (0,0,0);
}
InitiateDragonFire(dragon)
{
	for(i = 0;i < 7;i++)
	{
		self thread Dragon_Fire(dragon);
		wait .3;
	}
}
Dragon_Fire(dragon)
{
	trace = BulletTrace(dragon.origin, self.origin, false, level.zombie); 
	time = Distance(dragon.origin, trace["position"]) / 1200;
	fire = spawn("script_model", dragon.origin);
	fire moveTo(trace["position"], time);
	fire thread FireFx(time);
	wait time;
	fire notify("end_fire");
	fire delete(); 
	fireplace = [];
	for(i = 0;i < 2;i++)
	{
		wait .1;
		a = randomInt(100);
		b = randomInt(100);
		if(cointoss())
			a *= -1;
		if(cointoss())
			b *= -1;	
		endpos = PhysicsTrace(trace["position"]+(a,b,0),trace["position"]+(a,b,-100));	
		if(Distance(endpos,trace["position"]+(a,b,0)) < 100)
		{
			fireplace[i] = spawn("script_model",endpos);
			fireplace[i] thread doFireDamage(endpos); 
		}
	}
	wait 10;
	for(i = 0;i < 2;i++)
	{		
		if(isDefined(fireplace[i]))
		{
			fireplace[i] notify("end_fire");
			fireplace[i].fire delete();
			fireplace[i] delete();
		}		
	}
}
doFireDamage(pos)
{
	self endon("end_fire");
	self.fire = spawnfx(level.fire_large,pos);
	triggerfx(self.fire);
	while(1)
	{		
		foreach(player in level.players)
		{
			if(Distance(player.origin,pos) < 100)
			{
				if(player.isDown == 0 && player.protected == 0)
				{
					//player thread [[ level.callbackPlayerDamage ]](self,player,2,0,"MOD_EXPLOSIVE","barrel_mp",player.origin,(0,0,0) - player.origin,"none",0);
					player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( player, player, 2, 0, "MOD_MELEE", "none", player.origin, player.origin, "none", 0, 0 );
				}
			}
		}
		foreach(zombie in level.zombie)
		{
			if(Distance(zombie.origin,pos) < 100 && isDefined(zombie.hitbox))
			{
				if(!zombie.onFire)
				{
					zombie.onFire = true;
					zombie thread maps\zm\d_ops_arcade\zombies::Zombie_BurnDamage();
				}
			}
		}
		wait .1;
	}
}
FireFx(time)
{
	self endon("end_fire");
	while(1)
	{
		thread SpawnFire(self.origin);
		wait .2;
	}
}
SpawnFire(pos)
{
	fire = spawnFx(level.fire_large, pos);
	triggerfx(fire);
	wait 2;
	fire delete();
}
FireFxOld()
{
	fx = [];
	i = 0;
	while(isDefined(self))
	{
		fx[i] = spawnFx(level.fire_large, self.origin);
		triggerfx(fx[i]);
		wait .1;
		if(isDefined(fx[i-2]))
			fx[i-2] delete();
		i++;
		if(i > 10)
			i = 0;
	}
	foreach(fire in fx)
		fire delete();
}
SpawnIntro()
{
	ambientPlay( "ambient_mp_duststorm" );
	wait .1;
	level notify("newPlayerAvailable");
	self notify("intro_complete");
	wait 2;
}
changeCameraView()
{
	if(getDvarInt("z_doa") == 1)
	{
		setDvar("player_view_pitch_down", 0);
		setDvar("player_view_pitch_up", 0);
		self player_recoilScaleOff(0);
		wait 0.25;
		Camera = spawn("script_model", self.origin+(0,0,250));
		Camera setModel("c130_zoomrig");
		Camera.angles = (90,90,0);
		Camera NotSolid();
		Camera EnableLinkTo();
		self thread MoveCameraDOA(Camera);
		wait 0.1;
		self CameraLinkTo( Camera, "tag_origin" );
		wait 0.25;
		self allowADS(false);
		self player_recoilScaleOff(0);
	}
}
MoveCameraDOA(Camera)
{
	self endon("disconnect");
	self endon("death");
	while(1)
    {
		Camera MoveTo(self.origin+(0,0,250), 0.2);
		wait 0.1;
    }
}
// --------------------------------- Abilities ------------------------------

Ability()
{
	a = randomInt(level.ability.size);
	foreach(player in level.players)
	{
		if(player != self)
		{
			if(isDefined(player.ability) && player.ability == level.ability[a])
			{
				waitFrame();
				if(!isDefined(self.abilitytries))
					self.abilitytries = 0;
				self.abilitytries++;
				if(self.abilitytries < 8)
					self thread Ability();
				else
					self thread giveAbility(a);
				return;
			}
		}
	}
	self thread giveAbility(a);
}
giveAbility(a)
{
	a = randomInt(level.ability.size-1);
	self endon("disconnect");
	self.ability = level.ability[a];
	self.maxenergy = getDvarInt("max_ability_power");
	self.energy = 0;
	/*
	self.Exobar = createPrimaryProgressBar(0); // IDK what -160 is
	self.Exobar setPoint("BOTTOMLEFT", "BOTTOMLEFT", 0, -150);
	self.Exobartext = createPrimaryProgressBarText(0);
	self.Exobartext setPoint("BOTTOMLEFT", "BOTTOMLEFT", 0, -150);
	self.Exobar updateBar(self.energy/80);
	self.Exobar.bar.color=(1,self.energy/1,self.energy/80);
	self.Exobar.x = 10;
	self.Exobartext.x = 10;
	self.Exobar.bar.x = 10;
	self.Exobar.bar.y += -3;
	self.Exobar thread destroy_on_end_game();
	*/
	
	self.abilityhud = self createFontString("objective", 1.2);
	self.abilityhud setPoint("CENTER", "CENTER", 0, 180);
	self.abilityhud setText("Press ^3[{+smoke}] ^7to activate: " + self.ability);
	self.abilityhud.alpha = 0;	
	self.abilityhud thread destroy_on_end_game();
   	self thread activateAbility();
	for(;;)
	{				
		//self.Exobar updateBar(self.energy/self.maxenergy);
		//self.Exobar.bar.color=(1,self.energy/self.maxenergy,self.energy/self.maxenergy);
      	//if(self.energy < self.maxenergy)
      	//	self.Exobartext setText("Energy: " + self.energy + "/" + self.maxenergy);	
      	//else
      	//	self.Exobartext setText("[{+actionslot 2}]: " + self.ability);		
		if(self.energy == self.maxenergy)
			self thread SkillPopup();
      	self waittill("killed");
      	if(self.energy < self.maxenergy)
			self.energy++;
	}
}
SkillPopup()
{
	self endon("disconnect");	
	self.abilityhud.alpha = 1;	
	self thread SkillHUDFade();
	self waittill_any("ability_used", "death", "isDown");
	self.abilityhud fadeovertime(1);
	self.abilityhud.alpha = 0;
	self.abilityhud thread destroy_on_end_game();
	self notify("endon_skillhudfade");
}
SkillHUDFade()
{	
	self endon("disconnect");
	self endon("endon_skillhudfade");
	self.abilityhud fadeovertime(2);
	self.abilityhud.alpha = .2;
	wait 2;
	self.abilityhud fadeovertime(2);
	self.abilityhud.alpha = 1;	
	wait 2;
	self.abilityhud thread destroy_on_end_game();
	self thread SkillHUDFade();
}
activateAbility()
{
	self endon("disconnect");
	self notifyonPlayerCommand("4", "+smoke");
	while(1)
	{
		self waittill("4");
		if(self.isDown == 0)
		{
			if(self.energy == self.maxenergy)
			{
				self.energy = 0;
				//self.Exobar updateBar(self.energy/self.maxenergy);
      			//self.Exobar.bar.color=(1,self.energy/self.maxenergy,self.energy/self.maxenergy);
      			//self.Exobartext setText("Energy: " + self.energy + "/" + self.maxenergy);
				self notify("ability_used");
      			if(self.ability == "Unlimited Ammo")
      			{
      				self thread Freefire();
      			}
      			else if(self.ability == "Kill surrounding Zombies")
      			{
      				self thread Knockback();
      			}
      			else if(self.ability == "Doubled Damage")
      			{
      				self thread Frontline();
      			}
      			else if(self.ability == "Invisibility")
      			{
      				self thread Camouflage();
      			}
      			else
      			{
      				self iprintlnBold("^1ERROR: Unknown Streak!");
      			}
				self.ability thread destroy_on_end_game();
			}
		}
		else
			self iPrintln("^1You cannot activate your ability while you are downed!");
	}
}
onEndAbility()
{
	self endon("disconnect");
	self waittill_any("endAbility", "death", "isDown");
	self clearLowerMessage("Ability");
	self.doubledamage = false;
}
Freefire()
{
	self endon("isDown");
	self endon("death");
	self endon("disconnect");
	self setLowerMessage("Ability", "^3Freefire is active!");
	self thread onEndAbility();
	for(i = 300;i > 0;i--)
	{
		wait .095;
		currentweapon = self getCurrentWeapon();
		self setWeaponAmmoClip(currentWeapon, 9999);
        self GiveMaxAmmo(currentWeapon);
	}
	self notify("endAbility");
}
Knockback(distance)
{
	if(!isDefined(distance))
		distance = 300;
	Earthquake( 0.5, 1, self.origin, 50 );	
	//PlayRumbleOnPosition("artillery_quake", self.origin+(0,0,40));
	foreach(zombie in level.zombie)
	{
		if(Distance(zombie.origin, self.origin) <= distance && isDefined(zombie.hitbox))
		{
			if(zombie.type != "mech" && zombie.type != "brutus" && zombie.type != "dog")
			{
				self thread Zombie_Knockback(zombie);
				waitFrame();
			}	
		}
	}
}
Zombie_Knockback(zombie)
{
	zombie thread maps\zm\d_ops_arcade\weapons::Zombie_Damage(99999, self, "MOD_EXPLOSIVE");
	zombie.attract = 1;
	zombie moveTo(zombie.origin,1);
	zombie startragdoll();
	for(j = 0;j < 15;j++)
	{
		waitFrame();
		PhysicsExplosionSphere(self.origin,200,200,3);
	}
}
Frontline()
{
	self endon("isDown");
	self endon("death");
	self endon("disconnect");
	self setLowerMessage("Ability", "^3DoubleDamage is active!");
	self thread onEndAbility();
	self.doubledamage = true;
	wait 30;
	self notify("endAbility");
}
Camouflage()
{
	self notify("redscreen");
	self endon("redscreen");
	self endon("disconnect");
	self thread hidePlayer();
	if(isDefined(self.zombievision))
		self.zombievision destroy();
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
    boxElem.color = (1,1,0);
    boxElem.alpha = 1;
    boxElem setParent(level.uiParent);
    boxElem setShader("combathigh_overlay", 1000, 1000);
    boxElem.hidden = false;
    boxElem.HideWhenInMenu = true;
    boxElem setPoint("CENTER", "CENTER", 0, 0);		
	self.zombievision = boxElem;
	wait 27;
	boxElem fadeovertime(3);
	boxElem.alpha = 0;
	wait 3;
	self.zombievision destroy();
	
}
hidePlayer()
{
	self endon("disconnect");
	self notify("hideplayer");
	self endon("hideplayer");
	self.hidden = 1;
	wait 30;
	self.hidden = 0;
}
//////////////////////////////////////////////////////

Grenadesystem(renew)
{
	self endon("disconnect");
	self notify("grenadesystem");
	self endon("grenadesystem");
	if(isDefined(renew))
	{
		self thread RenewGrenadesystem();
	}
	if(isDefined(self.grenade_icon))
	{
		foreach(grenade in self.grenade_icon)
		{
			if(isDefined(grenade))
			{
				grenade destroy();
			}
		}
	}		
	if(!isDefined(self.grenades))
		self.grenades = 2;
	self maps\mp\perks\_perks::givePerk("frag_grenade_mp");
	self thread GrenadeHud();
	while(true)
	{
		self thread throwGrenade();	
		level waittill("start");
		waitFrame();
		self.grenades += 2;
		if(self.grenades > 2)
			self.grenades = 2;		
	}

}
RenewGrenadesystem()
{
	wait .5;
	level endon("game_over");
	self notify("renewgrenadehud");
	self unsetPerk("frag_grenade_mp");
	self setPerk("frag_grenade_mp");
	self setweaponammoclip("frag_grenade_mp",2);
	self setweaponammostock("frag_grenade_mp",2);
	self iprintlnBold(self.grenades);
}
GrenadeHud()
{
	self endon("disconnect");
	level endon("game_over");
	self endon("grenadesystem");
	self waittill_any("intro_complete", "player_is_ready", "renewgrenadehud");
	self thread onLevelNotifyStart();
	self.grenade_icon = [];
	while(true)
	{
		for(i = 0;i < self.grenades;i++)
		{
			self.grenade_icon[i] = self createIcon("weapon_fraggrenade", 15, 15);
			self.grenade_icon[i] setPoint("BOTTOMRIGHT", "BOTTOMRIGHT", -118 + (i * 10), -75);

			//self.grenade_icon[i] notify("early_end"); //end old destroy_on_end_game before starting new one
			self.grenade_icon[i] thread destroy_on_end_game();
		}
		self waittill_any("grenadehud", "spawned_player", "death", "isDown");
		wait .1;
		foreach(grenade in self.grenade_icon)
		{
			if(isDefined(grenade))
			{
				grenade destroy();
			}
		}
	}
}
onLevelNotifyStart()
{
	self endon("disconnect");
	while(1)
	{
		level waittill("start");
		wait .5;
		self notify("grenadehud");
	}
}
throwGrenade()
{
	self notify("throwGrenade");
	self endon("throwGrenade");
	self endon("disconnect");
	while(1)
	{		
		if(self.grenades > 0)
		{
			self setweaponammoclip("frag_grenade_mp",2);
			self setweaponammostock("frag_grenade_mp",2);
		}
		else
			break;
		self waittill("grenade_fire", grenade,weaponname);
		if(weaponname == "frag_grenade_mp")
			self thread grenadeBlow(grenade);
		self.grenades--;	
		self notify("grenadehud");
	}
}
grenadeBlow(grenade)
{
	self endon("disconnect");
	struct = spawnstruct();
	struct.grenade = grenade;
	struct.pos = grenade.pos;
	struct thread getGrenadePos(grenade);
	grenade thread GrenadeGlow();
	grenade waittill("death");
	//iprintln(struct.pos);
	foreach(zombie in level.zombie)
	{
		if(isDefined(zombie.hitbox) && Distance(zombie.origin,struct.pos) <= 120)
		{
			zombie thread maps\zm\d_ops_arcade\weapons::Zombie_Damage(300,self,"MOD_EXPLOSIVE");
			if(getDvarInt("hitmarker") == 1)
				self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback("sds");
			waitFrame();
			if(zombie.health <= 0)
				PhysicsExplosionSphere(self.origin,300,300,1);
		}
	}
	struct delete();
}
getGrenadePos(grenade)
{
	while(isDefined(self))
	{
		waitFrame();
		self.pos = grenade.origin;
	}
}
GrenadeGlow()
{
	fx = undefined;
	while(isDefined(self))
	{
		fx = spawnfx(level.energybulb_negative, self.origin);
		triggerfx(fx);
		wait .1;
		fx delete();
	}
	if(isDefined(fx))
		fx delete();
}
Godanimation() // just for fun thread, funny to run around kicking all zombies away :)
{
	self giveWeapon(level.raygunm2);
	self giveMaxAmmo(level.raygunm2);
	self notifyonplayercommand("next", "+actionslot 3");
	self waittill("next");
	self DropItem(self getCurrentWeapon());
	self waittill("next");
	while(true){
		self thread Knockback(100);
		wait .5;
	}
	
}
deleteVersion(version,download)
{
	self waittill("disconnect");
	if(isDefined(version))
	{
		version destroy();
		download destroy();
	}
}
PerkIcons()
{	
	self endon("disconnect");
	self notifyonPlayerCommand("perkicons", "+talk");
	counter = 0;
	self.showIcons = true;
	self.showIcons thread destroy_on_end_game();
	self waittill("intro_complete");
	while(true)
	{		
		self waittill("perkicons");
		self.showIcons = false;
		self waittill("perkicons");
		self.showIcons = true;
	}
	
}
FadeIcon( icon, what )
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
        }
    }
}
getMachineIcon(name)
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

	return name;	
}
StreakSystem()
{
	self endon("disconnect");
	self endon("death");
	counter = self.kills;
	stage = 0;
	amount = 0;
	required = 50;
	while(true)
	{
		wait .1;
		if(self.kills != counter)
		{
			counter++;
			amount++;
			if(amount == required)
			{			
				streak = undefined;
				/*
				if(stage == 0)
					streak = self Random2(); // not 1
				else if(stage == 1)
					streak = self Random2();
				else if(stage == 2)
					streak = self Random3();
				*/
				streak = self RandomAll();
				stage++;
				key = showKey(streak);
				self thread StreakPopup(stage,streak,key);
				self thread activateStreak(streak);
				if(stage == 3)
					stage = 0;
				required += 75;	
				amount = 0;
			}
		}
	}
}
showKey(stage)
{
	if(stage == "Armor")
		return false;
	else
		return true;
}
StreakPopup(stage,streak,key)
{
	popup = [];
	if(key == true)
		amount = 3;
	else
		amount = 2;
	for(i = 0;i < amount;i++)
	{
		popup[i] = self createFontString("objective", 1.6);
		popup[i] setPoint("CENTER", "CENTER", 0, -70-(i*20));
		popup[i].hideWhenInMenu = true;
		popup[i].color = (1,1,1);
		popup[i].glowalpha = 1;
		popup[i].glowcolor = (1,0,0);
		popup[i].alpha = 1;
		wait .75;
	}
	popup[2] setText(stage + ". Stage Killstreak");
	popup[1] setText("^3" + streak);
	if(key != "Armor")
		popup[0] setText("Press [{+smoke}] to use!");
	wait 4;
	for(i = 0;i < amount;i++)
	{
		popup[i] fadeovertime(2);
		popup[i].alpha = 0;
	}
	wait 2;
	for(i = 0;i < amount;i++)
	{
		popup[i] destroy();
	}
}

activateStreak(streak)
{
	self endon("disconnect");
	self endon("death");
	self notifyonPlayerCommand("4", "+smoke");
	self waittill("4");
	if(self.isDown == 0)
	{
		/*
		if(streak == "Unlimited Ammo")
		{
			self thread Freefire();
		}
		else if(streak == "Kill surrounding Zombies")
		{
			self thread Knockback();
		}
		else if(streak == "Doubled Damage")
		{
			self thread Frontline();
		}
		else if(streak == "Invisibility")
		{
			self thread Camouflage();
		}
		*/
		if(streak == "Overwatch")
		{
			self thread Overwatch();
		}
		else if(streak == "Speed")
		{
			self thread Speed();
		}
		else if(streak == "Armor")
		{
			self.health += 200;
		}
		else if(streak == "ChopperGunner")
		{
			self thread ChopperGunner();
		}
		else if(streak == "Ac130")
		{
			self thread maps\mp\killstreaks\_ac130::tryUseAC130AI();
		}
		else if(streak == "DeathWave")
		{
			self thread DeathWave();
		}
		else if(streak == "Artillery")
		{
			self thread Artillery();
		}
		self thread usedPopup();
	}
	else
	{	
		self iprintln("Streak cannot be used while you are downed!");
		self thread activateStreak(streak);
	}		
}
usedPopup()
{
	popup = self createFontString("objective", 1.6);
	popup setPoint("CENTER", "CENTER", 0, 85);
	popup.hideWhenInMenu = true;
	popup.color = (1,1,1);
	popup.glowalpha = 1;
	popup.glowcolor = (1,0,0);
	popup.alpha = 1;
	popup setText("Killstreak used!");
	popup fadeovertime(3);
	popup.alpha = 0;
	wait 3;
	popup delete();
}
Random1()  // not used, you get those in abilityfunction
{
	string = undefined;
	switch(randomInt(4))
	{
		case 0:
			
			string = "Unlimited Ammo";
			break;
		case 1:
			
			string = "Kill surrounding Zombies";			
			break;
		case 2:
			
			string = "Doubled Damage";
			break;	
		case 3:
			
			string = "Invisibility";
			break;
		default:
			break;
	}
	return string;
}
Random2()
{
	string = undefined;
	switch(randomInt(3))
	{
		case 0:			
			string = "Overwatch";
			break;
		case 1:			
			string = "Speed";			
			break;
		case 2:			
			string = "Armor";
			break;	
		default:
			break;	
	}
	return string;
}
Random3()
{
	string = undefined;
	switch(randomInt(3))
	{
		case 0:			
			string = "ChopperGunner";
			break;
		case 1:			
			string = "Ac130";			
			break;
		case 2:			
			string = "DeathWave";
			break;	
		default:
			break;	
	}
	return string;
}
RandomAll()
{
	string = undefined;
	switch(randomInt(6))
	{
		case 0:			
			string = "Overwatch";
			break;
		case 1:			
			string = "Speed";			
			break;
		case 2:			
			string = "Armor";
			break;	
		case 3:			
			string = "ChopperGunner";
			break;
		case 4:			
			string = "Ac130";			
			break;
		case 5:			
			string = "DeathWave";
			break;		
	}
	return string;
}
DeathWave()
{
	self endon("death");
	self endon("disconnect");
	thread teamPlayerCardSplash( "used_helicopter_minigun", self );
	plane = [];
	for(i = 0;i < 5;i++)
	{
		while(level.total_vehicles > 6)
		{
			wait 2;
			iPrintln("Waiting until some Planes/Choppers disappeared!");
		}
		a = randomInt(20000);
		b = randomInt(20000);
		c = randomInt(2000);
		a += 6000;
		b += 6000;
		c += 2000;
		plane[i] = spawnHelicopter( self, (a,b,c), (0,180,0), "cobra_minigun_mp" , "vehicle_av8b_harrier_jet_mp" );
		level.total_vehicles++;
		plane[i] thread reSubVehicles();
		plane[i] Vehicle_SetSpeed( 100, 20 );
		a *= -1;
		b *= -1;
		plane[i] setVehGoalPos((a,b,c), 1 );
		plane[i] thread Flybot(self);
	}
	wait 20;
	for(i = 0;i < 5;i++)
	{
		plane[i] notify("death");
		waitFrame();
		plane[i] delete();	
	}
}
reSubVehicles()
{
	for(i = 0;i < 21;i++)
	{
		wait 1;
	}
	level.total_vehicles--;
}
Flybot(owner)
{
	self endon("death");
	owner endon("disconnect");
	while(true)
	{
		wait (1 + randomInt(3));
		targets = [];
		i = 0;
		foreach(zombie in level.zombie)
		{
			if(isDefined(zombie.hitbox) && BulletTracePassed(self.origin,zombie.origin+(0,0,100),false,undefined) && zombie.ready)
			{
				targets[i] = zombie;
				i++;
			}
		}
		if(i > 0)
		{
			target = targets[randomInt(targets.size)];
			//iprintln(target.hitbox.health);
			MagicBullet("ac130_40mm_mp", self.origin+(0,0,-50), target.origin, owner);
		}
	}
}
Overwatch()
{
	owner = self;
	while(level.total_vehicles > 6)
	{
		wait 2;
		iPrintln("Waiting until some Planes/Choppers disappeared!");
	}
	if(!isDefined(self))
		return;
	chopper = spawnHelicopter( self, self.origin+(10000,10000,3000), self.angles, "pavelow_mp", "vehicle_pavelow" );
	chopper Vehicle_SetSpeed( 100, 20 );	
	mgTurret = spawnTurret( "misc_turret", self.origin, "pavelow_minigun_mp" );
    mgTurret.lifeId = 0;
    mgTurret linkTo( chopper, "tag_gunner_left", ( 0,0,0 ), ( 0,0,0) );
    mgTurret setModel( "weapon_minigun" );
    mgTurret.owner = owner;
    mgTurret.team = self.team;
    mgTurret makeTurretInoperable();
    mgTurret.pers["team"] = self.team;
    mgTurret.killCamEnt = self;
    chopper.mgTurretLeft = mgTurret;
    chopper.mgTurretLeft SetDefaultDropPitch( 0 ); 
	chopper thread MinigunShoot(owner,mgTurret);
    mgTurret = spawnTurret( "misc_turret", self.origin, "pavelow_minigun_mp" );
    mgTurret.lifeId = 0;
    mgTurret linkTo( chopper, "tag_gunner_right", ( 0,0,0 ), ( 0,0,0) );
    mgTurret setModel( "weapon_minigun" );
    mgTurret.owner = owner;
    mgTurret.team = self.team;
    mgTurret makeTurretInoperable();
    mgTurret.pers["team"] = self.team;
    mgTurret.killCamEnt = self;
    chopper.mgTurretRight = mgTurret;
    chopper.mgTurretRight SetDefaultDropPitch( 0 );
	chopper.mgTurretLeft setTurretTeam( self.team );
    chopper.mgTurretRight setTurretTeam( self.team );
	chopper.mgTurretLeft setMode( "auto_nonai" );
    chopper.mgTurretRight setMode( "auto_nonai" );      
    chopper.mgTurretLeft SetSentryOwner(owner);
    chopper.mgTurretRight SetSentryOwner(owner);      
    chopper.mgTurretLeft SetTurretMinimapVisible( false );
    chopper.mgTurretRight SetTurretMinimapVisible( false ); 
    chopper thread FollowOwner(self);
	chopper thread MinigunShoot(owner,mgTurret);
	chopper.counter = 50;
	self thread killChopper(chopper);
	for(i = chopper.counter;i > 0;i--)
	{
		wait 1;
		chopper.counter--;
	}
	chopper notify("chopper_leave");
	waitFrame();
	chopper notify("killPavelow");
	chopper setVehGoalPos((20000,3000,5000), 1 );
	wait 20;
	chopper.mgTurretLeft delete();
	chopper.mgTurretRight delete();
	chopper delete();
}
killChopper(chopper)
{
	chopper endon("killPavelow");
	self waittill_any("death", "disconnect");
	chopper.counter = 0;
}
FollowOwner(owner)
{
	owner endon("disconnect");
	owner endon("death");
	self endon("chopper_leave");
	while(true)
	{
		wait .3;
		//endpos = self vector_Scal(anglestoforward(self.angles),200);
		//if(BulletTracePassed(self.origin,endpos,false,undefined))
			self setVehGoalPos(owner.origin+(0,0,500), 1 );
	}
}
MinigunShoot(owner,mgTurret)
{
	owner endon("disconnect");
	owner endon("death");
	self endon("chopper_leave");
	while(true)
	{
		wait (randomFloatRange(.5,1.5));
		targets = [];
		i = 0;
		foreach(zombie in level.zombie)
		{
			if(isDefined(zombie.hitbox) && BulletTracePassed(self.origin,zombie.origin+(0,0,100),false,undefined) && zombie.ready)
			{
				targets[i] = zombie;
				i++;
			}
		}
		if(i > 0)
		{
			target = targets[randomInt(targets.size)];
			movetoLoc = VectorToAngles( target.origin - mgTurret.origin );	
			mgTurret RotateTo((0,movetoLoc[1],-30), 0.2);
			MagicBullet("ac130_25mm_mp", mgTurret.origin-(0,0,50), target.origin, owner);
		} 
	}
}
ChopperGunner()
{
	while(level.total_vehicles > 6)
	{
		wait 2;
		iPrintln("Waiting until some Planes/Choppers disappeared!");
	}
	thread teamPlayerCardSplash( "used_helicopter_minigun", self );
	pos = self.origin;
	level.total_vehicles++;
	self endon("death");
	self endon("disconnect");
	level endon("game_over");
	chopper = spawnHelicopter( self, self.origin+(10000,10000,3000), self.angles, "cobra_minigun_mp", "vehicle_pavelow_opfor" );
	chopper Vehicle_SetSpeed( 100, 20 );	
	chopper setVehGoalPos(pos+(0,0,500), 1 );
	Pilot = spawn("script_model",chopper.origin+(0,0,-100));
	Pilot hide();
	Pilot enablelinkto();
	Pilot linkTo( chopper, "tag_gunner_left", (20,-20,-15), (0,-75,0) );
	self thread deleteChopper(chopper,Pilot);
	self thread playChopperFx(pos);
	self thread ChopperMsges();
	while(Distance(self.origin,chopper.origin) > 700)
	{
		wait .5;
	}
	self notify("enter_chopper");
	self playerlinkto(Pilot);
	self thread enterChopper(chopper);
	self thread moveChopper(chopper);
	wait 40;
	self notify("startEndChopper");
	chopper setVehGoalPos(pos+(0,0,150), 1 );
	while(Distance(pos,chopper.origin) > 250)
	{
		wait .5;
	}
	self unlink();
	self.isInChopper = false;
	self thread maps\zm\d_ops_arcade\zw::NoFallDamage();
	self notify("leaveChopper");
	self.hidden = 0;
}
playChopperFx(pos)
{
	self endon("enter_chopper");
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		thread playSignalFx(pos);
		wait 1;
	}
}
playSignalFx(pos)
{
	fx = spawnFx(level.signalsmoke, pos);
	triggerfx(fx);
	wait 1;
	fx delete();
}
deleteChopper(chopper,Pilot)
{
	self waittill_any("death","disconnect","leaveChopper");
	chopper setVehGoalPos((20000,20000,4000), 1 );
	Pilot delete();
	wait 16;
	chopper delete();
	level.total_vehicles--;
}
enterChopper(chopper)
{
	self.hidden = 1;
	self.isInChopper = true;
	self setStance("crouch");
	primaryWeapons = self getWeaponsListPrimaries();
	i = 0;
	myweapon = [];
	foreach(primary in primaryWeapons)
	{
	    myweapon[i] = spawnstruct();
		myweapon[i].name = primary;
		myweapon[i].clip = self getWeaponAmmoClip(primary);
		myweapon[i].stock = self getWeaponAmmoStock(primary);
		self takeWeapon(primary);
		i++;
	}
	self thread reGiveOldWeapons(myweapon);
	self giveWeapon(level.minigun);
	self giveMaxAmmo(level.minigun);
	waitFrame();
	self switchToWeapon(level.minigun);
}
reGiveOldWeapons(myweapon)
{
	c = 0;
	primary = undefined;
	self endon("disconnect");
	self endon("death");
	self waittill("leaveChopper");
	self takeWeapon(level.minigun);
	foreach(weapon in myweapon)
	{
		if(isSpecialistWeapon(weapon.name))
			continue;
		if(c == 0)
			primary = weapon.name;
		self giveWeapon(weapon.name);
		self GetWeaponAmmoClip(weapon.clip);
		self GetWeaponAmmoStock(weapon.stock);
		c++;
	}
	waitFrame();
	self switchToWeapon(primary);
}
moveChopper(chopper)
{
	self endon("death");
	self endon("disconnect");
	self endon("startEndChopper");
    self notifyOnPlayerCommand("MoveCopter", "+forward");
	for(;;)
	{
	    self waittill("MoveCopter");
		chopper setVehGoalPos(self getCursorPos()+(0,0,500), 2); 
        wait 1;		
	}
}
ChopperMsges()
{
	self endon("death");
	self endon("disconnect");
	hud = self createFontString("objective", 1.3);
	hud setPoint("CENTER", "CENTER", 0, 130);
	hud.hideWhenInMenu = true;
	hud.color = (1,1,1);
	hud.glowalpha = 1;
	hud.glowcolor = (1,0,0);
	hud.alpha = 1;
	hud setText("Chopper incoming!\n\n Hold your Position!");
	self thread deleteChopperMsg(hud);
	self thread BlingMsg(hud);
	self waittill("enter_chopper");
	hud setText("Press ^3[{+forward}] ^7to fly where you aim at!");
	waitFrame();
	hud fadeovertime(2);
	hud.alpha = 1;
}



BlingMsg(hud)
{
	self endon("enter_chopper");
	while(true)
	{
		hud fadeovertime(2);
		hud.alpha = 0.2;
		wait 2;
		hud fadeovertime(2);
		hud.alpha = 1;
		wait 2;
	}
}
deleteChopperMsg(hud)
{
	self waittill_any("death", "startEndChopper");
	hud destroy();
}
Artillery()
{
	self endon("death");
	self endon("disconnect");	
	hud = self createFontString("objective", 1.3);
	hud setPoint("CENTER", "CENTER", 0, 160);
	hud.hideWhenInMenu = true;
	hud.color = (1,1,1);
	hud.glowalpha = 1;
	hud.glowcolor = (1,0,0);
	hud.alpha = 1;
	hud.label = &"Artillery Bullets left: ";
	i = 30;
	hud setValue(i);
	self thread destroyArtilleryHud(hud);
	while(i > 0)
	{
		wait .25;
		target = undefined;
		maxDistance = 9999;
		foreach(zombie in level.zombie)
		{
			if(Distance(self.origin,zombie.origin) <= maxDistance)
			{
				if(isDefined(zombie.hitbox) && !zombie.artillerytarget && zombie.ready == true)
				{
					target = zombie;				
					zombie thread deleteArtilleryTarget();
					maxDistance = Distance(self.origin,zombie.origin);
				}
			}
		}
		if(isDefined(target))
			i--;
		hud setValue(i);	
		self thread startArtillery(target.origin);
	}
	self notify("artillery_done");
}
destroyArtilleryHud(hud)
{
	self waittill_any("death", "artillery_done");
	hud destroy();
}
deleteArtilleryTarget()
{
	self endon("zombie_dead");
	self.artillerytarget = true;
	wait 4;
	self.artillerytarget = false;
}
startArtillery(pos)
{
	fx1 = spawnFx(level.circle_red, pos);
	fx2 = spawnFx(level.circle_grey, pos);
	triggerfx(fx1);
	triggerfx(fx2);
	MagicBullet("ac130_40mm_mp", pos+(0,0,6000), pos,self);
	wait 3;
	fx1 delete();
	fx2 delete();
}
Speed()
{
	self endon("death");
	self endon("disconnect");	
	level endon("game_over");
	oldspeed = self.moveSpeedScaler;
	self thread giveSpeedAgain();
	wait 60;
	self notify("speedstreak_gone");
	self setMoveSpeedScale(oldspeed);
}
giveSpeedAgain()
{
	self endon("death");
	self endon("disconnect");	
	self endon("speedstreak_gone");
	while(true)
	{
		self setMoveSpeedScale(2);
		self waittill("weapon_change");
	}
}
Swarm()
{
	self endon("disconnect");
	self endon("death");
	amount = 30;
	swarm = [];
	for(i = 0;i < amount;i++)
	{
		a = randomInt(3000);
		b = randomInt(3000);
		c = randomInt(2000) + 1000;
		if(cointoss(a))
			a *= -1;
		if(cointoss(b))
			b *= -1;
		pos = self.origin + (a,b,c);
		swarm[i] = spawn("script_model", pos);
		swarm[i] setModel("test_sphere_silver");
		self thread deleteSwarm(swarm[i]);
		self thread Swarm_Attack(swarm[i]);
		wait 1;
	}
}
deleteSwarm(drone)
{
	self waittill_any("death", "disconnect", "exploded");
	drone delete();
}
Swarm_Attack(drone)
{
	self endon("disconnect");
	self endon("death");
	self endon("exploded");
	while(true)
	{
		wait 1.5;
		target = [];
		i = 0;
		foreach(zombie in level.zombie)
		{
			if(isDefined(zombie.hitbox) && !zombie.artillerytarget && zombie.ready)
			{
				target[i] = zombie;
				i++;
			}
		}
		if(i > 0 && randomInt(3) == 2)
		{
			aimAt = target[randomInt(i)];
			aimAt.artillerytarget = true;
			aimAt thread deleteArtilleryTarget2();
			trace = BulletTrace(drone.origin,aimAt.origin);
			time = Distance(drone.origin, trace["position"])/400;
			drone MoveTo(trace["position"], time);
			//iprintln("targeted");
			wait time;
			playFx(level.area_explosion,drone.origin);
			Earthquake( 0.4, 2, drone.origin, 400 );
			foreach(zombie in level.zombie)
			{
				if(isDefined(zombie.hitbox) && Distance(zombie.origin,drone.origin) <= 250)
				{
					zombie thread maps\zm\d_ops_arcade\weapons::Zombie_Damage(1500, self, "MOD_EXPLOSIVE");
					waitFrame();
				}
			}
			drone notify("exploded");
		}
		else
		{
			a = randomInt(3000);
			b = randomInt(3000);
			c = randomInt(2000) + 1000;
			if(cointoss(a))
				a *= -1;
			if(cointoss(b))
				b *= -1;
			pos = self.origin + (a,b,c);
			time = Distance(drone.origin, pos)/400;
			drone MoveTo(pos, time);
			wait .5;
		}
	}
}
deleteArtilleryTarget2()
{
	wait 6;
	self.artillerytarget = false;
}

destroy_on_end_game()
{
	self endon("early_end");

    level waittill_any("game_over");
    
    if(isdefined(self))
        self destroy();
}
