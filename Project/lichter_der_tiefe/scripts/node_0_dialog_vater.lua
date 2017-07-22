-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

    v.n = getNaija()
	v.flag = 006
	v.time = 0
	v.dt = 0
	
end

-- check trigger
function update(me, dt)	

	if isFlag(1200, 1) then return end

	if getFlag(v.flag) == 30 then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(1200, 1)
			
			goToTitle()
		end
		
	elseif isFlag(v.flag, 0) then

		if node_isEntityIn(me, v.n) then
			disableInput()
			setCutscene(1,1)
			if isFlag(702, 0) then
				setFlag(v.flag, 1)
			else
				setFlag(v.flag, 20 )
			end
			v.time = 0
			v.dt = 2

			showImage("0_cutscene/vater_emily")
		end
		
	-- indifferent ending
		
	elseif isFlag(v.flag, 1) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 2)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_1, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 2) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 3)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_2, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 4)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_3, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 5)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_4, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 6)
			v.time = 0
			v.dt = 2
			
			vision("indifferent", 4)
		end
		
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 7)
			v.time = 0
			v.dt = 3
			
			setControlHint(DATA_TEXTS.father_diag_5, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 7) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 8)
			v.time = 0
			v.dt = 2
			
			setControlHint(DATA_TEXTS.father_diag_6, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 8) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 9)
			v.time = 0
			v.dt = 2
			
			setControlHint(DATA_TEXTS.father_diag_7, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 9) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 10)
			v.time = 0
			v.dt = 3
			
			setControlHint(DATA_TEXTS.father_diag_8, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 10) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 11)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_9, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 11) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 12)
			v.time = 0
			v.dt = 3
			
			hideImage()
			showImage("0_cutscene/leave_me_alone")
		end
		
	elseif isFlag(v.flag, 12) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 13)
			v.time = 0
			v.dt = 3
			
			hideImage()
			showImage("0_cutscene/madallion_go")
		end
		
	elseif isFlag(v.flag, 13) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 14)
			v.time = 0
			v.dt = 3
			
			hideImage()
			showImage("0_cutscene/madallion_go_nejl")
		end
			
	elseif isFlag(v.flag, 14) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 30)
			v.time = 0
			v.dt = 3
			
			hideImage()
			setCutscene(0)
			enableInput()
		end
		
	-- good ending
		
	elseif isFlag(v.flag, 20) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 21)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_1, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 21) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 22)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_2, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 22) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 23)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_3, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 23) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 24)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_10, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 24) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 25)
			v.time = 0
			v.dt = 4
			
			vision("good", 3)
		end
		
	elseif isFlag(v.flag, 25) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 26)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_11, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 26) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 27)
			v.time = 0
			v.dt = 4
			
			setControlHint(DATA_TEXTS.father_diag_12, 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 27) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 28)
			v.time = 0
			v.dt = 3
			
			hideImage()
			showImage("0_cutscene/vater_emily_hug")
		end
		
	elseif isFlag(v.flag, 28) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 30)
			v.time = 0
			v.dt = 3
			
			hideImage()
			setCutscene(0)
			enableInput()
		end
		
	end

end

