#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

/*
// All MW2 MP files:  http://www.mpgh.net/forum/323-call-duty-modern-warfare-2-gsc-modding-help-discussion/202423-release-gsc-rip-collection.html
// FX List:           http://www.mpgh.net/forum/showthread.php?t=236319
// Soundlist:         http://www.se7ensins.com/forums/threads/all-sounds-list.192282/
// Zeroy Functionlist:      http://www.zeroy.com/script/
// MW2 Torrent:       http://uploaded.net/file/gapzc874/CODMW2.exe
// interesting shaders: https://www.itsmods.com/forum/Thread-Release-Some-usefull-shaders.html 
// GSC COMPRESSOR:    http://www.textfixer.com/tools/remove-line-breaks.php   
// Modellist listed with maps: http://pastebin.com/XZTXLDyf




 Santahunter: I appreciate if you do not modify something without my permission. 
 Santahunter: I spend more than 3 months on this mod and if someone changes 1 small thing, it doesnt give him the right to change the credits, even if Im still mentioned...
 
 
*/
Init()
{
    //precacheMenu(game["team_marinesopfor"]); // why is this still here 
    level Precache();
	
    OtherSettings();
	level thread onPlayerConnect();
	level thread System();
	level thread maps\mp\gametypes\hud::Init();
	level thread maps\mp\gametypes\zombies::Init();
	level thread maps\mp\gametypes\mapedits::Load();
	level thread NoKillTrigger();
	level thread DestroySentries();
	level thread IsItCorrectGamemode();
	level thread GhostDvars();
	level thread doRoundDvar();
	level thread doPlayerSizeToDvar();
	if(level.electrozombie == 1)
	    level thread maps\mp\gametypes\boss::SpawnElectroZombie();
	level thread InvalidWeaponList();
	
	if(level.cinema == 1)
	    level thread StartNuke();
	else
	    level.nuke_start = 2;
	level thread Dvars();
	level thread EndGame();
	level thread CheckEndgame();
	//level thread addBot(3);
	level.snow = loadfx("snow/snow_clouds_mp_derail");
	level.electric = loadfx("explosions/sentry_gun_explosion");	
	level.zombiedirt = loadfx("explosions/grenadeExp_dirt_1");
	level.glowfx = loadFX( "misc/flare_ambient" );
	level.airstrikefx = loadfx("smoke/signal_smoke_airdrop");
	level._effect[ "snow_spray_detail_oriented_runner" ]        = loadfx( "snow/snow_spray_detail_oriented_runner" );
	level._effect[ "snow_spiral_runner" ]                        = loadfx( "snow/snow_spiral_runner" );
	level._effect[ "snow_spray_detail_oriented_runner_large" ]        = loadfx( "snow/snow_spray_detail_oriented_large_runner" );
	level.freeze = loadFX( "impacts/20mm_snow_impact_exit" );
	level._effect[ "nuke_player" ] = loadfx( "explosions/player_death_nuke" );
	level._effect[ "nuke_flash" ] = loadfx( "explosions/player_death_nuke_flash" );
	level._effect[ "nuke_aftermath" ] = loadfx( "dust/nuke_aftermath_mp" );
	level.bigsmoke = loadFX("smoke/thin_black_smoke_m");
	//level.samanthafx = loadFX("misc/ac130_cloud");
	level.samanthafx = loadfx ("treadfx/heli_dust_default");
	level.georgefx = loadFx("snow/snow_spray_detail_oriented_large_runner");
	
	level.currentmap = getdvar("mapname");
	level.chopper_fx["explode"]["large"] = loadfx ("explosions/helicopter_explosion_secondary_small");
    AmbientStop(2);
	setObjectiveHintText( "allies", "Survive as long as possible!" ); // needed?
    setObjectiveHintText( "axis", "Wait till Round is over!" );
	
}
OtherSettings() // do not modify, can fuck up game
{
    level.extramodel = [];
	level.perkmodel = [];
	level.supporter = [];
	level.perkmachines = 0;
	level.helispawned = 0;
	level.indoground = 0;
	level.napalmzombie = 0;  
	level.georgespawned = 0;
	level.power = 0;
	level.multiplier = 1;
	level.instakill = 0;
	level.firesale = 0;
	level.inRound = 0;
	level.dropnumber = 1;
	level.dogrounds = 1;
	level.fireplane = 0;
	level.paused = 0;
	level.instatime = 30;
	level.saletime = 30;
	level.pointstime = 30;
	level.bloodtime = 20;
	level.round = 0;
	level.max_entitynumber = 50;
	level.currententities = 0;
}
onPlayerConnect()
{
    for(;;)
	{
		level waittill( "connected", player );
		player thread onConnect();
	}	
}
onConnect()
{
    level.nukestart = 2;
	SetDvarIfUninitialized( self.guid + "_loaded", 0);
    setdvar(self.guid + "_loaded", 1);
    player = self;
	player freezeControls(false);
	//player thread onMenuResponse();
    player thread maps\mp\gametypes\wonderweapons::Init();
	player thread onPlayerSpawned();
	if(level.nukestart < 2 && level.cinema == 1)
	    self thread Intro();		
	if(level.cinema != 1 || level.nuke_start != 0)
	    player thread Falldown();
	player thread OnDisconnect();
	player thread OnDeath();
	/* //player thread doPlayTheMixThingy();*/
	player thread maps\mp\gametypes\hud::IntroHud();
	//player SetRearViewRenderEnabled(true);
	player thread GumCost();
	player.kills = 0;
	player.firstspawn = 1;
	player.iconnumber = 0;
	player.solo = 0;
	player.isbuying = 0;
	player.quickrevivecounter = 0;
	player setClientDvar("r_drawsun", 0);
	player setClientDvar("sm_sunenable", 0);
	SetDvarIfUninitialized(player.guid, 0);
	SetDvarIfUninitialized(player.name,0);
	player setClientDvar("cg_crosshairAlpha", 0);
	player setClientDvar("cg_crosshairAlphaMin", 0);
	player setClientDvar("cg_crosshairDynamic", 0);
	
	player notify("menuresponse", game["menu_team"], "allies"); // ??
	player AllowSpectateTeam( "allies", true );
	player AllowSpectateTeam( "axis", true );
	player allowSpectateTeam( "freelook", true );
	if(level.players.size != 1)
	{
	    foreach(player in level.players)
		{
		    player.solo = 0;
		}
	}
	wait .1;
	player notify("menuresponse", "changeclass", "class1");
	player thread OnlyStart();
	player thread maps\mp\gametypes\quotes::Init();
	level notify("changed_playersize");
}
OnDeath()
{
    self endon("disconnect");
	for(;;)
	{
	    self waittill("death");
		wait 1;
		self thread maps\mp\gametypes\revivesystem::AllDown();
	}
}
OnlyStart()
{
    self endon("disconnect");
    self waittill("spawned_player");
	wait 3;
	if(self getCurrentWeapon() != level.startpistol) // && self.pers["team"] != "spectator"
	{
	    self thread Loadout();
	}
}
onPlayerSpawned()
{
    self endon("disconnect");
	for(;;)
	{
		self waittill("spawned_player");
		self thread SpawnPlayer();
		self thread ForcePatch();
		if(level.devmode == 1)
		    self thread UFO();
		//self setClientDvars("cg_watersheeting",1,"cg_waterSheeting_brightness",0,"cg_waterSheeting_contrast",1,"cg_waterSheeting_darkTint",1,"cg_waterSheeting_desaturation",0,"cg_waterSheeting_distortionScaleFactor",0.021961,"cg_waterSheeting_enable",0,"cg_waterSheeting_fadeDuration",2,"cg_waterSheeting_lightTint",0.780261,"cg_waterSheeting_magnitude",0.0655388,"cg_waterSheeting_radius",4.44051);
	}	
}
SpawnPlayer()
{
    self endon("disconnect");
	//self endon("death");
	self notify("spawn_player");
	self endon("spawned_player");
	//iPrintln("newspawn");
	self setOrigin(level.playerspawns[randomInt(level.playerspawns.size)]);
	//iPrintlnBold("mhm");
    if(level.inRound == 0)
	{
	    if(self.team == "allies")
		{
		    if(self.firstspawn == 1)
			    self thread Falldown();
			self thread Loadout(); 
		    self allowSpectateTeam( "freelook", false ); 
			self.sessionstate = "playing";	
		}
		else
		{
		    self notify("menuresponse", game["menu_team"], "allies");
			//self.team = "allies";
			self thread SpawnPlayer();
		}
	}
	else
	{
	    if(self.pers["team"] != "spectator")
		{
		    self thread SpawnPlayer();
		    self notify("menuresponse", game["menu_team"], "spectator");
			//wait 2;
			//self thread SpawnPlayer();
		}
		else
		{
		     self notify("menuresponse", game["menu_team"], "spectator");
		    self thread FlyAround();
		    self thread onRoundEnd();
		    self thread maps\mp\gametypes\hud::Spectatorhud();
		}
		
	}
}
FlyAround()
{ 
    level endon("ende");
	wait .5;
	self setOrigin(level.playerspawns[randomInt(level.playerspawns.size)] + (0,0,100));
    wait 1.5; 
	self maps\mp\gametypes\_spectating::setSpectatePermissions();
    self allowSpectateTeam( "freelook", true );
	self.sessionstate = "spectator";
}
onRoundEnd()
{
    self endon("disconnect");
	self notify("newroundend");
	self endon("newroundend");
	level waittill("ende");
	self.customspawn = 1;
	self notify("menuresponse", game["menu_team"], "allies");
	self thread SpawnPlayer();
	wait 5;
	self.customspawn = 0;
}
Loadout()
{
    if(self.team != "allies")
	{
	    self notify("menuresponse", game["menu_team"], "allies");
		self.team = "allies";
		self thread SpawnPlayer();
		return;
	}
    wait .1;
    self notify("menuresponse", "changeclass", "class1");
	self notify("spawn_falldown"); 
    self freezeControls(true);
    self thread Testfunction();
	self thread PauseGame();
	if(self.score < level.startmoney)
	{
	    if(self.firstspawn == 1)
		{
		    self.firstspawn = 0;
			self.score = level.startmoney;
			self playlocalSound("mp_ingame_summary");
		}
		else
		{
		    if(level.round > 3)
		        self.score = 1500;
			else
                self.score = 500;				
		}
	}		
	self.savehouse = 0;
	//self.zombieblood = 0;
	//self.zombietime = 20;
	self.quickrevive = 0;
	self.pistolmode = 1;
	self.firevision = 0;
	self.hasmonkey = 0;
	self.fire_ammo_total = 300;
	self.fire_ammo_max = 50;
	self.fire_ammo = 50;
	self.customspawn = 0;
	self.hud_damagefeedback.color = (1,0,0);
	self _clearPerks();
	self thread PerkValues();
	self thread PaPValues();
	if(level.players.size == 1)
	    self.solo = 1;
	else
        self.solo = 0;	
	self.isdown = 0;
	if(getDvar("mapname") == "mp_brecourt" || level.night == 1 && getDvar("mapname") != "co_hunted")
	    self visionsetnakedforplayer("icbm", .5);
	else if(getDvar("mapname") == "co_hunted")	
		self visionsetnakedforplayer("default_mp", .5);
	self player_recoilScaleOff(0);
	self setclientdvar( "cg_objectiveText", "^7Version ^31.3 \n^7Mod made by ^1Santahunter ^7and ^3Avenger" );
	self setclientdvar("r_dof_viewModelStart", 2);
	self takeAllWeapons();
	//self SetSpawnWeapon(level.startpistol);
	self giveWeapon(level.startpistol);
	self giveMaxAmmo(level.startpistol);
	self thread Arme_Sau();
	self thread HealthRegen();
	self thread DOAMode();
	self thread SpawnHumanZombie();
	if(level.streaks == 1)
	    self thread maps\mp\gametypes\killstreaks::Init();
	wait 1;
	self freezeControls(false);/*
	//self [[game["allies_model"]["RIOT"]]]();*/	
	self switchToWeapon(level.startpistol);
	self setViewmodel("viewhands_airport");
	for(i=0;i < level.adminguid.size;i++)
	{
	    if(self.guid == level.adminguid[i])
		{
		    self thread maps\mp\gametypes\hud::MyIcon();
		}	
	}
}
SpawnHumanZombie()
{
    self endon("disconnect");
	self endon("death");
	self notify("SpawnHumanZombie");
	self endon("SpawnHumanZombie");
	wait 5;
	self thread SeriouslySpawnHumanZombie();
}
SeriouslySpawnHumanZombie()
{
    self endon("disconnect");
    self waittill("death");
	self thread maps\mp\gametypes\boss::MalformedHuman();
}
Customhead()
{
	head = undefined;
	wait 1;
	playernumber = self getentitynumber();
	if(playernumber == 1)
	{
		head = self attach( "lovely_player_head_richtofen", "j_spine4" );
	}
	else if(playernumber == 2)
	{
		head = self attach( "lovely_player_head_dempsey", "j_spine4" );
	}
	else if(playernumber == 3)
	{
		head = self attach( "lovely_player_head_takeo", "j_spine4" );
	}
	else if(playernumber == 4)
	{
	    /*//self detach(self.headmodel);*/
		head = self attach( "lovely_player_head_nikolai", "j_spine4" );
	}
	else if(playernumber == 5)
	{
		head = self attach( "head_hero_soap_soccom_a", "j_spine4" );
	}
	else if(playernumber == 0)
	{
		head = self attach( "head_vil_makarov", "j_spine4" ); // head_vil_makarov
	}
	for(i=0;i < level.adminguid.size;i++)
	{
	    if(self.guid == level.adminguid[i])
    	{
		    /*
		    //playfxontag( level.fire_small, self, "j_spine4" );
			//FlameFX2 = playFxOnTag( level.fire_small, self, "j_spine4" );
		    self setRank(self.pers["rank"], 11);	*/
		}	
	}
	if(isDefined(head))
	    head GetAttachIgnoreCollision("j_helmet");
	
}
ForcePatch()
{   
    level endon("gameover");
	self endon("death");
	self endon("disconnect");
    while(1)
	{
	    wait 1;
		if(level.inRound == 1)
		{
		    if(self.team == "axis")
			{
			    self addToTeam("allies");
			}
			if(self.team == "spectator")
			{
			    self addToTeam("allies");
			}
		}
	}
}
ActivatehealthRegen()
{
    level endon("gameover");
    self endon("disconnect");
	self waittill("player_attacked");
	self thread HealthRegen(1);
}
HealthRegen(instant)
{
    self endon("disconnect");
	self endon("player_attacked");
	if(!isDefined(instant))
        self waittill("damage");
	wait 5;
	for(;;)
	{
	    if(self.health < self.maxhealth)
		{
		    self.health++;
		}
		else
		{
		    self waittill("damage");
			wait 5;
		}
		wait .1;
	}
}
Arme_Sau()
{
	self endon("disconnect");
	self notify("armesau");
	self endon("armesau");
	for(;;)
	{
	    wait 1;
		if(self.score < 0)
		{
		    self.score = 0;
			self notify("money");
		}
	}
}
Grenadesystem()
{
    self endon("disconnect");
	self endon("death");
	self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
	for(;;)
	{
	    level waittill("start");
		if(self.hasmonkey == 0){
		currentclip = self getweaponammoclip("frag_grenade_mp"); 
        currentstock = self getweaponammostock("frag_grenade_mp"); 
		if(currentclip == 2 && currentstock > 2)
		{
		    self waittill( "grenade_fire", grenade, weapname );
			self setweaponammoclip("frag_grenade_mp",currentclip+1);
            self setweaponammostock("frag_grenade_mp",currentstock+1);
			self waittill( "grenade_fire", grenade, weapname );
			self setweaponammoclip("frag_grenade_mp",currentclip+1);
            self setweaponammostock("frag_grenade_mp",currentstock+1);
		}
		else if(currentclip == 0 && currentstock > 0)
		{
		    self setweaponammoclip("frag_grenade_mp",currentclip+2);
            self setweaponammostock("frag_grenade_mp",currentstock+2);
		}
		else if(currentclip == 1 && currentstock > 1)
		{
			self setweaponammoclip("frag_grenade_mp",currentclip+1);
            self setweaponammostock("frag_grenade_mp",currentstock+1);
		}}
	}
}
GumCost()
{
    level endon("gameover");
	self endon("disconnect");
	self.gumcost = level.gumcost;
	self thread GumCost2();
    for(;;)
	{
	    self waittill("buy_gum");
		self.gumcost += 2000;
	}
}
GumCost2()
{
    level endon("gameover");
	self endon("disconnect");
	for(;;)
	{
	    level waittill("start");
		self.gumcost = level.gumcost;
	}
}
StartNuke()
{
    nukeDistance = 5000;
    level.nuke_start = 0;
	level thread NukeLoad();
	wait 15;
	level.nuke_start = 1;
	wait 1;
	if(level.night == 1)
	    visionsetnaked("icbm",2);
	else
	    visionsetnaked(getdvar("mapname"),2);
	wait 5;
	level notify("nuke_start");
    foreach(player in level.players)
	{
	    playerForward = anglestoforward( player.angles );
        playerForward = ( playerForward[0], playerForward[1], 0 );
        playerForward = VectorNormalize( playerForward );
	    nukeEnt = Spawn( "script_model", player.origin + Vector_Multiply( playerForward, nukeDistance ) );
        nukeEnt setModel( "tag_origin" ); // thats not a model
        nukeEnt.angles = ( 0, (player.angles[1] + 180), 90 );
		waitFrame(); 
	    PlayFXOnTagForClients( level._effect[ "nuke_flash" ], nukeEnt, "tag_origin", player );
		PlayFXOnTagForClients( level._effect[ "nuke_player" ], nukeEnt, "tag_origin", player );
        player playlocalsound( "nuke_explosion" );
        player playlocalsound( "nuke_wave" );
    }
	wait .1;
	setSlowMotion( 1.0, 0.25, 0.5 );
	wait 1;
	setSlowMotion( 0.25, 1, 2.0 );
	foreach( player in level.players )
        player playlocalsound( "nuke_incoming" );
	wait 15;
	level.nuke_start = 2;
}
NukeLoad()
{
    while(level.nuke_start == 0)
	{
	    level waittill("connected", player);
		player thread NukeSetup();
	}
}
NukeSetup()
{
    self waittill("spawned_player");
    self visionsetnakedforplayer("blacktest",0);
	self freezecontrols(true);
	if(level.helispawned < 7)
	{
	    self thread DoHeli();
		level.helispawned++;
	}
	self thread maps\mp\gametypes\hud::CinemaHud();
}
DoHeli()
{
    random = randomInt(3000);
	if(level.nuke_start == 0)
        self.lb = spawnHelicopter(self, level.playerspawns[randomInt(level.playerspawns.size)]+(12000,5000+random,3000), self.angles+(0,0,0), "littlebird_mp", "vehicle_little_bird_armed");
	else if(level.nuke_start == 1)
  	    self.lb = spawnHelicopter(self, level.playerspawns[randomInt(level.playerspawns.size)]+(6000,5000+random,3000), self.angles+(0,0,0), "littlebird_mp", "vehicle_little_bird_armed");
	self.lb Vehicle_SetSpeed(1300, 20);
	self enablelinkto();
	self PlayerLinkTo( self.lb, "tag_minigun_attach_right", 0.5 );
	self setstance("crouch");
	goal = level.playerspawns[randomInt(level.playerspawns.size)]+(0,0,500);
	self.lb setVehGoalPos(goal+(-12000,0,3000),1);
	wait 3;
	self SetPlayerAngles(self.lb.angles+(0,0,0));
	level waittill("nuke_start");
	wait 1.5;
	playFxOnTag( level.fire_medium, self.lb, "tag_engine_left" );
	self playLocalSound("missile_incoming");	
	self thread HeliSpin();
	self thread HeliSound();
	self.lb setVehGoalPos(goal,1);
	self thread inPosition(goal);
}
Intro()
{
    self endon("disconnect");
    self waittill("spawned_player");
	wait .5;
    self visionsetnakedforplayer("blacktest",0);
	if(level.helispawned < 7)
	{
	    self thread DoHeli();
		level.helispawned++;
	}
	self maps\mp\gametypes\hud::CinemaHud();
	if(getDvar("mapname") == "mp_brecourt" || level.night == 1)
	    self visionsetnakedforplayer("icbm",3);
}
HeliSpin()
{
    self endon("targetreached");
    speed = 180;
    while(1)
    {
        self.lb settargetyaw( self.lb.angles[1]+(speed*0.9) );
		/*//self.lb RotateTo( self.lb.angles+(0,90,0), 1 );*/
        wait 1;
    }
}
HeliSound()
{
    self endon("targetreached");
	wait .5;
    while(1)
	{
	    wait .3;
		playFx(level.chopper_fx["explode"]["large"],self.lb.origin);
	    self.lb playLoopSound( level.heli_sound[self.pers["team"]]["spinloop"] );
	}
}
inPosition(goal)
{
    wait 14;
	self notify("targetreached");
	self unlink();
	pos = randomInt(4);
	parachute = spawn("script_model", self.origin+(0,0,200));
	parachute setModel("parachute_deploy");
	parachute moveTo(level.playerspawns[pos], 4);
	self PlayerLinkTo( parachute); // , "tag_origin", 0.5 
	self.lb stopLoopSound( level.heli_sound[self.pers["team"]]["spinloop"] );
	playFx(level.meteorfx,self.lb.origin);
	self.lb setVehGoalPos(level.playerspawns[pos]+(5000,2000,0),1);
	wait 4;
	level notify("HUD_Start");
	self unlink();
	parachute moveTo(level.playerspawns[pos]+(0,0,-200),2);
	wait 2;
	parachute delete();
	wait 10;
	self.lb delete();
	level.helispawned--;
}
DeathFix()
{
    self thread maps\mp\gametypes\revivesystem::AllDown();
}
OnDisconnect()
{
    self waittill("disconnect");
	level notify("changed_playersize");
	aliveplayers = 0;
	foreach(player in level.players)
	{
	    if(player.team == "allies")
		    aliveplayers++;
	}
	if(aliveplayers == 1)
	{
	    foreach(player in level.players)
		    player.solo = 1;
	}
	if(aliveplayers == 0)
	    level notify("noPlayers");
}
AddWeapon(name)
{
    /* Why is this thread here? looks deprecated */
    i = level.weapons.size;
	level.weapons[i] = spawnstruct();
	level.weapons[i] = name;
	level.weapons++;
}
Dvars()
{
    setDvar( "ui_netGametypeName", "^1ZombieWarfare" );
	setDvar("g_hardcore", 0);
	setDvar("scr_" + getDvar("g_gametype") + "_timelimit", 0);
	setDvar("scr_" + getDvar("g_gametype") + "_scorelimit", 0);
	setdvar("ui_allow_teamchange", 0);
	setdvar("ui_allow_classchange", 0);
	setdvar("scr_game_hardpoints",0); 
	setDvar("g_gametype", "war");
	setDvar("ui_gametype", "war");
	setDvar("scr_teambalance",0);
	/*
	//setDvar("g_gametype", "zombie_warfare");
	//setDvar("ui_gametype", "zombie_warfare");
	*/
	setDvar("party_gameStartTimerLength", 0); // #not working
	setDvar("party_pregameStartTimerLength",0);
	level.teamBalance = 0;
    setDvar("scr_teambalance", 0);
	level thread BettyLoadout();
    if(level.devmode == 1)
	    setdvar("cg_Draw2d", 0);
	else
  	    setdvar("cg_Draw2d", 1);
}
PrecacheWeapons()
{
   precacheItem("raygun_mp");
   precacheItem("raygunv2_mp");
   precacheItem("ray_machine_mp");
   precacheItem("wunderwaffe_mp");
   precacheItem("blundergat_mp");
   precacheItem("Scavenger_mp");
   precacheItem("betty_mp");
   precacheItem("mg08_mp");
   precacheItem("cola_mp");
   precacheItem("bo3_mr6_mp");
   precacheItem("crossbow_mp");
   precacheItem("flamethrower_mp");
   precacheItem("freeze_mp");
   precacheItem("m1911_mp");
   precacheItem("ppsh_mp");
   precacheItem("punch_mp");
   precacheItem("sabertooth_mp");
   precacheItem("staff_mp");
   precacheItem("sword_mp");
   precacheItem("tazor_mp");
   precacheItem("thundergun_mp");
   precacheItem("tomahawk_mp");
   precacheItem("war_mp");
   precacheItem("wavegun_mp");
}
PrecacheSpecial()
{
    precacheModel("lovely_1911_vm");
	precacheModel("lovely_1911_world");
	precacheModel("viewmodel_bouncing_betty");
	precacheModel("weapon_bouncing_betty");
	precacheModel("projectile_bouncing_betty");
	precacheModel("lovely_tazor_vm");
	precacheModel("lovely_tazor_wm");
	precacheModel("lovely_tazor_wm_detect");
	precacheModel("lovely_sabertooth_vm");
	precacheModel("lovely_ray_machine");
	precacheModel("lovely_mg08_vm");
	precacheModel("lovely_mg08_wm");
	precacheModel("lovely_tomahawk");
	precacheModel("mp_body_riot_tf141_desert");
}
Precache()
{
    /*
    //PrecacheWeapons(); // I think I precache way too much uneccessary stuff...
	//PrecacheSpecial(); // needed?
	*/
    precacheShader("combathigh_overlay"); // napalm zombie red screen
    precacheShader("cardicon_bear");
    precacheShader("cardicon_juggernaut_1");
	precacheShader("specialty_fastreload_upgrade");
	precacheShader("cardicon_juggernaut_2");
	precacheShader("specialty_lightweight_upgrade");
	precacheShader("specialty_pistoldeath_upgrade");
	precacheShader("cardicon_doubletap");
	precacheShader("hint_health");
	precacheShader("cardicon_thecow");
	precacheShader("cardicon_gumby");
	precacheShader("cardicon_devilfinger");
	precacheShader("cardicon_moon");
	precacheShader("cardicon_xray");
	precacheShader("waypoint_kill");
	precacheShader("cardicon_burgertown");
	precacheShader("mw2_main_cloud_overlay");
	precacheshader("v2_zw_dpad");
	precacheshader("v2_zw_gum1");
	precacheshader("v2_zw_gum2");
	precacheshader("v2_zw_gum3");
	precacheshader("v2_zw_gum5");
	precacheshader("v2_zw_gum6");
	precacheshader("v2_zw_gum7");
	precacheshader("v2_zw_gum8");
	precacheshader("v2_zw_gum9");
	precacheshader("v2_zw_gum10");
	precacheshader("v2_zw_gum11");
	precacheshader("v2_zw_round_line_1");
	precacheshader("v2_zw_round_line_2");
	precacheshader("v2_zw_weaponbar");
	precacheshader("cardtitle_bloodsplat");

	//precacheModel("lovely_power_arm");// needed ?
	//precacheModel("lovely_bottle_sleight");// needed ?
	//precacheModel("lovely_bubble"); // needed ?
	precacheModel("lovely_girl");
	precacheModel("com_teddy_bear");
	precacheModel("parachute_deploy");
	precacheModel("head_hero_soap_soccom_a");
	precacheModel("head_vil_makarov");
	precacheModel("lovely_player_head_richtofen");
	precacheModel("lovely_player_head_nikolai");
	precacheModel("lovely_player_head_takeo");
	precacheModel("lovely_player_head_dempsey");
	precacheModel("lovely_teleporter");
	precacheModel("lovely_wine");
	precacheModel("lovely_drone");
	precacheModel("chicken_black_white");
	precacheModel("lovely_avogadro");
	precacheModel("avenger_credits");
	
	/*//precacheShader("cardicon_ball_volleyball_1"); // alchemical*/
	precacheShader("cardicon_humantrophy"); // Always_Done_Swiftly_GobbleGum_BO3
	precacheShader("cardicon_birdbrain"); // In_Plain_Sight_GobbleGum_BO3
	precacheShader("cardicon_claw"); // Killing_Time_GobbleGum_BO3
	precacheShader("cardicon_brassknuckles"); // Perkaholic_GobbleGum_BO3
	precacheShader("cardicon_tiger"); // Phoenix_Up_GobbleGum_BO3
	precacheShader("cardicon_thebomb"); // Stock_Option_GobbleGum_BO3
	precacheShader("cardicon_weed"); // Wall_Power_GobbleGum_BO3
	precacheShader("cardicon_stop"); // new alchemical
	precacheShader("specialty_pistoldeath");
	precacheShader("ui_host");
	precacheShader("logo_iw");
}
BettyLoadout()
{
    if(!isDefined(level.bettykillicon))
        level.bettykillicon = "betty_mp"; // must be a weaponname like: barrel_mp or nuke_mp	
	level.minefx = loadfx ("explosions/grenadeexp_default");
    level.mineglow = loadfx( "misc/aircraft_light_wingtip_green" );
	/*
	//level.mineglow = loadfx( "misc/aircraft_light_red_blink" );
	//bettymodel = GetWeaponModel("betty_mp", 0);
	//precacheModel("bettymodel");
	*/
	SetDvarIfUninitialized("BettySetupTime", 2.5);
	SetDvarIfUninitialized("BettyExplodeTime", 1); // smaller than 1 seems to be 0 for the "moveTo" command
	/*//precacheShader(level.Bettyicon); */
	
	SetDvarIfUninitialized("TazorSetupTime", 1.5);
	precacheShellShock( "concussion_grenade_mp" );
	precacheShellshock("flashbang_mp");
	level.tazorfx = loadfx("explosions/sentry_gun_explosion");
}
PerkValues()
{
    if(self.solo != 1)
        self.quickrevive = 0;
	self.juggernog = 0;
	self.staminup = 0;
	self.speedcola = 0;
	self.doubletab = 0;
	if(isDefined(self.mulekick) && self.mulekick == 1)
	    self takeWeapon(self.mulekickweapon);
	self.mulekick = 0;
	self.deadshot = 0;
	self.electriccherry = 0;
	self.tombstone = 0;
	self.perknumber = 0;
	self.maxhealth = 100;
    self.health = 100;
	self.webknife = 0;
	self.widowswine = 0;
}
PaPValues()
{
    foreach(weapon in level.weapons)
    {
	    self.upraded[weapon] = 0;
    }
	/*// Add weapons here which arent in box*/
	
	self.upraded[level.startpistol] = 0;
	self.upraded["ray_machine_mp"] = -1; // not needed I think because new thread getvalidweapon()
	self.upraded["m240_grip_reflex_mp"] = -1;
    self.upraded["colt45_akimbo_mp"] = 0;
	self.upraded["olympia_mp"] = 0;
}
IsItCorrectGamemode()
{
    level endon("gameover");
    wait 3.14159;
    gamemode = getDvar("g_gametype");
    while(gamemode != "war")
    {
		wait 10;
        iPrintln("^1ERROR: WRONG GAMEGAMODE, IT HAS TO BE TEAM DEATHMATCH (war)");		
	} 		
}
CheckEndgame()
{
    level endon("noPlayers");
	level endon("gameover");
	for(;;)
	{
	    level waittill("player_died");
		wait 5;
		survivors = 0;
		foreach(player in level.players)
		{
		    if(level.players.size > 1)
		    {
		        if(player.solo == 1)
			        player.solo = 0;
	    	}
	        if(player.team == "allies")
		    {
		        survivors++;
		    }
		}
		if(survivors == 0)
		    level notify("gameover");
	}
}
EndGame()
{
    level waittill_any("gameover", "noPlayers");
	foreach(zombie in level.bots)
	{
	    zombie moveTo(zombie.origin,1);
	    zombie thread maps\mp\gametypes\zombies::Bot_Animation("stand");
	}
	random = level.players[randomInt(level.players.size)];
	level.Camera = spawn("script_model", random.origin+(0,100,100));
	level.Camera setModel("tag_origin");
	movetoLoc = VectorToAngles( random.origin - level.Camera.origin );
	level.Camera.angles = (0,movetoLoc[1],0);
	level.Camera NotSolid();
	level.Camera EnableLinkTo();
	level.Camera moveTo(level.Camera.origin+(0,0,2000), 25);
	foreach(player in level.players)
	{
	    player.playMusic = 0;
		player StopLocalSound(player.mymusic);
		player playLocalSound("mp_last_stand"); // mp_killstreak_carepackage 
	    player thread maps\mp\gametypes\hud::Endgame_Hud("MW2 Zombies", "Mod made by", "^3Santahunter", "and", "^3Avenger");
		player freezeControls(true);
		player hide();
		player notSolid();
		player enablelinkto();
		player CameraLinkTo( level.Camera, "tag_origin" );
		player.bestround = getDvarInt(player.guid);
		setdvar(player.guid + "_loaded", 0);
		if(player.bestround < level.round)
		{
		    setdvar(player.guid, level.round);
			notifyData = spawnstruct();
            notifyData.titleText = "New Record"; 
            notifyData.notifyText = "Round " + level.round; 
            notifyData.glowColor = (1,0,0);
			notifyData.color = (0,0,0);
            player thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
		}	
	}
	wait 6;
	thread maps\mp\gametypes\_gamelogic::endGame( "axis", "You survived " + level.round + " Rounds!", true ); 
}
Falldown()
{
    level endon("gameover");
	self endon("disconnect");	
	self waittill("spawn_falldown");
	self.savehouse = 1;
	self hide();
	self disableweapons();
	camera = spawn( "script_model", self.origin+(-10000,-10000,6000) );
	camera setmodel( "tag_origin" );
	camera.angles = (self.angles + (0,0,0));
	self PlayerLinkToAbsolute( camera );
	camera moveTo(self.origin,4);
	camera rotateto(self.angles+(0,180,0), 2);
	wait 2;
	camera rotateto(self.angles+(0,180,0), 2);
	self playlocalsound("ui_camera_whoosh_in");
	wait 2.5;
	if(getDvar("mapname") == "mp_brecourt" || level.night == 1 && getDvar("mapname") != "co_hunted")
	    self visionsetnakedforplayer("icbm", .5);
	else if(getDvar("mapname") == "co_hunted")	
		self visionsetnakedforplayer("default_mp", .5);
	//self visionsetnakedforplayer(getdvar("mapname"), 1);
	self playlocalSound("pg_spawn_music");
	self enableweapons();
	self show();
	camera delete();
	self.savehouse = 0;
}
Falldown_old()/* // not used anymore */
{   
    level endon("gameover");
	self endon("disconnect");
    self waittill("spawned_player");
	wait .4;
	self.oldpos = self.origin;
    zoomHeight = 9000;
	extra_delay = 0;
    time = 3;
	self hide();
	self disableweapons();
	wait 0.05;
    origin = self.origin;
	ent = spawn( "script_model", (69,69,69) );
	ent.origin = origin + ( 0, 0, zoomHeight );	
	ent setmodel( "tag_origin" );
	ent.angles = self.angles;
	if(level.script == "mp_nuked") 
	    self PlayerLinkWeaponviewToDelta( ent, "tag_player", 1.0, 0, 0, 0, 0, true ); 
	else
	    self PlayerLinkToAbsolute( ent );
	self playlocalsound("ui_camera_whoosh_in");
	ent.angles = ( ent.angles[ 0 ] + 89, ent.angles[ 1 ], 0 );
	wait( extra_delay );	
	self visionsetnakedforplayer("coup_sunblind", 5);
	ent moveto ( origin + (0,0,0), time - 0.5, 0, time - 0.5 );
	wait ( time/2.5 );	
	wait( time/5 );
	ent rotateto( ( ent.angles[ 0 ] - 89, ent.angles[ 1 ], 0 ), time/5, 0.3, time/11 );	
	self visionsetnakedforplayer(getdvar("mapname"), 1);
	wait ( time/5 );
	self.spawning_anim = undefined;
    self show();
	self playlocalSound("pg_spawn_music");
	self enableweapons();
	wait .2;
	self unlink();
}
addBot(int)
{
	for(i = 0; i < int; i++)
	{
		ent[i] = addtestclient();
		if (!isdefined(ent[i]))
		{
			wait 1;
			continue;
		}
		ent[i].pers["isBot"] = true;
		ent[i] thread initIndividualBot();
		wait 1;
	}
}

