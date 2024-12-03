-- AoC 2024 day 3 --

local input = assert(io.open"2024.3.in"):read"*a"
input = input..string.rep(" ", 12)

local p1, p2 = 0, 0
local enabled = true
for i = 1, #input - 12 do
	local str = input:sub(i, i + 12)
	if str:match"^don't%(%)" then
		enabled = false
	elseif str:match"^do%(%)" then
		enabled = true
	elseif str:match"^mul%(%d+,%d+%)" then
		local a, b = str:match"^mul%((%d+),(%d+)%)"
		a, b = tonumber(a), tonumber(b)
		p1 = p1 + a * b
		if enabled then p2 = p2 + a * b end
	end
end

print("A: "..p1)
print("B: "..p2)
