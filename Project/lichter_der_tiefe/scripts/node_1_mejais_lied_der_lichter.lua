-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-------------------------
local nameLine = ":\n \n"
-------------------------


-- on creation
function init(me)

    v.n = getNaija()
	v.mejais = getEntity("1_mejais_ghost")
	v.flag = 106
	v.time = 0
	v.flagUntiefen = 701
	v.dt = 0
	
	--debug:
	--setFlag(v.flag, 0)
	
	if isFlag(v.flag, 0) and isFlag(1100, 1) then
		setFlag(v.flag, 1)
	end
	
end

-- check trigger
function update(me, dt)	

	if getFlag(v.flag) >= 10 or isFlag(v.flag,0) then
		-- nothing
	
	elseif isFlag(v.flag, 1) then
		if node_isEntityIn(me, v.n) then
			setFlag(v.flag, 2)
			
			disableInput()
			entity_setState(v.mejais, STATE_WAIT)
			setControlHint("Mejais"..nameLine.."Emily!", 0,0,0, 3)
			entity_swimToPosition(v.mejais, entity_getPosition(v.n))
		end
	
	elseif isFlag(v.flag, 2) then
		if entity_isEntityInRange(v.mejais, v.n, 200) then
			setFlag(v.flag, 3)
			v.time = 0
			v.dt = 4
			
			entity_swimToPosition(v.mejais, entity_getPosition(v.mejais))
			setControlHint("Emily"..nameLine.."Nejl und ich haben das Lied der Lichter gelernt.", 0,0,0, v.dt)
		end

	
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 4)
			v.time = 0
			v.dt = 4
			
			setControlHint("Mejais"..nameLine.."Gut! Nun wird es dir moeglich sein durch den Schacht zurueck in deine Welt zu kommen.", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 5)
			v.time = 0
			v.dt = 4
			
			setControlHint("Mejais"..nameLine.."Bevor du gehst, bitte tu mir noch einen Gefallen.", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 6)
			v.time = 0
			v.dt = 4
			
			setControlHint("Mejais"..nameLine.."Sag Nejl, dass ich ihn liebe und ueber ihn wachen werde.", 0, 0, 0, v.dt)
		end
	
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 7)
			v.time = 0
			v.dt = 3
			
			setControlHint("Emily"..nameLine.."Natuerlich.", 0, 0, 0, v.dt)
		end
	
	elseif isFlag(v.flag, 7) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 8)
			v.time = 0
			v.dt = 4
			
			setControlHint("Mejais"..nameLine.."Aber beeile dich! Die Blumen haben bereits angefangen zu welken.", 0, 0, 0, v.dt)
		end
	
	elseif isFlag(v.flag, 8) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 9)
			v.time = 0
			v.dt = 4
			
			setControlHint("Mejais"..nameLine.."Wenn du zu lange brauchst werden sie dir nicht mehr den Weg nach oben leuchten koennen!", 0, 0, 0, v.dt)
		end
	
	elseif isFlag(v.flag, 9) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 10)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Dann sollte ich wohl lieber keine Zeit verlieren!", 0, 0, 0, v.dt)
			setFlag(v.flagUntiefen, 1)
			enableInput()
			entity_setState(v.mejais, STATE_IDLE)
		end
	end
	
end

