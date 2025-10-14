#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\d_ops_arcade\utilities;

// =========================================================
//
// Contains wonderweapon- and specialistweaponfunctions
//
// =========================================================

WonderWeapons()
{
    self endon("disconnect");
	self thread WonderGrenades();
	self thread Reload();
	while(1)
	{
	    self waittill("weapon_fired");
		weapon = self getCurrentWeapon();
		if(weapon == level.thundergun || weapon == level.thundergun_upgrade)
		    self thread Thundergun();
		//if(weapon == level.raygunm2)
		//	self thread RaygunM2();
		else if(weapon == level.paralyzer)
			self thread Paralyzer();
		else if(weapon == "deserteagle_akimbo_mp")
			self thread MustangSally();
		else if(weapon == level.firestaff)
			self thread Firestaff();
		else if(weapon == level.dg2)
			self thread Dg2();
		else if(weapon == level.wavegun)
			self thread Wavegun();
		else if(weapon == level.sliquifier)
			self thread Sliquifier();
	}
}
WonderGrenades()
{
	self endon("disconnect");
	while(1)
	{
		self waittill("grenade_fire",grenade,weapon );  
		if(weapon == level.apothiconservant || weapon == level.apothiconservant_upgrade)
		{
			self thread ApothiconServant(weapon, grenade);
		}
		else if(weapon == level.bow)
		{
			self thread Bow(weapon, grenade);
		}
		else if(weapon == level.blundergat_upgrade)
		{
			self thread VitrolicWithering(weapon, grenade);
		}
	}
}
Zombie_Damage(iDamage, player, type)
{
	if(!isDefined(self))
	{
		iPrintln("^1ERROR: self is not defined for Zombie_Damage! \n ^4Killing Thread!");
		return;
	}
	if(!isDefined(type))
		type = "unknown";
	if(level.instakill == 1)
	{
	    if(self.type != "brutus" && self.type != "mech" && self.type != "father")
			iDamage = 999999;
	}		    
	self.hitbox.health -= iDamage;
	if(self.hitbox.health > 0)
	{
		self.wounded++;
		if(self.wounded <= 5)
			player.score += (10 * level.multiplier); 		
	}
	else
	{
		player.mykills++;
		player.kills++;
		player.pers["kills"] = player.kills;
		if(type == "MOD_MELEE")
		    player.score += (80 * level.multiplier);
		else
		    player.score += (50 * level.multiplier);	
		if(!isDefined(type))
			self thread maps\zm\d_ops_arcade\zombies::Zombie_Death(2);	
		//else if(self.type == "normal")
			self thread maps\zm\d_ops_arcade\zombies::Zombie_Death(2,undefined,undefined,"tesla");	
		player notify("killed");
	}	
}
ApothiconServant(weapon,grenade)
{
	grenade waittill("death");
	pos = grenade.origin+(0,0,40);
	if(weapon == level.apothiconservant_upgrade)
	{
		fx = level.blackhole_red;
		maxdist = 1000;
	}
	else
	{
		fx = level.blackhole;
		maxdist = 500;
	}
	playFx(fx, pos); // better do 1 strong fx
	playFx(fx, pos);
	playFx(fx, pos);
	playFx(fx, pos);
	playFx(fx, pos);	
	foreach(zombie in level.zombie)
	{
		dist = Distance(zombie.origin, pos);
		if(isDefined(zombie.hitbox) && dist <= maxdist && zombie.type != "brutus" && zombie.type != "mech")
		{
			if(zombie.type != "dog")
				zombie thread Zombie_SuckerForMadEvilBlackholes(self, pos, dist);
			else if(zombie.dogready)
				zombie thread Zombie_SuckerForMadEvilBlackholes(self, pos, dist);
			wait .1;
		}
	}
}
ApothiconServant_old() // deprecated
{
	target = self getCursorPos(5000);
	bullet = spawn("script_model", self getTagOrigin("tag_weapon_right"));
	bullet setModel("zod_ammo");
	bullet moveTo(target, Distance(bullet.origin,target) / 800);
	wait ((Distance(bullet.origin,target) / 800));
	bullet delete();
	target = target + (0,0,40);
	playFx(level.blackhole, target);
	playFx(level.blackhole, target);
	playFx(level.blackhole, target);
	playFx(level.blackhole, target);
	playFx(level.blackhole, target);
	foreach(zombie in level.zombie)
	{
		dist = Distance(zombie.origin, target);
		if(isDefined(zombie.hitbox) && dist <= 500 && zombie.type != "brutus" && zombie.type != "mech")
		{
			zombie thread Zombie_SuckerForMadEvilBlackholes(self, target, dist);
			wait .1;
		}
	}
}

