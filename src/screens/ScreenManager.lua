
screen =  {
    menu = 0,
    game = 1,
    rules = 2,
    credits = 3,
    win = 4,
    defeat = 5,
    exit = 6
}

local currentScreen = 0

function GetScreen()
    return currentScreen
end

function SetScreen(newScreen)
    currentScreen = newScreen
end