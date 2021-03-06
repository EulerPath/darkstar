-----------------------------------
-- Area: Port Bastok
--  NPC: Paujean
-- Starts & Finishes Quest: Silence of the Rams
-- !pos -93.738 4.649 34.373 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    local SilenceOfTheRams = player:getQuestStatus(BASTOK,SILENCE_OF_THE_RAMS);

    if (SilenceOfTheRams == QUEST_ACCEPTED) then
        local count = trade:getItemCount();
        local LumberingHorn = trade:hasItemQty(910,1);
        local RampagingHorn = trade:hasItemQty(911,1);

        if (LumberingHorn == true and RampagingHorn == true and count == 2) then
            player:startEvent(196);
        end
    end
end;

function onTrigger(player,npc)
    local SilenceOfTheRams = player:getQuestStatus(BASTOK,SILENCE_OF_THE_RAMS);
    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,2) == false) then
        player:startEvent(355);
    elseif (SilenceOfTheRams == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 2) then
        player:startEvent(195);
    elseif (SilenceOfTheRams == QUEST_ACCEPTED) then
        player:showText(npc,PAUJEAN_DIALOG_1);
    else
        player:startEvent(25);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 195) then
        player:addQuest(BASTOK,SILENCE_OF_THE_RAMS);
    elseif (csid == 196) then
        player:tradeComplete();
        player:completeQuest(BASTOK,SILENCE_OF_THE_RAMS);
        player:addFame(3,125);
        player:addItem(13201);
        player:messageSpecial(ITEM_OBTAINED,13201);
        player:addTitle(dsp.title.PURPLE_BELT);
    elseif (csid == 355) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",2,true);
    end
end;
