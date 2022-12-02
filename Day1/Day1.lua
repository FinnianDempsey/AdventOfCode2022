#!/usr/local/bin/lua

local function read_array(file)
    local arr = {}
    local handle  = assert( io.open(file,"r") )
    local value = handle:read("*line")
    while value do
      table.insert( arr, value )
      value = handle:read("*line")
    end
    handle:close()
    return arr
  end

      
local fileContent = read_array("./data");

local sum = 0
local sums = {}

for i = 1, #fileContent do
    local number = tonumber(fileContent[i])

    if number then
        sum = sum + number
        print(number)
    else 
        print("------")
        table.insert(sums, sum)
        sum = 0
    end 
    

end
print("------")

table.sort(sums)

print(string.format("1st = %s\n2nd = %s\n3rd = %s", sums[#sums], sums[#sums-1], sums[#sums-2]))




