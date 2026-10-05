local fontRules

function rulesInit(font)
    fontRules = font
end

function rulesUpdate()
end

function rulesDraw()
    love.graphics.setColor(1, 0, 0, 1)
    rulesTextDraw =  love.graphics.newText(fontCredits, "Let's mine crypto!")
   
    love.graphics.draw (rulesTextDraw, 420, 50)
end
