------------------------------------------
-- FUNCTIONS
------------------------------------------

local function ReadyShieldModel()
    RequestModel(`prop_ballistic_shield`)
    repeat Wait(50) until HasModelLoaded(`prop_ballistic_shield`)
end

RegisterNetEvent('f-mazkeenkoodikoulu2:client:main:equipShield', function()
    local Player = PlayerPedId()
    ReadyShieldModel()
    if not IsPedInAnyVehicle(Player, true) then
        shieldEnabled = not shieldEnabled
        if shieldEnabled then
            shieldProp = CreateObject(`prop_ballistic_shield`, GetEntityCoords(Player), 1, 1, 1)
            AttachEntityToEntity(shieldProp, Player, GetPedBoneIndex(Player, 0xEEEB), 0.15, -0.12, 0.0, -45.0, -190.0, -5.0, false, false, 1, 0, 0, 1)
            TriggerEvent('f-mazkeenkoodikoulu2:client:main:shieldLoop', Player)
        else
            DeleteEntity(shieldProp)
        end
    end
end)

RegisterNetEvent('f-mazkeenkoodikoulu2:client:main:shieldLoop', function(Player)
    while shieldEnabled do
        if IsPedInAnyVehicle(Player, true) then
            shieldEnabled = false
        end
        Wait(100)
    end
end)

------------------------------------------
-- COMMANDS
------------------------------------------

RegisterCommand('kilpi', function()
    TriggerEvent('f-mazkeenkoodikoulu2:client:main:equipShield')
end)

------------------------------------------
-- KEYMAPPINGS
------------------------------------------

RegisterKeyMapping('kilpi', 'Turvavyö ( Ajoneuvossa )', 'keyboard', 'b')