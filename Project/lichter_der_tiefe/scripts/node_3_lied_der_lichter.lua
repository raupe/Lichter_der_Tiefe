-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------

-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false
	v.flagLiedDerLichter = 1100
	v.flagNejl = 303
	v.flagSongs = 307
	
	v.song = 104
	
	v.step = 0
	
end

-- check
function update(me, dt)
	
	if v.step == 0 or v.step > 3 then
		-- nothing
	elseif v.step == 1 then
		v.time = 0
		v.dt = 4
		v.step = v.step + 1

		disableInput()
		setControlHint("Nejl"..nameLine.."Jetzt erinnere ich mich an das Lied, das hat Mama immer gesungen!" ,0,0,0, 4)

		unlearnSong(101)
		unlearnSong(102)
		learnSong(v.song)

		setFlag(v.flagLiedDerLichter, 1)
		setFlag(v.flagSongs, 4)
		
		local nejl = getEntity("3_nejl")
		entity_setState(nejl, STATE_DISABLED)
	
	elseif v.step == 2 then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 4
			v.step = v.step + 1
			
			setControlHint("Nejl"..nameLine.."Wir muessen nur die Anfangstoene der Klaenge aneinander reihen.", 0,0,0, 4)
		end
	
	elseif v.step == 3 then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 4
			v.step = v.step + 1

			enableInput()
			setControlHint("Nejl"..nameLine.."Komm, du kannst das. Bring die Blumen zum leuchten!", 0,0,0, 4)
		end
	
	end
	
	
	-- enter node
	if not v.inNode and node_isEntityIn(me, v.n) then
		v.inNode = true
		
		if getFlag(v.flagSongs) == 3 then
			v.step = 1
		end
	end
	
	-- leave node
	if v.inNode and not node_isEntityIn(me, v.n) then
		v.inNode = false
	end
	
end

