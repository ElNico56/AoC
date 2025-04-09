-- AoC Solutions launcher --

local LANGS = {
	{name = "Uiua",   ext = "ua",   cmd = "uiua"},
	{name = "Lua",    ext = "lua",  cmd = "lua"},
	{name = "Python", ext = "py",   cmd = "py"},
	{name = "Raku",   ext = "raku", cmd = "raku"},
}

local function by_problem()
	print"Enter a problem: YYYY.DD"
	io.write": "
	local year, day = io.read():match"(%d+).(%d+)"

	local solutions = {}
	for _, lang in ipairs(LANGS) do
		local filename = year.."."..day.."."..lang.ext
		local file = io.open(filename, "r")
		if file then
			file:close()
			table.insert(solutions, {
				filename = filename,
				lang = lang.name,
				cmd = lang.cmd.." "..filename
			})
		end
	end
	return solutions
end

local function by_language()
	print"Enter a language"
	for i, lang in ipairs(LANGS) do
		print(i..". "..lang.name)
	end
	io.write": "
	local lang = LANGS[tonumber(io.read())]
	local solutions = {}
	for year = 2015, 2024 do
		for day = 1, 25 do
			local filename = year.."."..day.."."..lang.ext
			local file = io.open(filename, "r")
			if file then
				file:close()
				table.insert(solutions, {
					filename = filename,
					lang = lang.name,
					cmd = lang.cmd.." "..filename
				})
			end
		end
	end
	return solutions
end

print"AoC Launcher"
do
	print"select by problem or by language"
	print"1. by problem"
	print"2. by language"
	local solutions = {}
	io.write": "
	local choice = tonumber(io.read())
	if choice == 1 then solutions = by_problem() end
	if choice == 2 then solutions = by_language() end
	if #solutions == 0 then print"no solutions found" end
	if #solutions == 1 then os.execute(solutions[1].cmd) end
	if #solutions > 1 then
		print"Select a solution"
		for i, sol in ipairs(solutions) do
			print(i..". "..sol.filename)
		end
		io.write": "
		choice = tonumber(io.read())
		if choice >= 1 and choice <= #solutions then
			os.execute(solutions[choice].cmd)
		end
	end
end
