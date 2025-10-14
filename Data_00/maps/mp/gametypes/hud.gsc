#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

Init()
{
    precacheShader("minimap_background");
	precacheShader("cardicon_gold"); // 2x
	precacheShader("cardicon_skull"); // deathmachine
	precacheShader("cardicon_fmj"); // insta
	level thread onPlayerConnect();
	if(level.cinema == 1 && level.devmode == 0)
	    level waittill("HUD_Start");
    level thread MoneyHud();
	level thread Amount_of_Zombies();
	level thread DropInit();
	level thread RoundHud();
}
onPlayerConnect()
{
    for(;;)
	{
	    level waittill("connected", player);
		player thread onPlayerSpawned();
		player thread CreateScore();
		//player thread WeaponHud();
	}
}
onPlayerSpawned()
{
    self endon("disconnect");
	for(;;)
	{
	    self waittill("spawned_player");
		self thread Update_MoneyHud();
		self thread RefreshMoney();
	}
}
MoneyHud()
{
    while(1)
    {
        y = 85;
        c = 0;
        foreach(player in level.players)
        {
            level.cashhud[player.guid] = level createServerFontString("objective", 1.3);
            level.cashhud[player.guid] setPoint("RIGHT", "RIGHT", -90, y); 
            level.cashhud[player.guid] setText(player.name + ":");
            level.cashhud[player.guid].color = (1,1,1);
            level.cashhud[player.guid].glowalpha = 1;
            level.cashhud[player.guid].glowcolor = player getColor(c);
            level.cashhud_value[player.guid] = level createServerFontString("objective", 1.3);
            level.cashhud_value[player.guid] setPoint("RIGHT", "RIGHT", -10, y);
            level.cashhud_value[player.guid].foreground = 1;
            if(!isDefined(player.score))
                level.cashhud_value[player.guid] setValue(level.startmoney);
            else
                level.cashhud_value[player.guid] setValue(player.score);
            level.cashhud_value[player.guid].color = (1,1,1);
            level.cashhud_value[player.guid].glowalpha = 1;
            level.cashhud_value[player.guid].glowcolor = player getColor(c);
            level.cashhud_value[player.guid].hideWhenInMenu = true;
            level.cashhud[player.guid].hideWhenInMenu = true;
            y = (y - 30);
            //player thread Bloodmoney(110,y);
            c++;
        }
        level waittill("changed_playersize");
        foreach(cashhud in level.cashhud)
            cashhud destroy();
        foreach(cashhud_value in level.cashhud_value)
            cashhud_value destroy();
        wait .15;
    }
}/*
MoneyHud()
{
    while(1)
	{
	    y = 85;
		c = 0;
		foreach(player in level.players)
	    {
		    level.cashhud[player.guid] = level createServerFontString("objective", 1.2);
            level.cashhud[player.guid] setPoint("RIGHT", "RIGHT", -50, y); 
			level.cashhud[player.guid] setText(player.name + ":");
			level.cashhud[player.guid].color = (1,1,1);
			level.cashhud[player.guid].glowalpha = 1;
			level.cashhud[player.guid].glowcolor = player getColor(c);
			level.cashhud_value[player.guid] = level createServerFontString("objective", 1.5);
            level.cashhud_value[player.guid] setPoint("RIGHT", "RIGHT", -10, y);
            level.cashhud_value[player.guid].foreground = 1;
			if(!isDefined(player.score))
			    level.cashhud_value[player.guid] setValue(level.startmoney);
			else
			    level.cashhud_value[player.guid] setValue(player.score);
			level.cashhud_value[player.guid].color = (1,1,1);
			level.cashhud_value[player.guid].glowalpha = 1;
			level.cashhud_value[player.guid].glowcolor = player getColor(c);
			level.cashhud_value[player.guid].hideWhenInMenu = true;
			level.cashhud[player.guid].hideWhenInMenu = true;
			y = (y - 30);
			//player thread Bloodmoney(110,y);
			c++;
	    }
		level waittill("changed_playersize");
		foreach(cashhud in level.cashhud)
		    cashhud destroy();
		foreach(cashhud_value in level.cashhud_value)
		    cashhud_value destroy();		
		wait .15;
	}
}*/
getColor(c)
{
    if(c == 0 || c == 6)
	{
	    color = (1,0,0);
		return color;
	}
	else if(c == 1 || c == 7)
	{
	    color = (0,1,0);
		return color;
	}
	else if(c == 2 || c == 8)
	{
	    color = (0,0,1);
		return color;
	}
	else if(c == 3 || c == 9)
	{
	    color = (1,1,0);
		return color;
	}
	else if(c == 4 || c == 10)
	{
	    color = (0,1,1);
		return color;
	}
	else if(c == 5 || c == 11)
	{
	    color = (0,0,0);
		return color;
	}
	else 
	{
	    color = (1,1,1);
		return color;
	}
}
Update_MoneyHud()
{
    self endon("death");
	self endon("disconnect");
	for(;;)
	{
	    self waittill("money");
		level.cashhud_value[self.guid] setValue(self.score);
	}
}
RefreshMoney()
{
    self notify("refreshmoney");
	self endon("refreshmoney");
    self endon("disconnect");
	for(;;)
	{
	    wait 2;
		level.cashhud_value[self.guid] setValue(self.score);
	}
}

