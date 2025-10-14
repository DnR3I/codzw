#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\d_ops_arcade\utilities;
#using_animtree( "multiplayer" );

// =========================================================
//
// Contains zombielogic 
//
// =========================================================

BRUTUS_ATTACK = "UK_1mc_defcon";
BRUTUS_RAGE = BRUTUS_ATTACK; // UK_1mc_defcon_01
BRUTUS_SPAWN = "UK_1mc_control_lost"; // UK_1mc_control_lost_01
BRUTUS_DEATH = "UK_1mc_demolition"; //UK_1mc_demolition_01

SpawnZombie(type,pos,key,health,infinite)
{
	level endon("end");
	if(!isDefined(type))
	{
		iPrintln("^1ERROR: No Zombietype defined!");
		iPrintlnBold("^1ERROR: No Zombietype defined!");
		type = "normal";
		return;
	}
	//if(type == "mech")
	//	type = "brutus";
	while(level.zombies_currently_active >= 20) // seems to fix the bug that zombies are left over after roundend
	{
		wait 1.1;
	}
	zomb = doSpawnZombie(type,pos,key,health,infinite);
	//if(level.round < 5)
	//zomb thread testDeath();
}
testDeath()
{
	wait 5;
	self thread Zombie_Death(2);
	foreach(player in level.players)
		player.anticampcounter = 0;
}
doSpawnZombie(type,pos,key,health,infinite)
{	
	if(!isDefined(key))
		i = level.zombies_everspawned;
	else
		i = key;
    if(!isdefined(type))
	    type = "normal";	
	if(!isDefined(infinite))
		infinite = false;	
	fire = false;	
    if(!isdefined(pos))
	{
		pos = getSpawnPosition();
		if(type == "normal" || type == "explosive" || type == "suicide" || type == "mindfuck")
		{
			//if(!getVisibility(pos - (0,0,100)))
				pos = pos - (0,0,100);
			//else
			//	fire = true;
		}			
	}    
	level.zombie[i] = spawn("script_model", pos);	
	level.zombies_currently_active++;
	level notify("zombie_spawned");
	if(type == "explosive" || type == "suicide" || type == "mindfuck")
		level.zombie[i].type = "normal";
	else	
		level.zombie[i].type = type;	
	level.zombie[i].key = i;
	level.zombie[i].spawnpoint = pos;
	level.zombie[i].climbing = 0;
	level.zombie[i].wounded = 0;
	level.zombie[i].speed = 1.0;
	level.zombie[i].attract = 0;
	level.zombie[i].attacking = 0;
	level.zombie[i].ragemode = 0;
	level.zombie[i].artillerytarget = false;
	level.zombie[i].onFire = false;
	level.zombie[i].zombietarget = false;
	level.zombie[i].targetname = "zombie";
	level.zombie[i].mode = "walk";
	level.zombie[i] Solid(); 
	level.zombie[i].searching = false;
	level.zombie[i].burn = false;
	level.zombie[i].thunderkill = false;
	level.zombie[i].paraslow = false;
	level.zombie[i].paracounter = 0;
	level.zombie[i].poisolbulbed = false;
	level.zombie[i].vaporized = false;
	if(level.zombie[i].type == "normal")
		level.zombie[i].ready = false;
	else
		level.zombie[i].ready = true;
	//level.zombie[i].mesmerized = false; // not used yet
	level.zombie[i].liquidated = false;
	level.zombie[i].firestaff = false;
	level.zombie[i].hitted = 100;	
	level.zombie[i].infinite = infinite;
	
	if(type == "normal" || type == "explosive" || type == "suicide" || type == "mindfuck")
    {	
		level.zombie[i] getZombieSpawnModel();
		if(level.zombie[i] hasDrop())
			level.zombie[i] thread Zombie_Drop();
		if(!fire)
			level.zombie[i] thread Zombie_Climb(pos);
		else
			level.zombie[i] thread SpawnInFire();
		/*	
		if(level.drops > 0 && level.round > 1)   
		{
		    a = randomInt(level.zombie.size + level.zombies_spawned);
			if(a == 1)
			{
			    level.drops--;
				level.zombie[i] thread Zombie_Drop();
			}
		}
		*/
	}
	else if(type == "insanity")
	{
		level.zombie[i] setModel("bo3_insanity");
		level.zombie[i].speed = 50;
		level.zombie[i] thread Insanity_Spawn();
	}
	else if(type == "dog")
	{
		level.zombie[i] setModel("zw2_wolf");
		level.zombie[i].speed = 50;
		level.zombie[i] thread Dog_Spawn();
		if(level.zombies_will_spawn == 0)
			level.zombie[i] thread Zombie_Drop("maxammo");
	}
	else if(type == "brutus")
	{
	    level.zombie[i].inRage = 0;
		level.zombie[i].speed = 1.0;
        level.zombie[i] setModel("zw2_brutus");	
		if(!infinite)			
		level.zombie[i] thread Brutus_Spawn();
	}	
	else if(type == "mech")
	{
		level.zombie[i] setModel("bo2_mech");	
		level.zombie[i].speed = 1.5;
		level.zombie[i] thread MechZombie();
	}
	if(type != "insanity")
		level.zombie[i].hitbox = spawn("script_model", level.zombie[i] getTagOrigin( "j_spine4" ) + (-5,0,-10));
	else
		level.zombie[i].hitbox = spawn("script_model", level.zombie[i] getTagOrigin( "tag_origin" ) + (-5,0,10));
	level.zombie[i].hitbox setModel("com_plasticcase_beige_big");
	level.zombie[i].hitbox.angles = (90,0,0);	
	if(level.zombie[i].type != "normal")
		level.zombie[i].hitbox CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
	//level.zombie[i].hitbox Solid(); // this kills the cmd above
	level.zombie[i].hitbox setCanDamage(true);
	level.zombie[i].hitbox enablelinkto();
	if(type != "insanity")
		level.zombie[i].hitbox linkto(level.zombie[i],"j_spine4"); 	
	else
		level.zombie[i].hitbox linkto(level.zombie[i],"tag_origin"); 
    if(type == "normal")
	{
		level.zombie[i] thread delayHealth();
		level.zombie[i].hitbox.health = level.zombie_health;
		level.zombie[i].hitbox hide();
		level.zombie[i] thread Zombie_PlaySound();
	}	
	else if(type == "explosive")
	{
		level.zombie[i] thread delayHealth();
		level.zombie[i].hitbox hide();
		level.zombie[i] thread Zombie_PlaySound();
		level.zombie[i] thread Zombie_Explosive();
	}
	else if(type == "suicide")
	{
		level.zombie[i] thread delayHealth();
		level.zombie[i].hitbox hide();
		level.zombie[i] thread Zombie_PlaySound();
		level.zombie[i] thread Suicidebomber();
	}
	else if(type == "mindfuck")
	{
		level.zombie[i] thread delayHealth();
		level.zombie[i].hitbox hide();
		level.zombie[i] thread Zombie_PlaySound();
		level.zombie[i] thread Mindfuck();
	}
	else if(type == "insanity")
	{
		level.zombie[i].hitbox.health = 999999999;
		level.zombie[i].hitbox hide();
		level.zombie[i].hitbox.angles = (90,90,90);
	}
	else if(type == "dog")
	{
		level.zombie[i].hitbox.health = 999999999;
		level.zombie[i].hitbox hide();
		level.zombie[i].hitbox.angles = (90,90,90);
	}
	else if(type == "brutus")
	{	
		level.zombie[i].hitbox hide();
		level.zombie[i].hitbox.health = getDvarInt("zombie_brutus_health");
		level.zombie[i].hitbox.origin = level.zombie[i] getTagOrigin("j_head"); //level.zombie[i].head.origin;
		level.zombie[i].hitbox.angles = (90,90,90);
	}
	else if(type == "mech")
	{
		level.zombie[i].hitbox.health = getDvarInt("zombie_brutus_health");
		level.zombie[i].hitbox hide();
		level.zombie[i].searchcounter = 0;
		level.zombie[i] thread Zombie_Eyes();
	}	
	if(isDefined(health))
	{
		if(level.zombie[i].type == "brutus" || level.zombie[i].type == "mech")
			level.zombie[i].hitbox.health = health;
	}
	level.zombie[i] thread Zombie_Health();	
	level.zombie[i] thread Zombie_SticksOnPlayer();
	return level.zombie[i];
}
delayHealth()
{
	self endon("zombie_dead");
	self.hitbox.health = 6000;
	wait 4;
	self.hitbox.health = level.zombie_health;	
}
Zombie_Climb(pos)
{
	self playSound("US_1mc_boost");
	//self thread locateEnt();
    self endon("zombie_dead");
	level endon("game_over");
	self.climbing = 1;
	if(!BulletTracePassed(self.origin+(0,0,-30), self.origin+(0,0,-130), false, self))
	{
		self hide();
		if(isDefined(self.head))
			self.head hide();
	}
    self Zombie_Animation("climb");
	playFx(level.zombiedirt, self.origin+(0,0,50));
	wait .1;
	nextToPlayer = false;
	foreach(player in level.players)
	{
	    if(Distance(player.origin, self.origin+(0,0,75)) <= 100)
		{
			player thread maps\mp\gametypes\_shellshock::dirtEffect(self.origin); 
		}		      
	}
	if(self.model != "infantrya_body")
		self moveTo(self.origin+(0,0,100),3.5);
	else
	{
		self moveTo(self.origin+(0,0,-70),1);
		wait 1;
		self moveTo(self.origin+(0,0,100),3.5);
	}
	wait 1;
	self show();
	if(isDefined(self.head))
		self.head show();
	wait 1;
	target = self getNearestPlayer(true,true);
	if(target != level)
	{
		movetoLoc = VectorToAngles(target.origin - self.origin );	
		self RotateTo((0,movetoLoc[1],0), 0.1);
		wait .1;
	}
	wait 1.3;
	if(self.model == "infantrya_body")
	{
		//trace = bullettrace(pos+(0,0,200), pos+(0,0,-200), false,self.hitbox);
		//self.origin = trace["position"];
		//self moveTo(trace["position"],.1);
		//self moveTo(self.origin+(0,0,70),.1);
		self.origin = pos+(0,0,70);
	}
	else
		wait 1; 
	self thread Zombie_Mode();
	wait .2;
	self.ready = true;
	self.hitbox CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
	target = self getNearestPlayer(true,true);
	if(target != level)
	{
		movetoLoc = VectorToAngles(target.origin - self.origin );	
		self RotateTo((0,movetoLoc[1],0), 0.1);
		wait .1;
	}	
	self.climbing = 0;
	self thread Zombie_Move();
}
Zombie_Mode()
{
	if(level.round <= 4)
	    self.mode = "walk";
	else if(level.round <= 6)
	{
		a = randomInt(3);
		if(a == 1)
			self.mode = "run";
		else
			self.mode = "walk";
	}
	else if(level.round <= 8)
	{
		a = randomInt(3);
		if(a == 1)
			self.mode = "walk";
		else
			self.mode = "run";
	}
	else if(level.round <= 10)
	{
		a = randomInt(3);
		if(a == 1)
			self.mode = "sprint";
		else
			self.mode = "run";
	}
	else
	{
		if(cointoss())
			self.mode = "sprint";
		else
			self.mode = "run";
	}
	self thread Zombie_Animation(self.mode);
}

