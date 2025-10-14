main()
{
	//ambient fx
	level._effect[ "sand_storm_light" ]						= loadfx( "weather/sand_storm_mp_rust" );
	level._effect[ "sand_spray_detail_runner0x400" ]	 	= loadfx( "dust/sand_spray_detail_oriented_runner" );
	level._effect[ "sand_spray_detail_runner400x400" ]	 	= loadfx( "dust/sand_spray_cliff_oriented_runner" );
	level._effect[ "sand_spray_detail_oriented_runner" ]	= loadfx( "dust/sand_spray_detail_oriented_runner" );
	level._effect[ "sand_spray_cliff_oriented_runner" ] 	= loadfx( "dust/sand_spray_cliff_oriented_runner" );
	level._effect[ "ash" ] 									= loadfx( "weather/ash" );
	level._effect[ "toxic" ] 								= loadfx( "fire/toxic" );
	level._effect[ "lightning_yellow" ] 					= loadfx( "weather/lightning_yellow" );

	level._effect[ "hunted_spotlight_model_dim" ]			= loadfx( "misc/hunted_spotlight_model_dim" );

/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_rust_fx::main();
#/

}