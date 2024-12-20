-- AoC Solutions launcher --

local LANGS = {
	{name = "Uiua",       ext = "ua",   cmd = "uiua"},
	{name = "Lua",        ext = "lua",  cmd = "lua"},
	{name = "Ruby",       ext = "rb",   cmd = "ruby"},
	{name = "Python",     ext = "py",   cmd = "py"},
	{name = "JavaScript", ext = "js",   cmd = "node"},
	{name = "Raku",       ext = "raku", cmd = "raku"},
	{name = "C",          ext = "c",    cmd = "tcc -run"},
}

local function by_problem()
	print"Enter a year: 2015 .. 2024"
	local year = io.read()

	print"Enter a day: 1 .. 25"
	local day = io.read()

	local solutions = {}
	for _, lang in ipairs(LANGS) do
		local filename = year.."."..day.."."..lang.ext
		local file = io.open(filename, "r")
		if file then
			file:close()
			table.insert(solutions, {
				lang = lang.name,
				cmd = lang.cmd.." "..filename
			})
		end
	end

	-- No solutions found
	if #solutions == 0 then
		print"No solutions found"
		return
	end

	-- Single solution found
	if #solutions == 1 then
		os.execute(solutions[1].cmd)
		return
	end

	-- Multiple solutions found
	print"Multiple solutions found"
	print"Please select one:"
	for i, sol in ipairs(solutions) do
		print(i..". "..sol.lang)
	end
	local choice = tonumber(io.read())
	if choice < 1 or choice > #solutions then
		print"Invalid choice"
		return
	end
	os.execute(solutions[choice].cmd)
end

local function by_language()
	print"Enter a language"
	for i, lang in ipairs(LANGS) do
		print(i..". "..lang.name)
	end
	local lang = LANGS[tonumber(io.read())]
	local solutions = {}
	for year = 2015, 2024 do
		for day = 1, 25 do
			local filename = year.."."..day.."."..lang.ext
			local file = io.open(filename, "r")
			if file then
				file:close()
				table.insert(solutions, filename)
			end
		end
	end
end

print"AoC Launcher"
local valid = false
while not valid do
	print"select by problem or by language"
	print"1. by problem"
	print"2. by language"
	local choice = tonumber(io.read())
	if choice == 1 then
		by_problem()
		valid = true
	elseif choice == 2 then
		by_language()
		valid = true
	else
		print"Invalid choice"
	end
end
