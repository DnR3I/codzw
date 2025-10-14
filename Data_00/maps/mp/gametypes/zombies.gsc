#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

main()
{
	if(getDvar("g_gametype") != "zombies")
	{
		setDvar("g_gametype", "zombies");
		setDvar("ui_gametype", "zombies");
		setDvar("party_gametype ", "Zombies");
		map(getDvar("mapname"));
	}
	if(getdvar("mapname") == "mp_background")
		return;

	maps\mp\gametypes\_globallogic::init();
	maps\mp\gametypes\_callbacksetup::SetupCallbacks();
	maps\mp\gametypes\_globallogic::SetupCallbacks();

	registerRoundSwitchDvar( level.gameType, 0, 0, 9 );
	registerTimeLimitDvar( level.gameType, 10, 0, 1440 );
	registerScoreLimitDvar( level.gameType, 500, 0, 5000 );
	registerRoundLimitDvar( level.gameType, 1, 0, 10 );
	registerWinLimitDvar( level.gameType, 1, 0, 10 );
	registerRoundSwitchDvar( level.gameType, 3, 0, 30 );
	registerNumLivesDvar( level.gameType, 0, 0, 10 );
	registerHalfTimeDvar( level.gameType, 0, 0, 1 );

	level.teamBased = true;
	level.onStartGameType = ::onStartGameType;
	level.getSpawnPoint = ::getSpawnPoint;
	level.onNormalDeath = ::onNormalDeath;

	game["dialog"]["gametype"] = "zombies";

	if ( getDvarInt( "" ) )
		game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
	else if ( getDvarInt( "camera_thirdPerson" ) )
		game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
	else if ( getDvarInt( "scr_diehard" ) )
		game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
	else if (getDvarInt( "scr_" + level.gameType + "_promode" ) )
		game["dialog"]["gametype"] = game["dialog"]["gametype"] + "_pro";

	game["strings"]["overtime_hint"] = &"MP_FIRST_BLOOD";
}


onStartGameType()
{
	setClientNameMode("auto_change");

	if ( !isdefined( game["switchedsides"] ) )
		game["switchedsides"] = false;

	if ( game["switchedsides"] )
	{
		oldAttackers = game["attackers"];
		oldDefenders = game["defenders"];
		game["attackers"] = oldDefenders;
		game["defenders"] = oldAttackers;
	}

	setObjectiveText("allies", "To survive Nazi Zombies, you must play both offensively and defensively. Remember to look behind you !");
	setObjectiveText("axis", "To survive Nazi Zombies, you must play both offensively and defensively. Remember to look behind you !");

	if ( level.splitscreen )
	{
		setObjectiveScoreText( "allies", "^2Humans" );
		setObjectiveScoreText( "axis", "^1Zombies" );
	}
	else
	{
		setObjectiveScoreText( "allies", "^2Humans" );
		setObjectiveScoreText( "axis", "^1Zombies" );
	}
	setObjectiveHintText( "allies", "Stay Alive For As Long As Possible." );
	setObjectiveHintText( "axis", "Infect All Humans With The Zombei Virus." );

	level.spawnMins = ( 0, 0, 0 );
	level.spawnMaxs = ( 0, 0, 0 );
	maps\mp\gametypes\_spawnlogic::placeSpawnPoints( "mp_tdm_spawn_allies_start" );	// Create new spawns...?
	maps\mp\gametypes\_spawnlogic::placeSpawnPoints( "mp_tdm_spawn_axis_start" );
	maps\mp\gametypes\_spawnlogic::addSpawnPoints( "allies", "mp_tdm_spawn" );
	maps\mp\gametypes\_spawnlogic::addSpawnPoints( "axis", "mp_tdm_spawn" );

	level.mapCenter = maps\mp\gametypes\_spawnlogic::findBoxCenter( level.spawnMins, level.spawnMaxs );
	setMapCenter( level.mapCenter );

	allowed[0] = level.gameType;
	allowed[1] = "airdrop_pallet";

	maps\mp\gametypes\_gameobjects::main(allowed);
	
	level thread maps\zm\gametypes\loading::Init();
}


getSpawnPoint()
{
	spawnteam = self.pers["team"];
	if ( game["switchedsides"] )
		spawnteam = getOtherTeam( spawnteam );

	if ( level.inGracePeriod )
	{
		spawnPoints = maps\mp\gametypes\_spawnlogic::getSpawnpointArray( "mp_tdm_spawn_" + spawnteam + "_start" );
		spawnPoint = maps\mp\gametypes\_spawnlogic::getSpawnpoint_Random( spawnPoints );
	}
	else
	{
		spawnPoints = maps\mp\gametypes\_spawnlogic::getTeamSpawnPoints( spawnteam );
		spawnPoint = maps\mp\gametypes\_spawnlogic::getSpawnpoint_NearTeam( spawnPoints );
	}

	return spawnPoint;
}


onNormalDeath( victim, attacker, lifeId )
{
	score = maps\mp\gametypes\_rank::getScoreInfoValue( "kill" );
	assert( isDefined( score ) );

	//attacker maps\mp\gametypes\_gamescore::giveTeamScoreForObjective( attacker.pers["team"], score );

	if ( game["state"] == "postgame" && game["teamScores"][attacker.team] > game["teamScores"][level.otherTeam[attacker.team]] || isDefined(victim.isLast) && victim.isLast )
		attacker.finalKill = true;
}


onTimeLimit()
{
	if ( game["status"] == "overtime" )
	{
		winner = "forfeit";
	}
	else if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
	{
		winner = "overtime";
	}
	else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
	{
		winner = "axis";
	}
	else
	{
		winner = "allies";
	}

	thread maps\mp\gametypes\_gamelogic::endGame( winner, game["strings"]["time_limit_reached"] );
}
