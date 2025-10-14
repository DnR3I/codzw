#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#using_animtree( "multiplayer" );

// =========================================================
//
// Loads everything before the game starts
//
// =========================================================

Init()
{
    level.script = GetDvar("mapname");

    //          MODELS          \\

    PrecacheShellShock("ac130");

    PrecacheItem("gl_mp");

    // Characters
    precacheModel("zw2_richtofen_pm");
    precacheModel("zw2_dempsay_pm");
	precacheModel("zw2_takeo_pm");
	precacheModel("zw2_nikolai_pm");

    // Viewhands
    precacheModel("zw2_richtofen_vh");
	precacheModel("zw2_dempsay_vh");
	precacheModel("zw2_takeo_vh");
	precacheModel("zw2_nikolai_vh");

    // Enemies
    precacheModel("georg");
	precacheModel("zw2_alduin");
	precacheModel("infantrya_body");
	precacheModel("bo2_mech");
	precacheModel("zw2_zombie01");
    precacheModel("zw2_zombie02");
	precacheModel("nazi_body");
	precacheModel("zw2_head01");
	precacheModel("zw2_head02");
	precacheModel("zw2_head03");
	precacheModel("zw2_head04");
	precacheModel("zw2_head03_alt");
	precacheModel("zw2_wolf");
	precacheModel("zw2_brutus");
	precacheModel("zombie_body_3");
	precacheModel("zombie_head_3");
	precacheModel("nazi_head");
	precacheModel("ww2_zm_head_01");
	precacheModel("ww2_zm_head_02");
	precacheModel("bo3_insanity");

    // Entities
    precacheModel("fsm_box");
	precacheModel("zw2_pap_machine");
	precacheModel("zw2_jugg_machine");
	precacheModel("zw2_doubletap_machine");
	precacheModel("bo2_doubletap");
	precacheModel("zw2_speedcola_machine");
	precacheModel("zw2_marathon_machine");
	precacheModel("zw2_quickrevive_machine");
	precacheModel("bo3_bubblegum");
	precacheModel("zw2_powerup_fire_sale");
	precacheModel("zw2_powerup_free_perk");
	precacheModel("zw2_powerup_insta_kill");
	precacheModel("zw2_powerup_max_ammo");
	precacheModel("zw2_powerup_nuke");
	precacheModel("zw2_powerup_minigun");
	precacheModel("zw2_powerup_x2");

	if(getDvar("mapname") == "mp_bsf_dead_night") precacheModel("com_plasticcase_beige_big");

    //          ANIMATIONS          \\

    // Zombies
    precacheMpAnim("zw2_zombie_attack01");
	precacheMpAnim("zw2_zombie_ground_climb");
    precacheMpAnim("zw2_zombie_idle");
	precacheMpAnim("zw2_zombie_run");
	precacheMpAnim("zw2_zombie_sprint");
	precacheMpAnim("zw2_zombie_sprint_alt");
	precacheMpAnim("zw2_zombie_walk");
	precacheMpAnim("tesla_death");
	precacheMpAnim("ww2_zm_walk");
	precacheMpAnim("ww2_zm_attack");
	precacheMpAnim("ww2_zm_death");
	precacheMpAnim("ww2_zm_ground_1");
	precacheMpAnim("ww2_zm_sprint");
	precacheMpAnim("ww2_zm_idle_loop");
	precacheMpAnim("bo3_insanity_idle");

    // Dogs
    precacheMpAnim("zw2_wolf_idle");
	precacheMpAnim("zw2_wolf_death");
	precacheMpAnim("zw2_wolf_run_attack");
	precacheMpAnim("zw2_wolf_run_loop");

    // Mystery Box
    precacheMpAnim("fsm_open_box");
	precacheMpAnim("fsm_close_box");

    // Pack a Punch
    precacheMpAnim("zw2_pap_anim");

    // Dragon
    precacheMpAnim("zw2_alduin_hover");
	precacheMpAnim("zw2_alduin_fly_forward");
	
	// Robotzombie
	precacheMpAnim("bo2_mech_walk");
	precacheMpAnim("bo2_mech_run");
	precacheMpAnim("bo2_mech_arrive");
	precacheMpAnim("bo2_mech_death");
	precacheMpAnim("bo2_mech_melee");
	
	// Brutus
	precacheMpAnim("zw2_brutus_enrage");
	precacheMpAnim("zw2_brutus_idle");
	precacheMpAnim("zw2_brutus_run");
	precacheMpAnim("zw2_brutus_spawn");
	precacheMpAnim("zw2_brutus_sprint");
	//precacheMpAnim("zw2_brutus_swingleft");
	precacheMpAnim("zw2_brutus_swingright");
	precacheMpAnim("zw2_brutus_walk");
	
	// Georg
	
	precacheMpAnim("fsm_georg_idle");
	precacheMpAnim("fsm_georg_death");
	precacheMpAnim("fsm_georg_run_attack");
	precacheMpAnim("fsm_georg_stand_attack");
	precacheMpAnim("fsm_georg_walk");
	
	////////// Images ////////
	
	precacheShader("line_horizontal");
	precacheShader("line_horizontal");
	precacheShader("combathigh_overlay");
	precacheShader("specialty_pistoldeath");
	precacheShader("cardicon_abduction");
	//precacheShader("minimap_background");
	precacheShader("hud_weaponbar");
	precacheShader("cardicon_launcher");
	precacheShader("cardicon_bear");
	precacheShader("cardicon_gold");
	precacheShader("cardicon_fmj");
	precacheShader("cardicon_juggernaut_2");
	precacheShader("cardicon_doubletap");
	precacheShader("specialty_lightweight_upgrade");
	precacheShader("specialty_fastreload_upgrade");
	precacheShader("specialty_pistoldeath_upgrade");
	precacheShader("cardicon_weed");
	precacheShader("cardicon_xray");	
	precacheShader("cardicon_warpig");
	precacheShader("cardicon_abrams");
	precacheShader("cardicon_ac130_angelflare");
	precacheShader("cardicon_aircraft_01");
	//precacheShader("cardicon_animal");
	precacheShader("cardicon_assad");
	precacheShader("cardicon_award_jets");
	precacheShader("cardicon_b2");
	precacheShader("cardicon_ball_baseball_1");
	precacheShader("cardicon_ball_volleyball_1");
	precacheShader("cardicon_binoculars_1");
	precacheShader("cardicon_biohazard");
	precacheShader("cardicon_birdbrain");
	//precacheShader("cardicon_blast_shield");
	precacheShader("cardicon_boot");
	precacheShader("cardicon_circuit");
	precacheShader("cardicon_headshot");
	precacheShader("weapon_fraggrenade");
	precacheShader("cardicon_brit_beret");
	preCacheShader("cardicon_nightvision_1");
	preCacheShader("cardicon_nightvision_2");
	preCacheShader("cardicon_gasmask");
	preCacheShader("cardicon_sniperscope");
	

	////////// Fx ////////////

	level.cloudbank = loadFx("wza/cloudbank");
	level.jesus = loadFX("wza/jesus");
	level.fire_soulburn = loadFX("wza/fire_soulburn");
	level.energybulb = loadFX("wza/energybulb");
	level.energybulb_negative = loadFX("wza/energybulb_negative");
	level.vendingsmoke = loadFX("wza/vendingmachine_smoke");
	level.signalsmoke = loadFX("wza/signalsmoke_red_green");
	level.blackhole = loadFX("wza/blackhole");
	level.blackhole_red = loadFX("wza/blackhole_red");
	level.redsmoke = loadFX("wza/redsmoke");
	//level.nukefx = loadFX("wza/nuke"); 							// crashes game on playing 
	level.dragonfire_onground = loadFX("wza/dragonfire_onground");
	level.paralzyer_fade = loadFX("wza/paralyzer_fade");
	level.paralyzer_blast = loadFx("wza/paralyzer_blast");
	level.raygun_splash_green = loadFX("wza/raygun_splash_green");
	level.raygun_splash_red = loadFX("wza/raygun_splash_red");
	level.thundergun_smoke = loadFX("wza/thundergun_smoke");
	level.rain_heavy = loadFx("wza/wza_rain_heavy");
	level.meteor_shower = loadfx("wza/wza_meteor_shower");
	level.fire_large = loadFX("wza/wza_fire_lrg");
	level.fire_med = loadFX("wza/wza_fire_med");
	level.fire_flamethrower = loadFX("wza/wza_flamethrower");
	level.magic_box = loadFX("wza/wza_magic_box");
	level._effect[ "FOW" ] = loadfx( "dust/nuke_aftermath_mp" );
	level.zombiedirt = loadfx("explosions/grenadeExp_dirt_1");	
	level.bloodfx = loadfx("impacts/flesh_hit_body_fatal_exit");
	level.greenfx = loadFX( "misc/aircraft_light_wingtip_green" );
	level.greenfx2 = loadFX( "misc/flare_ambient_green" );
	level.redfx = loadFX( "misc/aircraft_light_wingtip_red" );
	level.redfx2 = loadFX( "misc/flare_ambient" );
	level.circle_red = loadfx( maps\mp\gametypes\_teams::getTeamFlagFX( "axis" ) ); 
	level.circle_grey = loadfx( maps\mp\gametypes\_teams::getTeamFlagFX( "allies" ) );
	level.smokefx = loadfx("smoke/smoke_grenade_11sec_mp");
	level.fx_heli_dust = loadfx ("treadfx/heli_dust_default");
	level.dragonfire = loadfx ("explosions/helicopter_explosion_secondary_small");
	level.marker = loadfx("smoke/signal_smoke_airdrop");
	//level.firelava = loadFX("wza/lavafire");
	//level.firewall = loadFX("wza/firewall");
	level.bloodfountain = loadFX("wza/bloodfountain");
	level.bloodlake = loadFX("wza/bloodlake");
	level.firemud = loadFX("wza/firemud");
	level.area_explosion = loadFX("wza/area_explosion");
	//level.suicidebomber = level.dragonfire;
	level.suicidebomber = level.area_explosion;
	level.magicstream = loadFx("wza/magicstream");
	level.portal = loadFX("wza/portal");
	level.zombie_eye = loadFx("wza/zombie_eye");
	level.liquid_bullet = loadFX("wza/liquid_bullet");
	level.liquid_lake = loadFX("wza/liquid_lake");
	level.ww = loadFX("wunderwaffe/wunderwaffe_muzzle");
	level.storm = loadFX("wza/storm");
	level.electricfire = loadFx("wza/electricfire");
	level.poisonbulb = loadFx("wza/poisonbulb");
	//level.playerlight = loadFx("wza/light");
	
	///////// Weapons //////////
	
	level.paralyzer = "ak47_fmj_mp";
	level.apothiconservant = "ump45_fmj_rof_mp";
	level.apothiconservant_upgrade = "ump45_fmj_xmags_mp";
	level.raygunm2 = "beretta393_mp";
	level.raygunm2_upgrade = "beretta393_reflex_mp";
	level.thundergun = "rpg_mp";
	level.thundergun_upgrade = "m79_mp";
	level.flamethrower = "aa12_eotech_mp";
	level.skull = "usp_fmj_tactical_mp";
	level.perkbottle = "javelin_mp";
	level.gumball = "stinger_mp";
	level.annihilator = "beretta_tactical_mp";
	level.ppsh = "p90_eotech_fmj_mp";
	level.firestaff = "at4_mp";
	level.mp40 = "ump45_silencer_mp";
	level.mg08 = "sa80_fmj_heartbeat_mp";
	level.minigun = "m240_fmj_thermal_mp";
	level.dg2 = "m16_fmj_gl_mp";
	level.sliquifier = "ak47_thermal_xmags_mp";
	level.wavegun = "m4_eotech_fmj_mp";
	level.blundergat = "spas12_grip_reflex_mp";
	level.blundergat_upgrade = "spas12_grip_silencer_mp";
	level.blundergat_upgrade2 = "spas12_grip_xmags_mp";
	level.mors = "m21_acog_fmj_mp";
	level.bow = "wa2000_thermal_xmags_mp";
	level.sword = "mp5k_rof_silencer_mp";
	level.thompson = "ak47_acog_fmj_mp";
	
	////////// Settings //////////
	
	setDvarIfUnInitialized("movie", 0); // deprecated
	setDvarIfUnInitialized("start_weapon", "m1911_mp"); 
	setDvarIfUnInitialized("start_money", 500);
	setDvarIfUnInitialized("intermission_time", 10);
	setDvarIfUnInitialized("round", 1);
	setDvar("devmode", 1);
	setDvar("sv_cheats", 1);
	setDvarIfUnInitialized("hitmarker", 0);
	setDvarIfUnInitialized("challenges",1);
	setDvarIfUnInitialized("maxdrops", 1);
	setDvarIfUnInitialized("revivetime", 10);	
	setDvarIfUnInitialized("bossround", 99);
	setDvarIfUnInitialized("multiplier", 1);
	setDvarIfUnInitialized("firesale_time", 30);
	setDvarIfUnInitialized("instakill_time", 30);
	setDvarIfUnInitialized("multiplier_time", 30);
	setDvarIfUnInitialized("drop_timeout",32); // devrait être divisible par 2 et 4 et toujours être un entier
	setDvarIfUnInitialized("bloodscreen", 1);
	setDvarIfUnInitialized("box_active_time", 4);
	setDvarIfUnInitialized("bleedout_time", 40);
	setDvarIfUnInitialized("selfmediation_time", 10);
	setDvarIfUnInitialized("max_ability_power", 60);
	setDvarIfUnInitialized("foggy", 0);
	
	setDvarIfUnInitialized("allow_heli",1);
	setDvarIfUnInitialized("allow_spectator", 0);
	setDvarIfUnInitialized("allow_fpsboost", 1);
	setDvarIfUnInitialized("allow_fovchange", 1);
	setDvarIfUnInitialized("allow_maxdistance", 1000);
	setDvarIfUnInitialized("allow_camp", 0);
	setDvarIfUnInitialized("allow_maxcamptime", 40);
	
	setDvarIfUnInitialized("cost_box", 950);
	setDvarIfUnInitialized("cost_gumball", 1000);
	setDvarIfUnInitialized("cost_power", 3000); // not used
	setDvarIfUnInitialized("cost_gum_1",500);
	setDvarIfUnInitialized("cost_gum_2",1000);
	setDvarIfUnInitialized("cost_gum_3",1500);
	setDvarIfUnInitialized("cost_gum_4",2000);
	setDvarIfUnInitialized("cost_trap", 10);
	setDvarIfUnInitialized("cost_teleporter", 1000); // not used
	setDvarIfUnInitialized("cost_perk_gobblegum", 500);
	setDvarIfUnInitialized("cost_perk_solo",500);
	setDvarIfUnInitialized("cost_perk_quickrevive",1500);
	setDvarIfUnInitialized("cost_perk_juggernog",2500);
	setDvarIfUnInitialized("cost_perk_speedcola",3000);
	setDvarIfUnInitialized("cost_perk_doubletap",2000);
	setDvarIfUnInitialized("cost_perk_staminup",2000);
	setDvarIfUnInitialized("cost_perk_pap",5000);
	setDvarIfUnInitialized("cost_javelin_mp",500);
	setDvarIfUnInitialized("cost_kar98k_tactical_mp",200);
	setDvarIfUnInitialized("cost_m21_fmj_zm",500);
	setDvarIfUnInitialized("cost_p38_mp",750);
	setDvarIfUnInitialized("cost_mp40", 1300);
	setDvarIfUnInitialized("cost_stg44_mp", 1400);
	setDvarIfUnInitialized("cost_" + level.dg2, 5000);
	setDvarIfUnInitialized("cost_" + level.thundergun, 5000);
	
	setDvarIfUnInitialized("zombie_amount", 4);
	setDvarIfUnInitialized("zombie_damage", 34);
	setDvarIfUnInitialized("zombie_burn_damage", 20);
	setDvarIfUnInitialized("zombie_health", 150);
	setDvarIfUnInitialized("zombie_health_add", 50);
	setDvarIfUnInitialized("zombie_speed_walk", .6); // unused??
	setDvarIfUnInitialized("zombie_speed_sprint", 2);
	setDvarIfUnInitialized("zombie_dog_health", 400);
	setDvarIfUnInitialized("zombie_brutus_health", 5000);
	setDvarIfUnInitialized("dragon_health", 15000);
	setDvarIfUnInitialized("dragon_health_brecourt", 5000);
	setDvarIfUnInitialized("zombie_mech_health", 4000);	
	setDvarIfUnInitialized("zombie_george_health",9999);
	setDvar("scr_" + getDvar("g_gametype") + "_timelimit", 0);
	setDvar("scr_" + getDvar("g_gametype") + "_scorelimit", 0);
	setDvar("scr_teambalance",0);
	setDvar("ui_allow_teamchange", 0);
	setDvar("ui_allow_classchange", 0);
	setDvar("scr_game_hardpoints",0); 
	setDvar("scr_forcelaststand",1);
	setDvar("sv_zombietime", 30);
	setDvar("g_hardcore", 0);
	setDvar("sv_customTextColor", (178/255,0,0));
	setDvar("hud_enable", 1);
	
	thread Weaponlist();
	thread Gumballist();
	thread ZombieBodies();
	thread ZombieHeads();
	thread Challenges();
	thread setNight();
	thread maps\zm\gametypes\paused_menu::Init();
	thread maps\zm\gametypes\hotfix_player_health_regen::Init();
	thread maps\zm\gametypes\movement::Init(); // not used yet
	thread maps\zm\gametypes\mapedit::Init();
	thread maps\zm\gametypes\zw::Init();
	
}
setNight()
{
	level.HUDCOLOR = (1,1,1);
	switch(level.script)
	{					
		case "mp_bo2_town":
			setDvar("night", 0);	
			break;
		case "mp_dome":
			setDvar("night", 0);	
			break;	
		case "mp_bsf_dead_night":
			setDvar("night", 1);
			break;
		case "mp_seatown_snow":
			setDvar("night", 0);
			break;	
		case "zm_factory_sh":
			setDvar("night", 0);
			break;	
		case "mp_asylum":
			setDvar("night", 0);
			break;	
		case "mp_waw_castle":
			setDvar("night", 0);
			break;	
		default:
			setDvar("night", 1);
			break;
	}
	if(getDvarInt("night") == 1)
	{
		level.HUDCOLOR = (1,1,1);
		while(true)
		{
			level waittill("connected", player);
			player thread resetNight();
		}
	}
}
resetNight()
{
	self endon("disconnect");
	while(true)
	{
		wait 1;
		if(self.team == "spectator" || self.health == self.maxhealth)
		{
			//self visionsetnakedforplayer("icbm", 2);
			self visionsetnakedforplayer("cobra_sunset3", 2);
			wait 5;
		}
	}
}
Weaponlist()
{
	level.startpistol = getDvar("start_weapon");
	precacheItem(level.startpistol);
	precacheItem("deserteagle_akimbo_mp");
	precacheItem(level.minigun);
	precacheItem(level.raygunm2_upgrade);
	precacheItem(level.blundergat_upgrade);
	precacheItem("frag_grenade_mp");
	precacheItem("javelin_mp");
	precacheItem("stinger_mp");
	precacheItem("ump45_fmj_xmags_mp");
	precacheItem("m79_mp");
	
    level.gun = [];
	level.weaponlist = 0;

	AddWeapon("m1911_mp");
	AddWeapon("m21_fmj_zm");
	AddWeapon("kar98k_tactical_mp");
	AddWeapon("ak47_mp");
	AddWeapon("aa12_mp");
	AddWeapon("aug_mp");
	AddWeapon("beretta_mp");
	AddWeapon("beretta393_xmags_mp");
	AddWeapon("cheytac_mp");
	AddWeapon("coltanaconda_mp");
	AddWeapon("deserteagle_mp");
	AddWeapon("famas_mp");
	AddWeapon("fn2000_mp");
	AddWeapon("kriss_mp");
	AddWeapon("glock_mp");
	AddWeapon("masada_mp");
	AddWeapon("m4_mp");
	AddWeapon("m14_mp");
	AddWeapon("m16_mp");
	AddWeapon("mp40_mp");
	AddWeapon(level.thundergun);
	AddWeapon(level.blundergat);
	AddWeapon(level.dg2);
	AddWeapon("m240_mp");
	AddWeapon("mg4_mp");
	AddWeapon("m1014_mp");
	AddWeapon("model1887_mp");
	AddWeapon("mp5k_mp");
	AddWeapon("p38_mp");
	AddWeapon("p90_mp");
	AddWeapon("pp2000_mp");
	AddWeapon("riotshield_mp");
	AddWeapon("rpd_mp");
	AddWeapon("sa80_mp");
	AddWeapon("scar_mp");
	AddWeapon("spas12_mp");
	AddWeapon("striker_mp");
	AddWeapon("stg44_mp");
	AddWeapon("tavor_mp");
	AddWeapon("ump45_mp");
	AddWeapon("uzi_mp");
	AddWeapon("usp_mp");
	AddWeapon("wa2000_fmj_xmags_mp");
}
AddWeapon(weapon)
{
    level.gun[weapon] = weapon;
	level.weaponlist++;
	precacheItem(weapon);
}
Gumballist()
{
	level.gobblegum = [];
	level.gumballlist = 0;
	AddGumball("Percaholic"); // orange
	AddGumball("3x Firesale");  // lila
	AddGumball("2x Nuke"); // lila
	AddGumball("2x DoublePoints"); // lila
	AddGumball("2x Max Ammo"); // lila 
	AddGumball("Stun normal Zombies for 20s"); // lila
	AddGumball("Droprain"); // lila
	AddGumball("End Round + 1600 Cash"); // lila
	AddGumball("Punch your current Gun"); //lila
	AddGumball("Slow Down all Zombies"); //green
	AddGumball("2x Firewave on taking damage"); // orange
	AddGumball("2x Random Powerup"); //lila
	AddGumball("Invisible for zombies");  // lila
	AddGumball("2x Teleport to a random location"); // lila
}
AddGumball(gumball)
{
    level.gobblegum[level.gumballlist] = gumball;
	level.gumballlist++;
}
ZombieBodies()
{
    level.zombiebody = [];
	level.zombiebody[0] = "infantrya_body";
	level.zombiebody[1] = "zw2_zombie01";
	level.zombiebody[2] = "zw2_zombie02";
	level.zombiebody[3] = "zombie_body_3";
	level.zombiebody[4] = "nazi_body";
}
ZombieHeads()
{
    level.zombiehead = [];
	level.zombiehead[0] = "zw2_head01";
	level.zombiehead[1] = "zw2_head02";
	level.zombiehead[2] = "zw2_head03";
	level.zombiehead[3] = "zw2_head03_alt";
	level.zombiehead[4] = "zw2_head04";
	level.zombiehead[5] = "ww2_zm_head_01";
	level.zombiehead[6] = "ww2_zm_head_02";
	//level.zombiehead[7] = "zombie_head_3"; // can be obtained otherwise
}
Challenges()
{
	level.challenge = [];
	level.challengelist = 0;
	AddChallenge("Kill Zombies");
	AddChallenge("Kill Zombies with Melee");
	AddChallenge("Do Damage");
	AddChallenge("Protect The Area");
	AddChallenge("Survive Rounds");
	AddChallenge("Upgrade your Weapon");
}
AddChallenge(challenge)
{
	level.challenge[level.challengelist] = challenge;
	level.challengelist++;
}




















