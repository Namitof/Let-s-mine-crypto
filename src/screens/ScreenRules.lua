require("src/objects/Button")

local fontRules

local backButton = {
    x = 500,
    y = 600,
    width = 110,
    height = 50,
    isPresed = false,
    wasPresed = false
}

function rulesInit(font)
    --Recursos
    fontRules = font

    --Usar la funcion buttonInit
    backButton.x = 590
    backButton.y = 600
    backButton.width = 110
    backButton.height = 50
    backButton.isPresed = false
    backButton.wasPresed = false
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

    --Dibujar botones
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.rectangle("line", backButton.x, backButton.y, backButton.width, backButton.height)

end
