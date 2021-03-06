-----------------------------------
-- Area: Waughroon Shrine
--  MOB: Dark Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1);
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.DARK_DRAGON_SLAYER);
end;