Zombie_SuckerForMadEvilBlackholes(player, target, dist)
{
	self notify("sucker");
	self endon("sucker");
	self notify("zombie_dead");
	//if(dist < 100)
	//	power = 400;
	//else if(dist < 200)
	//	power = 300;
	//else if(dist < 400)
	//	power = 200;
	//else 
		power = 450;
	self.attract = 1;
	movetoLoc = VectorToAngles(target - self.origin);	
	self RotateTo((0,movetoLoc[1],0), 0.3);
	//if(self.type == "normal")
	//	self scriptModelPlayAnim("zw2_zombie_idle");
	self startragdoll();
	PhysicsExplosionSphere(self.origin, 100, 100, 1);
	self moveTo(target, dist / power);
	wait dist / power;
	if(self.type == "dog")
		self hide();
	if(self.type != "brutus" && self.type != "mech")
		self thread Zombie_Damage(99999, player, "MOD_EXPLOSIVE");
	else
		self.attract = 0;
	player waittill("killed");	
}
Paralyzer()
{
	playFx(level.paralyzer_blast, self getTagOrigin("j_head"),AnglesToForward(self.angles+(0,90,0)),self GetPlayerAngles());
	self thread ParaFly();
	Earthquake( 0.2, 1, self.origin+(0,0,40), 20 );	
	end = [];
	start = self getTagOrigin("j_head");
	forward = AnglesToForward(self.angles);
	for(i = 0;i < 3;i++)
	{
		end[i] = start + vector_Scal(forward,(100*i) + 50);
	}
	for(i = 0;i < 3;i++)
	{
		foreach(zombie in level.zombie)
		{
			if(Distance(end[i],zombie.origin) <= 100 && isDefined(zombie.hitbox))
			{		
				if(zombie.type != "dog")
				{
					zombie thread Zombie_SlowDown(self);
					//zombie thread FadeEfx();
				}
				else if(zombie.dogready)
				{
					zombie thread Zombie_SlowDown(self);
					//zombie thread FadeEfx();
				}
				waitFrame();
			}
		}
		
	}
}
FadeEfx()
{
	self endon("zombie_dead");
	self notify("fadeefx");
	self endon("fadeefx");
	//self thread deleteFadeFxOnDeath();
	for(i = 0;i < 10;i++)
	{
		fx = spawnfx(level.paralzyer_fade, self.origin+(0,0,40));
		fx thread deleteFx(fx,.95);
		triggerfx(fx);	
		wait 1;
	}
	self notify("deleteFadeFxOnDeath_denied");
}
deleteFx(fx, time)
{
	wait time;
	fx delete();
}
deleteFadeFxOnDeath() // not used
{
	self endon("deleteFadeFxOnDeath_denied");
	self endon("fadeefx");
	self waittill("zombie_dead");
	self.fx delete();
}
Zombie_SlowDown(player)
{
	self endon("zombie_dead");
	self notify("zombie_slowdown");
	self endon("zombie_slowdown");
	//self.paracounter++;
	
	if(player.weaponlist[level.paralyzer] == 1)
		self thread Zombie_Damage(80,player,"MOD_EXPLOSIVE");
	else
		self thread Zombie_Damage(50,player,"MOD_EXPLOSIVE");
	if(getDvarInt("hitmarker") == 1)
		player thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback("idk");
	/*	
	if(self.type == "brutus" || self.type == "mech")
		max = 80;
	else
		max = 32;
	if(player.weaponlist[level.paralyzer] == 1)
		max /= 2;
		
	if(self.paracounter == max)
	{
		player.score += (50 * level.multiplier);
		self thread maps\zm\d_ops_arcade\zombies::Zombie_Death(3);
	}
	else if(self.paracounter == 5 || self.paracounter == 10 || self.paracounter == 15)
	{
		player.score += (10 * level.multiplier);
		self thread FadeEfx();
	}
	*/
	
	if(!self.paraslow)
	{
		self.paraslow = true;
		//self.speed = self.speed / 20;
		if(self.type == "normal")
			self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("idle");
		else if(self.type == "brutus")
			self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("brutus_idle");
		else if(self.type == "dog")
			self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("dog_idle");
	}
	wait 5;
	self.paraslow = false;
	//self.speed = self.speed * 20;
	if(self.type == "normal")
		self thread maps\zm\d_ops_arcade\zombies::Zombie_Mode();
	else if(self.type == "brutus")
	{
		if(self.inRage == 0)
		    self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("brutus_walk");
		else if(self.inRage == 1)
			self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("brutus_run");
		else if(self.inRage == 2)	
			self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("brutus_sprint");
	}
	else if(self.type == "dog")
		self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("dog_run");
}
ParaFly()
{
	self endon("disconnect");
	self endon("death");
	self notify("parafly");
	self endon("parafly");
	while(self attackbuttonpressed() && self getCurrentWeapon() == level.paralyzer && self GetWeaponAmmoClip(level.paralyzer) > 0)
	{
		wait 0.05;
		if(BulletTracePassed(self.origin, self.origin+(0,0,-200), true, self))
			continue;
		angle = self getPlayerAngles();
		if(angle[0] < 60)
			continue;
		self setvelocity(self getvelocity()+(0,0,80));	
	}
}
ParalyzerRecovery()
{
	self endon("disconnect");
	self notify("pararecovery");
	self endon("pararecovery");
	while(1)
	{
		wait 1;
		if(self hasWeapon(level.paralyzer))
		{
			ammo = self GetWeaponAmmoClip(level.paralyzer);
			if(ammo >= 115)
				continue;
			if(self attackbuttonpressed())
			{
				if(self getCurrentWeapon() == level.paralyzer)
					continue;
			}
			self setweaponammoclip(level.paralyzer, ammo+1);
			if(self.weaponlist[level.paralyzer] == 1)
				self setweaponammoclip(level.paralyzer, ammo+1);
			self notify("reload");		
		}
	}
}
Thundergun()
{
	playFx(level.thundergun_smoke, self getTagOrigin("j_head"),AnglesToForward(self.angles+(0,90,0)),self GetPlayerAngles());
	//playFx(level.thundergun_smoke, self getTagOrigin("tag_weapon_right"));
	Earthquake( 0.3, 1, self.origin+(0,0,40), 50 );	
	PlayRumbleOnPosition( "artillery_quake", self.origin+(0,0,40));
	forward = AnglesToForward(self.angles);
	start = self getTagOrigin("j_head");
	end = [];
	for(i = 0;i < 3;i++)
	{
		end[i] = start + vector_Scal(forward,(100*i) + 50);
	}
	for(i = 0;i < 3;i++)
	{
		counter = 0;
		foreach(zombie in level.zombie)
		{
			if(Distance(end[i],zombie.origin) <= 200 && isDefined(zombie.hitbox) && !zombie.thunderkill)
			{
				counter++;				
				if(zombie.type != "brutus" && zombie.type != "mech")
				{
					if(zombie.type != "dog")
					{
						zombie.thunderkill = true;
						zombie Thunder_Kill(counter);
						self.kills++;
						self.pers["kills"] = self.kills;
						self.score += (50 * level.multiplier);
						self notify("killed");
						for(j = 0;j < 8;j++)
							zombie thread Thundergun_Blow(end[i]);
					}
					else if(zombie.dogready)
					{
						zombie.thunderkill = true;
						if(isDefined(zombie.fire))
							zombie.fire delete();
						zombie Thunder_Kill(counter);
						self.kills++;
						self.pers["kills"] = self.kills;
						self.score += (50 * level.multiplier);
						self notify("killed");
						for(j = 0;j < 8;j++)
							zombie thread Thundergun_Blow(end[i]);
					}
				}
				else
				{
					zombie thread Zombie_Damage(1000, self,"MOD_EXPLOSIVE");
				}
			}
		}
	}
}
Thundergun_Blow(pos)
{  
	waitFrame();
	PhysicsExplosionSphere(pos,300,300,1);
}
Thunder_Kill(counter)
{
	timer = counter / 100;
	wait timer;
	self thread maps\zm\d_ops_arcade\zombies::Zombie_Death(4);
}
RaygunM2()
{
	bullet = spawn("script_model", self getTagOrigin("j_head"));
	//bullet setModel("tag_origin");
	bullet thread RaygunFx();
	//PlayFXOnTag(level.greenfx2,bullet, "tag_origin");
	trace = Bullettrace(self getEye(),self getEye()+anglestoforward(self getplayerangles())*100000,true,self);
	time = distance(self.origin, trace["position"]) / 1000;
	if(time > 5)
		time = 5;
	bullet moveTo(trace["position"],time);
	self thread GlowDamage(time,trace["position"]);
	bullet thread deleteRaygunBullet(time);
	wait .2;	
}
deleteRaygunBullet(time)
{
	wait time;
	self notify("bullet_dead");
	self.glow delete();
	self delete();
}
RaygunFx()
{
	pos = self.origin;
    while(isDefined(self))
	{
	    //self.glow = spawnFX(level.greenfx,pos);
		if(self.weaponlist[level.raygunm2] == 0)
			self.glow = spawnFx(level.greenfx2, pos);
		else
			self.glow = spawnFx(level.redfx2, pos);
	    TriggerFX(self.glow);
		pos = self.origin;
		waitFrame();
		self.glow delete();		
	}
	if(self.weaponlist[level.raygunm2] == 0)
		glow = spawnFX(level.raygun_splash_green,pos);
	else
		glow = spawnFX(level.raygun_splash_red,pos);
	TriggerFX(glow);
	wait 2;
	glow delete();
}
GlowDamage(time,pos)
{
	wait time;
	foreach(zombie in level.zombie)
	{
		if(Distance(pos,zombie.origin) < 50 && isDefined(zombie.hitbox))
		{
			//zombie.hitbox notify("damage", 1000, self, 0, 0, "MOD_EXPLOSIVE", zombie, undefined, undefined, undefined, level.raygunm2);
			zombie thread Zombie_Damage(1000,self,"MOD_EXPLOSIVE");
			wait .1;
		}
	}	
}
getDg2()
{
	weapon = self getCurrentWeapon();
	fx = PlayFXOnTag(level.ww, weapon, "tag_flash" );
}
Dg2()
{
	self endon("disconnect");
	level endon("game_over");
	self thread getDg2();
	bullet = spawn("script_model", self.origin+(0,0,35));
	bullet thread JesusFx(true);
	end = self getCursorPos();
	time = Distance(bullet.origin,end)/1200;
	bullet moveTo(end, time);
	wait time;
	bullet delete();
	counter = 0;
	last = end;
	max = 5;
	if(self.weaponlist[level.dg2] == 1)
		max = 10;
	while(counter < max)
	{
		zombie = getNearestZombie(last);
		if(zombie == level)
			counter = max;
		else
		{
			zombie thread Zombie_Damage(49999,self,"tesla");
			zombie thread playElectricFx();
			counter++;
			last = zombie.origin;
			wait 1;			
		}
	}
	
}
playElectricFx()
{
	fx = spawnFx(level.electricfire, self.origin);
	triggerfx(fx);
	wait 3;
	fx delete();
}
getNearestZombie(pos)
{
	maxdist = 300;
	target = level;
	foreach(zombie in level.zombie)
	{
		if(Distance(zombie.origin,pos) < maxdist && isDefined(zombie.hitbox))
		{
			maxdist = Distance(zombie.origin,pos);
			target = zombie;
		}
	}
	return target;
}
Wavegun()
{
	bullet = spawn("script_model", self.origin+(0,0,35));
	bullet thread JesusFx();
	end = self getCursorPos();
	time = Distance(bullet.origin,end)/1200;
	bullet moveTo(end, time);
	self thread WaveKill(bullet);
	wait time;
	bullet delete();
}
WaveKill(bullet)
{
	if(self.weaponlist[level.wavegun] == 1)
		maxdist = 300;
	else 	
		maxdist = 150;
	while(isDefined(bullet))
	{		
		foreach(zombie in level.zombie)
		{
			if(isDefined(zombie.hitbox) && Distance(zombie.origin,bullet.origin) <= maxdist && zombie.vaporized == false)
			{
				if(zombie.type != "brutus" && zombie.type != "mech")
				{
					zombie.vaporized = true;
					self thread Vaporize(zombie);
				}			
			}
		}
		waitFrame();
	}
}
JesusFx(name)
{
	if(!isDefined(name))
		name = level.jesus;
	else
		name = level.electricfire;
	while(isDefined(self))
	{
		pos = self.origin;
		fx = spawnFx(name, self.origin+(0,0,40));
		triggerfx(fx);
		waitFrame();
		fx delete();
	}
}
Sliquifier()
{
	bullet = spawn("script_model", self.origin+(0,0,35));
	//bullet = MagicBullet(level.sliquifier, self.origin+(0,0,40),self getCursorPos(),self);//self getTagOrigin("tag_flash")
	bullet thread LiquidFx(self);
	end = self getCursorPos();
	time = Distance(bullet.origin,end)/600;
	bullet moveTo(end, time);
	wait time;
	bullet delete();
}
LiquidFx(owner)
{
	pos = self.origin;
	while(isDefined(self))
	{
		pos = self.origin;
		fx = spawnFx(level.liquid_bullet, self.origin);
		triggerfx(fx);
		waitFrame();
		fx delete();
	}
	endpos = PhysicsTrace(pos,pos+(0,0,-100));
	LiquidLake(pos,owner);
}
LiquidLake(pos,owner)
{
	fx = spawnFx(level.liquid_lake, pos);
	triggerfx(fx);
	thread LiquidSlip(fx,pos,owner);
	wait 3;
	fx delete();
}
LiquidSlip(fx,pos,owner)
{
	if(self.weaponlist[level.sliquifier] == 1)
		maxdist = 200;
	else
		maxdist = 120;
	while(isDefined(fx))
	{
		wait .1;
		foreach(zombie in level.zombie)
		{
			if(isDefined(zombie.hitbox) && Distance(zombie.origin,pos) <= maxdist && zombie.attract == 0 && !zombie.liquidated)
			{
				zombie.liquidated = true;
				zombie thread GlitchyZombie(pos,owner);
				zombie thread TriggerFadeFx();
			}
		}
		foreach(player in level.players)
		{
			if(Distance(player.origin,pos) <= 150)
			{
				player thread PlayerSpeedUp();
			}
		}
	}
}
PlayerSpeedUp()
{
	self notify("speedup");
	self endon("speedup");
	self endon("death");
	self endon("disconnect");
	self setMoveSpeedScale(2);
	wait .3;
	self setMoveSpeedScale(1);
}
GlitchyZombie(pos,owner)
{
	self endon("zombie_dead");
	self.attract = 1;
	wait 2;
	self.attract = 0;
	self thread InfectZombies(pos,owner);
	if(self.type != "brutus" && self.type != "mech" && self.type != "father")
	{
		self thread Zombie_Damage(99999, owner, "tesla");	
	}
			
}
InfectZombies(pos,owner)
{
	foreach(zombie in level.zombie)
	{
		if(Distance(zombie.origin,pos) <= 100 && isDefined(zombie.hitbox) && zombie != self)
		{
			thread LiquidLake(zombie.origin,owner);			
		}
	}
}
MustangSally()
{
	MagicBullet("gl_mp", self getTagOrigin("tag_weapon_right"), self getCursorPos(), self);
}
Firestaff()
{
	model = spawn("script_model", self getTagOrigin("tag_flash"));
	trace = Bullettrace(self getEye(),self getEye()+anglestoforward(self getplayerangles())*3000,true,self);
	model moveTo(trace["position"], Distance(self getTagOrigin("tag_flash"), trace["position"]) / 600);
	model thread FirestaffFx();
	self thread FirestaffDamage(model);
	wait Distance(self getTagOrigin("tag_flash"), trace["position"]) / 600;
	wait 1;
	model delete();
}
FirestaffDamage(model)
{
	while(isDefined(model))
	{
		wait .1;
		foreach(zombie in level.zombie)
		{
			if(Distance(model.origin,zombie.origin+(0,0,40)) < 40 && isDefined(zombie.hitbox) && isDefined(model) && !zombie.firestaff)
			{
				if(getDvarInt("hitmarker") == 1)		
					self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback("who knows");
				if(zombie.hitbox.health <= 1000)
					zombie thread FirestaffBurn();
				zombie.firestaff = true;	
				zombie thread Zombie_Damage(1000,self,"MOD_EXPLOSIVE");				
				wait .1;
			}
		}	
	}
}
FirestaffBurn()
{
	fire = spawnFx(level.fire_large, self.origin);
	triggerfx(fire);
	wait 3;
	fire delete();
	self.firestaff = false;
}
FirestaffFx()
{
	pos = self.origin;
    while(isDefined(self))
	{
		glow = spawnFx(level.fire_med, pos);
	    TriggerFX(glow);
		pos = self.origin;
		waitFrame();
		glow delete();		
	}
	glow = spawnFX(level.fire_med,pos);
	TriggerFX(glow);
	wait 2;
	glow delete();
}
Firestaff_testing()
{
	endpos = self getCursorPos();
	model = spawn("script_model", self getTagOrigin("tag_flash"));
	model.ending = false;
	model moveTo(endpos, Distance(self getTagOrigin("tag_flash"), endpos) / 600);
	model thread endFireStaff(Distance(self getTagOrigin("tag_flash"), endpos) / 600);
	self thread activateFirestaffDamage(model);
	while(!model.ending)
	{
		fire = spawnFX(level.fire_med, model.origin);
		triggerfx(fire);
		wait .1;
		fire delete();
	}
	model delete();
}
endFireStaff(time)
{
	wait time;
	self.ending = true;
}
activateFirestaffDamage(model)
{
	//foreach(zombie in level.zombie)
	//{
	//	zombie.firestaffhit = false;
	//}
	while(isDefined(model))
	{
		wait .1;
		foreach(zombie in level.zombie)
		{
			if(isDefined(zombie.hitbox) && zombie isTouching(model))
			{
				self thread doFirestaffDamage(zombie, model); 
			}
		}
	}
}
doFirestaffDamage(zombie, model)
{
	if(!isDefined(zombie.isTouchingFirestaff))
	{
		zombie.isTouching = true;
		iPrintln("yes");
	}
	wait 1;
	zombie.isTouchingFirestaff = undefined;
}
Reload()
{
	self endon("disconnect");
	while(true)
	{
		self waittill("reload_start");
		weapon = self getCurrentWeapon();
		if(weapon == level.firestaff)
		{
			self playLocalSound("PG_1mc_dh_searchdestroy");
		}
		else if(weapon == level.thundergun || weapon == level.thundergun_upgrade)
		{
			self thread ThunderReload();
		}
		
	}
}
CLIP_IN = "RU_1mc_arena";
CLIP_OUT = "RU_1mc_capture";
CLIP_FIXED = "RU_1mc_ahead";

