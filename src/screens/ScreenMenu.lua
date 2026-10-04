require("src/objects/Button")

local playButton = {
    x = 100,
    y = 50,
    width = 110,
    height = 50,
    isPresed = false,
    wasPresed = false
}

local fontMenu

function menuInit(font)
    fontMenu = font
end

function menuUpdate(mousePos)

    playButton.wasPresed = playButton.isPresed

    CheckButton(playButton, mousePos)

    if (not playButton.isPresed and playButton.wasPresed) then
        SetScreen(screen.game)
    end


end

function menuDraw()
    love.graphics.rectangle("fill", playButton.x, playButton.y, playButton.width, playButton.height)

    love.graphics.setColor(1, 0, 0, 1)
    coinsTextDraw = love.graphics.newText(fontMenu, "Let's mine crypto!")

    love.graphics.draw (coinsTextDraw, 50, 50)
end

