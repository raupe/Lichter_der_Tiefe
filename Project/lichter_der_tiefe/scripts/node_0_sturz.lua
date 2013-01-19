-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
	v.flag = 003
	v.time = 0
	
end

-- check trigger
function update(me, dt)	

	if getFlag(v.flag) > 4 then
		-- early out
	elseif isFlag(v.flag, 0) then
		if node_isEntityIn(me, v.n) then
			v.dt = 4
			v.time = 0
			setFlag(v.flag, 1)
			
			disableInput()
			showImage("0_cutscene/steg_01")
		end
		
	elseif isFlag(v.flag, 1) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			v.time = 0
			setFlag(v.flag, 2)
			
			hideImage()
			showImage("0_cutscene/steg_02")
		end
		
	elseif isFlag(v.flag, 2) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			v.time = 0
			setFlag(v.flag, 3)
			
			
			hideImage()
			showImage("0_cutscene/steg_03")
		end
		
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 2
			v.time = 0
			setFlag(v.flag, 4)
			
			entity_setPosition(v.n, node_getPosition(me))
			hideImage()
		end
		
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 3
			v.time = 0
			setFlag(v.flag, 5)
			
			enableInput()
			loadMap("1_riff_der_erleuchtung")
		end
		
	end

end

