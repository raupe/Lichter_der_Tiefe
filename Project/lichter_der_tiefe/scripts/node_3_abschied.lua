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
		setControlHint("Nejl: Emily, warte!", 0,0,0, 3)
		entity_swimToPosition(v.nejl, entity_getPosition(v.n))
	
	elseif isFlag(v.flag, 2) then
		if entity_isEntityInRange(v.nejl, v.n, 200) then
			setFlag(v.flag, 3)
			v.time = 0
			v.dt = 4
	
			entity_swimToPosition(v.nejl, entity_getPosition(v.nejl))
			setControlHint("Nejl: Wo willst du hin? Gehst du wieder nach Hause?", 0,0,0, 4)
		end
	
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time > v.dt then
			setFlag(v.flag, 4)
			v.time = 0
			v.dt = 3
			
			setControlHint("Emily: Ich kann nicht bei dir bleiben, ich muss gehen ...", 0,0,0, 3)
		end
	
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time > v.dt then
			setFlag(v.flag, 5)
			v.time = 0
			v.dt = 4
			
			setControlHint("Nejl: Nagut, ich werd dich vermissen.", 0,0,0, 4)
		end
	
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time > v.dt then
			setFlag(v.flag, 6)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily: Wir sehen uns wieder, bestimmt.", 0,0,0, 4)
		end
	
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time > v.dt then
			setFlag(v.flag, 7)
			v.time = 0
			v.dt = 4
			
			enableInput()
		end
	
	end
end

