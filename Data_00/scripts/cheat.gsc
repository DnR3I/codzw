#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

// =========================================================
//
// Contains ingame cheats while developement
//
// =========================================================

// very simple chat reading commands

Init()
{
	level.mycmds = [];
	cmd("test",::test);	
	cmd("giveweapon",::givegun);
	cmd("givecash", ::givecash);
	cmd("givewonder", ::givewonder);
	cmd("round", ::setRound);
	cmd("fog", ::fog);
	cmd("map", ::mapp);
	cmd("god", ::iamgod);
	level thread loadCmds();
}
loadCmds()
{
	wait 3;
	if(getDvarInt("devmode") == 0)
		return;
	while(1)
	{
		level waittill("say", string, player);
		player thread onSay(string);
	}	
}
cmd(name, func)
{
    aliases = strtok(name, "-");
    foreach(alias in aliases)
	{
        if(!isDefined(level.mycmds["command"][alias]))
		{
            level.mycmds["command"][alias]["func"] = func;
            level.mycmds["command"][alias]["name"] = upperOne(aliases[aliases.size-1]);
        }   
    } 
}
upperOne(string)
{
	lower = "abcdefghijklmnopqrstuvwxyz";
	upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	for(i=0;i<lower.length;i++)
	{
		if(string[0] == lower[i])
		{
			string[0] = upper[i];
			return string;
		}
	}
}
onSay(string)
{
	if(getDvar("devmode") == 1 && string[0] == "!")
	{
		str = strtok(string, " ");
		cmd = toLower(getSubStr(string, 1, str[0].size));
		arg = getSubStr(string, str[0].size + 1, string.size);
		self thread [[level.mycmds["command"][cmd]["func"]]](arg);
	}	
}

// ------------- Commands ----------------

test(arg)
{
	if(!isDefined(arg))
		self iPrintlnBold("test");
	else
		self iPrintlnBold(arg);
}
givegun(arg)
{
	self giveWeapon(arg);
	self giveMaxAmmo(arg);
	self switchToWeapon(arg);
}
givecash(arg)
{
	cash = int(arg);
	self.score += cash;
}
givewonder(arg)
{
	switch(arg)
	{
		case "apo":
			weapon = level.apothiconservant;
			break;
		case "apou":
			weapon = level.apothiconservant_upgrade;
			break;
		case "raygun":
			weapon = level.raygunm2;
			break;	
		case "thunder":
			weapon = level.thundergun;
			break;	
		case "thunderu":
			weapon = level.thundergun_upgrade;
			break;	
		case "skull":
			weapon = level.skull;
			break;	
		case "staff":
			weapon = level.firestaff;
			break;	
		case "flame":
			weapon = level.flamethrower;
			break;
		case "ppsh":
			weapon = level.ppsh;
			break;
		case "para":
			weapon = level.paralyzer;
			break;
		case "annihilator":
			weapon = level.annihilator;
			break;
		case "mp40":
			weapon = level.mp40;
			break;		
		case "minigun":
			weapon = level.minigun;
			break;
		case "sliquifier":
			weapon = level.sliquifier;
			break;
		case "dg2":
			weapon = level.dg2;
			break;
		case "wavegun":
			weapon = level.wavegun;
			break;	
		case "blunder":
			weapon = level.blundergat;
			break;		
		case "blunderu":
			weapon = level.blundergat_upgrade;
			break;	
		case "blunderu2":
			weapon = level.blundergat_upgrade2;
			break;		
		case "bow":
			weapon = level.bow;
			break;		
		case "mors":
			weapon = level.mors;
			break;	
		case "sword":
			weapon = level.sword;
			break;		
		case "thompson":
			weapon = level.thompson;
			break;	
		default:
			weapon = getDvar("startweapon");
			break;
	}
	self giveWeapon(weapon);
	self giveMaxAmmo(weapon);
	self switchToWeapon(weapon);
	if(arg == "flame" || arg == "skull" || arg == "annihilator")
	{
		self.specialistcounter = 80;
		self thread maps\zm\gametypes\weapons::SpecialistAmmo(weapon,self getCurrentWeapon());
	}		
}
setRound(arg)
{
	level.round = int(arg);
	iPrintlnBold("Next Round will be " + arg);
}
fog()
{
	thread maps\zm\gametypes\mapedit::CreatePeriodCloudBank(0);
	
}
blackscreen()
{
	self visionsetnakedforplayer("blacktest", 2);
}
noBlackscreen()
{
	self visionsetnakedforplayer("icbm", 2);
}
mapp(arg)
{
	map(arg,false);
}
blacktext(text)
{
	blackscreen();
	hud = self createFontString("objective", 3);
	hud setPoint("CENTER","CENTER",0,0);
	hud setText(text);
	hud SetPulseFX(120, 4000, 400 );
	wait 3;
	noBlackscreen();
	hud delete();
}
iamgod()
{
	if(!isDefined(self.god))
		self.god = false;
	if(self.god == false)
	{
		self.god = true;
		self.getOldhealth = self.maxhealth;
		self.maxhealth = 99999;
		self.health = 99999;
	}
	else
	{
		self.god = false;
		self.maxhealth = self.getOldhealth;
		self.health = self.maxhealth;
	}
}