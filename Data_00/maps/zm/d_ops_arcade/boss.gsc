#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\d_ops_arcade\utilities;
#using_animtree( "multiplayer" );

// =========================================================
//
// Contains bossfight functions
//
// =========================================================
BRUTUS_RAGE = "UK_1mc_defcon"; 
enterBossRound()
{
	level notify("enterBossRound");
	if(level.script == "mp_brecourt")
	{
		level.dragon thread Dragon_Health();
		level.dragon.hitbox = spawn("script_model", level.dragon getTagOrigin( "tag_cobiy_ride" ) + (-5,0,-10));
		level.dragon.hitbox setModel("com_plasticcase_beige_big");
		level.dragon.hitbox.angles = (90,0,0);	
		level.dragon.hitbox CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		level.dragon.hitbox Solid();
		level.dragon.hitbox setCanDamage(true);
		level.dragon.hitbox enablelinkto();
		level.dragon.hitbox linkto(level.dragon,"tag_cobiy_ride"); 	
		level.dragon.hitbox.health = getDvarInt("dragon_health_brecourt");
		level.dragon thread Dragon_Damage();
		level.dragon thread WastelandDragon_Die();
		j = 0;
		foreach(player in level.players)
		{				
			wait 3;
			player thread spawnHeli(j);
			if(j > 4)
			{
				j = 0;
				wait 10;
			}	
			else
				j++;
		}
		level waittill("dragon_defeated");
	}
	if(level.script == "mp_bsf_dead_night")
	{
		level waittill("dragon_defeated");
	}
	else if(level.script == "mp_bo2_town")
	{
		level thread Shadowman();
		level waittill("shadowman_death");
	}
}
WastelandDragon_Die()
{
	level waittill("dragon_defeated");
	self.hitbox delete();
	trace = BulletTrace(self.origin, self.origin + vector_Scal(AnglesToForward(self.angles),1000)+(0,0,-3000), false, undefined);  
	self moveTo(trace["position"], 5);
	wait 5;
	self delete();
}
spawnHeli(i)
{
	birdy = spawnHelicopter(self,(10000,10000,3000), self.angles+(0,0,0),"pavelow_mp","vehicle_pavelow_opfor");
	//birdy = spawnHelicopter(self, (5000,5000,3000), self.angles+(0,0,0), "littlebird_mp", "vehicle_little_bird_armed");
	birdy.target = level.spawns_helis[i];
	birdy Vehicle_SetSpeed(35,2);
	birdy SetTurningAbility(1);
	birdy SetMaxPitchRoll(60,10); 
	birdy enablelinkto();
	birdy.mgTurret = spawnTurret( "misc_turret", birdy.origin, "pavelow_minigun_mp" );
    birdy.mgTurret linkTo( birdy, "tag_gunner_left", (20,-20,-15), (0,-75,0) ); // (20,-20,-15) -75 in middle bei 2
    birdy.mgTurret setModel( "weapon_minigun" );
    birdy.mgTurret.angles = birdy.angles; 
    birdy.mgTurret SetPlayerSpread( .65 );
    birdy.mgTurret SetDefaultDropPitch( 25 );
	birdy.mgTurret MakeUsable();
	birdy setVehGoalPos(level.spawns_helis[i]+(0,0,200));
	birdy thread playFxonPos(level.signalsmoke, level.spawns_helis[i],40); // level.marker
	birdy thread onDistance(i);
}
moveHeli()
{
	level endon("dragon_defeated");
	self.owner endon("death");
	self.owner endon("disconnect");
	self Vehicle_SetSpeed(2000, 10);
	a = randomInt(500);
	b = randomInt(500);
	c = randomInt(500);
	if(cointoss())
		a = a -a -a;
	if(cointoss())
		b = b -b -b;
	//if(cointoss())
	//	c = c - c -c;	
	while(1)
	{		
		self setVehGoalPos(level.dragon.origin+(a, b, c),1);
		wait 1;
	}
}
flyback()
{
	self.owner endon("death");
	self.owner endon("disconnect");
	level waittill("dragon_defeated");
	i = randomInt(4);
	self setVehGoalPos(level.spawns_helis[i],1);
	valid = true;
	while(valid)
	{
		wait .1;
		if(Distance(self.origin,level.spawns_helis[i]) <= 100)
		{			
			self.owner unlink();
			self.mgTurret delete();
			self setVehGoalPos((10000,10000,3000),1);
			valid = false;
		}
	}
	wait 1;
	self.owner setorigin(level.spawns_helis[i]);
	wait 10;
	self delete();
}
onDistance(i)
{
	self endon("onEnterHeli");
	wait 24;
	self Vehicle_SetSpeed(10,2);
	wait 7;
	while(1)
	{			
		wait .5;
		foreach(player in level.players)
		{
			if(Distance(player.origin,level.spawns_helis[i]) <= 200)
			{
				player setLowerMessage("Heli", "Press ^3[{+activate}] ^7to enter the helicopter!");
				self thread tryEnterHeli(player,i);
			}
			else
				player clearLowerMessage("Heli");
		}
	}
}
tryEnterHeli(player,i)
{
	player endon("death");
	player endon("disconnect");
	player notify("tryEnterHeli");
	player endon("tryEnterHeli");
	player notifyonPlayerCommand("Enter_Heli", "+activate");
	while(1)
	{
		player waittill("Enter_Heli");
		if(Distance(player.origin,level.spawns_helis[i]) <= 200)
		{
			player.protected = 1;
			self thread onEnterHeli(player);
			self notify("onEnterHeli");
			player clearLowerMessage("Heli");
			player notify("tryEnterHeli");
		}
	}
}
onEnterHeli(player)
{
	player endon("disconnect");
	player endon("death");
	level endon("dragon_defeated");
	player setStance("crouch");
	player enablelinkto();
	player PlayerLinkTo(self, "tag_gunner_left", 0.5 );
	player.protected = 1;
	self.owner = player;
	//self.mgTurret.owner = self.owner;
	//self.mgTurret.team = self.mgTurret.owner.team;
	self thread moveHeli();
	self thread flyback();
	wait .5;	
	//player thread Minigun(self);
	while(1)
	{
		wait .2;
		self.mgTurret useby(player);		
	}
}
Minigun(chopper)
{
	self endon("disconnect");
	self endon("death");
	level endon("dragon_defeated");
	while(1)
	{
		wait .1;
		end = self vector_Scal(anglestoforward(self getPlayerAngles()),100);
		trace = BulletTrace(chopper getTagOrigin("tag_gunner_left"), end, false, undefined);
		if(self attackbuttonpressed())
		{
			MagicBullet("ac130_40mm_mp", trace["position"], self getCursorPos(), self);
		}
	}
}
Dragon_Health()
{
	level endon("dragon_defeated");
	health = getDvarInt("dragon_health");
	health = health * level.players.size;
	foreach(player in level.players)
	    player thread Bossbar(self,health,"Dragon");
}
Dragon_Damage(weaponname)
{
	level endon("game_over");
	level endon("dragon_defeated");
	self.damagetrigger = false;
	while(1)
	{
		damage = 0;
		self.hitbox waittill("damage", iDamage, attacker, iDFlags, vPoint, killedwith, victim, vDir, sHitLoc, psOffsetTime, sWeapon);
		if(!isDefined(weaponname))
		{
			damage = self maps\zm\d_ops_arcade\zombies::doDamage(iDamage,attacker,victim,sWeapon,vPoint,killedwith);	
			attacker.damage_dealed += damage;
			playFx(level.bloodfx,vPoint);
			attacker thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback(sHitLoc);
			level notify("dragon_damage");
			//iPrintln("^1" + self.hitbox.health);
			if(self.hitbox.health <= 0)
				level notify("dragon_defeated");
		}
		else
		{
			if(weaponname != sWeapon)
			{
				self.hitbox.health += iDamage;
			}
			else
			{
				if(weaponname == "frag_grenade_mp")
					damage = 1000;
				else
					damage = self maps\zm\d_ops_arcade\zombies::doDamage(iDamage,attacker,victim,sWeapon,vPoint,killedwith);	
				attacker.damage_dealed += damage;
				playFx(level.bloodfx,vPoint);
				attacker thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback(sHitLoc);
				level notify("dragon_damage");
				//iPrintln("^1" + self.hitbox.health);
				if(self.hitbox.health <= 0)
					level notify("dragon_defeated");
			}
		}
		if(!self.damagetrigger && level.script == "mp_bsf_dead_night")
			self checkDamageTrigger();
	}
}
checkDamageTrigger()
{
	if(self.hitbox.health < (getDvarInt("dragon_health")/2))
	{		
		level thread EndlessRound();
		self.dragon_damage = true;
	}
}
Bossbar(dragon,bosshealth,bossname)
{
    level endon("dragon_defeated");
	self endon("disconnect");
	self endon("death");
    crybar = createPrimaryProgressBar( -275 );  
    crybar.bar.color=(1,1,1);
	crybar.y = -180;
	crybar.bar.y = -180;
	text = createPrimaryProgressBarText( -275 ); 
	text.y = -200;
	if(bossname == "Dragon")
		text settext("^1Dragonhealth");
	self thread DeleteBar(crybar, text);
	waitFrame();
	for(;;)
	{	    
		crybar.bar.color=(1,dragon.hitbox.health/bosshealth,level.dragon.hitbox.health/bosshealth);
		crybar updateBar(dragon.hitbox.health/bosshealth);
		//iPrintlnBold(dragon.hitbox.health/bosshealth);
		level waittill("dragon_damage");
	}
}
DeleteBar(crybar, text)
{
    level waittill_any("dragon_defeated", "game_over");
	text destroy();
	crybar.bar destroy();
	crybar destroy();
}