/////////////////////////////////////////////////////////////////
Amount_of_Zombies()
{
    while(level.players.size < 1)
	{
	    wait 1;
	}
	level.amount_of_zombies_hud = level createServerFontString("objective", 1.5);
    level.amount_of_zombies_hud setPoint("TOP", "TOP", -25, 0); 
	level.amount_of_zombies_hud_value = level createServerFontString("objective", 1.5);
    level.amount_of_zombies_hud_value setPoint("TOP", "TOP", 55, 0); 
	level.amount_of_zombies_hud_value.color = (1,1,1);
	level.amount_of_zombies_hud_value.glowalpha = 1;
	level.amount_of_zombies_hud_value.glowcolor = (1,0,0);
	level.amount_of_zombies_hud.glowalpha = 1;
	level.amount_of_zombies_hud.glowcolor = (1,0,0);
	level.amount_of_zombies_hud.color = (1,1,1);
	level.amount_of_zombies_hud setText("Intermission:");
	level.amount_of_zombies_hud.hideWhenInMenu = true;
	level.amount_of_zombies_hud_value.hideWhenInMenu = true;
}
Intermission()
{
    level.amount_of_zombies_hud setText("Intermission:");
    for(i = level.intermissiontime; i > 0;i--)
	{
	    level.amount_of_zombies_hud_value setValue(i);
		if(level.players.size < 1 || level.paused == 1)
		    i++;
		wait 1; 	
	}
}
ZombieCounter()
{
    level endon("ende");
	level endon("gameover");
    level.amount_of_zombies_hud setText("Zombies:");
	if(level.inbossround == 1)
	    level.zombies_left = 1;
	else if(level.indoground == 0)
	    level.zombies_left = level.zombie_total;
	else
	    level.zombies_left = level.players.size * 8 + 1;	
	level.amount_of_zombies_hud_value setValue(level.zombies_left);
	for(;;)
	{
	    level waittill("zombie_killed");
		if(level.inbossround == 0)
		    level thread UpdateZombieHud();
	}
}
UpdateZombieHud()
{
    ////////////////////////////////////////////
    wait 1; // made for testing if it fixes the wrong left zombie hud bug
	////////////////////////////////////////////
    level.zombies_left -= 1;
	zombies_left = 0;
	foreach(zombie in level.bots)
	{
	    if(zombie.alive == 1 && isDefined(zombie.crate1))
		    zombies_left++;
	}
	//if(isDefined(level.george))
	//{
	//    zombies_left++;
	//}
	level thread ZombieCounter_2(zombies_left + level.zombie_to_spawn);
	//wait 1;
	level.amount_of_zombies_hud_value setValue(level.zombies_left);
}
ZombieCounter_2(zombies_left)
{
    if(zombies_left < 7)
	{
	    level notify("zombies_less");
	}
    if(zombies_left == 1)
	{
		foreach(zombie in level.bots)
		{
		    if(isDefined(zombie) && zombie.crate1.health > 0 && isDefined(zombie.crate1.health) && level.indoground == 0)
			{
			    zombie thread maps\mp\gametypes\zombies::Bot_Animation("run");
				zombie.speed = 160;
			}
		}
		if(level.indoground == 1)
		{
		    level thread FixDogBug();
		}
	}
	if(zombies_left <= 0)
	{      
	    if(level.georgespawned == 1)
		    level waittill("killed_george");
		level.amount_of_zombies_hud_value setText("");
		//level.amount_of_zombies_hud setText("");
		level.inRound = 0;
		level notify("ende");
	}
}
FixDogBug()
{
    level endon("ende");
	level endon("gameover");
	wait 25;
	foreach(zombie in level.bots)
	{
	    if(isDefined(zombie.crate.health && zombie.crate1.health > 0))
		{
		    zombie.crate1.health -= 9999;
			zombie thread maps\mp\gametypes\zombies::Bot_Kill(0);
		}
	}
}
RoundHud()
{
    level.roundhud = level createServerFontString("objective", 2);
    level.roundhud setPoint("BOTTOMLEFT", "BOTTOMLEFT", 50, -40); 
	level.roundhud.color = (0,0,0);
	level.roundhud.glowalpha = 1;
	level.roundhud.glowcolor = (1,0,0);
	level.roundhud2 = level createServerFontString("objective", 5);
    level.roundhud2 setPoint("BOTTOMLEFT", "BOTTOMLEFT", 25, -10); 
	level.roundhud2.color = (153/255,0,0);
	level.roundhud2.glowalpha = 1;
	level.roundhud2.glowcolor = (0,0,0);
	level.roundhud.hideWhenInMenu = true;
	level.roundhud2.hideWhenInMenu = true;
	//level.roundhud2.color = (85,7,9);
	for(;;)
	{
	    level waittill("start");
		level thread RoundPopup();
		if(level.round >= 6)
            level.roundhud2 setText(level.round);
	}	
}
RoundPopup()
{
    level.roundhud3 = level createServerFontString("objective", 2.5);
    level.roundhud3 setPoint("CENTER", "CENTER", 0, 0); 
	level.roundhud3.color = (0,0,0);
	level.roundhud3.glowalpha = 1;
	level.roundhud3.glowcolor = (1,0,0);
	if(level.inbossround == 1)
	    level.roundhud3 setText("Wave " + level.round + "\n \n    Samantha!");  
	else if(level.indoground == 0)
	    level.roundhud3 setText("Wave " + level.round);  
	else
	    level.roundhud3 setText("Wave " + level.round + "\n \n    Hellhounds!");  
	level.roundhud3 SetPulseFX( 80, 4000, 1000 );
    wait 5;
    level.roundhud3 destroy();	
}

