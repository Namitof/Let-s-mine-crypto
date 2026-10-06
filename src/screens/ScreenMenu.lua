require("src/objects/Button")

local playButton = {
    x = 965,
    y = 200,
    width = 220,
    height = 80,
    isPresed = false,
    wasPresed = false,
    textX = 1030,
    textY = 220
}

local rulesButton = {
    x = 965,
    y = 300,
    width = 220,
    height = 80,
    isPresed = false,
    wasPresed = false,
    textX = 1015,
    textY = 320
}

local creditsButton = {
    x = 965,
    y = 400,
    width = 220,
    height = 80,
    isPresed = false,
    wasPresed = false,
    textX = 995,
    textY = 420
}

local exitButton = {
    x = 965,
    y = 500,
    width = 220,
    height = 80,
    isPresed = false,
    wasPresed = false,
    textX = 1030,
    textY = 520
}

local fontMenu

local backgroundOne = {
    x = 0,
    y = 0,
    scaleX = 1,
    scaleY = 1,
    image = 0
}

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

function menuInit(font, computerSprite, keyboardSprite, mouseSprite, backgroundOneSprite)
    --Recursos
    fontMenu = font

    computer.x = 190
    computer.y = 170
    computer.scaleX = 1.5
    computer.scaleY = 1.5
    computer.image = computerSprite

    keyboard.x = 60
    keyboard.y = 290
    keyboard.scaleX = 2
    keyboard.scaleY = 2
    keyboard.image = keyboardSprite

    mouse.x = 620
    mouse.y = 540
    mouse.scaleX = 0.5
    mouse.scaleY = 0.5
    mouse.image = mouseSprite

    backgroundOne.x = 0
    backgroundOne.y = 0
    backgroundOne.scaleX = 1
    backgroundOne.scaleY = 1
    backgroundOne.image = backgroundOneSprite

    playButton.x = 965
    playButton.y = 200
    playButton.width = 220
    playButton.height = 80
    playButton.isPresed = false
    playButton.wasPresed = false
    playButton.textX = 1030
    playButton.textY = 220

    rulesButton.x = 965
    rulesButton.y = 300
    rulesButton.width = 220
    rulesButton.height = 80
    rulesButton.isPresed = false
    rulesButton.wasPresed = false
    rulesButton.textX = 1015
    rulesButton.textY = 320

    creditsButton.x = 965
    creditsButton.y = 400
    creditsButton.width = 220
    creditsButton.height = 80
    creditsButton.isPresed = false
    creditsButton.wasPresed = false
    creditsButton.textX = 995
    creditsButton.textY = 420

    exitButton.x = 965
    exitButton.y = 500
    exitButton.width = 220
    exitButton.height = 80
    exitButton.isPresed = false
    exitButton.wasPresed = false
    exitButton.textX = 1030
    exitButton.textY = 520

end

function menuUpdate(mousePos)
    --Actualizar estado de los botones
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
    --Dibujar background
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(backgroundOne.image, backgroundOne.x, backgroundOne.y, 0, backgroundOne.scaleX, backgroundOne.scaleY)
    love.graphics.draw(computer.image, computer.x, computer.y, 0, computer.scaleX, computer.scaleY)
    love.graphics.draw(keyboard.image, keyboard.x, keyboard.y, 0, keyboard.scaleX, keyboard.scaleY)
    love.graphics.draw(mouse.image, mouse.x, mouse.y, 0, mouse.scaleX, mouse.scaleY)

    --DIbujar titulo
    love.graphics.setColor(0, 1, 0, 1)
    titleText = love.graphics.newText(fontMenu, "Let's")
    love.graphics.draw (titleText, 300, 300)

    titleText = love.graphics.newText(fontMenu, "mine")
    love.graphics.draw (titleText, 300, 350)

    titleText = love.graphics.newText(fontMenu, "crypto!")
    love.graphics.draw (titleText, 300, 400)
    
    --Dibujar botones
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle("fill", playButton.x, playButton.y, playButton.width, playButton.height)
    love.graphics.rectangle("fill", rulesButton.x, rulesButton.y, rulesButton.width, rulesButton.height)
    love.graphics.rectangle("fill", creditsButton.x, creditsButton.y, creditsButton.width, creditsButton.height)
    love.graphics.rectangle("fill", exitButton.x, exitButton.y, exitButton.width, exitButton.height)
   
    --Dibujar texto de botones
    love.graphics.setColor(1, 1, 1, 1)
    playTextDraw = love.graphics.newText(fontMenu, "Play")
    rulesTextDraw = love.graphics.newText(fontMenu, "Rules")
    creditsTextDraw = love.graphics.newText(fontMenu, "Credits")
    exitTextDraw = love.graphics.newText(fontMenu, "Exit")

    love.graphics.draw (playTextDraw, playButton.textX, playButton.textY)
    love.graphics.draw (rulesTextDraw, rulesButton.textX, rulesButton.textY)
    love.graphics.draw (creditsTextDraw, creditsButton.textX, creditsButton.textY)
    love.graphics.draw (exitTextDraw, exitButton.textX, exitButton.textY)
    
end

