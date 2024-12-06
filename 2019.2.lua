-- AoC 2019 day 2 --

local input = io.open"2019.2.in":read"*a"


local function run(program, noun, verb)
	local mem, pc, i = {}, 0, 0
	for num in program:gmatch"%d+" do
		mem[i] = tonumber(num); i = i + 1
	end
	mem[1] = noun
	mem[2] = verb
	while true do
		local opcode = mem[pc]
		local a, b, c = mem[pc + 1], mem[pc + 2], mem[pc + 3]
		if opcode == 99 then
			break
		elseif opcode == 1 then
			mem[c] = mem[a] + mem[b]
			pc = pc + 4
		elseif opcode == 2 then
			mem[c] = mem[a] * mem[b]
			pc = pc + 4
		end
	end
	return mem[0]
end

local p1, p2 = run(input, 12, 2), 0
for noun = 0, 99 do
	for verb = 0, 99 do
		if run(input, noun, verb) == 19690720 then
			p2 = 100 * noun + verb
			break
		end
	end
end

print("A: "..p1)
print("B: "..p2)
