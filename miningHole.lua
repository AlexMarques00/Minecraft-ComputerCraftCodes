function refueling()
    print("Refueling...")
    fuel = turtle.getFuelLevel()
    for i = 1, 16, 1 do
        turtle.select(i)
        turtle.refuel()
        if fuel < turtle.getFuelLevel() then
            i = 16
            print("Fuel level: " .. fuel)
        end
    end
    if fuel >= turtle.getFuelLevel() then
        print("No flammables found")
    end
    fuel = turtle.getFuelLevel()
end

function goingBack()
    fuel = turtle.getFuelLevel()
    if fuel < 50 then
        refueling()
        fuel = turtle.getFuelLevel()
        if fuel < 5 then
            print("Fuel's up")
        end
    end
    turtle.dig()
    turtle.forward()
    print("Going up...")
    for i = x, 65, 1 do
        turtle.digUp()
        turtle.up()
        fuel = turtle.getFuelLevel()
        if fuel < 50 then
            refueling()
            fuel = turtle.getFuelLevel()
            if fuel < 5 then
                print("Fuel's up")
            end
        end
    end
end

function mining()
    x = 0
    fuel = turtle.getFuelLevel()
    print("Fuel level: " .. fuel)
    print("Mining...")
    for i = 65, 16, -1 do
        if fuel < 50 then
            refueling()
            fuel = turtle.getFuelLevel()
            if fuel < 50 then
                x = i - 1
                i = 16
            end
        end
        turtle.digDown()
        turtle.down()
        fuel = turtle.getFuelLevel()
        if fuel < 5 then
            print("Fuel's up")
        end
        x = i
    end
    goingBack()
end

for i = 0, 5, 1 do
    
end