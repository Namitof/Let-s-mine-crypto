require("src/objects/Button")

local fontCredits

local backButton = {
    x = 530,
    y = 600,
    width = 250,
    height = 70,
    isPresed = false,
    wasPresed = false,
    textX = 610,
    textY = 615
}

function creditsInit(font, buttonImgSprite)
    --Recursos
    fontCredits = font

    backButton.x = 530
    backButton.y = 600
    backButton.scaleX = 0.83
    backButton.scaleY = 0.6
    backButton.image = buttonImgSprite
    backButton.width = 250
    backButton.height = 70
    backButton.isPresed = false
    backButton.wasPresed = false
    backButton.textX = 610
    backButton.textY = 615
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
    love.graphics.setBackgroundColor(0.2, 0.2, 0.2)
    love.graphics.setColor(0, 1, 0, 1)
    creditsTextDraw = love.graphics.newText(fontCredits, "Let's mine crypto!")
    creditsTextGameDevelopment = love.graphics.newText(fontCredits, "Game Development by:")
    creditsTextGameDeveloper1 = love.graphics.newText(fontCredits, "Mercedes Ramirez Diaz")
    creditsTextGameDeveloper2 = love.graphics.newText(fontCredits, "Nahuel Suarez")
    creditsTextArt = love.graphics.newText(fontCredits, "Art by:")
    creditsTextArtBy1 = love.graphics.newText(fontCredits, "Mercedes Ramirez Diaz")
    creditsTextArtBy2 = love.graphics.newText(fontCredits, "Nahuel Suarez")

    love.graphics.draw (creditsTextDraw, 420, 50)
    love.graphics.draw (creditsTextGameDevelopment, 400, 150)
    love.graphics.draw (creditsTextGameDeveloper1, 400, 195)
    love.graphics.draw (creditsTextGameDeveloper2, 400, 240)
    love.graphics.draw (creditsTextArt, 400, 300)
    love.graphics.draw (creditsTextArtBy1, 400, 345)
    love.graphics.draw (creditsTextArtBy2, 400, 390)
    
    --Dibujar botones
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(backButton.image, backButton.x, backButton.y, 0, backButton.scaleX, backButton.scaleY)
    
    --Texto boton
    backButtonTextDraw = love.graphics.newText(fontCredits, "BACK")
    love.graphics.draw (backButtonTextDraw, backButton.textX, backButton.textY)
    
    
end