//////////////////// Nacht der Untoten /////////////////////

// stage 1: shooting fire at you when he sees you
// stage 2: spawns in zombies, zombies drop eneryballs which you can throw at dragon
// stage 3: dragonriding, he tries to pull you off, quicktimeevents?

Nachtboss()
{
	level endon("game_over");
	level waittill("enterBossRound");
	level notify("nachtboss");
	self moveTo((-32.4096, -1928.87, 411.367), distance(self.origin, (-32.4096, -1928.87, 411.367)) / (self.speed*100));
	wait .1;
	movetoLoc = VectorToAngles(self.origin - (-32.4096, -1928.87, 411.367) );	
	self RotateTo((0,movetoLoc[1]+90,0), 2);		
	wait distance(self.origin,(-32.4096, -1928.87, 411.367)) / (self.speed*100);
	self scriptModelPlayAnim("zw2_alduin_hover");
	self thread Dragon_Attacking();
	health = getDvarInt("dragon_health");
	health = health * level.players.size;	
	self.hitbox = spawn("script_model",(self getTagOrigin( "tag_cobiy_ride")+(0,0,-20)) + vector_Scal(AnglesToForward(self.angles+(0,90,0)),120));
	self.hitbox setModel("com_plasticcase_beige_big");
	self.hitbox.angles = (90,0,0);	
	self.hitbox CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
	self.hitbox Solid();
	self.hitbox setCanDamage(true); 
	self.hitbox enablelinkto();
	self.hitbox linkto(self,"tag_cobiy_ride"); 	
	self.hitbox.health = health;
	self.hitbox hide();
	level.dragon = self;
	self thread Dragon_Damage();
	foreach(player in level.players)
	    player thread Bossbar(self,health,"Dragon");
	wait distance(self.origin, (-32.4096, -1928.87, 411.367)) / (self.speed*100);
	self thread Dragon_LookAt();	
	level waittill("dragon_defeated");
	
	/*
	foreach(player in level.players)
	{
		player takeWeapon("frag_grenade_mp");
		player thread HowToDamage();
	}
	// reward may be: zw2_powerup_free_perk
	foreach(player in level.players)
	    player thread Bossbar(self,health,"Dragon");
	self.hitbox.health = health;
	self thread Dragon_Damage("frag_grenade_mp");	
	*/
	
	dying_light = spawnFx(level.energybulb, self.origin+(0,0,40));
	triggerfx(dying_light);
	dying_light2 = spawnFx(level.energybulb, self gettagorigin("tag_cobiy_ride"));
	triggerfx(dying_light2);
	dying_light3 = spawnFx(level.energybulb, self.origin+(0,0,80));
	triggerfx(dying_light3);
	foreach(zombie in level.zombie)
	{
		if(isDefined(zombie.hitbox))
		{
			zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Death(4);
			waitFrame();
		}
	}
	level notify("dragon_defeated");
	level notify("end");	
	wait 8;
	self delete();
	dying_light delete();
	dying_light2 delete();
	dying_light3 delete();
	//self startragdoll();
	//for(i = 0; i < 10;i++)
	//	PhysicsExplosionSphere(self.origin+(0,0,10), 100, 100, 1 );
}
EndlessRound()
{
	level endon("dragon_defeated");
	brutus = [];
	i = 0;
	while(1)
	{
		wait 1;
		if(level.zombies_currently_active < 5)
		{
			brutus[i] = maps\zm\d_ops_arcade\zombies::spawnZombie("brutus", undefined,undefined,undefined,true);
			brutus[i] thread maps\zm\d_ops_arcade\zombies::Zombie_Drop("special");
			level.zombies_everspawned++;
			i++;
		}
	}
}
Dragon_LookAt()
{
	level endon("game_over");
	level endon("dragon_defeated");
	while(true)
	{		
	    wait .2;
		self.attacking = undefined;
		maxdist = 99999;
		target = undefined;
		foreach(player in level.players)
		{
		    distance = Distance(player.origin,self.origin);
			if(distance < maxdist && player.isDown == 0 && player.hidden == 0) //  && player.protected == 0
			{
			    maxdist = distance;
				target = player;
				if(BulletTracePassed(self.origin+(0,0,40), player.origin+(0,0,40), false,undefined))
				{
					self.attacking = player;
				}
			}			
		}	
		movetoLoc = VectorToAngles(self.origin - target.origin );	
	    self RotateTo((0,movetoLoc[1]+90,0), 1);		
	}
}
Dragon_Attacking()
{
	level endon("dragon_defeated");
	self.attacking = undefined;
	wait 2;
	while(true)
	{
		time = 2 + randomInt(2);
		r = 10;
		wait time;
		if(isDefined(self.attacking))
		{
			if(r != 5)
				self thread Fireball(self.attacking);
			else
			{
				self thread Fireball(self.attacking,140);
			}
		}
	}
}
Fireball(target,area)
{
	fireball = spawn("script_model", (self getTagOrigin("tag_cobiy_ride")+(0,0,-20)) + vector_Scal(AnglesToForward(self.angles+(0,90,0)),120));
	fireball moveTo(target.origin,distance(self.origin, target.origin) / 700);
	fireball thread FireFx(area);
	wait distance(self.origin, target.origin) / 700;
	if(isDefined(area))
	{
		playFx(level.dragonfire_onground, fireball.origin);
	}
	wait 4;
	fireball delete();
}
FireFx(area)
{
	//area = 0;
	if(!isDefined(area))
		area = 70;	
	while(isDefined(self))
	{
		fire = spawnfx(level.fire_large, self.origin);
		triggerfx(fire);
		foreach(player in level.players)
		{
			if(Distance(self.origin,player.origin) <= area && player.isDown == 0 && player.protected == 0)
			{
				player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, 1, 0, "MOD_EXPLOSIVE", "none", player.origin, player.origin, "none", 0, 0 );
				//iPrintln("yes");
			}
		}
		wait .1;
		fire delete();
	}
}
HowToDamage()
{
	self endon("death");
	self endon("disconnect");
	level endon("dragon_defeated");
	howtodamage = self createFontString("objective", 1.2);
	howtodamage setPoint("CENTER", "CENTER", 0, 230);
	howtodamage setText("Damage the Dragon with Santa22M Grenades!");
	howtodamage.alpha = 0.8;
	self thread delete_howtodamage(howtodamage);
	self thread delete_howtodamage2(howtodamage);
	while(true)
	{
		howtodamage fadeovertime(3);
		howtodamage.alpha = 0;
		wait 3;
		howtodamage fadeovertime(3);
		howtodamage.alpha = 0.8;
		wait 3;
	}
}
delete_howtodamage(howtodamage)
{
	self endon("death");
	self endon("disconnect");
	level waittill("dragon_defeated");
	howtodamage destroy();
}
delete_howtodamage2(howtodamage)
{
	level endon("dragon_defeated");
	self waittill_any("death", "isDown");
	howtodamage destroy();
}

