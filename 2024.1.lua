-- AoC 2024 Day 1 --

local file = assert(io.open("2024.1.in", "r"))
local input = file:read"*a"
file:close()

local p1, p2 = 0, 0
local l, r = {}, {}
for line in input:gmatch"[^\r\n]+" do
	local a, b = line:match"(%d+)%s+(%d+)"
	l[#l+1] = tonumber(b)
	r[#r+1] = tonumber(a)
end

table.sort(l); table.sort(r)

for i = 1, #l do
	p1 = p1 + math.abs(l[i] - r[i])
end

for _, v in ipairs(l) do
	local count = 0
	for _, w in ipairs(r) do
		count = count + (v == w and 1 or 0)
	end
	p2 = p2 + v * count
end

print("A: "..p1)
print("B: "..p2)