Zombie_Mode_old()
{
    if(level.round <= 4)
	    self.mode = "walk";
	else if(level.round < 8)
	{
		if(cointoss())
		    self.mode = "walk";
		else
            self.mode = "run";		
	}
	else if(level.round < 10 && level.round >= 8)
	{			
		a = randomInt(5);
		if(a == 1)
			self.mode = "walk";
		else if(a == 2)
			self.mode = "sprint";
		else 
			self.mode = "run";
	}
	else
	{
		if(randomInt(3) != 2)
		    self.mode = "run";
		else
            self.mode = "sprint";	
	}
	self thread Zombie_Animation(self.mode);
}
Zombie_Animation(mode,tesla)
{
    if(!isdefined(mode))
	    mode = "uneccessary";
	if(mode == "death")
	{
		if(self.model != "infantrya_body" || isDefined(tesla))
			self scriptModelPlayAnim("tesla_death");
		else
			self scriptModelPlayAnim("ww2_zm_death");
	}	
	else if(mode == "idle")
	{
		if(self.model != "infantrya_body")
			self scriptModelPlayAnim("zw2_zombie_idle");
		else
			self scriptModelPlayAnim("ww2_zm_idle_loop");
	}	
	else if(mode == "walk" || self.speed == .8)
	{
		if(self.model != "infantrya_body")
			self scriptModelPlayAnim("zw2_zombie_walk");
		else
			self scriptModelPlayAnim("ww2_zm_walk");
		self.speed = .7;
		self.mode = "walk";
		self.ragemode = 0;
	}	        
	else if(mode == "run" || self.speed == 1.2)
	{
		if(self.model != "infantrya_body")
			self scriptModelPlayAnim("zw2_zombie_run");	
		else
			self scriptModelPlayAnim("ww2_zm_sprint");	
		self.speed = 1.6;
		self.mode = "run";
		self.ragemode = 1;
		foreach(player in level.players)
		{
			player playlocalsound("US_1mc_capture");
		}
	}			
	else if(mode == "sprint" || self.speed == 1.4)
	{
	    self.mode = "sprint";
	    self.speed = 2.0;
		self.ragemode = 2;
		if(self.model != "infantrya_body")
		{
			if(cointoss())
				self scriptModelPlayAnim("zw2_zombie_sprint");
			else
				self scriptModelPlayAnim("zw2_zombie_sprint_alt");
		}
	    else
		{
			self scriptModelPlayAnim("ww2_zm_sprint");
		}
		foreach(player in level.players)
		{
			player playlocalsound("US_1mc_captureflag");
		}
	}
	else if(mode == "climb")
	{
		if(self.model != "infantrya_body")
			self scriptModelPlayAnim("zw2_zombie_ground_climb");
		else
		{
			//self.origin = self.origin + (0,0,-70);
			self moveTo(self.origin+(0,0,-70),1);
			self scriptModelPlayAnim("ww2_zm_ground");
		}
			
	}
	else if(mode == "fall")
	{
		iPrintln("^1ERROR: this animation wasnt added yet");
	}
	else if(mode == "attack")
	{
		if(self.model != "infantrya_body")
			self scriptModelPlayAnim("zw2_zombie_attack01");
		else
			self scriptModelPlayAnim("ww2_zm_attack");
	}
	else if(mode == "brutus_walk")
	{
	    self.speed = .7;
		self.mode = "walk";
	    self scriptModelPlayAnim("zw2_brutus_walk");
	}
	else if(mode == "brutus_run")
	{
	    self.speed = 1.7;
		self.mode = "run";
	    self scriptModelPlayAnim("zw2_brutus_run");
	}
	else if(mode == "brutus_sprint")
	{
	    self.speed = 2.0;
		self.mode = "sprint";
	    self scriptModelPlayAnim("zw2_brutus_sprint");
	}
	else if(mode == "brutus_idle")
	{
	    self.mode = "idle";
		self scriptModelPlayAnim("zw2_brutus_idle");
	}
	else if(mode == "brutus_attack")
	{
	    self.mode = "attack";
		//self playSound("NS_1mc_bomb_planted");
		foreach(player in level.players)
		{
			if(Distance(player.origin,self.origin) <= 300){
				player playlocalsound(BRUTUS_ATTACK);
			}
		}
		//if(cointoss())
		//    self scriptModelPlayAnim("zw2_brutus_swingleft");
		//else
            self scriptModelPlayAnim("zw2_brutus_swingright");		
	}
	else if(mode == "insanity")
	{
		self.mode = "run";
		self.speed = 2.0;
		self scriptModelPlayAnim("bo3_insanity_idle");
	}
	else if(mode == "dog_idle")
	{
	    /*self scriptModelPlayAnim("zw2_wolf_run_stop");
		for(i = 20;i > 0;i--)
		{
		    wait .1;
			self.speed -= .9;
		}*/
	    self.speed = 0;
		self.mode = "idle";
		self scriptModelPlayAnim("zw2_wolf_idle");
	}
	else if(mode == "dog_run")
	{
		self.speed = 2.7;
		self.mode = "run";
		self scriptModelPlayAnim("zw2_wolf_run_loop");
	}
	else if(mode == "dog_attack")
	{
		self.mode = "attack";
		self scriptModelPlayAnim("zw2_wolf_run_attack");
		foreach(player in level.players)
		{
			player playlocalsound("US_1mc_control_taken");
		}
	}
	else if(mode == "mech_walk")
	{
		self.mode = "walk";
		self.speed = 1.0;
		self scriptModelPlayAnim("bo2_mech_walk");
	}
	else if(mode == "mech_run")
	{
		self.mode = "run";
		self.speed = 1.6;
		self scriptModelPlayAnim("bo2_mech_run");
	}
	else if(mode == "mech_attack")
	{
		self.mode = "attack";
		self scriptModelPlayAnim("bo2_mech_melee");
	}
	else if(mode == "father_idle")
	{
		self.mode = "idle";
		self scriptModelPlayAnim("fsm_georg_idle");
	}
	else if(mode == "father_walk")
	{
		self.mode = "walk";
		self scriptModelPlayAnim("fsm_georg_walk");
	}
	else if(mode == "father_run")
	{
		self.mode = "run";
		self.speed = 1.3;
		self scriptModelPlayAnim("fsm_georg_run_attack"); // no run only anim? 
	}
	else if(mode == "father_attack_walk")
	{
		self.mode = "attack";
		self scriptModelPlayAnim("fsm_georg_stand_attack"); 
	}
	else if(mode == "father_attack_run")
	{
		self.mode = "attack";
		self scriptModelPlayAnim("fsm_georg_run_attack"); 
	}
	else if(mode == "father_death")
	{
		self scriptModelPlayAnim("fsm_georg_death");
	}
	else
	{
	    iPrintln("^1ERROR: ^3" + mode + " ^1could not be found!");
	}
}
FatherDeath(time,respawn)
{
	if(!isdefined(time))
	    time = 0;
	if(time > 0 && level.players.size > 1)
		time = time / 2;
	self.hitbox delete();
	//self.attract = 1;
	if(isDefined(self.fire))
		self.fire delete();
	if(!isDefined(respawn) || !respawn || self.infinite)
	{		
		self notify("zombie_drop");	
		self notify("zombie_dead");	
	}	
	else
	{
		self notify("zombie_respawn");	
		level thread maps\zm\d_ops_arcade\boss::George();
	}
	self moveTo(self.origin,1);	
	self thread Zombie_Animation("father_death");
	PhysicsExplosionSphere(self.origin, 100, 100, 1 );
	wait 3.5;
    wait time;
    self delete();		
}
Zombie_Death(time,respawn,newtype,tesla)
{
	if(!isDefined(self))
	{
		//iPrintln("^1ERROR: self is not defined for Zombie_Death!");
		level waittill("forever");
		return;
	}
	if(isDefined(level.father) && level.father == self)
	{
		self FatherDeath(time,respawn);
		return;
	}
    if(!isdefined(time))
	    time = 0;
	if(time > 0 && level.players.size > 1)
		time = time / 2;
	if(!isdefined(respawn) || !respawn)	
	{
		level notify("zombie_dead");		
		self notify("zombie_drop");		
	}    
	else
	{
		self notify("zombie_respawn");
		if(!isDefined(newtype))		
			level thread SpawnZombie(self.type,undefined,self.key,self.hitbox.health,self.infinite);
		else
			level thread SpawnZombie(newtype,undefined,self.key,self.hitbox.health,self.infinite);
	}	
	self notify("zombie_dead");		
	self.hitbox delete();
	if(isDefined(self.fire))
		self.fire delete();
	level.zombies_currently_active--;	
	if(!isDefined(respawn) || !respawn || self.infinite)
	{		
		level.zombies_left--;
		if(self.type == "suicide")
		{
			self thread SuicideExplosion();
		}
	}	
	if(isDefined(self.eye_left))
	{
		self.eye_left delete();
		self.eye_right delete();
	}
	self moveTo(self.origin,1);
	if(self.type == "brutus")
	{
		self startragdoll();
		PhysicsExplosionSphere( self.origin, 100, 100, 1 );
	}
	if(isDefined(tesla))
	{
		if(self.model != "infantrya_body")
			self scriptModelPlayAnim("tesla_death");
		else
			self scriptModelPlayAnim("ww2_zm_death");
	}
	else if(self.type == "dog")
	{
		self scriptModelPlayAnim("zw2_wolf_death");
		foreach(player in level.players)
		{
			player playLocalSound("US_1mc_ahead");
		}
	}
	else if(self.type == "mech")
	{
		self scriptModelPlayAnim("bo2_mech_death");
		foreach(player in level.players)
		{
			if(Distance(player.origin,self.origin) <= 300 && player.team == "allies")
			{
			
			}
		}
	}	
	else if(self.type == "insanity")
	{
		self playSound("US_1mc_dh_freeforall");
		playFx(level.suicidebomber, self.origin);
		self delete();
		return;
	}
	else	
	{
		self startragdoll();
		//PhysicsExplosionSphere( self.origin, 500, 500, 1 );
	}	
	if(self.type == "normal")
	{
		r = randomInt(2);
		//self PlaySound(level.zombie_sound[4 + r]);
		foreach(player in level.players)
		{
			if(Distance(player.origin,self.origin) <= 200)
				player playlocalsound(level.zombie_sound[4 + r]);
		}
	}
	level notify("zombie_died");
    wait 2;
    wait time;
	if(isDefined(self.head))
		self.head delete();
    self delete();	
}

