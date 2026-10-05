require("src/objects/Button")

local playButton = {
    x = 500,
    y = 200,
    width = 220,
    height = 80,
    isPresed = false,
    wasPresed = false
}

local rulesButton = {
    x = 500,
    y = 300,
    width = 220,
    height = 80,
    isPresed = false,
    wasPresed = false
}

local creditsButton = {
    x = 500,
    y = 400,
    width = 220,
    height = 80,
    isPresed = false,
    wasPresed = false
}

local exitButton = {
    x = 500,
    y = 500,
    width = 220,
    height = 80,
    isPresed = false,
    wasPresed = false
}

local fontMenu

function menuInit(font)
    fontMenu = font
end

function menuUpdate(mousePos)

    playButton.wasPresed = playButton.isPresed
    rulesButton.wasPresed = rulesButton.isPresed
    creditsButton.wasPresed = creditsButton.isPresed
    exitButton.wasPresed = exitButton.isPresed

    CheckButton(playButton, mousePos)
    CheckButton(rulesButton, mousePos)
    CheckButton(creditsButton, mousePos)
    CheckButton(exitButton, mousePos)

    if (not playButton.isPresed and playButton.wasPresed) then
        SetScreen(screen.game)
    elseif (not rulesButton.isPresed and rulesButton.wasPresed) then
        SetScreen(screen.rules)
    elseif (not creditsButton.isPresed and creditsButton.wasPresed) then
        SetScreen(screen.credits)
    elseif (not exitButton.isPresed and exitButton.wasPresed) then
        SetScreen(screen.exit)
    end
end

function menuDraw()
    love.graphics.setColor(1, 0, 0, 1)
    titleText = love.graphics.newText(fontMenu, "Let's mine crypto!")
    love.graphics.draw (titleText, 420, 50)
    
    love.graphics.rectangle("fill", playButton.x, playButton.y, playButton.width, playButton.height)
    love.graphics.rectangle("fill", rulesButton.x, rulesButton.y, rulesButton.width, rulesButton.height)
    love.graphics.rectangle("fill", creditsButton.x, creditsButton.y, creditsButton.width, creditsButton.height)
    love.graphics.rectangle("fill", exitButton.x, exitButton.y, exitButton.width, exitButton.height)
end

