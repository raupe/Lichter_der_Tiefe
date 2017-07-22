-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

	v.n = getNaija()
	v.nejl = getEntity("3_nejl")

	v.flag = 308
	v.flagLdL = 1100
	
	v.time = 0
	v.dt = 0
end

-- check
function update(me, dt)

	if isFlag(v.flag, 0) or isFlag(v.flag, 7) then
		-- nothing
	elseif isFlag(v.flag, 1) then
		setFlag(v.flag, 2)
	
		disableInput()
		setControlHint(DATA_TEXTS.abschied_1, 0,0,0, 3)
		entity_swimToPosition(v.nejl, entity_getPosition(v.n))
	
	elseif isFlag(v.flag, 2) then
		if entity_isEntityInRange(v.nejl, v.n, 200) then
			setFlag(v.flag, 3)
			v.time = 0
			v.dt = 4
	
			entity_swimToPosition(v.nejl, entity_getPosition(v.nejl))
			setControlHint(DATA_TEXTS.abschied_2, 0,0,0, 4)
		end
	
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time > v.dt then
			setFlag(v.flag, 4)
			v.time = 0
			v.dt = 3
			
			setControlHint(DATA_TEXTS.abschied_3, 0,0,0, 3)
		end
	
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time > v.dt then
			setFlag(v.flag, 5)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.abschied_4, 0,0,0, 4)
		end
	
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time > v.dt then
			setFlag(v.flag, 6)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.abschied_5, 0,0,0, 4)
		end
	
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time > v.dt then
			setFlag(v.flag, 7)
			v.time = 0
			v.dt = 4
			
			enableInput()
		end
	
	
	elseif isFlag(v.flag, 8) then
		setFlag(v.flag, 9)
		v.time = 0
		v.dt = 3
		
		disableInput()
		setControlHint(DATA_TEXTS.abschied_6, 0,0,0, v.dt)
	
	elseif isFlag(v.flag, 9) then
		v.time = v.time + dt
		if v.time > v.dt then
			setFlag(v.flag, 10)
			v.time = 0
			v.dt = 3
			
			setControlHint(DATA_TEXTS.abschied_7, 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 10) then
		v.time = v.time + dt
		if v.time > v.dt then
			setFlag(v.flag, 4)
			v.time = 0
			v.dt = 3
			
			enableInput()
			setControlHint(DATA_TEXTS.abschied_8, 0,0,0, v.dt)
		end
	
	end
end

