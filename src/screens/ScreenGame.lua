require("src/objects/PowerUp")
require("src/objects/EnergyManager")
require("src/screens/ScreenManager")
require("src/objects/Button")

--Constantes
local POWER_UP_ONE_PRICE = 10
local POWER_UP_TWO_PRICE = 20
local POWER_UP_THREE_PRICE = 30
local ENERGY_PRICE = 50

--Buttons
local clickerButton = {
    x = 0,
    y = 0,
    width = 110,
    height = 50,
    isPresed = false,
    wasPresed = false
}

local backButton = {
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

local powerUpTwoButton = {
    x = 0,
    y = 0,
    width = 110,
    height = 50,
    isPresed = false,
    wasPresed = false
}

local powerUpThreeButton = {
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

local powerUpTwo = {
    count = 0,
    time = 0.5,
    addCoins = 0.1,
    isEquiped = false,
    quantity = 0
}

local powerUpThree = {
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

local computer = {
    x = 190,
    y = 170,
    scaleX = 1.5,
    scaleY = 1.5,
    image = 0
}

local keyboard = {
    x = 60,
    y = 290,
    scaleX = 2,
    scaleY = 2,
    image = 0
}

local mouse = {
    x = 620,
    y = 540,
    scaleX = 0.5,
    scaleY = 0.5,
    image = 0
}

local backgroundOne = {
    x = 0,
    y = 0,
    scaleX = 1,
    scaleY = 1,
    image = 0
}

local computerBackground = {
    x = 220,
    y = 270,
    scaleX = 0.28,
    scaleY = 0.24,
    image = 0
}

function gameInit(width, height, font, computerSprite, keyboardSprite, mouseSprite, backgroundOneSprite, computerBackgroundSprite)
    --Recursos
    fontGame = font
    
    computer.scaleX = 1.5
    computer.scaleY = 1.5
    computer.image = computerSprite

    keyboard.scaleX = 2
    keyboard.scaleY = 2
    keyboard.image = keyboardSprite

    mouse.scaleX = 0.5
    mouse.scaleY = 0.5
    mouse.image = mouseSprite

    backgroundOne.scaleX = 1
    backgroundOne.scaleY = 1
    backgroundOne.image = backgroundOneSprite

    computerBackground.scaleX = 0.28
    computerBackground.scaleY = 0.24
    computerBackground.image = computerBackgroundSprite

    --Stats
    stats.coins = 0
    stats.energy = 100

    --Energy
    EnergyInit(energy, 0, 1, -1)

    --Buttons
    ButtonClickerInit(clickerButton, 80, 590)
    ButtonInit(backButton, 950, (height - backButton.height) - 40)
    ButtonInit(powerUpOneButton, 950, 150)
    ButtonInit(powerUpTwoButton, 950, 250)
    ButtonInit(powerUpThreeButton, 950, 350)
    ButtonInit(energyButton, 950, 450)

    --PowerUps
    PowerUpInit(powerUpOne, 0, 1, 0.1, false, 0)
    PowerUpInit(powerUpTwo, 0, 1, 1, false, 0)
    PowerUpInit(powerUpThree, 0, 1, 5, false, 0)
end

function gameUpdate(dt, mousePos)
    --Actualizar estado de botones
    clickerButton.wasPresed = clickerButton.isPresed
    powerUpOneButton.wasPresed = powerUpOneButton.isPresed
    powerUpTwoButton.wasPresed = powerUpTwoButton.isPresed
    powerUpThreeButton.wasPresed = powerUpThreeButton.isPresed
    energyButton.wasPresed = energyButton.isPresed
    backButton.wasPresed = backButton.isPresed

    --Evaluar estado de powerUps
    CheckPowerUp(powerUpOne, stats, dt)
    CheckPowerUp(powerUpTwo, stats, dt)
    CheckPowerUp(powerUpThree, stats, dt)

    --Evaluar energy
    CheckEnergy(energy, stats, dt)
    if (stats.energy <= 0) then
        SetScreen(screen.defeat)
    end

    --Win condition
    if (stats.coins >= 1000) then
        SetScreen(screen.win)
    end

    --Evaluar estado de botones

    --Clicker
    CheckButton(clickerButton, mousePos)
    if (not clickerButton.isPresed and clickerButton.wasPresed) then
        stats.coins = stats.coins + 1
    end

    --PowerUp uno
    CheckButton(powerUpOneButton, mousePos)
    if (not powerUpOneButton.isPresed and powerUpOneButton.wasPresed) then
        if (stats.coins >= POWER_UP_ONE_PRICE and (not powerUpOne.isEquiped)) then
            powerUpOne.isEquiped = true
            stats.coins = stats.coins - POWER_UP_ONE_PRICE
            powerUpOne.quantity = 1
        elseif (stats.coins >= POWER_UP_ONE_PRICE and (powerUpOne.isEquiped)) then
            powerUpOne.addCoins = powerUpOne.addCoins + 0.1
            stats.coins = stats.coins - POWER_UP_ONE_PRICE
            powerUpOne.quantity = powerUpOne.quantity + 1
        end
    end

    --PowerUp dos
    CheckButton(powerUpTwoButton, mousePos)
    if (not powerUpTwoButton.isPresed and powerUpTwoButton.wasPresed) then
        if (stats.coins >= POWER_UP_TWO_PRICE and (not powerUpTwo.isEquiped)) then
            powerUpTwo.isEquiped = true
            stats.coins = stats.coins - POWER_UP_TWO_PRICE
            powerUpTwo.quantity = 1
        elseif (stats.coins >= POWER_UP_TWO_PRICE and (powerUpTwo.isEquiped)) then
            powerUpTwo.addCoins = powerUpTwo.addCoins + 0.3
            stats.coins = stats.coins - POWER_UP_TWO_PRICE
            powerUpTwo.quantity = powerUpTwo.quantity + 1
        end
    end

    --PowerUp tres
    CheckButton(powerUpThreeButton, mousePos)
    if (not powerUpThreeButton.isPresed and powerUpThreeButton.wasPresed) then
        if (stats.coins >= POWER_UP_THREE_PRICE and (not powerUpThree.isEquiped)) then
            powerUpThree.isEquiped = true
            stats.coins = stats.coins - POWER_UP_THREE_PRICE
            powerUpThree.quantity = 1
        elseif (stats.coins >= POWER_UP_THREE_PRICE and (powerUpThree.isEquiped)) then
            powerUpThree.addCoins = powerUpThree.addCoins + 0.5
            stats.coins = stats.coins - POWER_UP_THREE_PRICE
            powerUpThree.quantity = powerUpThree.quantity + 1
        end
    end

    --Energy
    CheckButton(energyButton, mousePos)
    if (not energyButton.isPresed and energyButton.wasPresed) then
        if (stats.coins >= ENERGY_PRICE) then
            stats.energy = stats.energy + 10
            stats.coins = stats.coins - ENERGY_PRICE
        end
    end

    --Back button
    CheckButton(backButton, mousePos)
    if (not backButton.isPresed and backButton.wasPresed) then
        SetScreen(screen.menu)
    end
    
end

function gameDraw()

    --Dibujar imagenes
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(backgroundOne.image, backgroundOne.x, backgroundOne.y, 0, backgroundOne.scaleX, backgroundOne.scaleY)
    love.graphics.draw(computer.image, computer.x, computer.y, 0, computer.scaleX, computer.scaleY)
    love.graphics.draw(computerBackground.image, computerBackground.x, computerBackground.y, 0, computerBackground.scaleX, computerBackground.scaleY)
    love.graphics.draw(keyboard.image, keyboard.x, keyboard.y, 0, keyboard.scaleX, keyboard.scaleY)
    love.graphics.draw(mouse.image, mouse.x, mouse.y, 0, mouse.scaleX, mouse.scaleY)

    --Dibujar rectangulo clickerButton
    --love.graphics.setColor(1, 1, 1, 1)
    --love.graphics.rectangle("fill", clickerButton.x, clickerButton.y, clickerButton.width, clickerButton.height)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", powerUpOneButton.x, powerUpOneButton.y, powerUpOneButton.width, powerUpOneButton.height)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", powerUpTwoButton.x, powerUpTwoButton.y, powerUpTwoButton.width, powerUpTwoButton.height)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", powerUpThreeButton.x, powerUpThreeButton.y, powerUpThreeButton.width, powerUpThreeButton.height)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", energyButton.x, energyButton.y, energyButton.width, energyButton.height)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", backButton.x, backButton.y, backButton.width, backButton.height)

    --Dibujar texto coins
    love.graphics.setColor(0.349, 1, 0.349, 1)
    coinsText = love.graphics.newText(fontGame, "Coins: " .. stats.coins)
    love.graphics.draw (coinsText, 10, 10)

    --Dibujar texto store
    love.graphics.setColor(1, 0, 0, 1)
    storeText = love.graphics.newText(fontGame, "- STORE -")
    love.graphics.draw (storeText, 970, 50)

    --Dibujar texto energy
    love.graphics.setColor(0.349, 1, 0.349, 1)
    energyText = love.graphics.newText(fontGame, "Energy: " .. stats.energy)
    love.graphics.draw (energyText, 10, 60)


    --Dibujar texto powerUpOne
    love.graphics.setColor(0, 0.58, 0, 1)
    powerUpOneText = love.graphics.newText(fontGame, "RAMs: " .. powerUpOne.quantity)
    love.graphics.draw (powerUpOneText, powerUpOneButton.x + 15, powerUpOneButton.y + 15)

    --Dibujar texto powerUpTwo
    love.graphics.setColor(0, 0.58, 0, 1)
    coinsText = love.graphics.newText(fontGame, "CPUs: " .. powerUpTwo.quantity)
    love.graphics.draw (coinsText, powerUpTwoButton.x + 15, powerUpTwoButton.y + 15)

    --Dibujar texto powerUpThree
    love.graphics.setColor(0, 0.58, 0, 1)
    coinsText = love.graphics.newText(fontGame, "GPUs: " .. powerUpThree.quantity)
    love.graphics.draw (coinsText, powerUpThreeButton.x + 15, powerUpThreeButton.y + 15)

    --Dibujar texto energyButton
    love.graphics.setColor(0, 0.58, 0, 1)
    coinsText = love.graphics.newText(fontGame, "+10 Energy")
    love.graphics.draw (coinsText, energyButton.x + 8, energyButton.y + 15)

    --Dibujar texto back
    love.graphics.setColor(0, 0.58, 0, 1)
    coinsText = love.graphics.newText(fontGame, "Back")
    love.graphics.draw (coinsText, backButton.x + 15, backButton.y + 15)

end