ThunderReload()
{
	self playLocalSound("PG_1mc_dfcn_tm_death");
	wait .5;
	if(self.speedcola)
		wait .5;
	self playLocalSound("PG_1mc_dfcn_arena");
}
PPSHReload()
{
	self notify("newreload");
	self endon("newreload");
	time1  = 0.3;
	time2 = 1;
	time3 = .2;
	if(self.speedcola)
	{
		time1 /= 2;
		time2 /= 2;
		time3 /= 2;
	}
	self playLocalSound(CLIP_OUT);
	wait time1;
	self stopLocalSound(CLIP_OUT);
	wait time2;
	self playLocalSound(CLIP_IN);
	wait time3;
	self playLocalSound(CLIP_FIXED);
}
RaygunM2Reload()
{
	time1 = 0.3;
	time2 = 0.9;
	if(self.speedcola)
	{
		time1 = time1/2;
		time2 = time2/2;
	}
	wait time1;
	//self playLocalSound("PG_1mc_dfcn_headquarters");
	wait time2;
	self playLocalSound("PG_1mc_defcon_5");
}
Bow(weapon, grenade)
{
	grenade waittill("death");
	pos = grenade.origin;
	playFx(level.storm, pos);
	counter = 0;
	foreach(zombie in level.zombie)
	{
		if(isDefined(zombie.hitbox))
		{
			if(Distance(zombie.origin,pos) < 300)
			{
				self thread Bow_Effect(zombie);
				counter++;
			}
		}	
	}
	for(i = 0;i < counter;i++)
	{
		self.score += (50 * level.multiplier);	
	}
}
Bow_Effect(zombie)
{
	zombie endon("zombie_dead");
	zombie.attract = 1;
	zombie moveTo(zombie.origin+(0,0,50),3);
	zombie scriptModelPlayAnim("tesla_death");
	wait 3;
	zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Death(2);	
}
VitrolicWithering(weapons,grenade)
{
	pos = grenade.origin;
	counter = 0;
	maxdist = 250;
	if(self.weaponlist[level.blundergat_upgrade] == 1)
		maxdist = 400;
	while(isDefined(grenade)) 
	{
		pos = grenade.origin;
		counter++;
		foreach(zombie in level.zombie)
		{
			if(counter > 10 && Distance(zombie.origin,pos) < maxdist && isDefined(zombie.hitbox))
			{
				zombie thread Zombie_RunToPoison(grenade);
			}
		}
		fx = spawnFx(level.poisonbulb,pos);
		triggerfx(fx);
		waitFrame();
		fx delete();
	}
	playFx(level.suicidebomber,pos);
	foreach(zombie in level.zombie)
	{
		if(isDefined(zombie.hitbox))
		{
			zombie notify("reAim");
			if(Distance(zombie.origin,pos) < 100)
			{
				zombie thread Zombie_Damage(500,self,"MOD_EXPLOSIVE");
			}
		}		
	}	
}
Zombie_RunToPoison(grenade)
{
	self endon("zombie_dead");
	self notify("runtopoison");
	self endon("runtopoison");
	self.poisolbulbed = true;
	self.goalpos = grenade;
	time = Distance(grenade.origin,self.origin)/(self.speed*100);
	self thread reAim();
	wait time;
	self.poisolbulbed = false;
	self notify("runtopoison");
}
reAim()
{
	self endon("zombie_dead");
	self notify("runtopoison");
	self endon("runtopoison");
	self waittill("reAim");
	self.poisolbulbed = false;
}