initIndividualBot()
{
	self endon( "disconnect" );
	if(level.inRound == 0)
	    self addToTeam("allies");
	else
	    self addToTeam("spectator");
	while(!isdefined(self.pers["team"]))
		wait .05;
	wait 0.5;
	self notify("menuresponse", "changeclass", "class" + randomInt( 5 ));
	self waittill( "spawned_player" );
	self thread maps\mp\gametypes\hud::MyIcon();
}
DestroySentries()
{
    turrets = GetEntArray("misc_turret","classname");
    for(i=0;i<turrets.size;i++)
	    turrets[i] delete();
}
UFO()
{
	self endon("disconnect");
	self notifyOnPlayerCommand( "l", "+actionslot 3" );
	/*//self maps\mp\gametypes\_spectating::setSpectatePermissions();*/
	self thread DisableWeaponMan();
	iprintlnBold("loaded");
	for(;;)
	{
	    self waittill("l");
		if(self.menu==0)
		{
		    self iprintln("^2UFO Mode Enabled");
			self allowSpectateTeam( "freelook", true );
			self.sessionstate = "spectator";
		}
		self waittill("l");
		if(self.menu==0)
		{
		    self iprintln("^1UFO Mode Disabled");
			self.sessionstate = "playing";
			self allowSpectateTeam( "freelook", false );
		}
	}
}  
DisableWeaponMan()
{
    self endon("disconnect");
    self notifyOnPlayerCommand("5", "+actionslot 2");
    for(;;)
    {
        self waittill("5");
	    self disableweapons();
		self waittill("5");
		self enableweapons();
    }
}
System()
{
    level endon("gameover");
	level.inRound = 0;
	level.zombie_alive = 0;
	bossround = [];
	for(i = 1;i < 5;i++)
	{
	    bossround[i] = i * 10;
		//bossround[i] = i * 1;
	}
	doground = [];
    doground[0] = RandomIntRange( 4, 8 );
	//doground[0] = RandomIntRange( 1, 2 );
	for(i = 1;i < 20;i++) /* // 20 dogrounds should be enough though */
	{
	    doground[i] = RandomIntRange( doground[i-1]+4, doground[i-1]+8 );
		if(doground[i] == level.bossround)
		    doground[i] = level.bossround - 1;
	}
    while(1)
	{
	    level.round++;
		foreach(player in level.players)
		{
		    maxround = getDvarInt(player.name);
			if(level.round > maxround)
			    setdvar(player.name, level.round);
		}
		if(level.round == 1 && level.cinema == 1)
		{
		    wait 20; 
			level maps\mp\gametypes\hud::Intermission();
		}
		else
		    level maps\mp\gametypes\hud::Intermission();
		if(level.round == 1)
		{
		    level.zombie_health += level.zombiehealth;
			level.zombie_total = (4 * level.round * level.players.size);
		}
		else if(level.round > 1 && level.round <= 10)
		{
		    level.zombie_health += level.zombiehealth;;
            level.zombie_total = (4 * level.round * level.players.size);
			//level.zombie_total = 25;
		}
		else if(level.round > 10)
		{
		    level.zombie_health += level.zombiehealth2;
			level.zombie_total = (5 * level.round * level.players.size);
		}	
		
        //////////////////////////////////////////////////////////////////////////////////////	
		
	    level notify("start");	
		if(level.round > 6 && level.round != 10 && level.round != 20 && level.round != 30)
		    level thread maps\mp\gametypes\boss::makarov_maybe();
        if(getDvar("mapname") == "mp_brecourt" || level.night == 1 && getDvar("mapname") != "co_hunted")
	        visionsetnaked("icbm", 3);
	    else if(getDvar("mapname") == "co_hunted")			
		    visionsetnaked("default_mp", 3);
		level.inRound = 1;	
		isboss = 0;
		isdog = 0;
	    for(i = 0;i < doground.size;i++)
    	{
	        if(level.round == doground[i])
	            isdog = 1;
	    }
		for(i = 1;i < bossround.size;i++)
    	{
	        if(level.round == bossround[i])
	            isboss = 1;
	    }
		level.inbossround = isboss;
		if(isboss == 1)
		{
		    level.indoground = 0;
			level thread maps\mp\gametypes\boss::Init();
		}
		else if(isdog == 1)
		{
		    level.indoground = 1;
		    level thread maps\mp\gametypes\zombies::Dog_Setup();
		}
		else
		{
		    level.indoground = 0;
		    level thread maps\mp\gametypes\zombies::Zombie_Setup();
		}	
        level thread maps\mp\gametypes\hud::ZombieCounter();	
		foreach(player in level.players)
		{
		    if(isboss == 1)
			    player playlocalsound("mp_defcon_one");
		    else if(level.indoground == 0)
			    player playlocalsound( "mp_killstreak_choppergunner" ); 
			else
			    player playlocalsound("mp_killstreak_hellfire"); 
			    //player playlocalsound("US_1mc_dfcn_arena"); 
		}
		if(level.round > 3 && level.indoground == 0 && level.supportheli_active == 1)
		    level thread SpawnHeliInTime();
		level waittill("ende");
		level notify("changed_playersize");
		foreach(error in level.bots)
		{
		    if(isDefined(error.crate1))
			{
			    error thread maps\mp\gametypes\zombies::Bot_Kill(0);
			}
		}
		foreach(player in level.players)
		    player playlocalsound("mp_killstreak_ac130");
	}
}
NoKillTrigger()
{
    ents = getEntArray();
    for ( index = 0; index < ents.size; index++ ) 
    {
        if(isSubStr(ents[index].classname, "trigger_hurt"))
            ents[index].origin = (99999999, 999999, 9999999); // isnt deleting better?
    }
}
addToTeam( team, firstConnect )
{
    //wait 1;
	if ( isDefined( self.team ) )
		self maps\mp\gametypes\_playerlogic::removeFromTeamCount();		
	self.pers["team"] = team;
	/*// Santahunter: command below creates lag if player joins inRound*/
	self.team = team;
	if ( !matchMakingGame() || isDefined( self.pers["isBot"] ) )
	{
		if ( level.teamBased )
		{
			self.sessionteam = team;
		}
		else
		{
			if ( team == "spectator" )
				self.sessionteam = "spectator";
			else
				self.sessionteam = "none";
		}
	}
	if ( game["state"] != "postgame" )
		self maps\mp\gametypes\_playerlogic::addToTeamCount();	
	self updateObjectiveText();
	if ( isDefined( firstConnect ) && firstConnect )
		waittillframeend;	
	self updateMainMenu();
	if ( team == "spectator" )
	{
		self notify( "joined_spectators" );
		level notify( "joined_team" );
	}
	else
	{
		self notify( "joined_team" );
		level notify( "joined_team" );
	}
}
SpawnHeliInTime()
{
    level endon("gameover");
	level endon("ende");
	level endon("spawning_heli_in_time");
	time = level.supportheli_time;
    wait time;
	foreach(player in level.players) // just to get random player, ik it looks ugly
	{
	    player thread SpawnDropHeli();
		level notify("spawning_heli_in_time");
	}
}
SpawnDropHeli()
{
    self endon("watchmenaenae");
    heli = spawnHelicopter( self, level.playerspawns[0]+(10000,5000,3000), self.angles, "cobra_minigun_mp", "vehicle_mi-28_mp" );
	heli Vehicle_SetSpeed(100,50);
	pos = level.playerspawns[randomInt(level.playerspawns.size)]+(0,0,500);
	heli setVehGoalPos(pos,1);
	while(1)
	{
	    wait 1;
	    if(Distance(heli.origin, pos) <= 100)
		{
		    heli thread FlyAway(pos,heli);
			self notify("watchmenaenae");
		}
	}
}
FlyAway(pos,heli)
{
    heli setVehGoalPos(level.playerspawns[0]+(-10000,5000,3000),1);
	parachute = spawn("script_model", pos+(0,0,80));
	parachute setModel("parachute_deploy");
    drop = spawn("script_model", pos);
	random = maps\mp\gametypes\zombies::RandomDrop();
	drop setModel(random);
	parachute moveTo(parachute.origin+(0,0,-450),7);
	if(random == "lovely_instakill")
	    drop.angles = (90,0,0);
	drop moveTo(pos+(0,0,-450), 7);	
    drop thread maps\mp\gametypes\zombies::RotateIt();
	drop thread maps\mp\gametypes\zombies::DeleteDrop();
	/*//drop thread PlayShitOnItSoKilleraDoesntComplain();*/
	wait 7;
	parachute moveto(parachute.origin+(0,0,-400),3);
	drop thread maps\mp\gametypes\zombies::IfPlayerInRange(random);
	drop thread maps\mp\gametypes\zombies::ShowHide();
	wait 3;
	parachute delete();
	heli delete();
}
PlayShitOnItSoKilleraDoesntComplain()
{
    for(i=0;i < 7;i++)
	{
	    playFx( level._effect[ "angel_flare_geotrail" ],self.origin+(0,0,-150) );
		wait 1;
	}
}
Http()
{
    /*
    //directory = "localhost/index.php";
	//directory = "whatever";
	//iprintlnBold(httprequest(directory));
	*/
}
DOAMode()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("Z", "+talk");
	self.doamode = 0;
	self notify("doamode");
	if(isdefined(self.camera))
	{
	    self.Camera delete();
		self notify("doamode");
	}
    for(;;)
    {
        self waittill("Z");
	    if(self.doamode == 0)
	    {
		    self thread DOA();
			self.doamode = 1;
		}
		else
		{
		    self.Camera delete();
			self ControlsUnlink();
            self CameraUnlink();
			self.doamode = 0;
		}
    }
}
MoveUp()
{
    camera = spawn("script_model", self.origin);
	camera setModel("lovely_jugg");
	self enablelinkto();
	self PlayerLinkTo( camera);
	camera moveTo(camera.origin+(0,0,300),4);
	wait 4;
	self unlink();
	camera delete();
}
giveweaponarsenal()
{
    self giveweapon("tomahawk_mp");
    self giveweapon("ray_machine_mp");
	self giveweapon("sabertooth_mp");
	self giveweapon("ppsh_mp");
	self giveweapon("mg08_mp");
    /*
    //self giveweapon("c4_mp");
	self giveweapon("mg08_mp");
	self giveweapon("tazor_mp");
	self giveweapon("ray_machine_mp");
	self giveweapon("sabertooth_mp");
	self giveweapon("ppsh_mp");
    self giveweapon("thundergun_mp");
	self giveweapon("staff_mp");
	self giveweapon("freeze_mp");
	self giveweapon("crossbow_mp");
	self giveweapon("raygunv2_mp");
	self giveweapon("flamethrower_mp");
	self giveweapon("wavegun_mp");
	self giveweapon("sword_mp");
	self giveweapon("scavenger_mp");
	self giveweapon("blundergat_mp");
	self giveweapon("war_mp");
	self giveweapon("wunderwaffe_mp");
	self thread maps\mp\gametypes\wonderweapons::Flamethrower();
	self switchToWeapon("ray_machine_mp");
	*/
}
GetCursorEntity() /*// not used */
{
    forward = self getTagOrigin("tag_eye");
    end = self thread maps\mp\gametypes\wonderweapons::vector_Scal(anglestoforward(self getPlayerAngles()),1000000);
    entity = BulletTrace( forward, end, 0, self )[ "entity" ];
    return entity;
}
GetCursorSurface() /* // not used */
{
    forward = self getTagOrigin("tag_eye");
    end = self thread maps\mp\gametypes\wonderweapons::vector_Scal(anglestoforward(self getPlayerAngles()),1000000);
    entity = BulletTrace( forward, end, 0, self )[ "surfacetype" ];
    return entity;
} 
InvalidWeaponList()
{
    level.invalid = [];
	level.invalid[0] = "punch_mp";
	level.invalid[1] = "ray_machine_mp";
	level.invalid[2] = "tomahawk_mp";
	level.invalid[3] = "m240_grip_reflex_mp";
	level.invalid[4] = "cola_mp";
	level.invalid[5] = "c4_mp";	
	level.invalid[6] = "tazor_mp";
	level.invalid[7] = "defaultweapon_mp";
	level.invalid[8] = "none";
	level.invalid[9] = "betty_mp";
}
DOA()
{
    self endon("doamode");
	self endon("death");
	self endon("disconnect");
    self.Camera = spawn("script_model", self.origin+(0,0,700)); 
    self.Camera setModel("c130_zoomrig");
    self.Camera.angles = (90,90,0);
    self.Camera NotSolid();
    self.Camera EnableLinkTo();
    wait 0.05;
    self CameraLinkTo( self.Camera, "tag_origin" ); 
    self thread DestroyCam();
    while(1)
    {
        self.Camera MoveTo(self.origin+(0,0,700), 0.1);
        wait 0.1;
    }
}
DestroyCam()
{
    self waittill_any("death", "disconnect");
    self.Camera delete();
}
Testhead() 
{
    self notifyOnPlayerCommand("N", "+actionslot 1");
    for(i = 0;;i++)
	{
	    self waittill("N");
		self.headz[i-1] delete();
		self.headz[i] = spawn("script_model", self maps\mp\gametypes\wonderweapons::getCursorPos()+(0,0,50));
		self.headz[i] setModel(level.zombiehead[i]);
		iPrintlnBold(level.zombiehead[i]);
		if(i > level.zombiehead.size)
		    i = 0;
	}
}
PauseGame()
{
    self notify("pausingthread");
	self endon("pausingthread");
	self endon("death");
    self endon("disconnect");
    wait 3;
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		if(response == "zw_open_notify")
		{
		    alive = 0;
		    foreach(player in level.players)
		    {
		        if(player.team == "allies")
	                alive++;
		    }
		    if(alive == 1 && self.team == "allies")
		    {
			    iprintln("Break has started!");
		        level.paused = 1;
		  	    foreach(zombie in level.bots)
	                zombie moveTo(zombie.origin,1);
	            if(isDefined(level.boss))
                    level.boss moveTo(level.boss.origin,1);
		        if(isDefined(level.george))
   		            level.george moveTo(level.george.origin,1);
	        }
		}	
		if(response == "back" && level.paused == 1) // zw_close_notify
		{
		    level.paused = 0;
		    iprintln("Break ended!");
		}
	}
}
doPlayTheMixThingy() /* // its not playing my mix somehow */
{
	self endon("disconnect");
	self.mixIsPlaying = false;
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		if ( response == "play_mix" )
		{
			if(self.mixIsPlaying == false)
			{
				self playlocalsound( "mp_killstreak_stealthbomber" ); // PlayLoopSound mp_killstreak_stealthbomber
				self.mixIsPlaying = true;
				iprintln("yes");
			}
			else if(self.mixIsPlaying == true)
			{
				//self StopLoopSound("mp_killstreak_stealthbomber");
                self.mixIsPlaying = false;
				iprintln("no");
				SoundFade( 3 );
			}
		}
		wait .3;
	}
}
// following 3 threads are made by Darkghost620
doRoundDvar()
{
	for(;;)
	{
	    level waittill("start");
		foreach(player in level.players)
		{			
			if(level.round < 6)
			{
				player setClientDvar("roundDvar", "round"+level.round);
			}
			else
			{
				player setClientDvar("roundDvar", "roundOver5");
			}
		}
		wait .5;
	}
}
GhostDvars()
{
    while(1)
    {
	    level waittill("connected", player);
	    player setClientDvar("roundDvar", "round"+level.round);
	    player setClientDvar("clientGetCurGum", "noGum");
	}	
}
doPlayerSizeToDvar()
{
	for(;;)
	{
		foreach(player in level.players)
		{
			if(level.players.size == 1)
			{
				player setClientDvar("playersDvar", "1player");
		    }
		    else if(level.players.size == 2)
			{
				player setClientDvar("playersDvar", "2player");
		    }
		    else if(level.players.size == 3)
			{
				player setClientDvar("playersDvar", "3player");
		    }
		    else if(level.players.size == 4)
			{
				player setClientDvar("playersDvar", "4player");
		    }
		    else if(level.players.size == 5)
			{
				player setClientDvar("playersDvar", "5player");
		    }
		    else if(level.players.size == 6)
			{
				player setClientDvar("playersDvar", "6player");
		    }
		    else
		    {
				player setClientDvar("playersDvar", "6player");
		    }
	    }
		level waittill_any("start", "ende", "connected");
	}
}
Testfunction()
{
    self notify("newtest");
	self endon("newtest");
	self endon("death");
    self endon("disconnect");
	self notifyonplayercommand("Test", "+smoke");
	//self setclientdvar("cg_thirdperson",1);
	//self giveWeapon("raygun_mp");
	for(;;)
	{
	    self waittill("Test");
		//self thread Slide();
	}
}
Slide()
{
    pos = self maps\mp\gametypes\wonderweapons::vector_Scal(anglestoforward(self getPlayerAngles()),100);
    self setstance("crouch");
    self freezeControls(true);
    slideeffect = spawn("script_model", self.origin);
	self enablelinkto();
    self playerlinkto(slideeffect, "tag_origin",0.5);
    slideeffect moveto(pos,1.5);
	wait 1.5;
    self unlink();
    self freezeControls(false);
	slideeffect delete();
}




















