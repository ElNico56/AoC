-- AoC 2015 Day 2 --

local file = assert(io.open("2015.2.in", "r"))
local input = file:read"*a"
file:close()

local p1, p2 = 0, 0
for line in input:gmatch"[^\n]+" do
	local w, h, l = line:match"(%d*)x(%d+)x(%d+)"
	local a, b, c = 0, 0, 0
	w = tonumber(w)
	h = tonumber(h)
	l = tonumber(l)
	a, b, c = l * w, w * h, h * l
	p1 = p1 + 2 * a + 2 * b + 2 * c + math.min(a, b, c)
	a, b, c = 2 * w, 2 * h, 2 * l
	p2 = p2 + math.min(a + b, b + c, c + a) + w * h * l
end

print("A: "..p1)
print("B: "..p2)
