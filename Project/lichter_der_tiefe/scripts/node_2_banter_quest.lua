-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false

	v.flag = 203

	v.nejl = 303
end

-- check
function update(me, dt)

	if isFlag(v.nejl, 1) and isFlag(v.flag, 0) and node_isEntityIn(me, v.n) then

		setFlag(v.flag, 1)

		setControlHint("Emily: Wir schaffen das schon Nejl...", 0, 0, 0, 3)
		-- setControlHint("Nejl: Ja, ich vermisse nur Mama....", 0, 0, 0, 3)
	end
end