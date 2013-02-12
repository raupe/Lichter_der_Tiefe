-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------

-- on creation
function init(me)

	v.n = getNaija()
	v.nejl = getEntity("3_nejl")
	v.flag = 800
	v.flagWake = 803

	centerText("Hoehle der Ruhe")
	
	-- debug:
	-- setFlag(303, 1)
	-- learnSong(101)
	-- setFlag(v.flagWake, 0)
	
	if isFlag(v.flagWake, 1) then
		v.step = 3
	else
		v.step = 0
	end

end

-- trigger
function activate(me)

end

-- check
function update(me, dt)
	
	if v.step == 0 then
		if isFlag(v.flagWake, 1) then
			v.step = v.step + 1
			v.time = 0
			v.dt = 4
			
			disableInput()
			entity_swimToPosition(v.n, entity_getPosition(v.nejl))
		end
	
	elseif v.step == 1 then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.step = v.step + 1
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily"..nameLine.."Nejl, wach auf!", 0, 0, 0, 4)
		end
		
	elseif v.step == 2 then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.step = v.step + 1
			v.time = 0
			v.dt = 4
			
			entity_setState(v.nejl, STATE_FOLLOW)
			setControlHint("Nejl"..nameLine.."Oh, der Klang hat mich eingeschlaefert. Das passiert mir nicht nochmal!", 0, 0, 0, 4)
			enableInput()
		end
	end
end

