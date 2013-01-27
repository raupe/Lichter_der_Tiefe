-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
	v.flag = 001
	v.time = 0
end

-- check trigger
function update(me, dt)	

	if getFlag(v.flag) > 15 then
		-- early out
	elseif isFlag(v.flag, 0) then

		if node_isEntityIn(me, v.n) then

			setCutscene(1,1)

			v.dt = 1
			v.time = 0
			setFlag(v.flag, 1)
			
			disableInput()
			showImage("0_cutscene/01_dialog")
		end
		
	elseif isFlag(v.flag, 1) then

		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			v.time = 0
			setFlag(v.flag, 2)
			
			setControlHint("Emily: Ob er schon da ist? Mir ist unwohl...", 0, 0, 0, 4)
		end
		
	elseif isFlag(v.flag, 2) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 3
			v.time = 0
			setFlag(v.flag, 3)
			
			hideImage()
			showImage("0_cutscene/02_dialog")
		end
		
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			v.time = 0
			setFlag(v.flag, 4)
			
			setControlHint("Emily: huuuups", 0, 0, 0, 4)
		end
		
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 3
			v.time = 0
			setFlag(v.flag, 5)
			
			hideImage()
			showImage("0_cutscene/03_dialog")
		end
		
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			v.time = 0
			setFlag(v.flag, 6)
			
			setControlHint("Fremder: Junges Fraeulein, ihr Amulett... ", 0, 0, 0, 4)
		end
		
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			v.time = 0
			setFlag(v.flag, 7)
			
			setControlHint("Fremder: Rote Perlen, eine Seltenheit. Darf ich fragen? Woher stammt es?", 0, 0, 0, 4)
		end
		
	elseif isFlag(v.flag, 7) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 6
			v.time = 0
			setFlag(v.flag, 8)
			
			setControlHint("Emily: Mein Vater liess es zurueck... Ich war noch ein Baby, als er von uns fortging.", 0, 0, 0, 6)
		end
		
	elseif isFlag(v.flag, 8) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			v.time = 0
			setFlag(v.flag, 9)
			
			setControlHint("Fremder: Warum ging er hinfort?", 0, 0, 0, 4)
		end
		
	elseif isFlag(v.flag, 9) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			v.time = 0
			setFlag(v.flag, 10)
			
			setControlHint("Emily: Ich weiss es nicht, aber letzten Monat erhielt ich diesen Brief.", 0, 0, 0, 4)
		end
		
	elseif isFlag(v.flag, 10) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 20
			v.time = 0
			setFlag(v.flag, 11)
			
			hideImage()
			showImage("0_cutscene/04_Dialog")
		end
		
	elseif isFlag(v.flag, 11) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 3
			v.time = 0
			setFlag(v.flag, 12)
			
			hideImage()
			showImage("0_cutscene/03_Dialog")
		end
		
	elseif isFlag(v.flag, 12) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			v.time = 0
			setFlag(v.flag, 13)
			
			setControlHint("Fremder: Ein wichtiger Grund... Ein Mann verlaesst seine Familie nicht grundlos... Er wird einen Grund gehabt haben.", 0, 0, 0, 8)
		end
		
	elseif isFlag(v.flag, 13) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 6
			v.time = 0
			setFlag(v.flag, 14)
			
			setControlHint("Emily: Nein... ich glaube nicht daran...  Wie soll ich diesem Fremden begegnen?", 0, 0, 0, 6)
		end
		
	elseif isFlag(v.flag, 14) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 5
			v.time = 0
			setFlag(v.flag, 15)
			
			setControlHint("Fremder: Junges Fraeulein... so hoeren sie ihn doch erst einmal an...", 0, 0, 0, 4)
		end
		
	elseif isFlag(v.flag, 15) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 16)
			
			hideImage()
			enableInput()
			setCutscene(0)
		end
		
	end

end