checkheight(pos1,pos2)
{
	if(pos1[2] > pos2[2])
	{
		a = pos1[2];
		b = pos2[2];
	}
	else
	{
		a = pos2[2];
		b = pos1[2];
	}
	//iprintln(a-b);
	return (a - b);
}
Zombie_Health()
{
	level endon("game_over");
	self endon("zombie_dead");
    while(1)
	{
	    self.hitbox waittill("damage", iDamage, attacker, iDFlags, vPoint, killtype, victim, vDir, sHitLoc, psOffsetTime, sWeapon);
		damage = self doDamage(iDamage,attacker,victim,sWeapon,vPoint,killtype);	
		if(self.type == "normal")
		{
			health = (level.zombie_health/3);
			if(self.ragemode == 0)
			{				
				if(self.hitbox.health < (health*2))
				{
					if(cointoss())
						self thread Zombie_Animation("run");
					if(self.ragemode < 1)
						self.ragemode = 1;
				}
			}
			else if(self.ragemode == 1)
			{				
				if(self.hitbox.health < health)
				{
					if(cointoss())
						self thread Zombie_Animation("sprint");
					self.ragemode = 2;
				}
			}
		}	
		attacker.damage_dealed += damage;
		if(getDvarInt("hitmarker") == 1)		
            attacker thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback(sHitLoc);
		self.wounded++;
		if(self.hitbox.health <= 0 || !isDefined(self.hitbox.health))
		{
			attacker.kills++;
			attacker.pers["kills"] = attacker.kills;
		    if(killtype == "MOD_MELEE")
			{
				attacker.score += (80 * level.multiplier);
				attacker.meleekills++;
			}			    
			else
			{
				attacker.score += (50 * level.multiplier);	
			}							
			attacker.mykills++;
			attacker notify("killed"); 			
			self thread Zombie_Death(0);		
		}
		else
		{
		    if(self.wounded <= 5)
				attacker.score += (10 * level.multiplier); 
			if(self.type == "brutus")
			{
				if(self.hitbox.health <= getDvarInt("zombie_brutus_health")/2 && self.inRage == 1)
				{
				    self.inRage = 2;
					self notify("inRage");
					foreach(player in level.players)
					{
						if(Distance(player.origin, self.origin) <= 300)
						{
							player playlocalsound(BRUTUS_RAGE);
						}
					}
				}			
			}
			else if(self.type == "father")
			{
				if(self.hitbox.health != getDvarInt("zombie_george_health"))
				{
					if(self.inRage == 0)
					{
						self notify("inRage");
					}
					
				}
			}
		}		
	}
}

Zombie_Attack(target)
{
	self endon("zombie_dead");
	hitdist = 80;
    hit = false;
	self.attract = 1;
    self moveTo(self.origin,1);
	damage = getDvarInt("zombie_damage");
	if(self.type == "normal") 
	    self thread Zombie_Animation("attack");
	else if(self.type == "brutus")
	    self thread Zombie_Animation("brutus_attack");
	else if(self.type == "mech")
		self thread Zombie_Animation("mech_attack");
	else if(self.type == "father")
	{
		self.walktype = self.mode; 	
		//if(self.mode == "walk" || self.mode == "idle")
			self thread Zombie_Animation("father_attack_walk");
		//else if(self.mode == "run")
		//	self thread Zombie_Animation("father_attack_run");	
	}	
	else if(self.type == "dog")
	{
		hitdist = 90;
		self thread Zombie_Animation("dog_attack");
	}	
	wait .5;
	if(self.type == "normal")
	{
		foreach(player in level.players)
		{
			if(Distance(self.origin,player.origin) <= 40)
			{
				player playLocalSound("mp_obj_returned");
			}
			else
			{
				player playLocalSound("mp_enemy_obj_captured");
			}
		}
	}
	if(Distance(self.origin, target.origin) < hitdist && target.isDown == 0)
	{
	    hit = true;
		if(isDefined(self.hitbox))
			target thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, damage, 0, "MOD_MELEE", "none", target.origin, target.origin, "none", 0, 0 );
		self.hitted = 100;
		target notify("get_attacked");
	}
	if(self.type == "dog")	
	{
		self thread Zombie_Animation("dog_idle");
		wait .5;
	}	
    else if(hit == true && self.type != "brutus" && self.type != "mech") //  && self.type != "father"	
	    wait 1;
	else
        wait .5;	
	if(self.type == "normal")	
		self thread Zombie_Animation(self.mode);
	else if(self.type == "dog")
		self thread Zombie_Animation("dog_run");
	else if(self.type == "brutus")
	{
	    if(self.inRage == 0)
		    self thread Zombie_Animation("brutus_walk");
		else if(self.inRage == 1)
			self thread Zombie_Animation("brutus_run");
		else if(self.inRage == 2)	
			self thread Zombie_Animation("brutus_sprint");
	}
	else if(self.type == "mech")
	{
		self thread Zombie_Animation("mech_run");
	}
	else if(self.type == "father")
	{
		if(self.walktype == "walk" || self.walktype == "idle")
			self thread Zombie_Animation("father_walk");
		else if(self.walktype == "run")
			self thread Zombie_Animation("father_run");
	}
	self.attract = 0;	
}
Zombie_SticksOnPlayer()
{
	self endon("zombie_dead");
    level endon("game_over");
	maxdistance = getDvarInt("allow_maxdistance");
	tempdist = 99999;
	foreach(player in level.players)
	{
		if(player.isDown == 0 && player.protected == 0)
		{
			if(Distance(self.spawnpoint, player.origin) < tempdist)
			{
				tempdist = Distance(self.spawnpoint, player.origin);
			}
		}
	}
	if(maxdistance < tempdist)
	{
		maxdistance += 15000;
	}
	wait 5;
	while(1)
	{
		distance = 99999;
		wait 1;
		self.hitted--;
		foreach(player in level.players)
		{
			if(Distance(self.origin,player.origin) < distance)
			{
				distance = Distance(self.origin,player.origin);
			}
		}
		if(distance > maxdistance || self.hitted == 0)
		{
			self thread Zombie_Death(2,1);
			return;
		}
	}
}
compareZombiePositions()
{
	level endon("game_over");
	self endon("zombie_dead");
	oldpos = self.origin;
	wait 5;
	while(1)
	{				
		if(self.attract == 0)
			oldpos = self.origin;		
		wait 10;	
		if(oldpos == self.origin)
		{
			v = true;
			max = level.players.size;
			foreach(player in level.players)
			{
				if(player.protected == 1 || player.isDown == 1 || player.hidden == 1)
					max--;
			}
			if(max == 0)
				v = false;
			if(v)	
				self thread Zombie_Death(2,1);
		}		
	}
}
Zombie_Move()
{
	//self thread maps\zm\d_ops_arcade\movement::Movement();
	self thread Zombie_Move2();
}
Zombie_Move2()
{
	self endon("zombie_dead");
	self endon("zombie_reaim");
    level endon("game_over");
	hasEnemy = false;
	mygoal = self;
	waittime = 0.005;
	newdist = undefined;
	oldtarget = self;
	self thread compareZombiePositions();
    while(1)
	{
		if(self.origin[2] < (level.spawns_humans[0][2] - 400))
		{
			self thread Zombie_Death(2,1);
			return;
		}
		/*if(hasEnemy) // not used atm
		{
			if(getDistances(self.target) < 100)
				hasEnemy = false;
		}*/
		if(self.attract == 0 && !self.paraslow && !hasEnemy)
 		{
		    maxdistance = 99999;
			target = undefined;
			self.target = undefined;
			group = 0;
			if(!self.poisolbulbed)
			{
				foreach(player in level.players)
				{
					if(Distance(self.origin, player.origin) < maxdistance && player.isDown == 0 && player.protected == 0 && player.hidden == 0 && player.team == "allies") 
					{					
						eye = player getTagOrigin("j_head"); // head
						trace = BulletTrace(self.origin+(0,0,60), eye, false, undefined);  
						newdist = Distance(trace["position"], player.origin);
						z = player.origin[2] - self.origin[2];
						if(newdist <75)        ///////////////////////////////////////////////////////////////////////////////////// 100
						{
							maxdistance = Distance(self.origin+(0,0,60),eye); // why is it not a line parallel to X axis? -> self.origin+(0,0,40)
							target = player;						
						}
					}
				}
			}
			else
			{
				target = self.goalpos;
			}
			if(isdefined(target))
			{		
				if(self.mode == "idle")
				{
					if(self.type == "normal")
						self thread Zombie_Mode();
					else if(self.type == "dog")
						self thread Zombie_Animation("dog_run");
					else if(self.type == "brutus")
					{
						if(self.inRage == 0)
							self thread Zombie_Animation("brutus_walk");
						else if(self.inRage == 1)
							self thread Zombie_Animation("brutus_run");
						else if(self.inRage == 2)	
							self thread Zombie_Animation("brutus_sprint");
					}
					else if(self.type == "mech")
					{
						if(maxdistance > 300)
							self thread Zombie_Animation("mech_run");
						else
							self thread Zombie_Animation("mech_walk");
					}
					else if(self.type == "father")
					{
						//if(self.inRage == 0)
							self thread Zombie_Animation("father_walk");
						//else if(self.inRage == 1)
						//	self thread Zombie_Animation("father_run");
					}
				}	
				self.target = target;
				oldtarget = target.origin;
				movetoLoc = VectorToAngles( target.origin - self.origin );	
				self RotateTo((0,movetoLoc[1],0), 0.3);	    
				if(Distance(self.origin,target.origin) > 60)
					self setGround();
				z = target.origin[2] - self.origin[2];
				if(Distance(self.origin, target.origin) > 60 ) //  && z < 300
				{	               
					maxdistance = Distance(self.origin, target.origin);
				    start = self.origin+(0,0,70);//newdist
					end = start + vector_Scal(AnglesToForward(self.angles),(maxdistance/10)); 	
					//pos = physicstrace(end + (0,0,30),end - (0,0,200));	
					pos = bullettrace(end + (0,0,30),end - (0,0,200),false,self.hitbox);	
					if(Distance(self.origin, pos["position"]) < 100)
						self MoveTo(pos["position"], (maxdistance / (self.speed*1000)));
				}
				else if(z <= 300)
				{			
					//if(self.type != "mech")
						self Zombie_Attack(target);					               			
				}
				else
				{
					//target = getNearestPlayer();
					//if(target != level)
					//{
					//	maxdistance = Distance(self.origin, target.origin);
					//	wait (maxdistance / (self.speed*100));
					//}
					//else
						wait .5;
					self.mode = "idle";
					if(self.type == "normal" || self.type == "brutus")
						self thread Zombie_Animation("idle");	
					else if(self.type == "dog")
						self thread Zombie_Animation("dog_idle");
					else if(self.type == "mech")
						self thread Zombie_Animation("idle");	
					else if(self.type == "father")
						self thread Zombie_Animation("father_idle");	
						//self thread MechFlyAway();
					self.hitted++;
				}
			}	
			else
			{
				if(oldtarget != self)
				{
					movetoLoc = VectorToAngles( target.origin - self.origin );	
					self RotateTo((0,movetoLoc[1],0), 0.3);
					self setGround();
					self thread Zombie_checkEnemyOnOldTarget(oldtarget);		
					wait ((distance(self.origin, oldtarget) / (self.speed*100)));
					self notify("reached_oldtarget");
					oldtarget = self;
				}
				else if(self.mode != "idle")
				{
					self.mode = "idle";
					if(self.type == "normal" || self.type == "brutus")
					{
						self thread Zombie_Animation("idle");
						/*	
						foreach(zombie in level.zombie)
						{
							if(zombie != self && isDefined(zombie.target) && BulletTracePassed(self.origin+(0,0,40), zombie.origin+(0,0,40), true, undefined))
							{
								hasEnemy = true;
								target = zombie;
								self.target = zombie;
							}
							else
								hasEnemy = false;
						}
						*/
					}
					else if(self.type == "dog")
						self thread Zombie_Animation("dog_idle");
					else if(self.type == "mech")
						self thread Zombie_Animation("idle");	
						//self thread MechFlyAway();
					else if(self.type == "father")
						self thread Zombie_Animation("father_idle");		
					self.hitted++; // so zombies dont respawn uneccessarily	
				}	
			}
		}	
		if(!isDefined(waittime))
			waittime = .1;
		wait waittime + 0.005;	
	}
}
Zombie_checkEnemyOnOldTarget(oldtarget)
{
	self endon("zombie_dead");
	self endon("reached_oldtarget");
	while(1)
	{
		//wait .1;
		waitFrame();
		maxdistance = 99999;
		target = undefined;
		self.target = undefined;
		foreach(player in level.players)
		{
		    if(Distance(self.origin, player.origin) < maxdistance && player.isDown == 0 && player.protected == 0 && player.hidden == 0) 
			{					
			    eye = player getTagOrigin("j_head"); // head
			    trace = BulletTrace(self.origin+(0,0,50), eye, false, level.zombie);  
				newdist = Distance(trace["position"], player.origin);
				if(newdist < 100)
				{
				    maxdistance = Distance(self.origin,eye);
					target = player;						
				}
			}
		}
		if(isDefined(target))
		{
			self notify("zombie_reaim");
			self.target = target;
			self thread Zombie_Move();
			self notify("reached_oldtarget");
		}
		else
		{
			self setGround();
			end = self.origin+(0,0,50) + vector_Scal(AnglesToForward(self.angles),(Distance(self.origin,oldtarget) / (self.speed*10)));	
			trace = BulletTrace(self.origin+(0,0,50), end, false, level.zombie);  
			//pos = physicstrace(trace["position"] + (0,0,30),trace["position"] - (0,0,200));
			pos = bullettrace(trace["position"] + (0,0,30),trace["position"] - (0,0,200),false,self.hitbox);
			if(Distance(self.origin,pos["position"]) <= 60)
				self moveTo(pos["position"], (distance(self.origin,pos["position"]) / (self.speed*100)));
			wait (distance(self.origin,pos["position"]) / (self.speed*100));
			//if(self.type == "mech")
			//	self thread MechFlyAway();
		}
	}
}

