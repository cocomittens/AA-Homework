def sluggish_octopus(fish)
    sorted = false
    until sorted
        sorted = true
        fish.each_index do |i|
            if i+1 < fish.length
                if fish[i].length > fish[i+1].length
                    fish[i], fish[i+1] = fish[i+1], fish[i]
                    sorted = false
                end
            end
        end
    end
    fish[-1]
end