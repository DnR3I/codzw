#include common_scripts\utility;

main()
{
	maps\mp\mp_dome_fx::main();
	maps\createfx\mp_dome_fx::main();
	maps\createart\mp_dome_art::main();
	maps\mp\_load::main();

	game[ "attackers" ] = "allies";
	game[ "defenders" ] = "axis";

	ambientPlay ( "ambient_mp_rural" );

	setdvar( "compassmaxrange", "2100" );
	maps\mp\_compass::setupMiniMap( "compass_map_mp_dome" );
}
