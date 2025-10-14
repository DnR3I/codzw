#include maps\mp\_utility;

main()
{

	maps\mp\mp_afghan_precache::main();
	maps\createart\mp_afghan_art::main();
	maps\mp\mp_afghan_fx::main();

	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap( "compass_map_mp_afghan" );

	setdvar( "compassmaxrange", "1400" );

	ambientPlay( "ambient_mp_rural" );

	game[ "attackers" ] = "allies";
	game[ "defenders" ] = "axis";
}

