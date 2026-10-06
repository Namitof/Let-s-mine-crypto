require("src/screens/ScreenMenu")
require("src/screens/ScreenGame")
require("src/screens/ScreenManager")
require("src/screens/ScreenCredits")
require("src/screens/ScreenRules")
require("src/screens/ScreenWin")

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

function love.load()
    SetScreen(screen.win)

    love.window.setTitle("Let's mine crypto!")
    love.window.setMode(1280,720)
    width, height = love.graphics.getDimensions( )

    --Inicializacion de escenas
    menuInit(font, backgroundOneImg)
    gameInit(width, height, font, computerImg, keyboardImg, mouseImg, backgroundOneImg, computerBackground)
    creditsInit(font)
    rulesInit(font)
    winInit(font)
end

function love.update(dt)
    --Obtener posicion del mouse
    mousePos.x, mousePos.y = love.mouse.getPosition() 

    --Escenas
    local currentScreen = GetScreen()

    if (currentScreen == screen.menu) then
        menuUpdate(mousePos)

        if (GetScreen() == screen.game) then
            gameInit(width,height,font, computerImg, keyboardImg, mouseImg, backgroundOneImg, computerBackground)
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
        -- VACIO
    elseif (currentScreen == screen.exit) then
        love.quit()
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
        -- VACIO
    end
end

function love.quit()
    font = nil
    collectgarbage("collect")
    love.window.close()
end