///////////////////////////// Shadowman ////////////////////////////

Shadowman()
{
	sm = spawn("script_model",level.spawns_humans[0]+(0,0,40));
	sm setModel("shadowman");
	sm.hitbox = spawn("script_model", sm getTagOrigin( "j_spine4" ) + (-5,0,-10));
	sm.hitbox setModel("com_plasticcase_beige_big");
	sm.hitbox.angles = (90,0,0);	
	sm.hitbox CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
	sm.hitbox Solid();
	sm.hitbox setCanDamage(true);
	sm.hitbox enablelinkto();
	sm.hitbox linkto(sm,"j_spine4"); 
	sm.hitbox hide();
	level.shadowman = sm;
	sm thread LevitationSearch();
	
}
LevitationSearch()
{
	self endon("shadowman_death");
	while(true)
	{
		wait .25;
		dist = 9999;
		target = undefined;
		foreach(player in level.players)
		{
			playerdistance = Distance(self.origin,player.origin);
			if(playerdistance < dist && player.protected == 0 && player.isDown == 0 && player.hidden == 0 && player.team == "allies")
			{
				if(playerdistance > 50)
				{
					dist = playerdistance;
					target = player;
				}
				else
					self moveTo(self.origin,1);
			}
		}
		if(isDefined(target))
		{
			movetoLoc = VectorToAngles(target.origin - self.origin );	
			self RotateTo((0,movetoLoc[1],0), 0.1);
			trace = bullettrace(self.origin+(0,0,40), target.origin+(0,0,40), true,self);
			if(Distance(trace["position"], target.origin+(0,0,40)) < 60)
			{
				self MoveTo(trace["position"], (Distance(self.origin, trace["position"]))/120);
				//iPrintln("mhm");
			}
		}
	}
}
/////////////// George Romero aka Father //////////////////

