-----------------------------------
-- Area: Cloister of Frost
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Ice Fragment)
-- !pos 566 0 606 203
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Frost/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/Cloister_of_Frost/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
        if (player:hasKeyItem(dsp.ki.ICE_FRAGMENT) == false) then
            player:startEvent(200,dsp.ki.ICE_FRAGMENT);
        elseif (player:hasKeyItem(239) and player:hasKeyItem(240) and player:hasKeyItem(241) and
            player:hasKeyItem(242) and player:hasKeyItem(243) and player:hasKeyItem(244) and
            player:hasKeyItem(245) and player:hasKeyItem(246)) then
            player:messageSpecial(ALREADY_HAVE_ALL_FRAGS);
        elseif (player:hasKeyItem(dsp.ki.ICE_FRAGMENT)) then
            player:messageSpecial(ALREADY_OBTAINED_FRAG,dsp.ki.ICE_FRAGMENT);
        end
    elseif (player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE)) then
        player:messageSpecial(ZILART_MONUMENT);
    else
        player:messageSpecial(CANNOT_REMOVE_FRAG);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 200 and option == 1) then
        player:addKeyItem(dsp.ki.ICE_FRAGMENT);
        -- Check and see if all fragments have been found (no need to check ice and dark frag)
        if (player:hasKeyItem(dsp.ki.FIRE_FRAGMENT) and player:hasKeyItem(dsp.ki.EARTH_FRAGMENT) and player:hasKeyItem(dsp.ki.WATER_FRAGMENT) and
           player:hasKeyItem(dsp.ki.WIND_FRAGMENT) and player:hasKeyItem(dsp.ki.LIGHTNING_FRAGMENT) and player:hasKeyItem(dsp.ki.LIGHT_FRAGMENT)) then
            player:messageSpecial(FOUND_ALL_FRAGS,dsp.ki.ICE_FRAGMENT);
            player:addTitle(dsp.title.BEARER_OF_THE_EIGHT_PRAYERS);
            player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
            player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
        else
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ICE_FRAGMENT);
        end
    end

end;