require("src/objects/PowerUp")
require("src/objects/EnergyManager")
require("src/screens/ScreenManager")

--Buttons
local clickerButton = {
    x = 0,
    y = 0,
    width = 110,
    height = 50,
    isPresed = false,
    wasPresed = false
}

local energyButton = {
    x = 0,
    y = 0,
    width = 110,
    height = 50,
    isPresed = false,
    wasPresed = false
}

local powerUpOneButton = {
    x = 0,
    y = 0,
    width = 110,
    height = 50,
    isPresed = false,
    wasPresed = false
}

--Power ups
local powerUpOne = {
    count = 0,
    time = 0.5,
    addCoins = 0.1,
    isEquiped = false,
    quantity = 0
}

--Stats player
local stats = {
    coins = 0,
    energy = 0
}

local energy = {
    count = 0,
    time = 1,
    addEnergy = -1
}

--Recursos
local fontGame

function gameInit(width, height, font)

    --Recursos
    fontGame = font

    --Stats
    stats.coins = 0
    stats.energy = 100

    --Energy
    energy.count = 0
    energy.time = 1
    energy.addEnergy = -1

    --Buttons
    clickerButton.x = width/2 - clickerButton.width/2
    clickerButton.y = height/2 - clickerButton.height/2

    powerUpOneButton.x = 200
    powerUpOneButton.y = 200

    energyButton.x = 0
    energyButton.y = 0

    --PowerUps
    powerUpOne.count = 0
    powerUpOne.time = 0.5
    powerUpOne.addCoins = 0.1
    powerUpOne.isEquiped = false
    powerUpOne.quantity = 0

end

function gameUpdate(dt, mousePos)

    --Actualizar estado de botones
    clickerButton.wasPresed = clickerButton.isPresed
    powerUpOneButton.wasPresed = powerUpOneButton.isPresed
    energyButton.wasPresed = energyButton.isPresed

    --Evaluar estado de powerUps
    CheckPowerUp(powerUpOne, stats, dt)

    --Evaluar energy
    CheckEnergy(energy, stats, dt)
    if (stats.energy <= 0) then
        SetScreen(screen.menu)
    end

    --Evaluar estado del boton
    CheckButton(clickerButton, mousePos)
    if (not clickerButton.isPresed and clickerButton.wasPresed) then
        stats.coins = stats.coins + 1
    end

    CheckButton(powerUpOneButton, mousePos)
    if (not powerUpOneButton.isPresed and powerUpOneButton.wasPresed) then
        if (stats.coins >= 10 and (not powerUpOne.isEquiped)) then
            powerUpOne.isEquiped = true
            stats.coins = stats.coins - 10
        elseif (stats.coins >= 10 and (powerUpOne.isEquiped)) then
            powerUpOne.addCoins = powerUpOne.addCoins + 0.1
            stats.coins = stats.coins - 10
        end
    end

    CheckButton(energyButton, mousePos)
    if (not energyButton.isPresed and energyButton.wasPresed) then
        if (stats.coins >= 10) then
            stats.energy = stats.energy + 10
            stats.coins = stats.coins - 10
        end
    end
    
end

function gameDraw()
    --Dibujar rectangulo
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.rectangle("line", clickerButton.x, clickerButton.y, clickerButton.width, clickerButton.height)

    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.rectangle("line", powerUpOneButton.x, powerUpOneButton.y, powerUpOneButton.width, powerUpOneButton.height)

    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.rectangle("line", energyButton.x, energyButton.y, energyButton.width, energyButton.height)

    --Dibujar texto coins
    love.graphics.setColor(1, 0, 0, 1)
    coinsText = love.graphics.newText(fontGame, "Coins: " .. stats.coins)
    love.graphics.draw (coinsText, 50, 50)

    --Dibujar texto energy
    love.graphics.setColor(1, 0, 0, 1)
    energyText = love.graphics.newText(fontGame, "Energy: " .. stats.energy)
    love.graphics.draw (energyText, 80, 80)
end