/////////// Specialistweapons /////////////

Specialistweapon(name,current)
{
	self notify("specialistweapon");
	self endon("specialistweapon");
	if(!isValidWeapon(current))
	{
		self takeWeapon(current);
		current = "";
	}		
	self.hasspecialist = true;
	self.specialistcounter = 80;
	self thread trySpecialist(name,current);
	self switchToWeapon(name);
	wait 2;
	self takeWeapon(name);
	self switchToWeapon(current);
	self thread SpecialistHud();
	while(1)
	{
		if(self.specialistcounter < 80 && self.validweapon && self getCurrentWeapon() != name)
			self.specialistcounter++;
		//if(self.specialistcounter == 80)
		//	self thread SpecialistHud_old();
		self waittill("killed");	
	}
}	
SpecialistHud()
{
	self endon("disconnect");
	self notify("specialisthud");
	self endon("specialisthud");
	level endon("game_over");

	if(isDefined(self.specialisthud))
		self.specialisthud destroy();
	self.specialisthud = self createFontString("objective", 1.2);
	self.specialisthud setPoint("CENTER", "CENTER", 0, 200);
	self.specialisthud setText("Press ^3[{+actionslot 3}] ^7to activate the Specialistweapon!");
	self.specialisthud.alpha = 0.8;
	self.specialisthud thread destroy_on_end_game();
	while(self.specialistcounter >= 80)
	{
		self.specialisthud fadeovertime(3);
		self.specialisthud.alpha = 0;
		wait 3;
		self.specialisthud fadeovertime(3);
		self.specialisthud.alpha = 0.8;
		wait 3;
	}
	self thread destroySpecialistHud();
	self.specialisthud thread destroy_on_end_game();
	for(;;)
	{
		if(self.specialistcounter >= 80)
		{
			self thread SpecialistHud();
		}
		wait 1;
	}
}
destroySpecialistHud()
{
	self endon("disconnect");
	self.specialisthud fadeovertime(2);
	self.specialisthud.alpha = 0;
	wait 2;
	if(isDefined(self.specialisthud))
		self.specialisthud destroy();
}

