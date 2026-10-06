require("src/screens/ScreenMenu")
require("src/screens/ScreenGame")
require("src/screens/ScreenManager")
require("src/screens/ScreenCredits")
require("src/screens/ScreenRules")
require("src/screens/ScreenWin")
require("src/screens/ScreenDefeat")

local mousePos = {
    x = 0,
    y = 0
}

--Recursos
local font = love.graphics.newFont("res/font/VCR_OSD_MONO_1.001.ttf", 40)
local computerImg = love.graphics.newImage("res/gameImg/Computer.png")
local keyboardImg = love.graphics.newImage("res/gameImg/Keyboard.png")
local mouseImg = love.graphics.newImage("res/gameImg/Mouse.png")
local backgroundOneImg = love.graphics.newImage("res/background/backgroundOne.png")
local computerBackground = love.graphics.newImage("res/gameImg/computerBackground.png")
local buttonImg = love.graphics.newImage("res/button/Button.png")
local backgroundWin = love.graphics.newImage("res/background/WinBackground.png")
local backgroundDefeat = love.graphics.newImage("res/background/DefeatBackground.png")

function love.load()
    SetScreen(screen.menu)

    love.window.setTitle("Let's mine crypto!")
    love.window.setMode(1280,720)
    width, height = love.graphics.getDimensions()

    --Inicializacion de escenas
    menuInit(font, computerImg, keyboardImg, mouseImg, backgroundOneImg)
    gameInit(width, height, font, computerImg, keyboardImg, mouseImg, backgroundOneImg, computerBackground, buttonImg)
    creditsInit(font, buttonImg)
    rulesInit(font, buttonImg)
    winInit(font, backgroundWin, buttonImg)
    defeatInit(font, backgroundDefeat, buttonImg)
end

function love.update(dt)
    --Obtener posicion del mouse 
    mousePos.x, mousePos.y = love.mouse.getPosition() 

    --Escenas
    local currentScreen = GetScreen()

    if (currentScreen == screen.menu) then
        menuUpdate(mousePos)

        if (GetScreen() == screen.game) then
            gameInit(width,height,font, computerImg, keyboardImg, mouseImg, backgroundOneImg, computerBackground, buttonImg)
        end

    elseif (currentScreen == screen.game) then
        gameUpdate(dt, mousePos)
    elseif (currentScreen == screen.rules) then
        rulesUpdate(mousePos)
    elseif (currentScreen == screen.credits) then
        creditsUpdate(mousePos)
    elseif (currentScreen == screen.win) then
        winUpdate(mousePos)
    elseif (currentScreen == screen.defeat) then
        defeatUpdate(mousePos)
    elseif (currentScreen == screen.exit) then
        love.event.quit()
    end
end

function love.draw()
    --Escenas
    local currentScreen = GetScreen()

    if (currentScreen == screen.menu) then
        menuDraw()
    elseif (currentScreen == screen.game) then
        gameDraw()
    elseif (currentScreen == screen.rules) then
        rulesDraw()
    elseif (currentScreen == screen.credits) then
        creditsDraw()
    elseif (currentScreen == screen.win) then
        winDraw()
    elseif (currentScreen == screen.defeat) then
        defeatDraw()
    end
end

function love.quit()
    font = nil
    computerImg = nil
    keyboardImg = nil
    mouseImg = nil
    backgroundOneImg = nil
    computerBackground = nil
    buttonImg = nil
    backgroundWin = nil
    backgroundDefeat = nil
    collectgarbage("collect")
    love.window.close()
end