// Todo 1: stuck on State "1"
// Todo 2: setGround doesnt work correctly
// Todo 3: check if the right path is faster than left
// Todo 4: zombie has to go straight forward instead of sidely
// Todo 5: stuck on State 3

Zombie_Find() // currently not used
{
	self endon("zombie_dead");
    level endon("game_over");
	target = undefined;
	maxdistance = 999999;
	foreach(player in level.players)
	{
		distance = Distance(self.origin, player.origin);
		if(distance < maxdistance && player.isDown == 0 && player.protected == 0 && player.hidden == 0)
		{
			target = player;
			maxdistance = distance;
		}
	}
	if(!isDefined(target))
	{
		if(self.mode != "idle")
		{
			self.mode = "idle";
			self thread Zombie_Mode(); ///// if this thread is used at any time I have to overwork this part here because this should only be called for normal zombies		
		}	
		return;	
	}		
	forward = AnglesToForward(self.angles);
	end = self.origin+(0,0,50) + vector_Scal(forward,(maxdistance/10)); 
	downtrace = BulletTrace(end,end - (0,0,200), false, level.zombie); 
	trace = BulletTrace(self.origin+(0,0,50),downtrace["position"], false, level.zombie); 
	self setGround();
	if(Distance(self.origin, trace["position"]) > 40)
	{		
		movetoLoc = VectorToAngles(target.origin - self.origin);	
	    self RotateTo((0,movetoLoc[1],0), 0.3);
		self setGround();
		iPrintln("^11");
		self MoveTo(trace["position"], ((Distance(trace["position"], self.origin) / (self.speed*100))),.2);
	}
	else
	{
		valid = false;	
		addition = 0;
		counter = 0;
		moved = false;
		
		while(!valid)
		{
			waitFrame();		
			angle = self.angles + (0,addition,0);			
			forward = AnglesToForward(angle); 
			end = self.origin+(0,0,50) + vector_Scal(forward,Distance(trace["position"], self.origin));	
			downtrace = BulletTrace(end,end - (0,0,100), false, level.zombie); 
			trace = BulletTrace(self.origin+(0,0,50),downtrace["position"], false, undefined); 
			if(Distance(self.origin, trace["position"]) > 80 && moved == false)
			{				
				movetoLoc = VectorToAngles(target.origin - self.origin);	
				self RotateTo((0,movetoLoc[1],0), 0.3);				
				//self setGround();
				self MoveTo(trace["position"], (Distance(self.origin, trace["position"]) / (self.speed*100)),.2);
				iPrintln("^22");
				moved = true;
				valid = true;				
			}
			else if(counter < 150)
			{
				addition -= 10;
				counter++;
				moved = false;
				iPrintln("^33");
			}
			else
			{
				self thread Zombie_Death(2,1);
				iPrintln("^4Respawn");
			}
		}
		/*
		i = 0;
		j = 0;
		while(!valid)
		{
			waitFrame();
			forward = AnglesToForward(self.angles + (0,i,0)); 
			end = self.origin+(0,0,50) + vector_Scal(forward,40);	
			//downtrace = BulletTrace(end,end - (0,0,60), false, level.zombie); 
			trace1 = BulletTrace(self.origin+(0,0,50),end, false, undefined); 
			path1 = isValidPath(self.angles + (0,i,0),trace1);
			
			forward = AnglesToForward(self.angles + (0,j,0)); 
			end = self.origin+(0,0,50) + vector_Scal(forward,40);	
			//downtrace = BulletTrace(end,end - (0,0,60), false, level.zombie); 
			trace2 = BulletTrace(self.origin+(0,0,50),end, false, undefined); 
			validPath = isValidPath(self.angles + (0,j,0),trace2);
			if(validPath == false)
			{
				i += 10;
				iPrintlnbold("^1false");
			}
			else	
			{
				movetoLoc = VectorToAngles(target.origin - self.origin);	
				self RotateTo((0,movetoLoc[1],0), 0.3);				
				self MoveTo(trace1["position"]+(0,0,-50), (Distance(self.origin, trace1["position"]+(0,0,-50)) / (self.speed*100)),.2);				
				wait (Distance(self.origin, trace1["position"]) / (self.speed*100));
				iPrintlnbold("^1true");
				valid = true;
			}	
			if(validPath == false && !valid)
			{
				j -= 10;
				iPrintlnbold("^2false");
			}
			else if(!valid)
			{
				movetoLoc = VectorToAngles(target.origin - self.origin);	
				self RotateTo((0,movetoLoc[1],0), 0.3);				
				self MoveTo(trace2["position"]+(0,0,-50), (Distance(self.origin, trace2["position"]+(0,0,-50)) / (self.speed*100)),.2);				
				wait (Distance(self.origin, trace2["position"]) / (self.speed*100));
				iPrintlnbold("^2true");
				valid = true;
			}
			counter++;
			if(counter == 150)
			{
				self thread Zombie_Death(2,1);
			}
		}
		*/
	}
}
isValidPath(angle, trace)
{
	if(Distance(trace["position"], self.origin+(0,0,0)) < 10)
		return false;
	else
		return true;
}
Zombie_PlaySound()
{
    self endon("zombie_dead");
	level endon("game_over");
    while(1)
	{
		time = randomInt(20);
		wait (time + 1);
		foreach(player in level.players)
		{
		    if(Distance(player.origin,self.origin) <= 300)
			{
			    player playlocalsound(level.zombie_sound[randomInt(4)]);
			}
		}
		//self playSound(level.zombie_sound[randomInt(4)]);
	}
}
SuicideExplosion()
{
	playFx(level.area_explosion,self.origin+(0,0,40));
	waitFrame();
	foreach(zombie in level.zombie)
	{
		if(zombie != self && isDefined(zombie.hitbox) && Distance(zombie.origin, self.origin) <= 100)
		{
			zombie thread Zombie_BurnDamage();
		}
	}
}
Zombie_Explosive()
{
	self endon("zombie_dead");
	level endon("game_over");
	self thread Zombie_Soulburn();
	while(1)
	{
		wait .1;
		foreach(player in level.players)
		{
			if(Distance(player.origin,self.origin) < 100 && player.team == "allies")
			{
				if(player.isDown == 0)
				{
					if(player.protected == 0)
					{
						//player thread [[ level.callbackPlayerDamage ]](self,player,2,0,"MOD_EXPLOSIVE","barrel_mp",player.origin,(0,0,0) - player.origin,"none",0);
						if(isDefined(self.hitbox))
							player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, 2, 0, "MOD_EXPLOSIVE", "none", player.origin, player.origin, "none", 0, 0 );
					}	
				}
			}
		}
	}
}
Zombie_Soulburn()
{
	self endon("zombie_dead");
	level endon("game_over");
	self thread deleteSoulburn();
	while(1)
	{
		self.fire = spawnFX(level.fire_soulburn, self.origin+(0,0,40));
		triggerfx(self.fire);
		wait .1;
		self.fire delete();		
	}	
}
deleteSoulburn()
{
	self waittill("zombie_dead");
	if(isDefined(self.fire))
		self.fire delete();
}
Zombie_BurnDamage() 
{
	level endon("game_over");
	self endon("zombie_dead");
	damage = getDvarInt("zombie_burn_damage");
	for(i = 0;i < 100;i++)
	{
		self.fire = spawnFX(level.fire_med,self.origin+(0,0,30));
		triggerfx(self.fire);
		wait .1;
		self.fire delete();
		foreach(player in level.players)
		{
			if(Distance(player.origin,self.origin) < 50)
			{
				if(player.isDown == 0)
				{
					if(player.protected == 0)
					{
						//player thread [[ level.callbackPlayerDamage ]](self,player,2,0,"MOD_EXPLOSIVE","barrel_mp",player.origin,(0,0,0) - player.origin,"none",0);
						if(isDefined(self.hitbox))
							player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, 2, 0, "MOD_EXPLOSIVE", "none", player.origin, player.origin, "none", 0, 0 );
					}
				}	
			}
		}	
	}
}
Zombie_Drop(type)
{
    level endon("game_over");
	self endon("zombie_respawn");
    if(!isdefined(type))
	    type = "random";
	//iPrintln(type);	
	model = undefined;
	if(type == "random" && !self.infinite)
	{
	    a = randomInt(5);
		if(a == 0)
            type = "instakill";
		else if(a == 1)
            type = "maxammo";
		else if(a == 2)
            type = "bomb";
		else if(a == 3)
            type = "multiplier";
		else if(a == 4)
            type = "firesale";
		else if(a == 5)			// cannot be reached except with brutus & mech
			type = "bottle";	
	}	
	if(type == "instakill")
        model = "zw2_powerup_insta_kill";
	else if(type == "maxammo")
        model = "zw2_powerup_max_ammo";
	else if(type == "bomb")
        model = "zw2_powerup_nuke";
	else if(type == "multiplier")
        model = "zw2_powerup_x2";
	else if(type == "firesale")
        model = "zw2_powerup_fire_sale";
    else if(type == "freeperk")
        model = "zw2_powerup_free_perk";
    else if(type == "minigun")
        model = "zw2_powerup_minigun";
	else if(type == "bottle")
		model = "zw2_powerup_free_perk";
	else if(type == "special")
		model = getWeaponModel("frag_grenade_mp");	
	else
	{
		iPrintln("^1ERROR: Unknown Dropmodel!");	
		return;
	}
	self waittill("zombie_drop");
    drop = spawn("script_model", self getDropPos());
    drop setModel(model);
    drop thread Drop_Rotate();	
	if(type != "special")
	{
		drop thread Drop_Think(type);
		drop thread maps\zm\d_ops_arcade\utilities::locateEnt();
	}
	else
	{
		drop thread maps\zm\d_ops_arcade\utilities::locateSpecial();	
		drop thread Drop_Think_Special();
	}	   
}
getDropPos()
{
	pos = PhysicsTrace(self.origin+(0,0,50), self.origin+(0,0,-300));
	pos = pos+(0,0,45);
	return pos;
}
Drop_Rotate()
{
    self endon("drop_gone");	
	time = getDvarInt("drop_timeout");
	speed = 1;
	half = (getDvarInt("drop_timeout")/2);
	fourth = (getDvarInt("drop_timeout")/4);
	while(time > 0)
	{
	    self rotateto(self.angles+(0,180,0),speed);
	    wait speed;
		time--;
		if(time == half)
		{
			speed = .7;
			self thread Drop_Bling(1);
		}			
		if(time == fourth)
		{
			speed = .4;	
			self thread Drop_Bling(.5);
		}			
	}
	self notify("drop_timeout");
	self.glow delete();
	self delete();
}
Drop_Bling(time)
{
    self notify("bling");
	self endon("bling");
	while(isdefined(self))
	{
	    self hide();
	    wait time;
		self show();
		wait time;
	}
}
Drop_Think(type)
{
    self endon("drop_gone"); 
	self endon("drop_timeout");
    while(1)
	{
	    wait .2;
		foreach(player in level.players)
		{
		    if(Distance(self.origin,player.origin) <= 70)
			{
			    self thread Drop_Give(player,type);
				self notify("drop_gone");
			}
		}
	}
}	
Drop_Think_Special()
{
	self endon("drop_gone"); 
	self endon("drop_timeout");
    while(1)
	{
	    wait .2;
		foreach(player in level.players)
		{
		    if(Distance(self.origin,player.origin) <= 70 && !player hasWeapon("frag_grenade_mp"))
			{
			    self thread Drop_Give(player, "special");
				self notify("drop_gone");
			}
		}
	}
}
Drop_Give(player,type)
{ 
	self.glow delete();
    self delete();
	if(type == "instakill")
	{
		level thread Instakill();
	}     
	else if(type == "maxammo")
    {
		foreach(client in level.players)
			client thread MaxAmmo();	    
	}	
	else if(type == "bomb")
	{
		foreach(client in level.players)
		    client thread Bomb();
		foreach(zombie in level.zombie)
			zombie.attract = 1;
	    foreach(zombie in level.zombie)
		{
		    if(isDefined(zombie) && isdefined(zombie.hitbox) && zombie.type != "brutus" && zombie.type != "napalm" && zombie.type != "mech")
			{
				zombie thread Zombie_Death(2);	
				waitFrame();waitFrame();waitFrame();
			}							
		}
	}
	else if(type == "multiplier")
	{
		level thread Multiplier();
	}
	else if(type == "firesale")
	{
		level thread FireSale();
	}
	else if(type == "bottle")
	{
		player thread GiveExtraPerk();
	}
	else if(type == "special")
	{
		/* // Bouncy :D
		player setClientDvar( "grenadeBounceRestitutionMax", 5);
		player setClientDvar( "grenadeBumpFreq", 9);
		player setClientDvar( "grenadeBumpMag", 0);
		player setClientDvar( "grenadeBumpMax", 20);
		player setClientDvar( "grenadeCurveMax", 0);
		player setClientDvar( "grenadeFrictionHigh", 0);
		player setClientDvar( "grenadeFrictionLow", 0);
		player setClientDvar( "grenadeFrictionMaxThresh", 0);
		player setClientDvar( "grenadeRestThreshold", 0);
		player setClientDvar( "grenadeRollingEnabled", 1);
		player setClientDvar( "grenadeWobbleFreq", 999);
		player setClientDvar( "grenadeWobbleFwdMag", 999);		
		*/
		player maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		player giveWeapon("frag_grenade_mp");
		player setweaponammoclip("frag_grenade_mp",1);
		player setweaponammostock("frag_grenade_mp",1);
		player thread ThrowGlowGrenade();
	}
	waitFrame();
	if(type == "instakill" || type == "multiplier" || type == "firesale")
	{
		foreach(client in level.players)
		{
			client thread DropToList();
		}
	}		
}
GiveExtraGumball()
{
	weapon = self getCurrentWeapon();
	gumball = level.gobblegum[randomInt(level.gobblegum.size)];
	self giveWeapon(level.gumball,getGumCamo(gumball));
	self thread maps\zm\d_ops_arcade\mapedit::giveGumball(gumball);
	wait .1;
	self switchToWeapon(level.gumball);
	wait 2;
	self switchToWeapon(weapon);
	self takeWeapon(level.gumball);
}
GiveExtraPerk()
{
	perk = [];
	length = 0;
	if(!is_true(self.juggernaut))
	{
		perk[length] = "juggernaut";
		length++;
	}
	if(!is_true(self.doubletap))
	{
		perk[length] = "doubletap";
		length++;
	}
	if(!is_true(self.speedcola))
	{
		perk[length] = "speedcola";
		length++;
	}
	if(!is_true(self.staminup))
	{
		perk[length] = "staminup";
		length++;
	}
	if(!is_true(self.quickrevive))
	{
		perk[length] = "quickrevive";
		length++;
	}
	if(length > 0)
	{
		choice = perk[randomInt(length)];
		self thread maps\zm\d_ops_arcade\mapedit::givePerk(choice);
	}	
}
DropToList()
{
    self notify("clear_powerup_wait");
    self endon("clear_powerup_wait");

    foreach(drop in self.drop)
        drop destroy();

    self.drop = [];

    self playlocalsound("mp_oldschool_pickup");
    if(level.instakill == 1)
    {
        x = self.drop.size * 50;
        self.drop[0] = self createIcon("cardicon_fmj", 30,30);
        self.drop[0] setPoint("CENTER", "CENTER", x, 150);        
        self thread endInstakill();    
    }
    self playlocalsound("mp_oldschool_spawn");        
    if(level.multiplier == 2)
    {
        x = self.drop.size * 50;
        self.drop[1] = self createIcon("cardicon_gold", 30, 30);    
        self.drop[1] setPoint("CENTER", "CENTER", x, 150);
        self thread endMultiplier();
    }
        
    if(level.firesale == 1)
    {
        x = self.drop.size * 50;
        self.drop[2] = self createIcon("cardicon_bear", 30, 30);    
        self.drop[2] setPoint("CENTER", "CENTER", x, 150);    
        self thread endFiresale();    
    }

    level waittill_any("game_over");
    
    if(isdefined(self.drop) && self.drop.size > 0)
        foreach(drop in self.drop)
            drop destroy();
}
endInstakill()
{
	self endon("disconnect");
	level waittill("end_instakill");
	self thread DropToList();
}
endMultiplier()
{
	self endon("disconnect");
	level waittill("end_multiplier");
	self thread DropToList();
}
endFiresale()
{
	self endon("disconnect");
	level waittill("end_firesale");
	self thread DropToList();
}
DropToList_Old(name) // not used anymore
{
	self notify(name);
	self endon(name);
	x = self.drop.size * 35;
	if(isDefined(self.drop.size[0]))
		self.drop[self.drop.size+1] = self createIcon(name, 20, 20);
	else
		self.drop[0] = self createIcon(name, 20, 20);
	if(name == "instakill")
		self.drop[self.drop.size-1].color = (1,0,0);
	if(name == "multiplier")
		self.drop[self.drop.size-1].color = (0,1,0);
	if(name == "firesale")
		self.drop[self.drop.size-1].color = (0,0,1);
	self.drop[self.drop.size-1] setPoint("CENTER", "CENTER", x, 150);	
	if(name == "instakill")
		time = level.instakilltime;
	else if(name == "multiplier")
		time = level.multipliertime;
	else if(name == "firesale")
		time = level.firesaletime;
	else
		time = 1; // just to prevent script error
	for(i = time;i > 0;i--)
	{
		wait 1;
		//iPrintln(name + ": " + i);
	}
	foreach(drop in self.drop)
	{
		drop destroy();
	}
	self.drop = [];
	if(level.instakill == 1)
	{
		foreach(player in level.players)
		{
			self playlocalsound("UK_1mc_arena");
				player thread DropToList("instakill");
		}
	}
	if(level.multiplier == 2)
	{
		foreach(player in level.players)
		{
			self playlocalsound("UK_1mc_arena");
				player thread DropToList("multiplier");
		}
	}
	if(level.firesale == 1)
	{
		foreach(player in level.players)
		{
			player thread DropToList("firesale");
		}
	}
}
MaxAmmo()
{
	icon = self createIcon("cardicon_launcher", 100, 100);
	icon setPoint("CENTER", "CENTER", -5, -70);
	icon fadeovertime(4);
	icon.alpha = 0;
	maxammo = self createFontString("objective", 2);
	maxammo setPoint("TOPLEFT", "TOPLEFT", 360, 220);
	maxammo setText("MAX AMMO!");
	maxammo fadeovertime(4);
	maxammo.glowalpha = 1;
	maxammo.color = level.HUDCOLOR;
	maxammo.glowcolor = (255,0,0);
	maxammo.hideWhenInMenu = true;
	maxammo fadeovertime(4);
	maxammo.alpha = 0;
	self playlocalsound("US_1mc_hq_online");
	primaryWeapons = self getWeaponsListPrimaries();
	foreach(primary in primaryWeapons)
	{
		if(isValidWeapon(primary))
		self giveMaxAmmo(primary);
	}	
	wait 4;
	if(isDefined(maxammo))
	if(isDefined(icon))
	{
		maxammo destroy();
		icon destroy();
	}
	self notify("maxammo");	
}
Bomb()
{
	self playlocalsound("US_1mc_hq_secured");
    self visionsetnakedforplayer("coup_sunblind", 1);
	wait 1;
	if(getDvarInt("night") == 1)
		self visionsetnakedforplayer("icbm", 3);
	else
		self visionsetnakedforplayer("default_mp", 3);
	if(self.team == "allies")
	    self.score += (400 * level.multiplier);	
}
Instakill()
{	
	level notify("instakill");
	level endon("instakill");
	level.instakilltime = level.instakilltime + getDvarInt("instakill_time");
	level.instakill = 1;
	foreach(player in level.players)
		player playlocalsound("US_1mc_hq_offline");
	for(i = level.instakilltime;i > 0;i--)
	{
	    wait 1;
		level.instakilltime--;
	}
	level.instakill = 0;
	foreach(player in level.players)
		player playlocalsound("AB_1mc_ahead");
	level notify("end_instakill");
}
Multiplier()
{	
	level notify("multiplier");
	level endon("multiplier");
	level.multipliertime = level.multipliertime + getDvarInt("multiplier_time");
	level.multiplier = 2;
	foreach(player in level.players)
		player playlocalsound("US_1mc_enemy_apache");
	for(i = level.multipliertime;i > 0;i--)
	{
	    wait 1;
		level.multipliertime--;
	}
	level.multiplier = 1;
	foreach(player in level.players)
		player playlocalsound("AB_1mc_arena");
	level notify("end_multiplier");
}
FireSale()
{
    level notify("firesale");
	level endon("firesale");
	foreach(client in level.players)
		client playlocalsound("mp_killstreak_carepackage");
	foreach(box in level.magical_boxes)
		box.price = 10;
	level.firesale = 1;
	level.firesaletime = level.firesaletime + getDvarInt("firesale_time");
	for(i = level.firesaletime;i > 0;i--)
	{
	    wait 1;
		level.firesaletime--;
	}
	foreach(box in level.magical_boxes)
		box.price = getDvarInt("cost_box");
	level.firesale = 0;	
	level notify("end_firesale");
}
ThrowGlowGrenade()
{
	self endon("death");
	self endon("disconnect");
	threw = false;
	while(!threw)
	{
		self waittill("grenade_fire", grenade,weaponname);
		if(weaponname == "frag_grenade_mp")
		{
			self takeWeapon("frag_grenade_mp");
			grenade thread GrenadeFx();
			self thread getDragonDistance(grenade);
			threw = true;
			//iPrintlnBold("energybulb");
		}
	}
}
GrenadeFx()
{
	while(isDefined(self))
	{
		fx = spawnFx(level.energybulb_negative, self.origin);
		triggerfx(fx);
		wait .1;
		fx delete();
	}
}
getDragonDistance(grenade)
{
	while(isDefined(grenade))
	{
		wait .1;
		if(Distance(self.origin, level.dragon.hitbox.origin) <= 300)
		{
			sticky = spawn("script_model", grenade.origin);
			sticky moveTo(level.dragon.hitbox.origin,2);
			grenade linkto(sticky);
			grenade waittill("death");
			playFxTemp(level.energybulb_negative, sticky.origin, 2);
			//level.dragon.hitbox thread [[level.callbackPlayerDamage]](self,level.dragon.hitbox,50,0,"MOD_EXPLOSIVE","barrel_mp",level.dragon.hitbox.origin,(0,0,0) - level.dragon.hitbox.origin,"tag_origin",0);
			//level.dragon.hitbox thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, 400, 0, "MOD_EXPLOSIVE", "none", level.dragon.hitbox.origin, level.dragon.hitbox.origin, "none", 0, 0 );
			level.dragon.hitbox notify("damage", 400, self, undefined, undefined, undefined, undefined, undefined, undefined, undefined, "frag_grenade_mp");
			iPrintln("400");
			sticky delete();
			
		}
	}
}
/////////////////// Damagethread ///////////////////

