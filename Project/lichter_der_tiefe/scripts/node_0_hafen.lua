-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)
    v.n = getNaija()
    entity_alpha(v.n, 0)

    changeForm(0)

    v.diff = 004
    
    v.flagLdL = 1100
    v.step = 005
    v.time = 0
    v.dt = 0
end

-- check trigger
function update(me, dt)

    if isFlag(v.diff, 0) then

        setFlag(v.diff, 1) -- prevent recalling

        showImage("0_schwierigkeitsgrad")
    end
    
    if isFlag(v.step, 5) then
    	-- nothing
    elseif isFlag(v.step, 0) then
	    if isFlag(v.flagLdL, 1) then
	    	setFlag(v.step, 1)
			v.time = 0
			v.dt = 2
			
			disableInput()
			setCutscene(1,1)
			showImage("0_cutscene/out_of_the_water")
		end
		
	elseif isFlag(v.step, 1) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.step, 2)
			v.time = 0
			v.dt = 3
		
			setControlHint("Fremder: Fraeulein, geht es Ihnen gut?", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.step, 2) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.step, 3)
			v.time = 0
			v.dt = 3
		
			setControlHint("Emily: Was ist passiert?", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.step, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.step, 4)
			v.time = 0
			v.dt = 4
		
			setControlHint("Fremder: Sie sind ins Wasser gefallen. Hier, ich helfe Ihnen auf.", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.step, 4) then    	
    	v.time = v.time + dt
    	if v.time >= v.dt then
    		setFlag(v.step, 5)
    		
    		local mann = getEntity("0_mann")
    		entity_setPosition(mann, 5330, 5610)
    		entity_rotate(mann, 225)
    		
    		hideImage()
			setCutscene(0)
    		enableInput()
    	end
    	
    end

end
