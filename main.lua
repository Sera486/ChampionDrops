local mod = RegisterMod("Champion Rewards", 1)

function mod:postNpcDeath(npc)
    local game = Game()
    if not (game:IsGreedMode() and npc:IsChampion()) then return end

    local dropChance = 100
    if game.Difficulty == Difficulty.DIFFICULTY_GREEDIER then 
        dropChance = 33
    end

    if npc.DropSeed % 100 < dropChance then
        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_PENNY, npc.Position, Vector(0,0), npc.EntityRef)
    end
end


mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, mod.postNpcDeath);
