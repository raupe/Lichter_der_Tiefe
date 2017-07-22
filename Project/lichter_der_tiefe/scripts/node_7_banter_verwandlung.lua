-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false

	v.time = 0
	v.dt = 5

	v.flag = 703
end

-- check
function update(me, dt)

	if isFlag(v.flag, 0) and node_isEntityIn(me, v.n) and isForm(1) then

		setFlag(v.flag, 1)

		setControlHint(DATA_TEXTS.verwandlung_banter_1, 0, 0, 0, 4)
	end

end

