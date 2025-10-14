#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\zm\gametypes\utilities;

Init()
{
    level thread onPlayerConnect();
}

onPlayerConnect()
{
    for (;;)
    {
        level waittill("connected", player);
        if (!isDefined(player)) continue;

        // stop any previous loop for this player
        player notify("end_regen");
        player thread hotfix_new_player_health_regen();
    }
}

hotfix_new_player_health_regen()
{
    self endon("death");
    self endon("disconnect");
    self endon("end_regen");

    // ---- safe defaults for gs ----
    if (!isDefined(self.gs)) self.gs = [];
    if (!isDefined(self.gs.healthOverlayCutoff))               self.gs.healthOverlayCutoff = 0.25; // 25%
    if (!isDefined(self.gs.playerHealth_RegularRegenDelay))    self.gs.playerHealth_RegularRegenDelay = 1200; // ms
    if (!isDefined(self.gs.longRegenTime))                     self.gs.longRegenTime = 1800; // ms
    if (!isDefined(self.gs.regenRate))                         self.gs.regenRate = 0.07;  // +7% after long delay
    if (!isDefined(self.gs.worthyDamageRatio))                 self.gs.worthyDamageRatio = 0.20;
    if (!isDefined(self.gs.invulTime_onShield))                self.gs.invulTime_onShield = 500;  // ms
    if (!isDefined(self.gs.invulTime_postShield))              self.gs.invulTime_postShield = 400;
    if (!isDefined(self.gs.invulTime_preShield))               self.gs.invulTime_preShield = 300;

    // ---- locals (keep names consistent!) ----
    oldRatio          = 1.0;
    lastInvulRatio    = 1.0;
    veryHurt          = false;
    playerJustFlashed = false;
    hurtTime          = 0;
    lastInvulNotify   = 0;   // throttle "player_becoming_invulnerable"
    self.boltHit      = false;

    for (;;)
    {
        wait 0.05;

        // hard guards
        if (!isDefined(self) || !isAlive(self)) break;
        if (!isDefined(self.maxhealth) || self.maxhealth <= 0) continue;

        // full health → reset state
        if (self.health >= self.maxhealth)
        {
            if (self ent_flag("player_has_red_flashing_overlay"))
                player_recovers_from_red_flashing();

            oldRatio          = 1.0;
            lastInvulRatio    = 1.0;
            veryHurt          = false;
            playerJustFlashed = false;
            continue;
        }

        ratio        = self.health / self.maxHealth;
        wasVeryHurt  = veryHurt;

        // enter "very hurt" state
        if (ratio <= self.gs.healthOverlayCutoff && isDefined(self.player_health_packets) && self.player_health_packets > 1)
        {
            veryHurt = true;
            if (!wasVeryHurt)
            {
                hurtTime = GetTime();
                self ent_flag_set("player_has_red_flashing_overlay");
                playerJustFlashed = true;
            }
        }

        if (isDefined(self.hurtAgain) && self.hurtAgain)
        {
            hurtTime = GetTime();
            self.hurtAgain = false;
        }

        // ---------- REGEN ----------
        if ((self.health / self.maxhealth) >= oldRatio)
        {
            if (GetTime() - hurtTime < self.gs.playerHealth_RegularRegenDelay)
                continue;

            if (veryHurt)
            {
                newHealth = ratio;
                if (GetTime() > (hurtTime + self.gs.longRegenTime))
                    newHealth += self.gs.regenRate;
            }
            else
            {
                newHealth = 1.0;
            }

            if (newHealth > 1.0) newHealth = 1.0;

            self SetNormalHealth(newHealth);
            oldRatio = self.health / self.maxHealth;
            continue;
        }

        // took damage since last tick
        oldRatio = lastInvulRatio;

        worthyDrop = self.gs.worthyDamageRatio;
        if (isDefined(self.attackerCount) && self.attackerCount == 1)
            worthyDrop *= 3;

        invulWorthy = ((oldRatio - ratio) >= worthyDrop);

        // keep away from 0 HP edge cases
        if (self.health <= 1)
        {
            self SetNormalHealth(2 / self.maxhealth);
            invulWorthy = true;
        }

        oldRatio = self.health / self.maxHealth;
        self notify("hit_again");
        hurtTime = GetTime();

        if (!invulWorthy)
            continue;

        if (self ent_flag("player_is_invulnerable"))
            continue;

        self ent_flag_set("player_is_invulnerable");

        // throttle global notify to 3/sec
        now = GetTime();
        if (now - lastInvulNotify > 333)
        {
            lastInvulNotify = now;
            level notify("player_becoming_invulnerable");
        }

        // compute window (leave the actual invul thread commented unless you need it)
        if (playerJustFlashed)
        {
            invulTime = self.gs.invulTime_onShield;
            playerJustFlashed = false;
        }
        else if (veryHurt)
        {
            invulTime = self.gs.invulTime_postShield;
        }
        else
        {
            invulTime = self.gs.invulTime_preShield;
        }

        lastInvulRatio = self.health / self.maxHealth;

        // If you want real invulnerability, uncomment:
        // self thread playerInvul(invulTime);
    }
}

player_recovers_from_red_flashing()
{
    self ent_flag_clear("player_has_red_flashing_overlay");
    self notify("take_cover_done");
}

// --- tiny flag helpers (no leaks) ---
ent_flag(k)
{
    if (!isDefined(self.ent_flag)) self.ent_flag = [];
    return self.ent_flag[k];
}
ent_flag_clear(k)
{
    if (isDefined(self.ent_flag) && self.ent_flag[k])
    {
        self.ent_flag[k] = false;
        self notify(k);
    }
}
ent_flag_set(k)
{
    if (!isDefined(self.ent_flag)) self.ent_flag = [];
    self.ent_flag[k] = true;
    self notify(k);
}

/*
playerInvul(ms)
{
    self endon("death");
    self endon("disconnect");

    if (ms > 0)
    {
        self.IgnoreRandomBulletDamage = true;
        wait (ms / 1000.0);
        self.IgnoreRandomBulletDamage = false;
    }
    self ent_flag_clear("player_is_invulnerable");
}
*/
