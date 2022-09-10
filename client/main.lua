local firstSpawn = true

function StartProtection()
	Citizen.CreateThread(function()
		local lastPosition = nil
		local interval = 500
		while true do
			Citizen.Wait(interval)
			local playerPos  = GetEntityCoords(PlayerPedId())
			if lastPosition == nil then
				lastPosition = playerPos
			end
			if Vdist2(playerPos, lastPosition) > 700.0 then
				ARIF.HackerFunction(lastPosition)
				playerPos = nil
			end
			if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
				interval = 50
			else
				interval = 500
			end
			lastPosition = playerPos
		end
	end)
end

AddEventHandler('playerSpawned', function()
	if firstSpawn and ARIF.Multichar.enable == false then
		StartProtection()
		firstSpawn = false
	end
end)

RegisterNetEvent("ANTI_TELEPORT:Load")
AddEventHandler('ANTI_TELEPORT:Load', function ()
	if ARIF.Multichar.enable and firstSpawn then
		StartProtection()
		firstSpawn = false
	end
end)