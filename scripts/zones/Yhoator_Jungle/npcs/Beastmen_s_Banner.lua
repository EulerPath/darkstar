-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: Beastmen_s_Banner
-- !pos 366.014 -0.185 -394.801 124
-----------------------------------
package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Yhoator_Jungle/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(BEASTMEN_BANNER);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);
end;