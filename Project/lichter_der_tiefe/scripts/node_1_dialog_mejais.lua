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

	if isFlag(v.flag, 0) then
		triffMejaisNode = getNode("1_triff_mejais")
		if node_isEntityIn(triffMejaisNode, v.n) then
			disableInput()
			entity_swimToNode(v.n, me, 4)
			setFlag(v.flag, 1)
		end
	
	elseif isFlag(v.flag, 1) and node_isEntityIn(me, v.n) then
		disableInput()
		setControlHint("Mejais: ...", 0, 0, 0, 3)
		setFlag(v.flag, 2)
	
	elseif isFlag(v.flag, 2) then
		v.time = v.time + dt
		if v.time >= 4 then
			entity_setState(v.mejais, STATE_DEATHSCENE)
			ghost = createEntity("1_mejais_ghost", "", entity_getPosition(v.mejais))
			setFlag(v.flag, 3)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= 2 then
			setControlHint("Mejais: erklaert die Welt", 0, 0, 0, 4)
			setFlag(v.flag, 4)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= 4 then
			mejaisStart = getNode("1_mejais_1")
			entity_swimToNode(ghost, mejaisStart, 4)
			enableInput()
			setFlag(100, 5)
		end
	end
	
end

