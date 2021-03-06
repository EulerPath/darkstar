-----------------------------------------
-- ID: 5164
-- Item: jar_of_ground_wasabi
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Strength -1
-- Dexterity -1
-- Agility -1
-- Vitality -1
-- Intelligence -1
-- Mind -1
-- Charisma -1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5164);
end;

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, -1);
    target:addMod(dsp.mod.DEX, -1);
    target:addMod(dsp.mod.AGI, -1);
    target:addMod(dsp.mod.VIT, -1);
    target:addMod(dsp.mod.INT, -1);
    target:addMod(dsp.mod.MND, -1);
    target:addMod(dsp.mod.CHR, -1);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, -1);
    target:delMod(dsp.mod.DEX, -1);
    target:delMod(dsp.mod.AGI, -1);
    target:delMod(dsp.mod.VIT, -1);
    target:delMod(dsp.mod.INT, -1);
    target:delMod(dsp.mod.MND, -1);
    target:delMod(dsp.mod.CHR, -1);
end;
