class 'CombatMarineUpgrade' (CombatUpgrade)

function CombatMarineUpgrade:Initialize(upgradeId, upgradeTextCode, upgradeDescription, upgradeTechId, upgradeFunc, requirements, levels, upgradeType, refundUpgrade, hardCap, mutuallyExclusive)

	CombatUpgrade.Initialize(self, "Marine", upgradeId, upgradeTextCode, upgradeDescription, upgradeTechId, upgradeFunc, requirements, levels, upgradeType, refundUpgrade, hardCap, mutuallyExclusive)

end

function CombatMarineUpgrade:TeamSpecificLogic(player)
	
	local techId = self:GetTechId()
	local kMapName = LookupTechData(techId, kTechDataMapName)
	
	-- Apply weapons upgrades to a marine.
	if (player:GetIsAlive() and self:GetType() == kCombatUpgradeTypes.Weapon) then
		--Player.InitWeapons(player)
		
		-- if this is a primary weapon, destroy the old one.
		if GetIsPrimaryWeapon(kMapName) then
			local weapon = player:GetWeaponInHUDSlot(1)
			if (weapon) then
				player:RemoveWeapon(weapon)
				DestroyEntity(weapon)
			end
		end
		
		self:GiveItem(player)
	end
	
end