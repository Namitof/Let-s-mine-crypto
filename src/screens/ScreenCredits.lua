require("src/objects/Button")

local fontCredits

local backButton = {
    x = 0,
    y = 0,
    width = 110,
    height = 50,
    isPresed = false,
    wasPresed = false
}

function creditsInit(font)
    --Recursos
    fontCredits = font

    backButton.x = 0
    backButton.y = 0
    backButton.width = 110
    backButton.height = 50
    backButton.isPresed = false
    backButton.wasPresed = false
end

function creditsUpdate(mousePos)
    --Actualizar estado de botones
    backButton.wasPresed = backButton.isPresed

    CheckButton(backButton, mousePos)

    if (not backButton.isPresed and backButton.wasPresed) then
        SetScreen(screen.menu)
    end
end

function creditsDraw()
    --Dibujar creditos
    love.graphics.setColor(1, 0, 0, 1)
    creditsTextDraw = love.graphics.newText(fontCredits, "Let's mine crypto!")
    creditsTextGameDevelopment = love.graphics.newText(fontCredits, "Game Development by:")
    creditsTextGameDeveloper1 = love.graphics.newText(fontCredits, "Mercedes Ramirez Diaz")
    creditsTextGameDeveloper2 = love.graphics.newText(fontCredits, "Nahuel Suarez")
    creditsTextArt = love.graphics.newText(fontCredits, "Art by:")
    creditsTextArtBy1 = love.graphics.newText(fontCredits, "Mercedes Ramirez Diaz")
    creditsTextArtBy2 = love.graphics.newText(fontCredits, "Nahuel Suarez")

    love.graphics.draw (creditsTextDraw, 420, 50)
    love.graphics.draw (creditsTextGameDevelopment, 400, 110)
    love.graphics.draw (creditsTextGameDeveloper1, 400, 160)
    love.graphics.draw (creditsTextGameDeveloper2, 400, 200)
    love.graphics.draw (creditsTextArt, 400, 260)
    love.graphics.draw (creditsTextArtBy1, 400, 310)
    love.graphics.draw (creditsTextArtBy2, 400, 360)

    --Dibujar botones
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.rectangle("line", backButton.x, backButton.y, backButton.width, backButton.height)

end