//////////////////////////////// Add Score Hud ///////////////////////////////////

CreateScore()
{
    self notify("createscore");
    self endon("createscore");
    self.scoretext = self createFontString( "Objective", 1.5 );
    self.scoretext setPoint( "CENTER", "CENTER", 0, 100 );
	self.scoretext.glowalpha = 1;
	self.scoretext.color = (0,0,0);
	self.scoretext.glowcolor = (1,0,0);
	self.amount_of_points = 0;
	self.fading = [];
	self.fadingnumber = 0;
	self waittill_any("death", "disconnect");
	self.scoretext destroy();
	self.amount_of_points delete();
}
AddScore(amount)
{
    self notify("addscore");
    self endon("addscore");
	//if(!isDefined(self.oldscore))
	//    self.oldscore = 0;
	if(!isDefined(self.scoretext))
	    self thread CreateScore();
	if(!isDefined(self.amount_of_points))
	    self.amount_of_points = 0;
    self.amount_of_points = (self.amount_of_points + amount);
	waitFrame();	
    self.scoretext setValue(self.amount_of_points);
	/*if(self.oldscore != self.amount_of_points)
	{
	    self thread ScoreFading(self.amount_of_points);
		self.fadingnumber++;
		self.oldscore = self.amount_of_points;
	}*/
	wait 2;
	counter = 0;
	while(self.amount_of_points > 0)
	{
		counter++;
		self.amount_of_points -= counter;
		if(self.amount_of_points >= 0)
		    self.scoretext setValue(self.amount_of_points);
		waitFrame();
	}
	self.scoretext destroy();
    self.amount_of_points delete();
	self notify("money");
	self notify("addscore");
}
ScoreFading(amount)
{
    r = randomInt(100);
	s = randomInt(50);
    self.fading[self.fadingnumber] = self createFontString( "Objective", 1.5 );
    self.fading[self.fadingnumber] setPoint( "CENTER", "CENTER", 0, 100 );
	self.fading[self.fadingnumber] setValue(amount);
	self.fading[self.fadingnumber].glowalpha = 1;
	self.fading[self.fadingnumber].color = (0,0,0);
	self.fading[self.fadingnumber].glowcolor = (1,0,0);
	self.fading[self.fadingnumber].alpha = 0;
	self.fading[self.fadingnumber] moveovertime(.1);
	self.fading[self.fadingnumber].x = self.scoretext.x;
	self.fading[self.fadingnumber].y = self.scoretext.y;
	wait .1;
	self.fading[self.fadingnumber].alpha = 1;
	self.fading[self.fadingnumber] moveovertime(1.8);
	self.fading[self.fadingnumber].y += 200;
	self.fading[self.fadingnumber].x += (r - s); 
	self.fading[self.fadingnumber] fadeovertime(1.8);
	self.fading[self.fadingnumber].alpha = 0;
	wait 1.8;
	self.fading[self.fadingnumber] destroy();
}

