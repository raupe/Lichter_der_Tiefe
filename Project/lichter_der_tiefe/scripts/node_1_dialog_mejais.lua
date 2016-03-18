-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

    v.n = getNaija()
	v.mejais = getEntity("1_mejais")
	v.flag = 104
	
	v.los = 102
	
	v.time = 0
	v.dt = 0
end

-- check trigger
function update(me, dt)	

	if isFlag(v.flag, 0) and node_isEntityIn( getNode("1_triff_mejais"), v.n) then

		setCutscene(1, 1)
		if not isFlag(v.los, 5) then
	        setFlag(v.los, 5)
	       	clearControlHint()
		end

		watch(5)
		disableInput()

		entity_swimToNode(v.n, me, 4)
		entity_flipToEntity(v.n, v.mejais)
		setFlag(v.flag, 1)

	elseif isFlag(v.flag, 1) and node_isEntityIn(me, v.n) then
		disableInput()
		setControlHint(DATA_TEXTS.mejais_banter_1, 0, 0, 0, 3)
		setFlag(v.flag, 2)
	
	elseif isFlag(v.flag, 2) then
		v.time = v.time + dt
		if v.time >= 4 then
			v.dt = 4
			entity_setState(v.mejais, STATE_DEATHSCENE)
			local ghost = createEntity("1_mejais_ghost", "", entity_getPosition(v.mejais))
			entity_setState(ghost, STATE_WAIT)
			setFlag(100, 1)
			setFlag(v.flag, 3)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint(DATA_TEXTS.mejais_banter_2, 0, 0, 0, v.dt)
			setFlag(v.flag, 4)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint(DATA_TEXTS.mejais_banter_3, 0, 0, 0, v.dt)
			setFlag(v.flag, 5)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint(DATA_TEXTS.mejais_banter_4, 0, 0, 0, v.dt)
			setFlag(v.flag, 6)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint(DATA_TEXTS.mejais_banter_5, 0, 0, 0, v.dt)
			setFlag(v.flag, 7)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 7) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 7
			setControlHint(DATA_TEXTS.mejais_banter_6, 0, 0, 0, v.dt)
			setFlag(v.flag, 8)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 8) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint(DATA_TEXTS.mejais_banter_7, 0, 0, 0, v.dt)
			setFlag(v.flag, 9)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 9) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint(DATA_TEXTS.mejais_banter_8, 0, 0, 0, v.dt)
			setFlag(v.flag, 10)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 10) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint(DATA_TEXTS.mejais_banter_9, 0, 0, 0, v.dt)
			setFlag(v.flag, 11)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 11) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint(DATA_TEXTS.mejais_banter_10, 0, 0, 0, v.dt)
			setFlag(v.flag, 12)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 12) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint(DATA_TEXTS.mejais_banter_11, 0, 0, 0, v.dt)
			setFlag(v.flag, 13)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 13) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 7--6
			setControlHint(DATA_TEXTS.mejais_banter_12, 0, 0, 0, v.dt)
			setFlag(v.flag, 14)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 14) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint(DATA_TEXTS.mejais_banter_13, 0, 0, 0, v.dt)
			setFlag(v.flag, 15)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 15) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint(DATA_TEXTS.mejais_banter_14, 0, 0, 0, v.dt)
			setFlag(v.flag, 16)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 16) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint(DATA_TEXTS.mejais_banter_15, 0, 0, 0, v.dt)
			setFlag(v.flag, 17)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 17) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.mejaisStart = getNode("1_mejais_1")
			local ghost = getEntity("1_mejais_ghost")
			entity_swimToNode(ghost, v.mejaisStart, 4)
			entity_setState(ghost, STATE_IDLE)
			enableInput()
			setFlag(v.flag, 18)
			setCutscene(0)
		end
	end

end

