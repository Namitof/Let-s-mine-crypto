

function CheckPowerUp(powerUp, stats, dt)
    if (powerUp.count >= powerUp.time) then

        if (powerUp.isEquiped) then
            stats.coins = stats.coins + powerUp.addCoins
            powerUp.count = 0
        end
        
    else
        powerUp.count = powerUp.count + dt
    end
end

