--dumper
--by Alex_Marques

local im = peripheral.find("inventoryManager")
local chatBox = peripheral.find("chatBox")
local filter,match = false,false
local tagFilter = {"forge:ores","forge:raw_materials"}

print("Running dumper...")

local function chatListener()
    while true do
        local event, name, message = os.pullEvent("chat")
        if message:lower() == "ore on" then
            chatBox.sendMessageToPlayer("ORE ON",name)
            filter = true
        elseif message:lower() == "ore off" then
            chatBox.sendMessageToPlayer("ORE OFF",name)
            filter = false
        end
    end
end

local function pushItems()
    while true do
        if filter then
            myInv = im.getItems()
            for slot, item in pairs(myInv) do
                for _, tag in pairs(item.tags) do
                    for k,v in pairs(tagFilter) do
                        if string.find(tag,v) then
                            match = true
                            break
                        end
                    end
                    if match == true then break end
                end
                if match == true then
                    print(item.name .. " : " .. item.count)
                    im.removeItemFromPlayer("up",{name=item.name, slot=item.slot, count=item.count})
                    match = false
                    os.sleep(1)
                end
            end
        end
        os.sleep(5)
    end
end

parallel.waitForAny(chatListener, pushItems)
