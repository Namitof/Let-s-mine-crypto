
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
