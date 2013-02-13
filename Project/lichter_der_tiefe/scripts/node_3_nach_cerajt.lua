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

	if isFlag(1200, 1) then return end
		
	if isFlag(v.flag, 50) then
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
				setFlag(v.flag, 20)
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
			
			showImage("3_cutscene/madallion_nejl")
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
			setFlag(v.flag, 50)
			
			enableInput()
			setFlag(v.flagForm, 0)
		end
		
	elseif isFlag(v.flag, 20) then
		v.time = 0
		v.dt = 3
		setFlag(v.flag, 21)
		
		setControlHint("Emily"..nameLine.."Nejl, bist du ok?", 0,0,0, v.dt)
		
	elseif isFlag(v.flag, 21) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 22)
			v.time = 0
			v.dt = 3
			
			setControlHint("Nejl"..nameLine.."Mir gehts gut. Was ist passiert?", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 22) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 23)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Ich weiss es nicht. Ich hatte die Verwandlung nicht mehr unter Kontrolle.", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 23) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 24)
			v.time = 0
			v.dt = 4
			
			setControlHint("Nejl"..nameLine.."Du warst zu lange der Kraft der Kristalle ausgesetzt.", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 24) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 25)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Nejl, schnell - schwimm fort. Wenn ich mich wieder verwand- ... ", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 25) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 26)
			v.time = 0
			v.dt = 4
			
			changeForm(1)
			local nejl = getEntity("3_nejl")
			entity_setState(nejl, STATE_MOVE)
		end
		
	elseif isFlag(v.flag, 26) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 27)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Nejl ist in Sicherheit.", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 27) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 28)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Vielleicht finde ich noch einen Weg nach Hause ...", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 28) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 29)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Aber was soll ich da schon?", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 29) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 30)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Mir Ausreden anhoeren, warum mein Vater mich verlassen hat?", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 30) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 31)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Nein! Ich bleibe hier!", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 31) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 32)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Hier kann ich machen was ich will! Hier habe ich MACHT!", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 32) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 33)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Und dafuer brauche ich noch nicht einmal die Kristalle.", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 33) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 34)
			v.time = 0
			v.dt = 3
			
			showImage("3_cutscene/bad_ending_00")
		end
		
	elseif isFlag(v.flag, 34) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 35)
			v.time = 0
			v.dt = 3
			
			hideImage()
			showImage("3_cutscene/bad_ending_01")
		end
		
	elseif isFlag(v.flag, 35) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 36)
			v.time = 0
			v.dt = 3
			
			hideImage()
			showImage("3_cutscene/bad_ending_02")
		end
		
	elseif isFlag(v.flag, 36) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 37)
			v.time = 0
			v.dt = 3
			
			hideImage()
			showImage("3_cutscene/bad_ending_03")
		end
		
	elseif isFlag(v.flag, 37) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 38)
			v.time = 0
			v.dt = 3
			
			hideImage()
			showImage("3_cutscene/bad_ending_04")
		end
		
	elseif isFlag(v.flag, 38) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 39)
			v.time = 0
			v.dt = 3
			
			hideImage()
			showImage("3_cutscene/bad_ending_05")
		end
		
	elseif isFlag(v.flag, 39) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 40)
			v.time = 0
			v.dt = 3
			
			hideImage()
			showImage("3_cutscene/bad_ending_06")
		end
		
	elseif isFlag(v.flag, 40) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 41)
			v.time = 0
			v.dt = 4
			
			setControlHint("Fremder"..nameLine.."Fraeulein? ... Fraeulein?", 0,0,0, 3)
		end
		
	elseif isFlag(v.flag, 41) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 42)
			v.time = 0
			v.dt = 3
			
			setControlHint("", 0,0,0, 2)
		end
		
	elseif isFlag(v.flag, 42) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 50)
			
			hideImage()
			goToTitle()
		end
	
		
	
	end
end