George()
{
	pos = getSpawnPosition();
	portal = spawnFx(level.energybulb,pos+(0,0,40));
	triggerfx(portal);
	wait 3;
	portal delete();
	level.father = spawn("script_model", pos);
	level.father setModel("georg"); // e missing bruh
	level.father endon("zombie_dead");
	level.father.type = "father";
	level.father.mode = "idle";
	level.father.inRage = 0;
	level.father.hitted = 100;
	level.father.hitbox = spawn("script_model", level.father getTagOrigin( "j_spine4" ) + (-5,0,-10));
	level.father.hitbox setModel("com_plasticcase_beige_big");
	level.father.hitbox.angles = (90,0,0);	
	level.father.hitbox.health = getDvarInt("zombie_george_health");
	level.father.hitbox CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
	level.father.hitbox setCanDamage(true);
	level.father.hitbox enablelinkto();
	level.father.hitbox linkto(level.father,"j_spine4");
	level.father.hitbox hide();
	level.father thread maps\zm\d_ops_arcade\zombies::Zombie_Health();	
	level.father thread FatherRage();
	level.father thread FatherSound();
	level.father thread maps\zm\d_ops_arcade\zombies::Zombie_Move2();
	level.father thread maps\zm\d_ops_arcade\zombies::Zombie_SticksOnPlayer();
}
FatherRage()
{
	self endon("zombie_dead");
	level endon("game_over");
	self waittill("inRage");
	self.inRage = 1;
	self thread FatherSound();
	self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("father_run");
}
FatherSound()
{
	foreach(player in level.players)
	{
		if(Distance(player.origin, self.origin) <= 300)
		{
			player playlocalsound(BRUTUS_RAGE);
		}
	}
}








