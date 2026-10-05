require("src/objects/Button")

local fontRules

local backButton = {
    x = 0,
    y = 0,
    width = 110,
    height = 50,
    isPresed = false,
    wasPresed = false
}

function rulesInit(font)
    fontRules = font
end

function rulesUpdate(mousePos)
    backButton.wasPresed = backButton.isPresed

    CheckButton(backButton, mousePos)

    if (not backButton.isPresed and backButton.wasPresed) then
        SetScreen(screen.menu)
    end
end

function rulesDraw()
    love.graphics.setColor(1, 0, 0, 1)
    --rulesTextDraw =  love.graphics.newText(fontCredits, "Let's mine crypto!")
   
    love.graphics.draw (rulesTextDraw, 420, 50)

    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.rectangle("line", backButton.x, backButton.y, backButton.width, backButton.height)

end
