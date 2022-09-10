ARIF = {}

ARIF.Multichar = {
    enable = true,
    Trigger = "esx_multicharacter:CharacterChosen"
}

ARIF.HackerFunction = function(pos)
    -- If you want u can add a ban system here or a if statement to check if the player is a admin or not
    -- Example: TriggerServerEvent("AntiCheat:BanPlayer", "Anti-Teleport")
    SetEntityCoords(GetPlayerPed(-1), pos.x, pos.y, pos.z)
end