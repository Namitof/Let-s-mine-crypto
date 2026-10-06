require("src/objects/Button")

local fontWin

local exitWinButton = {
    x = 500,
    y = 550,
    width = 220,
    height = 80,
    isPresed = false,
    wasPresed = false,
    textX = 565,
    textY = 570,
    scaleX = 1,
    scaleY = 1,
    image = 0
}

local winBackground = {
    x = 0,
    y = 0,
    scaleX = 1,
    scaleY = 1,
    image = 0
}


function winInit(font, winBackgroundSprite, buttonImgSprite)
    fontWin = font

    --Recursos
    winBackground.x = 0
    winBackground.y = 0
    winBackground.scaleX = 1
    winBackground.scaleY = 1
    winBackground.image = winBackgroundSprite

    --Usar la funcion buttonInit
    exitWinButton.x = 500
    exitWinButton.y = 550
    exitWinButton.width = 220
    exitWinButton.height = 80
    exitWinButton.isPresed = false
    exitWinButton.wasPresed = false
    exitWinButton.textX = 580
    exitWinButton.textY = 570
    exitWinButton.scaleX = 0.83
    exitWinButton.scaleY = 0.7
    exitWinButton.image = buttonImgSprite
end

function winUpdate(mousePos)
    exitWinButton.wasPresed = exitWinButton.isPresed

    CheckButton(exitWinButton, mousePos)

    if (not exitWinButton.isPresed and exitWinButton.wasPresed) then
        SetScreen(screen.menu)
    end
end

function winDraw()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(winBackground.image, winBackground.x, winBackground.y, 0, winBackground.scaleX, winBackground.scaleY)
   
    love.graphics.draw(exitWinButton.image, exitWinButton.x, exitWinButton.y, 0, exitWinButton.scaleX, exitWinButton.scaleY)
    
    exitWinTextDraw = love.graphics.newText(fontWin, "BACK")
    love.graphics.draw (exitWinTextDraw, exitWinButton.textX, exitWinButton.textY)
   
end

