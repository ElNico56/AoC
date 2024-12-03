-- AoC 2015 Day 1 --

local input = assert(io.open"2015.1.in"):read"*a"

local p1, p2 = 0, nil
for i, char in input:gmatch"()(.)" do
	if char == "(" then p1 = p1 + 1 end
	if char == ")" then p1 = p1 - 1 end
	if p1 < 0 and not p2 then
		p2 = i
	end
end

print("A: "..p1)
print("B: "..p2)
