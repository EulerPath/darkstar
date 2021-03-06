-----------------------------------------
-- ID: 5594
-- Item: cup_of_chai_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Vitality -3
-- Charisma 3
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5594);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, -3);
    target:addMod(dsp.mod.CHR, 3);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, -3);
    target:delMod(dsp.mod.CHR, 3);
end;
