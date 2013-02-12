-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------

-- on creation
function init(me)

	v.n = getNaija()
	v.flagCerajt = 702
	v.flagForm = 704
	v.flag = 309
	v.path = 306
	
	v.time = 0
	v.dt = 0
	
	-- debug
	setFlag(v.flag, 0)
	setFlag(310, 0)
end

-- check
function update(me, dt)
		
	if isFlag(v.flag, 13) then
		-- nothing
	
	elseif isFlag(v.flag, 0) then
		if node_isEntityIn(me, v.n) and isFlag(v.flagCerajt, 1) then
			
			local nejl = getEntity("3_Nejl")
			entity_setState(nejl, STATE_DISABLED)
			
			disableInput()
			changeForm(0)
			if getFlag(v.path) > 1 then
				setFlag(v.flag, 1)
			else
			
			end
		end
	
	elseif isFlag(v.flag, 1) then
		v.time = 0
		v.dt = 3
		setFlag(v.flag, 2)
		
		setControlHint("Emily"..nameLine.."Nejl? Bist du ok?", 0,0,0, v.dt)
	
	elseif isFlag(v.flag, 2) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 3
			setFlag(v.flag, 3)
			
			setControlHint("Nejl"..nameLine.."Mir geht es gut. Was war das?", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 5
			setFlag(v.flag, 4)
			
			setControlHint("Emily"..nameLine.."Ich weiss es nicht. Ich konnte die Verwandlung nicht mehr kontrollieren!", 0,0,0, 4)
		end
	
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 3
			setFlag(v.flag, 5)
			
			setControlHint("Nejl"..nameLine.."Was willst du jetzt machen?", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 4
			setFlag(v.flag, 6)
			
			setControlHint("Emily"..nameLine.."Ich muss hier weg, sonst bist du in staendiger Gefahr.", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 4
			setFlag(v.flag, 7)
			
			setControlHint("Nejl"..nameLine.."Wo willst du hin? - Die Blumen sind verwelkt.", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 7) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 3
			setFlag(v.flag, 8)
			
			setControlHint("Emily"..nameLine.."Ich finde schon einen Weg.", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 8) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 3
			setFlag(v.flag, 9)
			
			setControlHint("Emily"..nameLine.."Hier, nimm das - als Erinnerung.", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 9) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 3
			setFlag(v.flag, 10)
			
			showImage("3_cutscene")
		end
	
	elseif isFlag(v.flag, 10) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 3
			setFlag(v.flag, 11)
			
			hideImage()
		end
	
	elseif isFlag(v.flag, 11) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 4
			setFlag(v.flag, 12)
			
			setControlHint("Emily"..nameLine.."Pass auf dich auf!", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 12) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 4
			setFlag(v.flag, 13)
			
			enableInput()
			entity_setInvincible(v.n, false)
			setFlag(v.flagForm, 0)
		end
		
	
	end
end