doDamage(iDamage,attacker,victim,sWeapon,vPoint,killtype)
{
	self.hitbox.health += iDamage;
	if(sWeapon != "ac130_105mm_mp" && sWeapon != "ac130_40mm_mp" && sWeapon != "ac130_25mm_mp")	
		weapon = attacker getCurrentWeapon();
	else
		weapon = sWeapon;
	if(level.instakill == 1 && self.type != "brutus" && self.type != "mech" && self.type != "napalm")	
		iDamage = 99999;
	else if(sWeapon == "gl_mp")
		iDamage = 500;
	else if(weapon == level.startpistol)	
	{
		if(killtype == "MOD_MELEE")
			iDamage = 150;
		else
			iDamage = 39;
	}		
	else if(weapon == level.annihilator)
	{
		if(self.type != "brutus")
			iDamage = 2000;
		else
			iDamage = 500;
	}
		
	else if(weapon == "frag_grenade_mp")
	{
		iPrintln("damage");
		  iDamage += 400;	
	}  
	else if(weapon == "scar_mp")
	    iDamage += 60;
	else if(weapon == "usp_mp")	
		iDamage += 200;
	else if(weapon == "ak74u_mp")
		iDamage += 40;
	else if(weapon == "ac130_25mm_mp")
		iDamage += 500;	
	else if(weapon == "tavor_mp")
		iDamage += 40;
	else if(weapon == "ak47classic_mp")
		iDamage += 40;
	else if(weapon == "cheytac_mp")
		iDamage *= 12;
	else if(weapon == "m21_mp")
		iDamage *= 10;
	else if(weapon == "deserteagle_akimbo_mp")
		iDamage = 0;
	else if(weapon == "ump45_silencer_mp")
		iDamage += 30;
	else if(weapon == "rpd_mp")
		iDamage += 30;	
	else if(weapon == "spas12_mp")
		iDamage += 100;	
	else if(weapon == "model1887_akimbo_mp")
		iDamage *= 6;	
	else if(weapon == "m4_mp")
		iDamage += 40;	
	else if(weapon == "aug_mp")
		iDamage += 60;
	else if(weapon == "sa80_mp")
		iDamage += 50;
	else if(weapon == level.mg08)
		iDamage += 50;
	else if(weapon == level.mors)
		iDamage = 800;	
	else if(weapon == "mg4_mp")
		iDamage += 40;	
	else if(weapon == level.bow)
		iDamage = 500;		
	else if(weapon == "m240_mp")
		iDamage += 40;	
	else if(weapon == "kriss_mp")
		iDamage += 40;		
	else if(weapon == level.minigun)
		iDamage += 100;	
	else if(weapon == "uzi_acog_mp")
		iDamage += 50;
	else if(weapon == "masada_mp")
		iDamage += 30;
	else if(weapon == level.thompson)
		iDamage += 15;
	else if(weapon == "ac130_40mm_mp")
		iDamage += 3000;	
	else if(weapon == "peacekeeper_mp")
		iDamage += 40;	
	else if(weapon == level.raygunm2)
		iDamage += 250;
	else if(weapon == level.blundergat || weapon == level.blundergat_upgrade || weapon == level.blundergat_upgrade2)
		iDamage = 1000;		
	else if(weapon == "ak47_acog_heartbeat_mp")
		iDamage += 55;	
	else if(weapon == "ak47_acog_shotgun_mp")
		iDamage += 54;
	else if(weapon == "ak47_acog_silencer_mp")
		iDamage += 43;
	else if(weapon == "ak47_eotech_fmj_mp")
		iDamage += 31;
	else if(weapon == "uzi_acog_fmj_mp")
		iDamage += 46;
	else if(weapon == "ak47_eotech_heartbeat_mp")
		iDamage += 42;
	else if(weapon == "ak47_fmj_mp")
		iDamage += 45;
	else if(weapon == "ak47_fmj_thermal_mp")
		iDamage += 48;
	else if(weapon == "ak47classic_gl_mp")
		iDamage += 50;
	else if(weapon == "ak47classic_xmags_mp")
		iDamage += 40;
	else if(weapon == "ak74u_acog_mp")
		iDamage += 42;
	else if(weapon == "ak74u_xmags_mp")
		iDamage += 40;	
	else if(weapon == "famas_acog_mp")
		iDamage += 45;
	else if(weapon == "fn2000_mp")
		iDamage += 39;
	else if(weapon == "mg4_mp")
		iDamage += 30;
	else if(weapon == "ranger_mp")
		iDamage = 650;
	else if(weapon == "barrett_acog_mp")
		iDamage = 450;	
	else if(weapon == "barrett_silencer_mp")
		iDamage += 650;	
	else if(weapon == "cheytac_acog_mp")
		iDamage += 400;
	else if(weapon == "cheytac_fmj_heartbeat_mp")
		iDamage += 500;
	else if(weapon == "cheytac_silencer_mp")
		iDamage += 700;
	else if(weapon == "cheytac_xmags_mp")
		iDamage += 650;
	else if(weapon == "spas12_fmj_mp")
		iDamage += 125;	
	else if(weapon == "ak47_gl_mp")
		iDamage = 500;	
	
	if(weapon != "ac130_40mm_mp" && weapon != "ac130_105mm_mp" && weapon != "ac130_25mm_mp")
	{
		aimAt = attacker getCursorPos();
		if(self.mode == "idle")
				maxdist = 25;
			else
				maxdist = 15;
				
		if(isDefined(self.head) && Distance(aimAt, self.head.origin+(0,0,10)) <= 28 && checkheight(aimAt,self.head.origin+(0,0,10)) < maxdist)
		{
			divisor = iDamage / 2;
			iDamage = iDamage + int(divisor);
			headshot = true;
		}			
		else
			headshot = undefined;
		if(isDefined(attacker.weaponlist[sWeapon]) && attacker.weaponlist[sWeapon] > 0)
			iDamage *= 2;
			
		if(attacker.doubledamage)
			iDamage *= 2;	
		if(iDamage != 0 && self.type != "mech")
			playFx(level.bloodfx,vPoint);
		if(isDefined(headshot) && self.hitbox.health <= 0)
			attacker playlocalsound("RU_1mc_demolition");
	}
	self.hitbox.health -= iDamage;
	//iprintln("^1" + iDamage);
	if(iDamage > 0)
		self notify("damaged");	
	return iDamage;	

}


