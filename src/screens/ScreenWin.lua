require("src/objects/Button")

local fontWin

local exitWinButton = {
    x = 500,
    y = 500,
    width = 220,
    height = 80,
    isPresed = false,
    wasPresed = false,
    textX = 565,
    textY = 520
}

function winInit(font)
    fontWin = font

    --Usar la funcion buttonInit
    exitWinButton.x = 500
    exitWinButton.y = 500
    exitWinButton.width = 220
    exitWinButton.height = 80
    exitWinButton.isPresed = false
    exitWinButton.wasPresed = false
    exitWinButton.textX = 565
    exitWinButton.textY = 520
end

function winUpdate(mousePos)
    exitWinButton.wasPresed = exitWinButton.isPresed

    CheckButton(exitWinButton, mousePos)

    if (not exitWinButton.isPresed and exitWinButton.wasPresed) then
        SetScreen(screen.menu)
    end
end

function winDraw()
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.rectangle("line", exitWinButton.x, exitWinButton.y, exitWinButton.width, exitWinButton.height)
    
    exitWinTextDraw = love.graphics.newText(fontWin, "Exit")
    love.graphics.draw (exitWinTextDraw, exitWinButton.textX, exitWinButton.textY)
end