destroy_on_end_game()
{
    level waittill_any("game_over");
    
    if(isdefined(self))
        self destroy();
}
SpecialistHud_old() // deprecated
{
	self endon("specialistweapon");
	self endon("disconnect");
	self setLowerMessage("specialist","Press ^3[{+actionslot 3}] ^7to activate the Specialistweapon!");
	wait 2;
	self clearLowerMessage("specialist");
}
trySpecialist(name,current)
{
	self endon("specialistweapon");
	self endon("disconnect");
	self notifyonplayercommand("3", "+actionslot 3");
	while(1)
	{
		self waittill("3");
		if(self.specialistcounter == 80)
		{
			if(self.isDown == 0)
			{
				self giveWeapon(name);
				self switchToWeapon(name);
				self.validweapon = false;
				self thread SpecialistAmmo(name,current);
			}		
		}
		else
		{
			self setLowerMessage("error","Not enough kills! ^1" + self.specialistcounter + "^7/^180");
			self thread deleteError();
		}
	}
}
deleteError()
{
	self endon("disconnect");
	wait 2;
	self clearLowerMessage("error");
}
SpecialistAmmo(name,current)
{
	self thread SpecialistConstantlyFading(name,current);
	self endon("specialistweapon");
	self endon("disconnect");
	self endon("death");
	self endon("noSpecialistAmmo");
	self thread SpecialistFire(name);
	while(1)
	{
		self waittill_any("reload", "weapon_fired", "weapon_change", "newweapon");
		if(self GetWeaponAmmoClip(name) == 0 || self getCurrentWeapon() != name)
		{
			self takeWeapon(name);
			self switchToWeapon(current);
			self.validweapon = true;
			if(self.specialistcounter < 0)
				self.specialistcounter = 0;
			self notify("noSpecialistAmmo");
		}
	}
}
SpecialistConstantlyFading(name,current)
{
	self endon("specialistweapon");
	self endon("disconnect");
	self endon("death");
	self endon("noSpecialistAmmo");
	self setweaponammoclip(level.skull, self.specialistcounter);
	while(1)
	{
		wait 1;
		clip = self GetWeaponAmmoClip(name);
		if(clip >= 1)
		{
			self.specialistcounter--;
			//if(!self attackbuttonpressed())
			//	self SetWeaponAmmoClip(name,clip-1);
			self SetWeaponAmmoClip(name,self.specialistcounter);	
		}			
		else
		{
			self takeWeapon(name);
			self switchToWeapon(current);
			self.validweapon = true;
			self notify("noSpecialistAmmo");
		}	
		self notify("specfade");
	}
}
SpecialistFire(name)
{
	self endon("specialistweapon");
	self endon("disconnect");
	self endon("death");
	self endon("noSpecialistAmmo");
	a = undefined;
	if(name == level.minigun)
	{
		self thread MinigunAmmo();
		a = false;
	}		
	else if(name == level.sword)
		self thread SwordAmmo();
	while(1)
	{
		wait .1;
		if(self attackbuttonpressed())
		{
			self.specialistcounter--;
			if(name == level.skull)
			{
				self Skull();
			}
			else if(name == level.flamethrower)
			{
				self thread Flamethrower();
			}
			else if(name == level.annihilator)
			{
				self.specialistcounter -= 2;
			}
			else if(name == level.minigun)
			{
				if(!a)
				{
					a = true;
				}
				else
				{
					a = false;
					self.specialistcounter++;
				}
			}
		}
	}
}
//-----------------------------------

