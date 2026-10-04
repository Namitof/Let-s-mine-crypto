

function CheckEnergy(energy, stats, dt)
    if (energy.count >= energy.time) then
       stats.energy = stats.energy + energy.addEnergy
       energy.count = 0
    else
        energy.count = energy.count + dt
    end
end