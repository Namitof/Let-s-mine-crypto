local clickerButton = {
    x = 0,
    y = 0,
    width = 110,
    height = 50,
    isPresed = false,
    wasPresed = false
}

local powerUpOne = {
    count = 0,
    time = 5,
    addCoins = 10
}

local fontGame

local coins = 0

function gameInit(width, height, font)

    fontGame = font

    coins = 0

    clickerButton.x = width/2 - clickerButton.width/2
    clickerButton.y = height/2 - clickerButton.height/2
end

function gameUpdate(dt, mousePos)
    clickerButton.wasPresed = clickerButton.isPresed

    if (powerUpOne.count >= powerUpOne.time) then
        coins = coins + powerUpOne.addCoins
        powerUpOne.count = 0
    else
        powerUpOne.count = powerUpOne.count + dt
    end

    CheckButton(clickerButton, mousePos)

    if (not clickerButton.isPresed and clickerButton.wasPresed) then
        coins = coins + 1
    end
end

function gameDraw()
    --Dibujar rectangulo
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.rectangle("line", clickerButton.x, clickerButton.y, clickerButton.width, clickerButton.height)

    --Dibujar texto
    love.graphics.setColor(1, 0, 0, 1)
    coinsText = love.graphics.newText(fontGame, "Coins: " .. coins)
    love.graphics.draw (coinsText, 50, 50)
end