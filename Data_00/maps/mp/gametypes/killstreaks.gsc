#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#using_animtree("multiplayer");

LoopKill() // needed because too many spots where I have to do a notify on kill, without this thread
{
    self endon("newstreak");
	self endon("disconnect");
	kills = self.kills;
	for(;;)
	{
	    wait 1;
		if(self.kills != kills)
		{
		    /**
		    difference = self.kills - kills;
		    kills = self.kills;
			while(difference > 0)
			{
			    difference--;
				self notify("addkill");
				// disabled because not enough time to do the addkillloop in Init()
			}
			*/
			kills++;
			self notify("addkill");
		}
	}
}
Init()
{
    self endon("disconnect");
    self notify("newstreak");
	self endon("newstreak");
	kills = 0;
	self thread LoopKill();
	while(1)
	{
	    streak = undefined;
	    self waittill("addkill");
		kills++;
		if(kills == 100)
		{
			streak = "Sentry";
			self thread Sentry();
		}
		if(kills == 200)
		{
		    streak = "Drone";
			self thread MaxisDrone();
		}
		if(kills == 300)
		{
		    streak = "Raymachine";
			self thread Raymachine();
		}
		if(kills == 400)
		{
		   streak = "Supporter";
		   self thread Supporter();
		}
		if(kills == 500)
		{
		    streak = "G Strike";
			self thread GStrike();
		}
		if(kills == 600)
		{
		   streak = "Chopper";
		   self thread Chopper();
		}
		if(isDefined(streak))
		    self thread maps\mp\gametypes\hud::StreakHud(kills, streak);
	}
}
GStrike()
{
    self endon("disconnect");
	self notify("received_airstrike");
	self endon("received_airstrike");
	self notifyonplayercommand("4", "+actionslot 4");
	for(;;)
	{
	    self waittill("4");
		if(self.team == "allies" && self.isDown == 0)
		{
		    self thread LocateAim();
			wait .1;
			self thread Call_Airstrike();
			self notify("received_airstrike");
		}
	}
}
Call_Airstrike()
{
    self endon("disconnect");
	self endon("death");
	self endon("airstrike_incoming");
    self iPrintlnBold("Press ^3[{+activate}] ^7to call in airstrike to the position you are looking at!");
	self notifyonplayercommand("GStrike", "+activate");
	for(;;)
	{
	    self waittill("GStrike");
		if(Distance(self.gsstrike_pos, self.origin) < 5000 && self.down == 0)
		{
		    self thread DoAirstrike(self.gsstrike_pos);
			self.Fx_strike delete();
		    self.Fx2_strike delete();
			self thread AirstrikeFx(self.gsstrike_pos);
			self notify("airstrike_incoming");
		}
		else if(self.down == 0)
		    self iprintln("^1ERROR: Distance exceeded for airstrike!");
	}
}
DoAirstrike(pos)
{
    wait 8;
    for(i = 0;i < 30;i++)
	{
	    wait .33;
	    if(level.paused == 0)
		{
		    MagicBullet("ac130_40mm_mp", pos+(0,0,10000),pos,self);
		}
		else
		    i--;	
	}	
}
AirstrikeFx(pos)
{
	callstrikefx = SpawnFx(level.airstrikefx,pos);
	TriggerFX(callstrikefx);
	wait 10;
	callstrikefx delete();
}
LocateAim()
{
    self endon("disconnect");
	self endon("death");
	self endon("airstrike_incoming");
	while(1)
	{
	    self.gsstrike_pos = self maps\mp\gametypes\wonderweapons::getCursorPos();
	    self.Fx_strike = SpawnFx(level.teleFX["red"],self.gsstrike_pos);
        self.Fx2_strike = SpawnFx(level.teleFX["grey"],self.gsstrike_pos);
	    TriggerFX(self.Fx_strike);
	    TriggerFX(self.Fx2_strike);
		wait .1;
		self.Fx_strike delete();
		self.Fx2_strike delete();
	}
}
MaxisDrone()
{
    self endon("disconnect");
	self notify("received_drone");
	self endon("received_drone");
	self notifyonplayercommand("4", "+actionslot 4");
	for(;;)
	{
	    self waittill("4");
		if(self.team == "allies" && self.isDown == 0)
		{
		    self thread SpawnDrone();
			self notify("received_drone");
		}
	}
}
SpawnDrone()
{
    iPrintln("Maxis Drone incoming!");
    drone = spawn("script_model", self.origin+(10000,0,2000));
	drone setModel("lovely_drone");
	drone thread DroneIsMoving(self);
	drone thread DroneAttack(self);
	drone moveTo(self.origin+(0,0,500), 10);
	//spinstart
	drone playLoopSound( level.heli_sound[self.pers["team"]]["spinloop"] );
	wait 10;
	wait level.streaktime;
	drone notify("drone_is_done");
	drone moveTo(self.origin+(10000,0,2000),10);
	wait 10;
	drone stopLoopSound( level.heli_sound[self.pers["team"]]["spinloop"] );
	drone delete();
}
DroneAttack(player)
{
    player endon("disconnect");
	player endon("death");
	self endon("drone_is_done");
    wait 7;
    for(;;)
    {
	    wait .2;
		dist = 1200;
		target = undefined;
		foreach(zombie in level.bots)
		{
		    if(isDefined(zombie.crate1) && Distance(zombie.origin+(0,0,35), self.origin) < dist)
			{
			    dist = Distance(zombie.origin+(0,0,35));
				target = zombie.origin+(0,0,35);	
			}
		}
		movetoLoc = VectorToAngles( target.origin - self.origin );	
	    self RotateTo((0,movetoLoc[1],0), 0.5);
		if(isDefined(target))
		{
		    MagicBullet("ac130_25mm_mp", self.origin, target, player);
		}
	}	
}
DroneIsMoving(player)
{
    player endon("disconnect");
	player endon("death");
	self endon("drone_is_done");
	wait 11;
	for(;;)
	{
	    pos = player.origin+(0,0,200);
		//if(cointoss())
		//    pos[2] = pos[2] - (pos[2] * 2);
		self moveTo(pos,.5);
        wait .5;		
	}
}
Sentry()
{
    self endon("disconnect");
	self notify("received_sentry");
	self endon("received_sentry");
	self notifyonplayercommand("4", "+actionslot 4");
	for(;;)
	{
	    self waittill("4");
		if(self.team == "allies" && self.isDown == 0)
		{
		    iPrintln("Sentrygun spawned");
		    Turret = spawnTurret( "misc_turret", self.origin, "sentry_minigun_mp" ); 
            Turret setModel( "sentry_minigun" );
            Turret.angles = self.angles;
			Turret LaserOn();
			Turret SetRightArc(360);
			Turret SetTopArc(360);
			Turret SetPlayerSpread( 1 ); // test recoil
			Turret.owner = self;
			Turret thread DestroyTurret(self);
			Turret thread SkipTurret();
			self notify("received_sentry");
		}
	}
}
SkipTurret()
{
    self.owner waittill("wentdown");
	self.owner notify("skipturret");
	self delete();
    /*
    self endon("sentry_destroy");
    for(;;)
	{
	    self.owner waittill("wentdown");
	    self MakeTurretUnusable();
	    self.owner waittill_any("spawned_player", "revived");
	    self MakeTurretUsable();
	}
	*/
}
DestroyTurret(player)
{
    self endon("skipturret");
    wait level.streaktime;
	self notify("sentry_destroy");
	self delete();
	player iPrintln("Sentry is gone!");
}
Raymachine()
{
    self endon("disconnect");
	self notify("received_raymachine");
	self endon("received_raymachine");
	self notifyonplayercommand("4", "+actionslot 4");
	for(;;)
	{
	    self waittill("4");
		if(self.team == "allies" && self.isDown == 0)
		{
		    gun = self getCurrentWeapon();
            self giveweapon("ray_machine_mp");
	        self givemaxammo("ray_machine_mp");
	        self switchtoweapon("ray_machine_mp");
			//time = (level.streaktime / 2);
	        for(i = 60;i > 0;i--)
			{
			    wait 1;
				if(level.paused == 1)
				    i++;
			}
	        self takeweapon("ray_machine_mp");
			if(gun != "none" && gun != "")
	            self switchtoweapon(gun);
	        self iPrintln("Raymachine is gone!");
			self notify("received_raymachine");
		}
	}	
}
Supporter()
{
    self endon("disconnect");
	self notify("received_supporter");
	self endon("received_supporter");
	self notifyonplayercommand("4", "+actionslot 4");
	for(;;)
	{
	    self waittill("4");
		if(self.team == "allies" && self.isDown == 0)
		{
		    iPrintln("Supporter incoming!");
			birdy = spawnHelicopter(self, level.playerspawns[randomInt(level.playerspawns.size)]+(12000,5000,3000), self.angles+(0,0,0), "littlebird_mp", "vehicle_little_bird_armed");
			birdy Vehicle_SetSpeed(1300, 20);
			birdy.angles = self.angles+(0,180,0);
			pos = self.origin+(0,0,300);
			birdy setVehGoalPos(pos,1);
			juggplace = birdy getTagOrigin("tag_minigun_attach_right");
		    jugger = spawn("script_model", juggplace); 
			jugger enablelinkto();
			jugger linkto(birdy);
			level.supporter[level.supporter.size+1] = jugger;
			jugger setModel("mp_body_riot_tf141_desert"); // mp_body_riot_tf141_desert
			jugger.team = self.team; // needed?
			jugger.pers["team"] = jugger.team;
			jugger.owner = self;
			jugger.isfiring = 0;
			jugger.ismoving = 0;
			jugger.crate1 = spawn("script_model", jugger getTagOrigin( "j_spinelower" ) + (-5,0,-10)); 
	        jugger.crate1 setModel("com_plasticcase_beige_big");
			jugger.crate1 Solid();
	        jugger.crate1 hide();
			jugger.crate1 setCanDamage(true);
			jugger.crate1 linkto( jugger, "j_spinelower" );
			jugger.crate1.maxhealth = 7;
	        jugger.crate1.health = 7;
			jugger.crate1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
			birdy thread Jugger_Jump(jugger,pos);
			jugger.head = spawn("script_model", jugger getTagOrigin( "j_spine4" ));
			jugger.head setModel("head_hero_soap_soccom_a");  // head_riot_tf141_desert
			jugger.head.angles = (270,0,270);
			jugger.head enablelinkto();
	        jugger.head linkto(jugger, "j_spine4" );
			self notify("received_supporter");
		}
	}	
}
Jugger_Jump(jugger,pos)
{
    level endon("gameover");
	jugger endon("jugger_jumped");
    for(;;)
	{
	    if(Distance(self.origin, pos) <= 100)
		{
		    pos2 = physicstrace( jugger.origin,jugger.origin-(0,0,300));
			jugger unlink();
		    jugger moveTo(pos2,1.3);
			jugger scriptModelPlayAnim("lovely_zombie_fly");
			wait 0.7;
			self setVehGoalPos((100000,10000,10000),1);
			wait 1;
		    jugger thread Jugger_Life();
			jugger thread Jugger_Follow();
			jugger thread Jugger_Search();
			jugger thread Jugger_Attack();
			jugger thread Jugger_Fx();
            jugger thread Jugger_Hit();
			wait 20;
			self delete();
			jugger notify("jugger_jumped");
		}
		wait 1;
	}
}
Jugger_Life()
{
    level endon("gameover");
	self endon("bot_dead");
    for(;;)
	{
	    self waittill("jugger_damage");
		playFx(level.bloodfx, self.origin+(0,0,35));
		self.crate1.health--;
		if(self.crate1.health <= 0)
		{
		    self.owner iPrintln("Supporter died!");
			self.weapon delete();
			//self thread maps\mp\gametypes\zombies::Bot_Animation("death",1);
			self scriptModelPlayAnim("pb_death_run_onfront");
			self thread DeleteCorpus();
			self notify("bot_dead");
		}
	}
}
Jugger_Hit()
{
    level endon("gameover");
	self endon("bot_dead");
    for(;;)
	{
	    foreach(zombie in level.bots)
		{
		    if(Distance(zombie.origin,self.origin) <= 70 && isDefined(zombie.crate1))
			{
			    zombie thread maps\mp\gametypes\zombies::Bot_Animation("fight");
			    self notify("jugger_damage");
				wait 2;
			}
		}
		wait 1;
	}
}
DeleteCorpus()
{
    self.crate1 delete();
	level endon("gameover");
    wait level.streaktime;
	self.head delete();
	self delete();
}
Jugger_Follow()
{
    level endon("gameover");
    self endon("bot_dead");
    for(;;)
    {
		if(Distance(self.origin, self.owner.origin) > 200 && self.isfiring == 0)
		{
		    if(self.ismoving == 0)
			    self scriptModelPlayAnim("pb_walk_forward_mg"); // pb_walk_forward_mg
		    self.ismoving = 1;
		    self moveTo(self.owner.origin,(distance(self.origin, self.owner.origin) / 130));
		}
		else
		{
		    if(Distance(self.origin, self.owner.origin) <= 200 && self.moving == 1)
			{
			    self.ismoving = 0;
				self moveTo(self.origin, 1);
				self scriptModelPlayAnim("pb_stand_alert"); // pb_stand_alert  lovely_support_stand
			}
		}
		wait 1;
    }
}
Jugger_Search()
{
    level endon("gameover");
	self endon("bot_dead");
    for(;;)
	{
	    wait .5;
		MaxDistance = 99999;
	    target = undefined;
        foreach(zombie in level.bots)
		{
		    if( !bulletTracePassed( self.origin+(0,0,75), zombie.origin+(0,0,65), false, self ) && !bulletTracePassed( zombie.origin+(0,0,65), self.origin+(0,0,75), false, zombie ) )
                continue;
			if(Distance(self.origin, zombie.origin) < MaxDistance && isDefined(zombie.crate1))
			{
			    MaxDistance = Distance(self.origin, zombie.origin);
			    target = zombie;
				self.juggerpos = target.origin;
			}	
		}
		if(isDefined(target))
		{
		    angles = VectorToAngles( target.origin - self.origin);
		    self RotateTo( angles , 0.5 );
			self.isfiring = 1;
		}	
		else 
		{
		    self moveTo(self.origin, 1);
			self.isfiring = 0;
			angles = VectorToAngles( self.owner.origin - self.origin);
		    self RotateTo( angles , 0.5 );
		}
	}
}
Jugger_Attack()
{
    level endon("gameover");
	self endon("bot_dead");
	mode = [];
	mode[0] = "honey_mp";
	mode[1] = "mosin_mp";
	mode[2] = "raygun_mp";
	mode[3] = "at4_mp";
	mode[4] = "mg08_mp";
	mimu = randomInt(mode.size);
	mymode = mode[mimu];
	self.weapon = spawn("script_model", self getTagOrigin("j_gun"));
	self.weapon setmodel(GetWeaponModel(mymode,0));
	self.weapon enablelinkto();
	self.weapon.angles = self.angles+(0,0,90);
	self.weapon linkto(self, "j_gun"); // j_shouldertwist_ri
	time = 1 + (1 * mimu);
	if(mymode == "honey_mp")
	    time = 0.15;
	if(mymode == "mg08_mp")
        time = 0.5;	
	if(mymode == "mosin_mp")
        time = 1;	
	if(mymode == "raygun_mp")
        time = 2;	
	if(mymode == "at4_mp")
        time = 3;		
	while(1)
	{
	    wait time;
		if(self.isfiring == 1)
		{
		    //MagicBullet(mymode, self.weapon.origin+(0,0,10), self.juggerpos+(randomInt(50),randomInt(50),35), self.owner);
			MagicBullet(mymode, self.weapon.origin+(0,0,10), self.juggerpos+(0,0,35), self.owner);
		}
	}
}
Jugger_Fx()
{
    level endon("gameover");
	self endon("bot_dead");
	self thread Jugger_Fx_Fix();
	while(1)
	{
	    self.fx = spawnfx(level.glowfx, self.origin+(0,0,100));
		triggerfx(self.fx);
	    wait .4;
		self.fx delete();
	}
}
Jugger_Fx_Fix()
{
    self waittill("bot_dead");
	if(isDefined(self.fx))
	    self.fx delete();
}