////////////////////// Intro HUD ////////////////////////////////////


IntroHud()
{
    precacheShader("logo_iw");
    self waittill("spawned_player");
	icon = self createIcon("logo_iw", 80, 80);
	icon setPoint("CENTER", "CENTER", 0, -100);
	self.introhud = self createFontString( "Objective", 2 );
	self.introhud setPoint( "CENTER", "CENTER", 0, 0 ); // TOPLEFT
	self.introhud setText("Welcome " + self.name + " to ^4" + getDvar("sv_hostname"));
	self.introhud.glowalpha = .5;
	self.introhud.glowcolor = (1,0,0);
	self.introhud.color = (1,1,1);
	self thread DestroyIntroOnQuitter();
	self thread DestroyOnFastRestart();
	wait 3;
	self.introhud fadeovertime(3);
	self.introhud.alpha = 0;
	icon fadeovertime(3);
	icon.alpha = 0;
	wait 3;
	icon destroy();
	self.introhud destroy();
	self notify("NoDestroyIntroOnQuitter");
}
DestroyIntroOnQuitter()
{
    self endon("NoDestroyIntroOnQuitter");
    self waittill("disconnect");
	self.introhud destroy();
}
DestroyOnFastRestart()
{
    self endon("NoDestroyIntroOnQuitter");
    wait 7;
    if(isDefined(self.introhud))
       self.introhud destroy();
}
CinemaHud()
{
    self.cinema1 = self createFontString("objective", 1.3);
    self.cinema1 setPoint("LEFT", "LEFT", 0, 100); 
	self.cinema2 = self createFontString("objective", 1.3);
    self.cinema2 setPoint("LEFT", "LEFT", 0, 130); 
	self.cinema3 = self createFontString("objective", 1.3);
    self.cinema3 setPoint("LEFT", "LEFT", 0, 160); 	
	/*
	self.cinema1 setText("Day 7");
	self.cinema2 setText("90 percent of human population is zombiefied!");
	self.cinema3 setText("several survivors try to escape the horror...");
	*/
	self.cinema1.color = (1,1,1);
	self.cinema1.glowalpha = 1;
	self.cinema1.glowcolor = (1,0,0);
	//self.cinema1.alpha = 0;
	self.cinema2.color = (1,1,1);
	self.cinema2.glowalpha = 1;
	self.cinema2.glowcolor = (1,0,0);
	//self.cinema2.alpha = 0;
	self.cinema3.color = (1,1,1);
	self.cinema3.glowalpha = 1;
	self.cinema3.glowcolor = (1,0,0);
	//self.cinema3.alpha = 0;
	
	wait 3;
	self.cinema1 SetPulseFX( 40, 5000, 600 );
	self.cinema1 setText("Day 7");
	wait 1;
	self.cinema2 SetPulseFX( 40, 6000, 600 );
	self.cinema2 setText("90 percent of human population is zombiefied!");
	wait 2;
	self.cinema3 SetPulseFX( 40, 6000, 600 );
	self.cinema3 setText("several survivors try to escape the horror...");
	wait 4.5;
	/*
	self.cinema1 FadeOverTime( 4 );
	self.cinema2 FadeOverTime( 5 );
	self.cinema3 FadeOverTime( 6 );
	self.cinema1.alpha = 1;
	self.cinema2.alpha = 1;
	self.cinema3.alpha = 1;
	wait 8;	
	self.cinema1 FadeOverTime( 1 );
	self.cinema2 FadeOverTime( 1 );
	self.cinema3 FadeOverTime( 1 );
	self.cinema1.alpha = 0;
	self.cinema2.alpha = 0;
	self.cinema3.alpha = 0;
	
    //self.cinema1 SetPulseFX( 40, 2000, 600 );
	//self.cinema2 SetPulseFX( 40, 2000, 600 );
	//self.cinema3 SetPulseFX( 40, 2000, 600 );
	*/
}

///////////////////// Ammo Hud ////////////////////////////////////////

