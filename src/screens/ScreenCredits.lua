local fontCredits

function creditsInit(font)
    fontCredits = font
end

function creditsUpdate()

end

function creditsDraw()
    love.graphics.setColor(1, 0, 0, 1)
    creditsTextDraw = love.graphics.newText(fontCredits, "Let's mine crypto!")
    creditsTextGameDevelopment = love.graphics.newText(fontCredits, "Game Development by:")
    creditsTextGameDeveloper1 = love.graphics.newText(fontCredits, "Nahuel Suarez")
    creditsTextGameDeveloper2 = love.graphics.newText(fontCredits, "Mercedes Ramirez Diaz")
    creditsTextArt = love.graphics.newText(fontCredits, "Art by:")
    creditsTextArtBy = love.graphics.newText(fontCredits, "Mercedes Ramirez Diaz")

    love.graphics.draw (creditsTextDraw, 420, 50)
    love.graphics.draw (creditsTextGameDevelopment, 400, 110)
    love.graphics.draw (creditsTextGameDeveloper1, 400, 160) --x, y
    love.graphics.draw (creditsTextGameDeveloper2, 400, 200) 
    love.graphics.draw (creditsTextArt, 400, 260)
    love.graphics.draw (creditsTextArtBy, 400, 310)
end
