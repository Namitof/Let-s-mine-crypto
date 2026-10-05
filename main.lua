require("src/screens/ScreenMenu")
require("src/screens/ScreenGame")
require("src/screens/ScreenManager")
require("src/screens/ScreenCredits")

local mousePos = {
    x = 0,
    y = 0
}

--Recursos
    local font = love.graphics.newFont("res/font/VCR_OSD_MONO_1.001.ttf", 40)

function love.load()
    SetScreen(screen.menu)

    love.window.setTitle("Let's mine crypto!")
    love.window.setMode(1280,720)
    width, height = love.graphics.getDimensions( )

    --Inicializacion de escenas
    menuInit(font)
    gameInit(width,height,font)
    creditsInit(font)
end

function love.update(dt)
    --Obtener posicion del mouse
    mousePos.x, mousePos.y = love.mouse.getPosition() 

    --Escenas
    if (GetScreen() == screen.menu) then
        menuUpdate(mousePos)

        if (GetScreen() == screen.game) then
            gameInit(width,height,font)
        end

    elseif (GetScreen() == screen.game) then
        gameUpdate(dt, mousePos)
    elseif (GetScreen() == screen.rules) then
        --VACIO
    elseif (GetScreen() == screen.credits) then
        creditsUpdate()
        --VACIO
    elseif (GetScreen() == screen.exit) then
        love.quit()
    end
end

function love.draw()

    --Escenas
    if (GetScreen() == screen.menu) then
        menuDraw()
    elseif (GetScreen() == screen.game) then
        gameDraw()
    elseif (GetScreen() == screen.rules) then
        --VACIO
    elseif (GetScreen() == screen.credits) then
        creditsDraw()
        --VACIO
    end
end

function love.quit()
    font = nil
    collectgarbage("collect")
    love.window.close()
end