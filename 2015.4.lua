-- AoC 2015 Day 4 --

local md5 = require"md5"
local input = assert(io.open"2015.4.in"):read"*a"

local p1 = 0
while true do
	local hash = md5.sumhexa(input..p1)
	if hash:sub(1, 5) == "00000" then
		break
	end
	p1 = p1 + 1
end

local p2 = 0
while true do
	local hash = md5.sumhexa(input..p2)
	if hash:sub(1, 6) == "000000" then
		break
	end
	p2 = p2 + 1
end

print("A: "..p1)
print("A: "..p2)
