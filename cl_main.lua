------------------------------------------
-- CACHE
------------------------------------------

lib.onCache('vehicle', function(value)
    if not value then return end

    DeleteEntity(shieldProp)
    shieldEnabled = false
end)

------------------------------------------
-- FUNCTIONS
------------------------------------------

local function equipShield()
    local player = PlayerPedId()
    lib.requestModel(`prop_ballistic_shield`, 100)

    if not IsPedInAnyVehicle(player, true) then
        shieldEnabled = not shieldEnabled

        if shieldEnabled then
            shieldProp = CreateObject(`prop_ballistic_shield`, GetEntityCoords(player), 1, 1, 1)
            AttachEntityToEntity(shieldProp, player, GetPedBoneIndex(player, 0xEEEB), 0.15, -0.12, 0.0, -45.0, -190.0, -5.0, false, false, 1, 0, 0, 1)
            return
        end

        DeleteEntity(shieldProp)
    end
end

------------------------------------------
-- COMMANDS
------------------------------------------

RegisterCommand('kilpi', function()
    equipShield()
end)

------------------------------------------
-- KEYMAPPINGS
------------------------------------------

RegisterKeyMapping('kilpi', 'Turvavyö ( Ajoneuvossa )', 'keyboard', 'b')