LowFireAmmo() // not used and bug somehow, isnt showing hud
{
    self.isthreading_lowfire = 1;
    self endon("disconnect");
	self endon("death");
	self endon("end_lowfire");
    self.lowfire = self createFontString( "Objective", 1.5 );
	self.lowfire setPoint( "CENTER", "CENTER", 0, 100 );
	self.lowfire.glowalpha = 1;
	self.lowfire.glowcolor = (1,0,0);
	self.lowfire.hideWhenInMenu = true;
	self thread FuckLowFire();
	for(;;)
	{
	    if(self getCurrentWeapon() == "flamethrower_mp")
		    self.lowfire setText("Less ammo");
		else
		    self.lowfire setText("");
		if(self.fire_ammo_total <= 0)
	        self.lowfire.alpha = 1;
		if(self.fire_ammo_total < 10)
	        self.lowfire.alpha = .7;
		if(self.fire_ammo_total > 10)
	        self.lowfire.alpha = .4;	
	    self waittill("reload");
		if(self.fire_ammo_total <= 0)
		{
		    self notify("end_lowfire");
			
		}	
	}
}
FuckLowFire()
{
    self endon("end_lowfire");
    self waittill("maxammo");
	self.lowfire destroy();
	self.isthreading_lowfire = 0;
	self notify("end_lowfire");
}
/*WeaponHud()
{
    level endon("gameover");
    self endon("disconnect");
	
	if(level.cinema == 1 && level.devmode == 0)
	    level waittill("HUD_Start");
	else
    {
	    self waittill("spawn_falldown");	
	    wait 5;
	}	

	//self.overlay = self createFontString( "Objective", 3 );
	//self.overlay setPoint( "BOTTOMRIGHT", "BOTTOMRIGHT", -30, -30 );
	//self.overlay setshader("minimap_background", 135, 70 );
	//self.overlay.color = (0,.5,0);
	//self.overlay.foreground = 1;
	
	//self.overlay2 = self createFontString( "Objective", 3 );
	//self.overlay2 setPoint( "BOTTOMRIGHT", "BOTTOMRIGHT", -40, -40 );
	//self.overlay2 setshader("white", 110, 57 );
	//self.overlay2.color = (0.2,0.2,0.2);
	
	
	self.ammohud = self createFontString( "Objective", 3 );
	self.ammohud setPoint( "BOTTOMRIGHT", "BOTTOMRIGHT", -105, -50 );
	self.ammohud2 = self createFontString( "Objective", 1.5 );
	self.ammohud2 setPoint( "BOTTOMRIGHT", "BOTTOMRIGHT", -55, -50 );
	self.ammohud3 = self createFontString( "Objective", 2 );
	self.ammohud3 setPoint( "BOTTOMRIGHT", "BOTTOMRIGHT", -55, -100 );
	self.ammohud.glowalpha = .5;
	self.ammohud2.glowalpha = .5;
	self.ammohud3.glowalpha = 1;
	self.ammohud.glowcolor = (1,0,0);
	self.ammohud2.glowcolor = (1,0,0);
	self.ammohud3.glowcolor = (1,0,0);
	self.ammohud.color = (1,1,1);
	self.ammohud2.color = (1,1,1);
	self.ammohud3.color = (1,1,1);
	self.ammohud.hideWhenInMenu = true;
	self.ammohud2.hideWhenInMenu = true;
	self.ammohud3.hideWhenInMenu = true;
	self.ammohud3 setText(maps\mp\gametypes\mapedits::GetWeaponName(self getCurrentWeapon()));
	self thread DestroyAmmoHud();
	//a = 0;
	for(;;)
	{
	    if(self getCurrentWeapon() != "flamethrower_mp" && self.team == "allies")
		{
		    mygun = self getCurrentWeapon();
		    clipCount = self GetWeaponAmmoClip(mygun);
		    stockCount = self GetWeaponAmmoStock(mygun);
		    self.ammohud setvalue(clipCount);
		    self.ammohud2 setText(" / " + stockCount);
			if(self.upraded[mygun] > 0 && isDefined(self.upraded[mygun]))
			{
			    self.ammohud3.color = (0,0,1);
				//self.ammohud3.glowcolor = (1,1,0);
			}
			else
			{
			    self.ammohud3.color = (1,1,1);
				self.ammohud3.glowcolor = (1,0,0);
			}
		    self waittill_any("spawned_player", "reload", "weapon_fired", "weapon_change", "maxammo", "antithesis"); 
			if(mygun != self getCurrentWeapon())
		        self.ammohud3 setText(maps\mp\gametypes\mapedits::GetWeaponName(self getCurrentWeapon()));  
			stockCount2 = self GetWeaponAmmoStock(self getCurrentWeapon());	
		}
		else if(self.team == "allies")
		{
		    self.ammohud setvalue(self.fire_ammo);
			self.ammohud2 setValue(self.fire_ammo_total);
			mygun = self getCurrentWeapon();
			self waittill_any("spawned_player", "reload", "weapon_fired", "weapon_change", "maxammo", "antithesis"); 
			if(mygun != self getCurrentWeapon())
			{
			    if(self.upraded[self getCurrentWeapon()] > 0)
				    self.ammohud3 setText(maps\mp\gametypes\mapedits::GetWeaponName(self getCurrentWeapon()) + " 2.0");  
				else
				    self.ammohud3 setText(maps\mp\gametypes\mapedits::GetWeaponName(self getCurrentWeapon()));  
			}
			if(self.upraded[self getCurrentWeapon()] > 0 && isDefined(self.upraded[self getCurrentWeapon()]))
			{
			    self.ammohud3.color = (0,0,1);
				self.ammohud3.glowcolor = (1,0,0);
			}
			else
			{
			    self.ammohud3.color = (1,1,1);
				self.ammohud3.glowcolor = (1,0,0);
			}	
		}
		else
		{
		    self.ammohud setValue();
			self.ammohud2 setText("");
			self.ammohud3 setText("");
		}
	}
}*/
DestroyAmmoHud()
{
    level waittill("gameover");
	self.ammohud destroy();
	self.ammohud2 destroy();
	self.ammohud3 destroy();
}
////////////////// ENDGAME ///////////////////////

