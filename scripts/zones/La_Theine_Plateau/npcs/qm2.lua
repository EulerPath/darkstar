-----------------------------------
-- Area: La Theine Plateau
--  NPC: ??? (qm2)
--  Involved in Quest: HITTING_THE_MARQUISATE (THF AF3)
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/zones/La_Theine_Plateau/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    local hittingTheMarquisateNanaaCS = player:getVar("hittingTheMarquisateNanaaCS");

    if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then -- Trade pickaxe
        if (hittingTheMarquisateNanaaCS == 1) then
            player:startEvent(119);
        end
    end
end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 119) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14094);
        else
        player:addItem(14094);
        player:messageSpecial(ITEM_OBTAINED,14094);
        player:tradeComplete();
        player:completeQuest(WINDURST, HITTING_THE_MARQUISATE);
        player:addTitle(dsp.title.PARAGON_OF_THIEF_EXCELLENCE);
        player:setVar("hittingTheMarquisateNanaaCS",0);
        player:delKeyItem(dsp.ki.CAT_BURGLARS_NOTE);
        end
    end
end;