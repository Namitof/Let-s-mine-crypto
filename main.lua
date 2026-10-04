require("src/screens/ScreenMenu")
require("src/screens/ScreenGame")
require("src/screens/ScreenManager")

local mousePos = {
    x = 0,
    y = 0
}

function love.load()
    SetScreen(screen.menu)
    
    love.window.setTitle("Let's mine crypto!")
    love.window.setMode(1280,720)
    width, height = love.graphics.getDimensions( )

    --Recursos
    local font = love.graphics.newFont("res/font/VCR_OSD_MONO_1.001.ttf", 30)

    --Inicializacion de escenas
    menuInit(font)
    gameInit(width,height,font)
end

function love.update(dt)
    --Obtener posicion del mouse
    mousePos.x, mousePos.y = love.mouse.getPosition() 

    --Escenas
    if (GetScreen() == screen.menu) then
        menuUpdate(mousePos)
    elseif (GetScreen() == screen.game) then
        gameUpdate(dt, mousePos)
    elseif (GetScreen() == screen.exit) then
        love.window.close()
    end
end

function love.draw()

    --Escenas
    if (GetScreen() == screen.menu) then
        menuDraw()
    elseif (GetScreen() == screen.game) then
        gameDraw()
    end
end