Endgame_Hud(text1, text2, text3,text4, text5)
{
    color = (0,0,0);
	glowcolor = (1,0,0);
	intensity = 1;
	glowintensity = .4;
	

    self.endgametext[0] = self createFontString("hudbig", 1.5);
	self.endgametext[0] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 140); // 60
	self.endgametext[0].color = color;
	self.endgametext[0].glowalpha = glowintensity;
	self.endgametext[0].glowcolor = glowcolor;
	self.endgametext[0] setText(text1);
	self.endgametext[0].alpha = intensity;
	self playLocalSound("weap_barrett_fire_plr");
	earthquake(0.1,0.1, self.origin, 5000);
	wait 0.9;
	self.endgametext[1] = self createFontString("hudbig", 1.5);
	self.endgametext[1] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 180);
	self.endgametext[1].color = color;
	self.endgametext[1].glowalpha = glowintensity;
	self.endgametext[1].glowcolor = glowcolor;
	self.endgametext[1] setText(text2);
	self.endgametext[1].alpha = intensity;
	self playLocalSound("weap_barrett_fire_plr");
	earthquake(0.1,0.1, self.origin, 5000);
	wait 0.9;
	self.endgametext[2] = self createFontString("hudbig", 1.5); // 0.850
	self.endgametext[2] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 220);
	self.endgametext[2].color = color;
	self.endgametext[2].glowalpha = glowintensity;
	self.endgametext[2].glowcolor = glowcolor;
	self.endgametext[2] setText(text3);
	self.endgametext[2].alpha = intensity;
	self playLocalSound("weap_barrett_fire_plr");
	earthquake(0.1,0.1, self.origin, 5000);
	wait 0.9;
	self.endgametext[3] = self createFontString("hudbig", 1.5);
	self.endgametext[3] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 260);
	self.endgametext[3].color = color;
	self.endgametext[3].glowalpha = glowintensity;
	self.endgametext[3].glowcolor = glowcolor;
	self.endgametext[3] setText(text4);
	self.endgametext[3].alpha = intensity;
	self playLocalSound("weap_barrett_fire_plr");
	earthquake(0.1,1, self.origin, 5000);
	wait 0.9;
	self.endgametext[4] = self createFontString("hudbig", 1.5);
	self.endgametext[4] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 300);
	self.endgametext[4].color = color;
	self.endgametext[4].glowalpha = glowintensity;
	self.endgametext[4].glowcolor = glowcolor;
	self.endgametext[4] setText(text5);
	self.endgametext[4].alpha = intensity;
	self playLocalSound("weap_barrett_fire_plr");
	earthquake(0.1,0.1, self.origin, 5000);
	wait 3;
	self.endgametext[0] destroy();
	self.endgametext[1] destroy();
	self.endgametext[2] destroy();
	self.endgametext[3] destroy();
	self.endgametext[4] destroy();
}

////////////////// DROPS /////////////////////////

