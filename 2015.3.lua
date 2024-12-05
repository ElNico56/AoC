-- AoC 2015 Day 3 --

local input = assert(io.open"2015.3.in"):read"*a"
local homes

local x, y = 0, 0
local p1 = 1
homes = {[0] = {[0] = true}}
for char in input:gmatch"." do
	if char == "^" then y = y + 1 end
	if char == ">" then x = x + 1 end
	if char == "v" then y = y - 1 end
	if char == "<" then x = x - 1 end
	homes[x] = homes[x] or {}
	if not homes[x][y] then p1 = p1 + 1 end
	homes[x][y] = true
end

local xs, ys, xr, yr = 0, 0, 0, 0
local p2 = 1
homes = {[0] = {[0] = true}}
for cs, cr in input:gmatch"(.)(.)" do
	if cs == "^" then ys = ys + 1 end
	if cs == ">" then xs = xs + 1 end
	if cs == "v" then ys = ys - 1 end
	if cs == "<" then xs = xs - 1 end
	homes[xs] = homes[xs] or {}
	if not homes[xs][ys] then p2 = p2 + 1 end
	homes[xs][ys] = true
	if cr == "^" then yr = yr + 1 end
	if cr == ">" then xr = xr + 1 end
	if cr == "v" then yr = yr - 1 end
	if cr == "<" then xr = xr - 1 end
	homes[xr] = homes[xr] or {}
	if not homes[xr][yr] then p2 = p2 + 1 end
	homes[xr][yr] = true
end

print("A: "..p1)
print("B: "..p2)