////////////////////////////////// Brutus /////////////////////////////

Brutus_Spawn()
{
    self endon("zombie_dead");	
    self scriptModelPlayAnim("zw2_brutus_spawn");
	self thread Brutus_Death();
	Earthquake( 0.4, 2, self.origin, 1000 );
	if(!self.infinite)
	{
		playFx(level.smokefx,self.origin);
		foreach(player in level.players)
		{
			if(Distance(player.origin, self.origin) <= 750 && isDefined(player))
			{
				player playlocalsound(BRUTUS_SPAWN);
			}
		}
	}
	wait 1.5;
	self thread BossWalk_Earthquake();
	self thread Zombie_Animation("brutus_walk");
	self thread Zombie_Move();
	wait .1;
	self.hitbox waittill("damage");
	self.inRage = 1;
	self thread Zombie_Animation("brutus_run");
	self waittill("inRage");
	if(!self.infinite)
		playFx(level.smokefx,self.origin);
	self scriptModelPlayAnim("zw2_brutus_enrage");
	self.attract = 1;
	self moveto(self.origin,1);
	if(!self.infinite)
	{
		foreach(player in level.players)
		{
			if(Distance(player.origin, self.origin) <= 750 && isDefined(player))
			{
				player playlocalsound(BRUTUS_RAGE);
			}
		}
	}
	wait 3;		
	self.attract = 0;
	self thread Zombie_Animation("brutus_sprint");
}
BossWalk_Earthquake()
{
    level endon("game_over");
	self endon("zombie_dead");
	left = true;
	while(1)
	{
	    wait .5;
	    if(self.attract == 0 && self.mode != "idle")
		{		
			if(self.mode == "walk")
				wait .5;
			Earthquake( 0.25, .5, self.origin, 500 );
			if(self.type == "mech")
			{
				if(left)
				{
					left = false;
					foreach(player in level.players)
					{
						if(Distance(player.origin,self.origin) <= 500)
						{
							player playlocalsound("PG_1mc_control_lost");
						}
					}
				}
				else 
				{
					left = true;
					foreach(player in level.players)
					{
						if(Distance(player.origin,self.origin) <= 500)
						{
							player playlocalsound("PG_1mc_dh_sabotage");
						}
					}
				}
			}
		}
	}
}
Brutus_Death()
{
	self waittill("zombie_dead");
	foreach(player in level.players)
	{
		if(Distance(player.origin, self.origin) <= 750 && isDefined(player))
		{
			player playlocalsound(BRUTUS_DEATH);
		}
	}
}
/////////////////// Insanity /////////////////////

