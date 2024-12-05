-- AoC 2024 Day 5 --

local input = assert(io.open"2024.5.in"):read"*a"
-- local input = "47|53\n97|13\n97|61\n97|47\n75|29\n61|13\n75|53\n29|13\n97|29\n53|29\n61|53\n97|53\n61|29\n47|13\n75|47\n97|75\n47|61\n75|61\n47|29\n75|13\n53|13\n\n75,47,61,53,29\n97,61,53,29,13\n75,29,13\n75,97,47,61,53\n61,13,29\n97,13,75,29,47\n";

local rule_in, update_in = input:match"(.-)\n\n(.+)\n"
local rules, updates = {}, {}

rule_in:gsub("%d+|%d+", function(rule) rules[rule] = true end)

for line in update_in:gmatch"[^\n]+" do
	table.insert(updates, {})
	for num in line:gmatch"%d+" do
		num = tonumber(num)
		table.insert(updates[#updates], num)
	end
end

local p1, p2 = 0, 0
for _, u in ipairs(updates) do
	local valid = true
	for i = 1, #u do
		for j = 1, #u do
			if rules[u[i].."|"..u[j]] then
				if i > j then
					valid = false
					break
				end
			end
		end
	end
	if not valid then
		table.sort(u, function(a, b) return rules[a.."|"..b] end)
		p2 = p2 + u[math.ceil(#u / 2)]
	end
	if valid then p1 = p1 + u[math.ceil(#u / 2)] end
end

print("A: "..p1)
print("B: "..p2)
