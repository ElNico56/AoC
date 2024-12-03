-- AoC 2024 day 3 --

local input = assert(io.open"2024.3.in"):read"*a"

local p1, p2 = 0, 0
local enabled = true

for command in input:gmatch"[%w']+%(%d*,?%d*%)" do
	if command:match"do%(%)" then
		enabled = true
	elseif command:match"don't%(%)" then
		enabled = false
	elseif command:match"mul%(%d+,%d+%)" then
		local a, b = command:match"mul%((%d+),(%d+)%)"
		a, b = tonumber(a), tonumber(b)
		p1 = p1 + a * b
		p2 = p2 + (enabled and a * b or 0)
	end
end

print("A: "..p1)
print("B: "..p2)