Insanity_Spawn()
{	
	self playSound("US_1mc_boost");
	self hide();
	success = BulletTracePassed(self.origin, self.origin+(0,0,200), false, level.zombie);
	if(success)
	{
		self moveTo(self.origin+(0,0,200),1);
		wait 1;
	}
	self.fire = spawnFX(level.fire_soulburn, self.origin+(0,0,40));
	TriggerFX(self.fire);
	wait 2;
	self.hitbox.health = 300;
	self.fire delete();
	self thread Zombie_Soulburn();
	self thread Zombie_Animation("insanity");
	self show();
	if(success)	
		self moveTo(self.origin+(0,0,-200),.5);
		//self PhysicsLaunchServer((0,0,0), (randomInt(5),randomInt(5),randomInt(5)) );
	wait .5;
	self thread Zombie_Move();
	self thread Suicidebomber();
	self thread Insanity_Rotate();
}
Insanity_Rotate()
{
	self endon("zombie_dead");
	while(true)
	{
		if(self.mode != "idle")
		{
			self rotateto(self.angles+(0,10,0),.1);
			//self.angles = self.angles+(10,0,0);
		}
		wait .1;
	}
}

////////////////////// Dog //////////////////////

Dog_Spawn()
{
	self.dogready = false;
    self thread SpawnInFire();
}
SpawnInFire()
{
	self playSound("US_1mc_arena");
	self hide();
	self.fire = spawnFX(level.fire_soulburn, self.origin+(0,0,40));
	TriggerFX(self.fire);
	wait 2.8;
	dist = 99999;
	target = undefined;
	foreach(player in level.players)
	{
	    if(Distance(self.origin,player.origin) <= dist)
		{
		    if(player.isDown == 0)
			{
				dist = Distance(self.origin,player.origin);
				target = player;
			}
		}
	}
	movetoLoc = VectorToAngles( target.origin - self.origin );	
	self RotateTo((0,movetoLoc[1],0), 0.2);
	wait 2;
	self.fire delete();
	if(self.type != "normal")
		self thread Zombie_Soulburn();
	self endon("zombie_dead");
	if(self.type == "dog")
	{
		self.dogready = true;
		self.hitbox.health = getDvarInt("zombie_dog_health");
	}		
	else if(self.type == "mech")	
		self.hitbox.health = getDvarInt("zombie_mech_health");
	else
	{
		self.hitbox.health = level.zombie_health;
	}
	self show();
	self thread Zombie_Move();
	if(self.type == "dog")
		self thread Zombie_Animation("dog_run");
	else if(self.type == "mech")	
		self thread Zombie_Animation("mech_walk");
	else
		self thread Zombie_Mode();
	//wait 3;
	//self waittill("zombie_dead");
	//self startragdoll();
}
///////////////////// Mindfucker /////////////////

Mindfuck()
{
	self endon("zombie_dead");
	level endon("game_over");
	self thread MindFuck_Fx();	
	//self thread Mindfuck_Vision(); // makes player see darkness when he looks at him 
	//self thread Mindfuck_Telekinesis(); // not finished, raises up entities next to him like cars	
	while(true)
	{
		wait 4 + randomInt(12);
		distance = 99999;
		target = undefined;
		foreach(player in level.players)
		{
			newdist = Distance(player.origin,self.origin);
			if(newdist < distance && player.team == "allies" && player.isDown == 0 && player.protected == 0 && player.hidden == 0)
			{
				distance = newdist;
				target = player;
			}
		}
		if(isDefined(target) && Distance(target.origin,self.origin > 299))
		{
			forward = AnglesToForward(target.angles);
			start = target getTagOrigin("j_head");
			trace = bullettrace(start , start + vector_Scal(forward,300), false,undefined);
			trace2 = bullettrace(trace["position"] ,trace["position"]+(0,0,-1000), false,undefined); 
			if(Distance(trace2["position"], trace["position"]) < 1000)
			{
				self.attract = 1;
				self moveTo(self.origin,1);
				self hide();
				self.head hide();
				self.origin = trace2["position"];
				portal = spawnfx(level.blackhole, trace2["position"]);
				triggerfx(portal);
				portal thread deletePortal();
				self thread enteredPortal();
			}
		}
		
	}
}
deletePortal()
{
	wait 2;
	self delete();
}
enteredPortal()
{
	wait 2;
	self show();
	self.head show();
	self.attract = 0;
	self thread MindFuck_Fx();
}
Mindfuck_Telekinesis()
{
	while(isDefined(self.hitbox))
	{
		wait 5;
		foreach(player in level.players)
		{
			if(Distance(player.origin,self.origin) <= 200)
			{
				a = 500;
				b = a;
				if(cointoss())
					a *= -1;
				if(cointoss())
					b *= -1;	
				player setvelocity((a,b,300));	
			}
		}
	}
}
Mindfuck_Telekinesis_old()
{
	ents = getEntArray();
	ar = [];
	while(isDefined(self.hitbox))
	{
		i = 0;
		wait 5;
		foreach(ent in ents)
		{
			if(Distance(ent.origin,self.origin) <= 200)
			{
				ar[i] = ent;
				i++;
				ent thread Mindfuck_Move();
			}
		}			
	}
	foreach(elem in ar)
	{
		ar PhysicsLaunchServer( (0,0,0), (randomInt(5),randomInt(5),randomInt(5)) );
	}
}
Mindfuck_Move()
{
	self moveTo(self.origin+(0,0,70),2);
	wait 3;
	iprintln("flyaway");
}
Mindfuck_Vision()
{
	while(self.attract == 0)
	{
		wait .1;
		foreach(player in level.players)
		{
			if(Distance(self.head.origin, player getCursorPos()) <= 100 && !player.mindfucked && player.team == "allies")
			{
				player thread Mindfuck_Vision_Player();
			}
		}
	}
	while(self.attract == 1)
	{
		wait 1;
	}	
	self thread Mindfuck();
}
Mindfuck_Vision_Player()
{
	self endon("disconnect");
	self endon("death");
	self.mindfucked = true;
	self visionsetnakedforplayer("blacktest", 1);
	wait .5;
	if(getDvarInt("night") == 1)
	{
		self visionsetnakedforplayer("cobra_sunset3", 1);
	}
	else
	{
		self visionsetnakedforplayer("default_mp",1);
	}	
	self.mindfucked = false;
}
MindFuck_Fx()
{
	while(isDefined(self.hitbox) && self.attract == 0)
	{
		fx = spawnFx(level.magicstream, self.origin);
		triggerfx(fx);
		waitFrame();
		fx delete();
	}
}

///////////////////// Suicidebomber //////////////

Suicidebomber()
{
	level endon("game_over");
	self endon("zombie_dead");
	bomb = undefined;
	//self attach("projectile_hellfire_missile","tag_stowed_back");
	if(self.type == "normal")
	{
		bomb = spawn("script_model", self getTagOrigin("tag_stowed_back"));
		bomb.angles = (90,0,0);
		bomb setModel("projectile_hellfire_missile");
		bomb enablelinkto();
		bomb linkto(self, "tag_stowed_back");
		self thread Suicidebomber_onTakenOut(bomb);
	}		
	wait 5;
	while(1)
	{
		wait .5;
		validbomb = false;
		foreach(player in level.players)
		{
			if(Distance(player.origin,self.origin) <= 100 && player.team == "allies")
			{
				if(player.isDown == 0 && player.protected == 0 && player.hidden == 0)
				{
					validbomb = true;
					playFx(level.suicidebomber, self.origin);
					Earthquake( 0.6, 2, self.origin, 1000 );
					//player thread [[level.callbackPlayerDamage]](self,player,49,0,"MOD_EXPLOSIVE","barrel_mp",player.origin,(0,0,0) - player.origin,"tag_origin",0);
					if(isDefined(self.hitbox))
						player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, 49, 0, "MOD_EXPLOSIVE", "none", player.origin, player.origin, "none", 0, 0 );
					if(isDefined(bomb))
						bomb delete();
					self notify("suicidebomber");
					if(isDefined(self.fire))
						self.fire delete();
					//if(isDefined(self.hitbox))	
					//	self thread Zombie_Death(2);	
				}
			}		
		}
		if(isDefined(self.hitbox) && validbomb)	
			self thread Zombie_Death(2);
	}
}
Suicidebomber_onTakenOut(bomb)
{
	self endon("suicidebomber");
	self waittill("zombie_dead");
	self playSound("US_1mc_dh_freeforall");
	if(isDefined(bomb))
		bomb delete();
}
///////////////////// Mechzombie /////////////////

