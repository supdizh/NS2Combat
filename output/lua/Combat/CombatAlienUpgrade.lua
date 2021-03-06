class 'CombatAlienUpgrade' (CombatUpgrade)

function CombatAlienUpgrade:Initialize(upgradeId, upgradeTextCode, upgradeDescription, upgradeTechId, upgradeFunc, requirements, levels, upgradeType, refundUpgrade, hardCap, mutuallyExclusive)

	CombatUpgrade.Initialize(self, "Alien", upgradeId, upgradeTextCode, upgradeDescription, upgradeTechId, upgradeFunc, requirements, levels, upgradeType, refundUpgrade, hardCap, mutuallyExclusive)

end

function CombatAlienUpgrade:TeamSpecificLogic(player)
	
	if not player.isRespawning then
	    -- Eliminate velocity so that we don't slide or jump as an egg
        player:SetVelocity(Vector(0, 0, 0))
		player:DropToFloor()
        player:EvolveTo(self:GetTechId())
	end
	
end