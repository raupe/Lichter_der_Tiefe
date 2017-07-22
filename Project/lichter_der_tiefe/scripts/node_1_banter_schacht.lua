-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

    v.n = getNaija()

	v.inNode = false
	v.time = 0

	v.flag = 101
	v.flagLichtblume = 105

	if node_isEntityIn(me, v.n) then
		setFlag(v.flag, 0)
	end

end

-- check trigger
function update(me, dt)

	-- enter node
	if not v.inNode and node_isEntityIn(me, v.n) then
		v.inNode = true
	end

	-- leave node
	if v.inNode and not node_isEntityIn(me, v.n) then
		v.inNode = false
		v.time = 0
		if getFlag(v.flag) ~= 1 then
			setFlag(v.flag, 1)
	    	centerText(DATA_TEXTS.reef_enlightenment_name)
		end
	end

	if v.inNode and isFlag(v.flag, 1) then
		v.time = v.time + dt

		if v.time >= 3 and getFlag(v.flagLichtblume) ~= 1 then
			setControlHint(DATA_TEXTS.reef_toodark_1, 0, 0, 0, 4)
			v.time = 0
			setFlag(v.flag, 0)
		end
	end

end

