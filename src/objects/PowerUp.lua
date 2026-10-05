
function PowerUpInit(powerUp, count, time, addCoins, isEquiped, quantity)
    powerUp.count = count
    powerUp.time = time
    powerUp.addCoins = addCoins
    powerUp.isEquiped = isEquiped
    powerUp.quantity = quantity
end

function CheckPowerUp(powerUp, stats, dt)
    if (powerUp.isEquiped) then
        if (powerUp.count >= powerUp.time) then
                stats.coins = stats.coins + powerUp.addCoins
                powerUp.count = 0
        else
            powerUp.count = powerUp.count + dt
        end
    end
end