MechZombie()
{
	level endon("game_over");
	self endon("zombie_dead");
	self playSound("NS_1mc_defcon_2");
	trace = BulletTrace(self.origin, self.origin+(0,0,3000), false, undefined); 
	if(Distance(trace["position"],self.origin) < 1000)
		self SpawnInFire();
	else
	{
		self.origin = self.origin+(0,0,3000);
		self moveTo(self.origin+(0,0,-3000),5);
		self thread MechJetpack();
		self.hitbox.health = getDvarInt("zombie_mech_health");
		wait 5;
		self thread Zombie_Animation("mech_walk");
		self thread Zombie_Move();
		self thread MechTriggerAttack();
		self thread MechGrapnel();
		self thread BossWalk_Earthquake();
		while(isDefined(self.hitbox))
		{
			self waittill("damaged");
			if(isDefined(self.target) && self.attract == 0 && self.mode != "run")
				self thread Zombie_Animation("mech_run");
		}		
	}
}
MechGrapnel()
{
	level endon("game_over");
	self endon("mechflyaway");
	self endon("zombie_dead");
	for(;;)
	{
		wait 1;
		foreach(player in level.players)
		{
			wait 10;
			if(player.isDown == 1 || player.protected == 1 || player.hidden == 1)
				continue;
			trace = BulletTrace(self.origin+(0,0,20),player.origin+(0,0,20), false, self);
			if(Distance(trace["position"],player getTagOrigin("j_head")) <= 70)
			{
				self.attract = 1;
				self moveTo(self.origin,1);
				self thread Zombie_Animation("idle");
				wait 1;
				trace = BulletTrace(self.origin+(0,0,20),player.origin+(0,0,20), false, self);
				if(Distance(trace["position"],player getTagOrigin("j_head")) <= 70)
				{
					self MechMagnetic(player);
				}
				else
				{
					self thread Zombie_Animation("mech_run");
					self.attract = 0;
				}
			}
		}
	}	
}
MechMagnetic(player)
{
	time = (Distance(self.origin, player.origin) / (self.speed*100));
	if(time >= 1)
	{
		grapnel = spawn("script_model", player getTagOrigin("j_head"));
		player enablelinkto();
		player PlayerLinkTo(grapnel);
		grapnel moveTo(self.origin+(0,0,40),time);
		self thread endMagnetic(player, grapnel);
		wait time-1;
		grapnel delete();
		self notify("magneticdone");
	}
}
endMagnetic(player,grapnel)
{
	self waittill_any("zombie_dead", "damaged", "magneticdone");
	grapnel delete();
	self.attract = 0;
	self thread Zombie_Animation("mech_run");
}
MechTriggerAttack()
{
	level endon("game_over");
	self endon("zombie_dead");
	self endon("mechflyaway");
	for(;;)
	{
		wait .2;
		foreach(player in level.players)
		{
			if(Distance(player.origin, self.origin) <= 300 && player.isDown == 0 && player.protected == 0 && player.hidden == 0)
			{
				self MechAttack();
			}
		}	
	}
}

MechAttack()
{
    fire = [];
    endpos = self.origin + (0,0,40) + vector_Scal(AnglesToForward(self.angles), 500);
    fireorigin = spawn("script_model", self.origin + (0,0,40));
    fireorigin setModel("tag_origin");
    fireorigin moveTo(endpos, 1);
    for(i = 0;i < 8;i++)
    {    
        fire[i] = spawnfx(level.fire_med, fireorigin.origin);
        triggerfx(fire[i]);        
        self thread MechFireDamage(fire[i]);
        fire[i] thread maps\zm\d_ops_arcade\weapons::deleteIn(2);
        wait .12;
    }    
    wait 2;
    fireorigin delete();
}

MechFireDamage(fire)
{
	while(isDefined(fire))
	{
		foreach(player in level.players)
		{
			if(Distance(player.origin, self.origin) <= 100 && player.isDown == 0 && player.protected == 0)
			{
				//[[level.callbackPlayerDamage]](eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset);
				//player thread [[level.callbackPlayerDamage]](self,player,10,0,"MOD_EXPLOSIVE","barrel_mp",player.origin,(0,0,0) - player.origin,"tag_origin",0);
				player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, 2, 0, "MOD_EXPLOSIVE", "none", player.origin, player.origin, "none", 0, 0 );
				player thread RedScreen();
			}
		}
		wait .1;
	}
}
RedScreen()
{
	self notify("redscreen");
	self endon("redscreen");
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
    boxElem.color = (1,0,0);
    boxElem.alpha = 1;
    boxElem setParent(level.uiParent);
    boxElem setShader("combathigh_overlay", 1000, 1000);
    boxElem.hidden = false;
    boxElem.HideWhenInMenu = true;
    boxElem setPoint("CENTER", "CENTER", 0, 0);	
	boxElem fadeovertime(3);
	boxElem.alpha = 0;
	self.zombievision = boxElem;
	wait 3;
	self.zombievision destroy();
}
MechFlyAway()
{	
	self notify("mechflyaway");
	self endon("mechflyaway");
	for(i = 0;i < 30;i++)
	{
		wait 1;
		if(isDefined(self.target))
		{
			self.searchcounter = 0;
			return;
		}
		else
			self.searchcounter++;	
	}
	trace = BulletTrace(self.origin, self.origin+(0,0,3000), false, self); 
	if(Distance(trace["position"],self.origin+(0,0,200) > 1000))
	{
		self hide();
		self.attract = 1;		
		mech = spawn("script_model", self.origin);
		mech.angles = self.angles;
		mech setModel("bo2_mech");
		mech moveTo(self.origin+(0,0,3000),5);
		mech thread MechJetpack();
		mech thread deleteMechClone();
		self.origin = self.origin+(10000,10000,10000);
		wait 5.1;
		self thread Zombie_Death(1,1);
	}
	else
	{
		self thread Zombie_Death(1,1);
	}
}
deleteMechClone()
{
	wait 5.1;
	self delete();
}
MechJetpack()
{
	for(i = 0;i < 50;i++)
	{
		fx = spawnFx(level.fire_large, self.origin);
		triggerfx(fx);
		wait .1;
		fx delete();
	}
}
InitiateMechThreat(power)
{
	if(!isDefined(power) || power < 2)
	{
		iPrintln("^1ERROR: Initiating Mechthreat failed!");
		return;
	}	
	foreach(player in level.players)
		player PlayLocalSound( "flag_spawned" );
	power--;
	list = [];
	length = 0;
	foreach(zombie in level.zombie)
	{
		if(isDefined(zombie.hitbox) && zombie.type != "brutus" && zombie.type != "mech")
		{
			list[length] = zombie;
			length++;
		}
	}
	if(length > 0)
	{
		for(i = 0;i < power;i++)
		{
			//victim = list[randomInt(length)];
			//victim = list[i];
			//level.zombies_left++;
			//level.total++;
			//level.zombies_spawned--;
			//level.zombies_will_spawn++;
			//victim thread Zombie_Death(2);
			start = self.origin+(0,0,30);
			end = start + vector_Scal(AnglesToForward(self.angles+(0,randomInt(360),0)),100);
			trace = BulletTrace(start, end, false, level.zombie); 
			pos = physicstrace(trace["position"] + (0,0,30),trace["position"] - (0,0,200));
			//SpawnZombie("mech", pos);
			thread spawnExtraMech(pos);
			wait 3;
		}
	}
}
spawnExtraMech(pos)
{
	foreach(zombie in level.zombie)
	{
		if(isDefined(zombie) && isDefined(zombie.hitbox) && zombie.type != "mech" && zombie.type != "brutus")
		{
			zombie thread Zombie_Death(2,1,"mech");
			return;
		}
	}
}
pickupWeaponOnDeath(weapon)
{
	self waittill("zombie_dead");
	model = spawn("script_model", self.origin+(0,0,40));
	model setModel(getWeaponModel(weapon));
	model endon("pickedup");
	model thread onPickUpRange(weapon);
	for(i = 0;i < 60;i++)
	{
		model rotateto(model.angles+(0,180,0),1);
		model.fire = spawnFX(level.fire_soulburn, model.origin);
		triggerfx(model.fire);
		wait 1;	
		model.fire delete();
	}
	model notify("nopickup");
	model.fire delete();
	model delete();
}
onPickUpRange(weapon)
{
	self endon("pickedup");
	self endon("nopickup");
	while(true)
	{
		foreach(player in level.players)
		{
			if(Distance(player.origin,self.origin) <= 90)
			{
				if(player.isDown == 0)
				{
					player thread mayPickUp(self,weapon);
				}
			}
		}
		wait .2;
	}
}
mayPickUp(model,weapon)
{
	player = self;
	player notify("mayPickUp");
	player endon("mayPickUp");
	player thread dontMayPickUpBruh(model);
	player notifyonPlayerCommand("indeedPickUp", "+activate");
	player waittill("indeedPickUp");
	if(Distance(player.origin,model.origin) <= 90)
	{
		name = player getCurrentWeapon();
		if(!isSpecialistWeapon(name) && !player hasWeapon(weapon))
		{
			if(player.weapon_maximum == 1)
				player takeWeapon(name);
			else
				player.weapon_maximum = 1;
			player giveWeapon(weapon);
			player giveMaxAmmo(weapon);
			player switchToWeapon(weapon);
			model notify("pickedup");
			model.fire delete();
			model delete();	
		}
		else
			player iprintln("^1ERROR: you're holding an invalid weapon for weapon trading!");
	}
}
dontMayPickUpBruh(model)
{
	model endon("pickedup");
	self endon("mayPickUp");
	wait 3;
	self notify("mayPickUp");
}
Zombie_Eyes()
{
	self endon("zombie_dead");
	//fx = PlayFXOnTag(level.zombie_eye, self,self getTagOrigin("tag_eye_left"));
	while(true)
	{
		
		self.eye_left = spawnFx(level.zombie_eye, self getTagOrigin("tag_eye_left")); //tag_eye_left
		triggerfx(self.eye_left);
		self.eye_right = spawnFx(level.zombie_eye, self getTagOrigin("tag_eye_right"));
		triggerfx(self.eye_right);
		waitFrame();
		self.eye_right delete();
		self.eye_left delete();
	}
}
