local fontCredits

function creditsInit(font)
    fontCredits = font
end

function creditsUpdate()

end

function creditsDraw()
   love.graphics.setColor(1, 0, 0, 1)
   creditsTextDraw = love.graphics.newText(fontCredits, "Let's mine crypto!")
   
    love.graphics.draw (creditsTextDraw, 50, 50)
end