//////////////////////////////////// Chopper ///////////////////////////////////

Chopper()
{
    self endon("disconnect");
	self notify("received_chopper");
	self endon("received_chopper");
	self notifyonplayercommand("4", "+actionslot 4");
	for(;;)
	{
	    self waittill("4");
		if(self.team == "allies" && self.isDown == 0)
		{
	        self thread CreateChopper();
            self notify("received_chopper");			
		}
	}	
}
CreateChopper()
{
    heli = spawnHelicopter( self, self.origin+(10000,randomInt(5000),3000), self.angles, "cobra_minigun_mp", "vehicle_mi-28_mp" );
	heli Vehicle_SetSpeed(200,40);
	self thread MoveToRandom(heli);
    self thread AttackHeli(heli);  
	self thread LeaveHeli(heli);
	wait level.streaktime;
	self notify("leaveheli");
}
MoveToRandom(heli)
{
    level endon("gameover");
	self endon("leaveheli");
	self endon("disconnect");
	self endon("death");
    while(1)
	{
	    r = randomInt(3000);
		r2 = randomInt(3000);
	    heli setVehGoalPos(self.origin+(r-r2,r2-r,800),1);
		wait 10;
	}
}
AttackHeli(heli)
{
    level endon("gameover");
	self endon("leaveheli");
	self endon("disconnect");
	self endon("death");
	wait 10;
	while(1)
	{
	    wait .5;
	    dist = 99999;
		target = undefined;
		if(isDefined(level.boss.crate1))
		    target = level.boss;
	    foreach(zombie in level.bots)
		{
		    if(isDefined(zombie.crate1) && Distance(heli.origin, zombie.origin+(0,0,35)) <= dist)
			{
			    dist = Distance(heli.origin, zombie.origin+(0,0,35));
				target = zombie;
			}
		}
		if(isDefined(target) && Distance(self.origin, target.origin) > 400)
		    MagicBullet("ac130_40mm_mp", heli.origin+(0,0,-100), target.origin+(0,0,35), self);
	}
}
LeaveHeli(heli)
{
    self waittill_any("death", "disconnect", "leaveheli");
	heli setVehGoalPos(self.origin+(1000,10000,800),1);
	wait 10;
	heli delete();
}













