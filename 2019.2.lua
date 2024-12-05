-- AoC 2019 day 2 --

local input = io.open"2019.2.in":read"*a"

local mem = {}
for num in input:gmatch"%d+" do mem[#mem+1] = tonumber(num) end

mem[2] = 12; mem[3] = 2

local pc = 1
while true do
	local opcode = mem[pc]
	if opcode == 99 then break end
	if opcode == 1 then
		local a, b, c = mem[pc + 1], mem[pc + 2], mem[pc + 3]
		mem[c + 1] = mem[a + 1] + mem[b + 1]
	end
	if opcode == 2 then
		local a, b, c = mem[pc + 1], mem[pc + 2], mem[pc + 3]
		mem[c + 1] = mem[a + 1] * mem[b + 1]
	end
	pc = pc + 4
end

print("A: "..mem[1])
