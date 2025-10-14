#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\gametypes\utilities;
#using_animtree( "multiplayer" );

// =========================================================
//
// Contains zombielogic 
//
// =========================================================

initZombieAttackSounds()
{
    level.zombie_attack_sounds = [];
    level.zombie_attack_sounds[0] = "PG_1mc_control_lost";
    level.zombie_attack_sounds[1] = "UK_1mc_bomb_planted";
    level.zombie_attack_sounds[2] = "PG_1mc_dh_sabotage";
    level.zombie_attack_sounds[3] = "PG_1mc_control_taken";
    level.zombie_attack_sounds[4] = "US_1mc_dh_captureflag";

	if (!isDefined(level.zombie_attack_index))
    	level.zombie_attack_index = 0;
}
initZombieDeathSounds()
{
    level.zombie_death_sounds = [];
    level.zombie_death_sounds[0] = "UK_1mc_demolition";
    level.zombie_death_sounds[1] = "NS_1mc_defcon_2";
    level.zombie_death_sounds[2] = "UK_1mc_defcon";
    level.zombie_death_sounds[3] = "US_1mc_hq_online";
    level.zombie_death_sounds[4] = "UK_1mc_control_lost";

	if (!isDefined(level.zombie_death_index))
    	level.zombie_death_index = 0;
}
testDeath()
{
	wait 5;
	self thread Zombie_Death(2);
	foreach(player in level.players)
		player.anticampcounter = 0;
}
SpawnZombie(type,pos,key,health,infinite)
{
    level endon("end");

    // Init host, mais ne JAMAIS annuler le spawn si c'est en pause
    if (!isDefined(level.pauseInit))
    { 
        level.pauseInit = true; 
        if (isDefined(level.players) && level.players.size > 0)
            level.host = level.players[0];
    }

    // Si la partie est en pause, on attend la reprise
    while (isDefined(level.paused) && level.paused)
        wait 0.05;

    if (!isDefined(type))
    {
        iPrintln("^1ERROR: No Zombietype defined!");
        iPrintlnBold("^1ERROR: No Zombietype defined!");
        type = "normal";
    }

    return doSpawnZombie(type,pos,key,health,infinite);
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
		if(type == "normal" || type == "mindfuck")
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
	if(type == "mindfuck")
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
	
	if(type == "normal" || type == "mindfuck")
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
	else if(type == "dog")
	{
		level.zombie[i] setModel("zw2_wolf");
		level.zombie[i].speed = 50;
		level.zombie[i] thread Dog_Spawn();
		if(level.zombies_will_spawn == 0)
			level.zombie[i] thread Zombie_Drop("maxammo");

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
	}
	else if(type == "mindfuck")
	{
		level.zombie[i] thread delayHealth();
		level.zombie[i].hitbox hide();
		level.zombie[i] thread Mindfuck();
	}
	else if(type == "dog")
	{
		level.zombie[i].hitbox.health = 999999999;
		level.zombie[i].hitbox hide();
		level.zombie[i].hitbox.angles = (90,90,90);
	}
	level.zombie[i] thread Zombie_Health();	
	level.zombie[i] thread Zombie_SticksOnPlayer();
	thread initZombieAttackSounds();
	thread initZombieDeathSounds();
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
	self safePlaySound("US_1mc_boost");
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
	else if(self.model == "infantrya_body")
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
Zombie_DelaySolid()
{
    self notSolid();   // pas de collision au moment du spawn
    wait 2;            // attends 2 secondes (tu peux ajuster à 1.5 ou 3 si besoin)
    if (isDefined(self) && isAlive(self))
    {
        self Solid();  // active la collision
    }
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
    if (!isDefined(time))
        time = 0;
    if (time > 0 && level.players.size > 1)
        time = time / 2;

    if (isDefined(self.hitbox))
        self.hitbox delete();

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
        level thread maps\zm\gametypes\boss::George();
    }

    self moveTo(self.origin,1);	
    if (isDefined(self) && isAlive(self))
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
		level waittill("forever");
		return;
	}

	// --- FIX compteur : empêche un zombie de décrémenter plusieurs fois ---
	if (isDefined(self.alreadyCounted) && self.alreadyCounted)
	{
		respawn = 1; // considéré comme respawn forcé, pas de décrément
	}
	else
	{
		self.alreadyCounted = true;
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

	if (isDefined(self.hitbox))	
		self.hitbox delete();
	if(isDefined(self.fire))
		self.fire delete();

	// --- FIX compteur : seulement si pas respawn ---
	if (!isDefined(respawn) || !respawn)
	{
		level.zombies_currently_active--;	
		level.zombies_left--;

		// Sécurités anti -1
		if (level.zombies_left < 0)
			level.zombies_left = 0;

		if (level.zombies_currently_active < 0)
			level.zombies_currently_active = 0;
	}

	if(isDefined(self.eye_left))
	{
		self.eye_left delete();
		self.eye_right delete();
	}

	// --- ANIMATIONS + SONS ---
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
			player playLocalSound("US_1mc_ahead"); // son mort chien
		}
	}
	else	
	{
		self startragdoll();
	}

	// --- Sons de mort supplémentaires ---
	if (self.type == "normal")
	{
    	if (!isDefined(self.death_last_time)) self.death_last_time = 0;

    	if (getTime() - self.death_last_time >= 300)
    	{
        	sndName = level.zombie_death_sounds[level.zombie_death_index];
        	self safePlaySound(sndName);

        	level.zombie_death_index++;
        	if (level.zombie_death_index >= level.zombie_death_sounds.size)
            	level.zombie_death_index = 0;

        	self.death_last_time = getTime();
    	}
	}
	else if (self.type == "father")
	{
    	foreach(player in level.players)
        	player playLocalSound("fsm_georg_death"); // mort boss
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
		// Effet de sang à l'impact
		if (isDefined(vPoint))
		{
    		playFx(level.bloodfx, vPoint); // fx principal
    		playFx(level.bloodfx, vPoint + (0,0,15)); // petit splash en hauteur
		}
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
			{
				attacker.score += (10 * level.multiplier); 
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
	//self thread maps\zm\gametypes\movement::Movement();
	self thread Zombie_Move2();
}

Zombie_Move2()
{
    self endon("zombie_dead");
    self endon("zombie_reaim");
    level endon("game_over");

    // --- phase "spawn": collision OFF puis ON ---
    if (isDefined(self))
    {
        self notSolid();              // pas de collision pendant l'émergence
        if (isDefined(self) && isAlive(self))
            self Solid();             // collision activée
    }

	hasEnemy = false;
    waittime = 0.005;

    while (1)
    {
        // --- PAUSE DURE ---
        if (level.paused)
        {
            self moveTo(self.origin, 0.05);
            if (self.type == "dog")
                self Zombie_Animation("dog_idle");
            else if (self.type == "father")
                self Zombie_Animation("father_idle");
            else
                self Zombie_Animation("idle");

            level waittill("pause_off");
            continue;
        }

        // --- SI LE ZOMBIE GLISSE SOUS LA MAP ---
        if (self.origin[2] < (level.spawns_humans[0][2] - 400))
        {
            self thread Zombie_Death(2,1);
            return;
        }

        // recherche de cible
        maxdistance = 99999;
        target = undefined;
        foreach(player in level.players)
        {
            if(isDefined(player) && isAlive(player) && player.isDown == 0 && player.protected == 0 && player.hidden == 0 && player.team == "allies")
            {
                if(Distance(self.origin, player.origin) < maxdistance)
                {
                    eye = player getTagOrigin("j_head");
                    trace = BulletTrace(self.origin+(0,0,60), eye, false, undefined);
                    newdist = Distance(trace["position"], player.origin);

                    if(newdist < 75)
                    {
                        maxdistance = Distance(self.origin+(0,0,60),eye);
                        target = player;
                    }
                }
            }
        }

        if(isDefined(target) && isAlive(target))
        {
            // --- 🔥 Check zombie derrière le joueur ---
            if (Distance(self.origin, target.origin) <= 150)
            {
                fwd = AnglesToForward(target.angles);
                dir = VectorNormalize(self.origin - target.origin);
                dot = vectorDot(fwd, dir);

                if (dot < -0.3) // zombie derrière
                {
                    if (!isDefined(self.behind_last_time)) self.behind_last_time = 0;
                    if (getTime() - self.behind_last_time >= 5000) // cooldown 5s
                    {
                        target playLocalSound("AB_1mc_armsrace");
                        self.behind_last_time = getTime();
                    }
                }
            }
            // --- Fin check derrière ---

            // attaque si proche
            if(Distance(self.origin, target.origin) <= 60)
            {
                self thread Zombie_Attack(target);
                wait 1.2;
            }
            else
            {
                if(self.mode == "idle")
                {
                    if(self.type == "normal")
                        self thread Zombie_Mode();
                    else if(self.type == "dog")
                        self thread Zombie_Animation("dog_run");
                    else if(self.type == "father")
                        self thread Zombie_Animation("father_walk");
                }

                self.target = target;
                movetoLoc = VectorToAngles(target.origin - self.origin);
                self RotateTo((0,movetoLoc[1],0), 0.3);

                if(Distance(self.origin,target.origin) > 60)
                    self setGround();

                if(Distance(self.origin, target.origin) > 60)
                {
                    maxdistance = Distance(self.origin, target.origin);
                    start = self.origin+(0,0,70);
                    end = start + vector_Scal(AnglesToForward(self.angles),(maxdistance/10));
                    pos = bullettrace(end + (0,0,30),end - (0,0,200),false,self.hitbox);

                    if(Distance(self.origin, pos["position"]) < 100)
                        self MoveTo(pos["position"], (maxdistance / (self.speed*1000)));
                }
            }
        }
        else
        {
            if(self.mode != "idle")
            {
                self.mode = "idle";
                if(self.type == "normal")
                    self thread Zombie_Animation("idle");
                else if(self.type == "dog")
                    self thread Zombie_Animation("dog_idle");
                else if(self.type == "father")
                    self thread Zombie_Animation("father_idle");

                self.hitted++;
            }
        }

        // --- 🔥 Anti-Collision intégré ---
        foreach(z in level.zombie)
        {
            if(isDefined(z) && z != self && isAlive(z))
            {
                distXY = Distance2D(self.origin, z.origin); 
                dz     = abs(self.origin[2] - z.origin[2]); 
                dist   = Distance(self.origin, z.origin);

                if(dist < 40 || (distXY < 40 && dz < 60))
                {
                    dir = VectorNormalize(self.origin - z.origin);
                    self.origin += dir * 5;
                }
            }
        }
        // --- Fin anti-collision ---

        wait waittime + 0.005;
    }
}

Zombie_Attack(target)
{
    self endon("zombie_dead");
    self endon("disconnect");
    self endon("zombie_reaim");
    level endon("game_over");

    if (!isDefined(target) || !isAlive(target))
        return;

    if (!isDefined(self.attack_last_time))
        self.attack_last_time = 0;

    hitdist = 100;
    damage = getDvarInt("zombie_damage");
    self.attract = 1;

    if (self.type == "normal")
        self thread Zombie_Animation("attack");
    else if (self.type == "dog")
    {
        hitdist = 120;
        self thread Zombie_Animation("dog_attack");
    }
    else if (self.type == "father")
        self thread Zombie_Animation("father_attack_walk");

    wait 0.5;

	// --- SONS D'ATTAQUE ---
	if (self.type == "normal")
	{
    	if (!isDefined(self.attack_last_time)) self.attack_last_time = 0;

    	if (getTime() - self.attack_last_time >= 300) // cooldown 300ms
    	{
        	sndName = level.zombie_attack_sounds[level.zombie_attack_index];
        	self safePlaySound(sndName);

        	level.zombie_attack_index++;
        	if (level.zombie_attack_index >= level.zombie_attack_sounds.size)
            	level.zombie_attack_index = 0;

        	self.attack_last_time = getTime();
    	}
	}
	else if (self.type == "dog")
	{
    	if (!isDefined(self.attack_last_time)) self.attack_last_time = 0;

    	if (getTime() - self.attack_last_time >= 600) // aboie moins souvent
    	{
        	foreach(player in level.players)
            	player playLocalSound("US_1mc_control_taken");
        	self.attack_last_time = getTime();
    	}
	}
	else if (self.type == "father")
	{
    	foreach(player in level.players)
        	player playLocalSound("fsm_georg_attack");

    }

    // coup
    if (isDefined(target) && isAlive(target) && Distance(self.origin, target.origin) <= hitdist)
    {
        target thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper(
            self, self, damage, 0, "MOD_MELEE", "none",
            target.origin, target.origin, "none", 0, 0
        );
        target notify("get_attacked");
    }

    wait 0.5;
    if (self.type == "normal")
        self thread Zombie_Animation(self.mode);
    else if (self.type == "dog")
        self thread Zombie_Animation("dog_run");
    else if (self.type == "father")
        self thread Zombie_Animation("father_walk");

    self.attract = 0;
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
	drop thread Drop_PlayLoopingSound(type);
	if(type != "special")
	{
		drop thread Drop_Think(type);
		drop thread maps\zm\gametypes\utilities::locateEnt();
	}
	else
	{
		drop thread maps\zm\gametypes\utilities::locateSpecial();	
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
		    if(isDefined(zombie) && isdefined(zombie.hitbox) && zombie.type != "napalm")
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
Drop_PlayLoopingSound(type)
{
    self endon("drop_gone");
    self endon("drop_timeout");
    self endon("death");

    snd = "";

    switch(type)
    {
        case "instakill":
            snd = "mp_obj_returned";
            break;
        case "maxammo":
            snd = "mp_obj_returned";
            break;
        case "bomb":
            snd = "mp_obj_returned";
            break;
        case "multiplier":
            snd = "mp_obj_returned";
            break;
        case "firesale":
            snd = "mp_obj_returned";
            break;
        default:
            snd = "mp_obj_returned";
            break;
    }

    if (snd == "")
        return;

    // boucle jusqu’à disparition ou ramassage
    while(isDefined(self))
    {
        self safePlaySound(snd);     // 3D → entendu proche du drop
        //foreach(player in level.players) player playLocalSound(snd); // Global (partout sur la map)
        wait 3.0; // rejoue toutes les 3 secondes (ajuste selon la longueur du son)
    }
}

GiveExtraGumball()
{
	weapon = self getCurrentWeapon();
	gumball = level.gobblegum[randomInt(level.gobblegum.size)];
	self giveWeapon(level.gumball,getGumCamo(gumball));
	self thread maps\zm\gametypes\mapedit::giveGumball(gumball);
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
		self thread maps\zm\gametypes\mapedit::givePerk(choice);
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
			player thread DropToList("instakill");
		}
	}
	if(level.multiplier == 2)
	{
		foreach(player in level.players)
		{
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
	self playlocalsound("mp_ingame_summary");
	primaryWeapons = self getWeaponsListPrimaries();
	foreach(primary in primaryWeapons) 
	{
		if(isValidWeapon(primary)) 
		{
			self giveMaxAmmo(primary);
			self setWeaponAmmoClip(primary, 999);
			altWeapon = WeaponAltWeaponName(primary);
			if(altWeapon != "none") 
			{
				self giveMaxAmmo(altWeapon);
			}
		}
	}	
	wait 4;
	if(isDefined(icon))
	{
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
		player playlocalsound("mp_enemy_obj_captured");
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
		player playlocalsound("mp_killstreak_counteruav");
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
	if(level.instakill == 1 && self.type != "napalm")	
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
	}
	self.hitbox.health -= iDamage;
	//iprintln("^1" + iDamage);
	if(iDamage > 0)
		self notify("damaged");	
	return iDamage;	

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
			{
				wait .5;
				Earthquake( 0.25, .5, self.origin, 500 );
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
////////////////////// Dog //////////////////////

Dog_Spawn()
{
	self.dogready = false;
    self thread SpawnInFire();
}
SpawnInFire()
{
	self safePlaySound("US_1mc_arena");
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
	else
	{
		self.hitbox.health = level.zombie_health;
	}
	self show();
	self thread Zombie_Move();
	if(self.type == "dog")
		self thread Zombie_Animation("dog_run");
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
	fx = PlayFXOnTag(level.zombie_eye, self,self getTagOrigin("tag_eye_left"));
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

