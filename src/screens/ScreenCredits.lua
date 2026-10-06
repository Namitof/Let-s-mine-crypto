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

    creditsTextArtBy3 = love.graphics.newText(fontCredits, "Font:")
    creditsTextArtBy4 = love.graphics.newText(fontCredits, "VCR_OSD_MONO_1.001.ttf by Riciery Leal")
    creditsTextArtBy5 = love.graphics.newText(fontCredits, "https://www.dafont.com/es/vcr-osd-mono.font")

    love.graphics.draw (creditsTextDraw, 420, 30)
    love.graphics.draw (creditsTextGameDevelopment, 400, 100)
    love.graphics.draw (creditsTextGameDeveloper1, 400, 145)
    love.graphics.draw (creditsTextGameDeveloper2, 400, 190)
    love.graphics.draw (creditsTextArt, 400, 250)
    love.graphics.draw (creditsTextArtBy1, 400, 295)
    love.graphics.draw (creditsTextArtBy2, 400, 340)

    love.graphics.draw (creditsTextArtBy3, 600, 400)
    love.graphics.draw (creditsTextArtBy4, 250, 445)
    love.graphics.draw (creditsTextArtBy5, 195, 490)

    
    --Dibujar botones
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(backButton.image, backButton.x, backButton.y, 0, backButton.scaleX, backButton.scaleY)
    
    --Texto boton
    backButtonTextDraw = love.graphics.newText(fontCredits, "BACK")
    love.graphics.draw (backButtonTextDraw, backButton.textX, backButton.textY)
    
    
end
