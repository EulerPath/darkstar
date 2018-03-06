-----------------------------------
--
-- Zone: Mount_Zhayolm (61)
--
-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mount_Zhayolm/TextIDs");
require("scripts/zones/Mount_Zhayolm/MobIDs");
require("scripts/globals/settings");
-----------------------------------

function onInitialize(zone)
    GetMobByID(CERBERUS):setRespawnTime(math.random(12,36) * 3600);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-521.016,-6.191,60.013,126);
    end
    if (prevZone == 63) then
        player:setPos(681.950,-24.00,369.936,40);
    end
    return cs;
end;

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
    player:entityVisualPacket("2pb1");
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
