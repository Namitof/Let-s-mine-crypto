require("src/objects/Button")

local fontDefeat

local exitDefeatButton = {
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

local defeatBackground = {
    x = 0,
    y = 0,
    scaleX = 1,
    scaleY = 1,
    image = 0
}


function defeatInit(font, defeatBackgroundSprite, buttonImgSprite)
    fontDefeat = font

    --Recursos
    defeatBackground.x = 0
    defeatBackground.y = 0
    defeatBackground.scaleX = 1
    defeatBackground.scaleY = 1
    defeatBackground.image = defeatBackgroundSprite

    --Usar la funcion buttonInit
    exitDefeatButton.x = 500
    exitDefeatButton.y = 550
    exitDefeatButton.width = 220
    exitDefeatButton.height = 80
    exitDefeatButton.isPresed = false
    exitDefeatButton.wasPresed = false
    exitDefeatButton.textX = 580
    exitDefeatButton.textY = 570
    exitDefeatButton.scaleX = 0.83
    exitDefeatButton.scaleY = 0.7
    exitDefeatButton.image = buttonImgSprite
end

function defeatUpdate(mousePos)
    exitDefeatButton.wasPresed = exitDefeatButton.isPresed

    CheckButton(exitDefeatButton, mousePos)

    if (not exitDefeatButton.isPresed and exitDefeatButton.wasPresed) then
        SetScreen(screen.menu)
    end
end

function defeatDraw()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(defeatBackground.image, defeatBackground.x, defeatBackground.y, 0, defeatBackground.scaleX, defeatBackground.scaleY)
   
    love.graphics.draw(exitDefeatButton.image, exitDefeatButton.x, exitDefeatButton.y, 0, exitDefeatButton.scaleX, exitDefeatButton.scaleY)
    
    exitDefeatTextDraw = love.graphics.newText(fontDefeat, "BACK")
    love.graphics.draw (exitDefeatTextDraw, exitDefeatButton.textX, exitDefeatButton.textY)
   
end