doIcon(shader, time)
{
    level notify("drop_counter");
    if(!isDefined(time))
	    time = 30;
    if(shader == "lovely_x2_icon" && level.multiplier != 2) 
	{
	    level.activedrop++;
	    level.icons[shader] = self createIcon("cardicon_gold", 30, 30);
		x = (level.activedrop * 30 - 45);
    	level.icons[shader] setPoint("CENTER", "BOTTOM", x, -50);
	}
	if(shader == "lovely_instakill" && level.instakill != 1)
	{ 
	    level.activedrop++;
	    level.icons[shader] = self createIcon("cardicon_fmj", 30, 30);
		x = (level.activedrop * 30 - 45);
	    level.icons[shader] setPoint("CENTER", "BOTTOM", x, -50);
	}
	if(shader == "lovely_firesale" && level.firesale != 1)
	{
	   level.activedrop++;
	   level.icons[shader] = self createIcon("cardicon_burgertown", 30, 30);
	   x = (level.activedrop * 30 - 45);
	   level.icons[shader] setPoint("CENTER", "BOTTOM", x, -50);
	}
	/*
	if(shader == "avenger_blood" && isDefined(self.savehouse))
	{
	   level.activedrop++;
	   level.icons[shader] = self createIcon("specialty_zomblood_zombies", 30, 30);
	   x = (level.activedrop * 30 - 45);
	   level.icons[shader] setPoint("CENTER", "BOTTOM", x, -50);
	}
	*/
	wait time;
	level.icons[shader] destroy();
}
DropInit()
{
    level.icons = [];
	level.activedrop = 0;
	for(;;)
	{
	    //level waittill("loseadrop");
		level waittill("drop_counter");
		wait 30;
		level.activedrop = 0;
		foreach(icon in level.icons)
		    icon destroy();
		if(level.multiplier == 2)	
		    self thread doIcon("cardicon_gold", level.pointstime);
		if(level.instakill == 1)	
		    self thread doIcon("cardicon_fmj",level.instatime);
		if(level.firesale == 1)	
		    self thread doIcon("cardicon_burgertown", level.saletime);	
		foreach(player in level.players)
        {
		    if(player.zombieblood == 1)
			    player thread doIcon("avenger_blood", player.zombietime);	
		}		
	}
}

/////////////////////////////// DownHud /////////////////////////////////////

DownHud()
{
    downhud = self createFontString( "Objective", 2 );
	downhud setPoint( "CENTER", "CENTER", 0, 0 );
	downhud setText("^0You are down!");
	downhud.hideWhenInMenu = true;
	downhud.alpha = 1;
	downhud.glowalpha = 1;
	downhud.glowcolor = (1,0,0);
	downhud FadeOverTime(5);
	downhud.alpha = 0;
	downhud moveovertime(.2);
	wait 5;
	downhud destroy();
}

///////////////////////////// Gumball Message /////////////////////

GumHud(text,text2,icon,activation)
{
    notifyData = spawnstruct();
	//notifyData.iconName = icon; // maaaan darky why do you have to use v2 icons so I cant use them in .gsc :|
    notifyData.titleText = text; 
    notifyData.notifyText = text2; 
	if(isDefined(activation))
    notifyData.notifyText2 = "Press ^3[{+actionslot 3}] ^7to activate"; 
    notifyData.glowColor = (0.3, 0.6, 0.3);
    notifyData.sound = "mp_level_up"; 
    notifyData.duration = 5; 
    notifyData.hideWhenInMenu = true; 
    self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
}

/////////////////////////// MyHud ////////////////////////////////////////

MyIcon()
{
    if(isDefined(self.star))
	    self.star destroy();
    self.star = newTeamHudElem( "allies" );
	self.star.alpha = 1;
	self.star.isShown = true;
	self.star setShader("ui_host", 10, 10);
	self.star setwaypoint(true, true);
	self.star thread FixPosition(self);
	pos = self GetIconPos();
	self.star SetTargetEnt(pos);
	self thread OnDownGoing();
	self waittill_any("death", "disconnect");
    foreach(player in level.players) // ??	
	self.star destroy();
}
OnDownGoing()
{
    self endon("disconnect");
	self endon("death");
	for(;;)
	{
	    self waittill("wentdown");
        self.star destroy();
        self waittill("revived");
        self thread MyIcon();		
	}
}

////////////////////////////// Bloodmoney ////////////////////////////////

Bloodmoney(x,y)
{/*
    wait 2;
    //precacheShader("cardtitle_bloodmoney");
	
    if(isDefined(self.bloodshader))
	    self.bloodshader destroy();
    //self.bloodshader = self createIcon("cardtitle_bloodmoney", 0, 30);
    //self.bloodshader setPoint("LEFT", "LEFT", x, y);
	
	
	self.bloodshader = createRectangle("cardtitle_moneyshot", "LEFT", "LEFT", 0,y+10,200,50,(1,1,1), 1,1);
	
	*/
}
createRectangle(shader, align,relative,x,y,width,height,color,sort,alpha) 
{
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
    barElemBG.sort = sort;
    barElemBG.color = color;
    barElemBG.alpha = alpha;
    barElemBG setParent( level.uiParent );
    barElemBG setShader( shader, width , height );
    barElemBG.hidden = false;
    barElemBG setPoint(align,relative,x,y);
	barElemBG.foreground = false;
	barElemBG.hideWhenInMenu = true;
    return barElemBG;
}

//////////////////////////// Napalm Zombie ///////////////////////////////

