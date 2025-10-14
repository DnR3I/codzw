#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\gametypes\zombies;

// ================================
// Pause système – Hotkey USE+MELEE
// ================================
Init()
{
    if (!isDefined(level.paused))
        level.paused = false; // démarrage: pas en pause

    // Attache le hotkey aux joueurs
    level thread TrackPlayersForPauseHotkey();

    // Boucle de gel zombies
    level thread FreezeZombiesWhilePaused();

    // Suivi des ouvertures/fermetures de menus
    level thread TrackPlayersForMenuEvents();
}
// ================================
// Suivi des events de menu (.menu)
// ================================
TrackPlayersForMenuEvents()
{
    // déjà connectés
    foreach(p in level.players)
        if (isDefined(p)) p thread OnPlayerMenuEvents();

    // nouveaux joueurs
    for(;;)
    {
        level waittill("connected", player);
        if (isDefined(player))
            player thread OnPlayerMenuEvents();
    }
}

OnPlayerMenuEvents()
{
    self endon("disconnect");

    for(;;)
    {
        self waittill("menuresponse", menuName, response);

        if(!isDefined(menuName) || !isDefined(response))
            continue;

        if(menuName == "class")
        {
            if(response == "zw_open_notify")
            {
                if(!level.paused)
                {
                    level.paused = true;
                    level notify("pause_on");
                }
            }
            else if(response == "zw_close_notify")
            {
                if(level.paused)
                {
                    level.paused = false;
                    level notify("pause_off");
                }
            }
        }
    }
}

TrackPlayersForPauseHotkey()
{
    // joueurs déjà connectés
    foreach(p in level.players)
        if (isDefined(p)) p thread HostPauseHotkey();

    // nouveaux joueurs
    for(;;)
    {
        level waittill("connected", player);
        if (isDefined(player))
            player thread HostPauseHotkey();
    }
}

HostPauseHotkey()
{
    self endon("disconnect");

    lastToggleTime = 0;

    for(;;)
    {
        wait 0.05;

        // seul le slot 0 (host) peut basculer
        if (!isDefined(level.players[0]) || self != level.players[0])
            continue;

        // maintenir USE + MELEE ~0.6s
        if (self UseButtonPressed() && self MeleeButtonPressed())
        {
            hold = 0.0;
            while (self UseButtonPressed() && self MeleeButtonPressed())
            {
                wait 0.05;
                hold += 0.05;
                if (hold >= 0.6) break;
            }

            // anti spam
            if (hold >= 0.6 && (getTime() - lastToggleTime) > 1200)
            {
                level.paused = !level.paused;
                lastToggleTime = getTime();

                if (level.paused)
                {
                    level notify("pause_on");
                    foreach(pl in level.players)
                        if (isDefined(pl)) pl iPrintlnBold("^1PAUSE ACTIVÉE  (^3USE+MELEE^7 pour reprendre)");
                }
                else
                {
                    level notify("pause_off");
                    foreach(pl in level.players)
                        if (isDefined(pl)) pl iPrintlnBold("^2REPRISE");
                }
            }
        }
    }
}

// ================================
// Gel complet des zombies
// ================================
FreezeZombiesWhilePaused()
{
    for(;;)
    {
        level waittill("pause_on");

        while(level.paused)
        {
            foreach(zombie in level.zombie)
            {
                if(isDefined(zombie) && isAlive(zombie))
                {
                    continue;
                    // force idle comme dans startEndGame
                    zombie.attract = 1;
                    zombie.mode = "idle";

                    if(zombie.type == "normal")
                        zombie thread maps\zm\gametypes\zombies::Zombie_Animation("idle");
                    else if(zombie.type == "dog")
                        zombie thread maps\zm\gametypes\zombies::Zombie_Animation("dog_idle");
                    else if(zombie.type == "mech")
                        zombie thread maps\zm\gametypes\zombies::Zombie_Animation("idle");
                    else if(zombie.type == "father")
                        zombie thread maps\zm\gametypes\zombies::Zombie_Animation("father_idle");
                }
            }
            wait 0.3;
        }

        // reprise → animation selon mode
        foreach(zombie in level.zombie)
        {
            if(isDefined(zombie) && isAlive(zombie))
            {
                continue;
                zombie.mode = "normal";

                if(zombie.type == "normal")
                    zombie thread maps\zm\gametypes\zombies::Zombie_Animation("zombie.mode");
                if(zombie.type == "dog")
                    zombie thread maps\zm\gametypes\zombies::Zombie_Animation("dog_run");
                else if(zombie.type == "father")
                    zombie thread maps\zm\gametypes\zombies::Zombie_Animation("father_walk");
                else
                    zombie thread maps\zm\gametypes\zombies::Zombie_Animation(zombie.mode);
            }
        }
    }
}
