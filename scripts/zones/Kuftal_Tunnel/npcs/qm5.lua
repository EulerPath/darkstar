-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: ???
-- Involved in Mission: Bastok 8-2
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/TextIDs");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and player:getVar("MissionStatus") == 1) then
        player:startEvent(12);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 12 and option == 0) then
        player:setVar("MissionStatus",2);
        player:messageSpecial(FELL);
    end
end;
