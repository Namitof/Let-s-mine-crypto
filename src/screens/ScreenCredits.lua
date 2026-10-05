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

    love.graphics.draw (creditsTextDraw, 60, 50)
    love.graphics.draw (creditsTextGameDevelopment, 50, 100)
    love.graphics.draw (creditsTextGameDeveloper1, 50, 130) --x, y
    love.graphics.draw (creditsTextGameDeveloper2, 30, 160) 
    love.graphics.draw (creditsTextArt, 60, 190)
    love.graphics.draw (creditsTextArtBy, 50, 220)
end
