
screen =  {
    menu = 0,
    game = 1,
    exit = 2,
}

local currentScreen = 0

function GetScreen()
    return currentScreen
end

function SetScreen(newScreen)
    currentScreen = newScreen
end