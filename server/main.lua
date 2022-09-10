RegisterNetEvent(ARIF.Multichar.Trigger)
AddEventHandler(ARIF.Multichar.Trigger, function()
    if ARIF.Multichar.enable then
        TriggerClientEvent("ANTI_TELEPORT:Load", source)
    end
end)