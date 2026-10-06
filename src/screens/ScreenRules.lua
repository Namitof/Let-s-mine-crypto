require("src/objects/Button")

local fontRules

local backButton = {
    x = 530,
    y = 600,
    width = 250,
    height = 70,
    scaleX = 0.83,
    scaleY = 0.6,
    image = 0,
    isPresed = false,
    wasPresed = false,
    textX = 610,
    textY = 615
}

function rulesInit(font, buttonImgSprite)
    --Recursos
    fontRules = font

    --Usar la funcion buttonInit
    backButton.x = 530
    backButton.y = 600
    backButton.width = 250
    backButton.height = 70
    backButton.scaleX = 0.85
    backButton.scaleY = 0.6
    backButton.image = buttonImgSprite
    backButton.isPresed = false
    backButton.wasPresed = false
    backButton.textX = 610
    backButton.textY = 615
end

function rulesUpdate(mousePos)
    --Actualizar estado de los botones
    backButton.wasPresed = backButton.isPresed

    CheckButton(backButton, mousePos)

    if (not backButton.isPresed and backButton.wasPresed) then
        SetScreen(screen.menu)
    end
end

function rulesDraw()
    --Dibujar reglas
    love.graphics.setBackgroundColor(0.2, 0.2, 0.2)
    love.graphics.setColor(0, 1, 0, 1)

    rulesTextDraw1 =  love.graphics.newText(fontRules, "Click the keyboard and mouse to mine crypto,")
    love.graphics.draw (rulesTextDraw1, 150, 50)

    rulesTextDraw2 =  love.graphics.newText(fontRules, "buy upgrades to reach 1,000 crypto.")
    love.graphics.draw (rulesTextDraw2, 150, 100)

    rulesTextDraw3 =  love.graphics.newText(fontRules, "But WATCH OUT!!!")
    love.graphics.draw (rulesTextDraw3, 150, 200)

    rulesTextDraw3 =  love.graphics.newText(fontRules, "be careful not to use up all your energy.")
    love.graphics.draw (rulesTextDraw3, 150, 250)

    rulesTextStoreRam = love.graphics.newText(fontRules, "RAM = 10 crypto")
    love.graphics.draw (rulesTextStoreRam, 150, 330)

    rulesTextStoreCPU = love.graphics.newText(fontRules, "CPU = 20 crypto")
    love.graphics.draw (rulesTextStoreCPU, 150, 380)

    rulesTextStoreGPU = love.graphics.newText(fontRules, "GPU = 30 crypto")
    love.graphics.draw (rulesTextStoreGPU, 150, 430)

    rulesTextStoreEnergy = love.graphics.newText(fontRules, "Energy = 50 crypto")
    love.graphics.draw (rulesTextStoreEnergy, 150, 480)

    --Dibujar botones
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(backButton.image, backButton.x, backButton.y, 0, backButton.scaleX, backButton.scaleY)
    
    --Texto boton
    backButtonTextDraw = love.graphics.newText(fontRules, "BACK")
    love.graphics.draw (backButtonTextDraw, backButton.textX, backButton.textY)
    
end
