-- AoC 2024 day 3 --

local input = assert(io.open"2024.3.in"):read"*all"
-- local input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

local ans = 0
input = input..string.rep(" ", 12)
local enabled = true
for i = 1, #input - 12 do
	local str = input:sub(i, i + 12)
	if str:match"^don't%(%)" then
		enabled = false
	end
	if str:match"^do%(%)" then
		enabled = true
	end
	if str:match"^mul%(%d+,%d+%)" and enabled then
		local a, b = str:match"^mul%((%d+),(%d+)%)"
		a, b = tonumber(a), tonumber(b)
		ans = ans + a * b
	end
end
print(ans)