NapalmIcon(icon)
{
    if(!isDefined(icon))
	    icon = "waypoint_kill";
	level endon("gameover");
	self.napalmicon = newTeamHudElem( "allies" );
	self.napalmicon.alpha = 1;
	self.napalmicon.isShown = true;
	self.napalmicon setShader(icon, 10, 10);
	self.napalmicon setwaypoint(true, true);
	pos = self GetIconPos();
	self.napalmicon SetTargetEnt(pos);
	self thread DestroyOnGameover(pos);
	self.napalmicon thread FixPosition(self);
	if(icon == "waypoint_kill")
	    self waittill("bot_dead");
	else
        self waittill_any("death", "disconnect");	
	self thread DestroyIcon(self.napalmicon,pos);
}
GetIconPos()
{
    iconpos = spawn("script_model", self.origin+(0,0,80));
	iconpos enablelinkto();
	iconpos linkto(self);
	return iconpos;
}
FixPosition(player)
{
    player endon("bot_dead");
	level endon("gameover");
	for(;;)
	{
	    wait .5;
		self.z = player.origin+(0,0,80);
	}
}
DestroyIcon(icon,other)
{
    icon destroy();
	other delete();
}
DestroyOnGameover(pos)
{
    level waittill("gameover");
	self.napalmicon destroy();
	pos delete();
}


///////////////////////// Killstreaks /////////////////////////

StreakHud(kills, streak)
{
    notifyData = spawnstruct();
    notifyData.titleText = kills + " Killstreak"; 
    notifyData.notifyText = streak; 
    notifyData.notifyText2 = "Press ^3[{+actionslot 4}] ^7to activate"; 
    notifyData.glowColor = (0.3, 0.6, 0.3); 
    self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
}

/////////////////////// Spec Hud ////////////////////////////////

Spectatorhud()
{
    self endon("death");
	self endon("disconnect");
	self GetAlivePlayers();
    Spectatorhud = self createFontString( "Objective", 2 );
	Spectatorhud setPoint( "CENTER", "CENTER", 0, 150 );
	Spectatorhud setText("Wait until round is over!");
	Spectatorhud.hideWhenInMenu = true;
	Spectatorhud.alpha = .7;
	Spectatorhud.glowalpha = 1;
	Spectatorhud.glowcolor = (1,0,0);
	self thread FuckSpecHud(Spectatorhud);
	self thread DownloadMod();
	level waittill("ende");
	Spectatorhud destroy();
}
FuckSpecHud(hud)
{
    self waittill_any("death", "disconnect", "destroy_spechud");
	hud destroy();
}
DownloadMod()
{
    Spectatorhud = self createFontString( "Objective", 1 );
	Spectatorhud setPoint( "CENTER", "LEFT", 170, -150 );
	Spectatorhud setText("If you see Red Fx download mod on \n teamvictorygaming.net and launch it in mainmenu \n before joining server!");
	Spectatorhud.hideWhenInMenu = true;
	Spectatorhud.alpha = .7;
	Spectatorhud.glowalpha = 1;
	Spectatorhud.glowcolor = (1,0,0);
	self thread FuckSpecHud(Spectatorhud);
	level waittill("ende");
	Spectatorhud destroy();
}
GetAlivePlayers() // should do an allrounder thread
{
    alive = 0;
	foreach(player in level.players)
	{
	    if(player.team == "allies")
		    alive++;
	}
	if(alive == 0)
	{
	    foreach(survivor in level.players)
		{
		    survivor notify("destroy_spechud");
		}
	    self waittill("forever");
	}
}

////////////////////////////// Bossbar ////////////////////////////////

Bossbar()
{
    level endon("boss_died");
	self endon("disconnect");
	self endon("death");
    maxhealth = level.bosshealth/150;
    crybar = createPrimaryProgressBar( -275 );
    crybar updateBar(maxhealth/80);
    crybar.bar.color=(1,maxhealth/maxhealth,maxhealth/maxhealth);
	crybar.bar.x = 75;
    crybar.x = 135;
	text = createPrimaryProgressBarText( -275 );
    text.x=100;
	text settext("^1Samantha Health");
	self thread DeleteBar(crybar, text);
	for(;;)
	{
	    level waittill("boss_gets_damage");
		maxhealth = level.boss.crate1.health/150;
		crybar.bar.color=(1,level.boss.crate1.health/maxhealth,level.boss.crate1.health/maxhealth);
		crybar updateBar(maxhealth/80);
	}
}
DeleteBar(crybar, text)
{
    level waittill_any("boss_died", "gameover");
	text destroy();
	crybar.bar destroy();
	crybar destroy();
}

























