-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
	v.mejais = getEntity("1_mejais")
	v.flag = 104
	v.time = 0
end

-- check trigger
function update(me, dt)


	if isFlag(v.flag, 0) and node_isEntityIn(me, v.n) then
		-- disableInput()
		setControlHint("Mejais: ...", 0, 0, 0, 3)
		setFlag(v.flag, 1)
	end

	if isFlag(v.flag, 1) then
		v.time = v.time + dt
		if v.time >= 4 then
			entity_setState(v.mejais, STATE_DEATHSCENE)
			ghost = createEntity("1_mejais_ghost", "", entity_getPosition(v.mejais))
			mejaisStart = getNode("1_mejais_1")
			entity_swimToNode(ghost, mejaisStart, 4)
			setFlag(v.flag, 2)
			setFlag(100, 2)
			-- enableInput()
		end
	end

end

