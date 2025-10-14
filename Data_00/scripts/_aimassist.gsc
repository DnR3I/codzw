init()
{
	aimAssistAllowed = getDvarInt("sv_allowAimAssist");

	if (aimAssistAllowed <= 0) level thread disableAimAssistForConnectedPlayers();
}

disableAimAssistForConnectedPlayers()
{
	for(;;)
	{
		level waittill("connected", player);

		player setClientDVar("aim_lockon_enabled", 0);
		player setClientDvar("aim_slowdown_enabled", 0);
	}
}