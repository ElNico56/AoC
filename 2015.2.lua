-- AoC 2015 Day 2 --

local input = assert(io.open"2015.2.in"):read"*a"

local p1, p2 = 0, 0
for line in input:gmatch"[^\n]+" do
	local w, h, l = line:match"(%d*)x(%d+)x(%d+)"
	local a, b, c = 0, 0, 0
	w = tonumber(w)
	h = tonumber(h)
	l = tonumber(l)
	a, b, c = w * h, h * l, l * w
	p1 = p1 + 2 * a + 2 * b + 2 * c + math.min(a, b, c)
	a, b, c = w + h, h + l, l + w
	p2 = p2 + math.min(2 * a, 2 * b, 2 * c) + w * h * l
end

print("A: "..p1)
print("B: "..p2)
