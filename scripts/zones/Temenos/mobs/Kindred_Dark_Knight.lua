-----------------------------------
-- Area: Temenos N T    
-- NPC:  Kindred_Dark_Knight

-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
 if (IsMobDead(16928797)==true and IsMobDead(16928798)==true  and IsMobDead(16928799)==true ) then
       GetNPCByID(16928768+27):setPos(-120,-80,429);
    GetNPCByID(16928768+27):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928768+161):setPos(-123,-80,429);
    GetNPCByID(16928768+161):setStatus(dsp.status.NORMAL);
    GetNPCByID(16928768+212):setPos(-117,-80,429);
    GetNPCByID(16928768+212):setStatus(dsp.status.NORMAL);
 end
end;