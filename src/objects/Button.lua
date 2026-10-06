
local BUTTON_WIDTH = 250
local BUTTON_HEIGTH = 70

local CLICKER_WIDTH = 670
local CLICKER_HEIGTH = 80

function ButtonClickerInit(button, x, y)
    button.x = x
    button.y = y
    button.width = CLICKER_WIDTH
    button.height = CLICKER_HEIGTH
    button.isPresed = false
    button.wasPresed = false
end

function ButtonInit(button, x, y)
    button.x = x
    button.y = y
    button.width = BUTTON_WIDTH
    button.height = BUTTON_HEIGTH
    button.isPresed = false
    button.wasPresed = false
end

function IsMouseOnButton(button, mousePos)
    if ((mousePos.x >= button.x and mousePos.x <= button.x + button.width) and 
    (mousePos.y >= button.y and mousePos.y <= button.y + button.height)) then
        return true
    end
    return false
end

function CheckButton(button, mousePos)
    if (IsMouseOnButton(button, mousePos) and love.mouse.isDown(1)) then
        button.isPresed = true
    else
        button.isPresed = false
    end
end