SwordAmmo()
{
	self endon("specialistweapon");
	self endon("disconnect");
	self endon("death");
	self endon("noSpecialistAmmo");
	self giveMaxAmmo(level.sword);
	while(self.specialistcounter > 0)
	{
		wait .1;
		if(self meleeButtonPressed() || self attackbuttonpressed())
		{
			self.specialistcounter -= 4;
		}
	}
}
MinigunAmmo()
{
	self endon("specialistweapon");
	self endon("disconnect");
	self endon("death");
	self endon("noSpecialistAmmo");
	self giveMaxAmmo(level.minigun);
	/*while(self.specialistcounter > 0)
	{
		wait .33;
		self.specialistcounter--;
	}*/
}
Skull()
{
	end = [];
	start = self getTagOrigin("j_head");
	forward = AnglesToForward(self.angles);
	for(i = 0;i < 3;i++)
	{
		end[i] = start + vector_Scal(forward,(50*i) + 50);
	}
	for(i = 0;i < 3;i++)
	{
		foreach(zombie in level.zombie)
		{
			if(!zombie.vaporized && zombie.type != "mech" && zombie.type != "brutus")
			{
				if(Distance(end[i],zombie.origin) <= 200 && isDefined(zombie.hitbox))
				{
					zombie.vaporized = true;
					self thread Vaporize(zombie);
				}
			}		
		}
	}	
}
Vaporize(zombie)
{
	level endon("game_over");
	zombie.attract = 1;
	zombie moveTo(zombie.origin+(0,0,100), 3);
	zombie thread TriggerFadeFx();
	if(zombie.model != "infantrya_body")
		zombie scriptModelPlayAnim("tesla_death");
	else
		zombie scriptModelPlayAnim("ww2_zm_death");
	wait 3;
	self.kills++;
	self.pers["kills"] = self.kills;
	self.score += (50 * level.multiplier);
	self notify("killed");		
	zombie thread maps\zm\d_ops_arcade\zombies::Zombie_Death(3);
}
TriggerFadeFx()
{
	for(i = 0;i < 10;i++)
	{
		fx = spawnfx(level.paralzyer_fade, self.origin+(0,0,40));
		triggerfx(fx);
		wait .3;
		fx delete();
	}
}
Flamethrower()
{
	//PlayFX(level.fire_flamethrower, self getTagOrigin("tag_weapon_left")+(0,0,10), AnglesToForward(self.angles+(0,90,0)),self GetPlayerAngles()); 
	fire = [];
	endpos = self getTagOrigin("tag_flash") + vector_Scal(AnglesToForward(self.angles),300);
	//endpos = self getCursorPos(300);
	fireorigin = spawn("script_model", self getTagOrigin("tag_weapon_right"));
	fireorigin moveTo(endpos, 1);
	self playLocalSound("PG_1mc_dfcn_oneflag");
	for(i = 0;i < 4;i++)
	{	
		fire[i] = spawnfx(level.fire_med, fireorigin.origin);
		triggerfx(fire[i]);		
		fire[i] thread deleteIn(2);
		wait .24;
		foreach(zombie in level.zombie)
		{
			if(isDefined(zombie.hitbox))
			{
				foreach(feufeu in fire)
				{
					if(Distance(zombie.origin+(0,0,40),feufeu.origin) < 80)
					{
						if(!zombie.burn && zombie.type != "mech" && zombie.type != "brutus")
						{
							zombie thread Flamethrower_Burn(self);
							wait .1;
						}
					}
				}
			}			
		}
	}
	fireorigin delete();
}
deleteIn(time)
{
	wait time;
	self delete();
}
Flamethrower_Burn(player)
{	
	self endon("zombie_dead");
	level endon("game_over");
	self.burn = true;
	player.kills++;
	player.pers["kills"] = player.kills;
	player notify("killed");
	player.score += (50 * level.multiplier);
	self thread FlameDeath();
	self.attract = 1;
	self moveTo(self.origin,1);
	/*
	for(i = 0;i < 10;i++)
	{
		self.fire = spawnFx(level.fire_large, self.origin+(0,0,30));
		triggerfx(self.fire);
		//self thread Zombie_Damage(1000,self,"MOD_EXPLOSIVE");
		wait .5;
		self.fire delete();
	} 
	self.burn = false;
	*/
}
FlameDeath()
{
	level endon("game_over");
	fire = spawnFx(level.fire_large, self.origin);
	triggerfx(fire);	
	self thread maps\zm\d_ops_arcade\zombies::Zombie_Animation("death");		
	wait 2.5;	
	self thread maps\zm\d_ops_arcade\zombies::Zombie_Death(2);		
	wait 2;
	fire delete();
}

////////////////////////////////////////////// Available Weapons /////////////////////////////////////S

Init_BoxWeapons()
{
	level.weaponlist = 0;	
	level.gun = [];
	wonderweapons = 0;
	specialistweapons = 0;
	foreach(weapon in level.weaponarray.list)
	{
		valid = false;
		if(weapon.type == 1 && wonderweapons > 3)
			continue;
		if(weapon.type == 2 && specialistweapons > 1)
			continue;	
		if(randomInt(3) == 1)
		{
			AddWeapon(weapon);
		}
	}
	//thread loopWeaponAmount();
}
loopWeaponAmount()
{
	while(true)
	{
		wait .5;
		iPrintln(level.gun.size);
	}
}
AddWeapon(weapon)
{
	precacheItem(weapon);
	level.gun[weapon] = weapon;
	level.weaponlist++;
}






































