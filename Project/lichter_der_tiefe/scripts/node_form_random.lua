-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)
--debug:
--setFlag(702, 1)

	v.n = getNaija()
	v.inNode = false
	v.flagCerajt = 702
	v.flagForm = 704
	
	v.time = 0
	v.dt = math.random() * 2 + 5
	
	v.timeShot = 0
	v.dtShot = math.random() + 1
end

-- check trigger
function update(me, dt)

	if isFlag(v.flagCerajt, 1) then
		
		if isFlag(v.flagForm, 0) then
			v.time = v.time + dt
			if v.time >= v.dt then
				
				v.time = 0
				v.dt = math.random() * 5 + 10
				
				if isForm(0) then
					changeForm(1)
				else
					changeForm(0)
				end
				
			end
		end
		
		if isForm(1) then
			v.timeShot = v.timeShot + dt
			if v.timeShot >= v.dtShot then
				v.timeShot = 0
				v.dtShot = math.random() + 1
				
				local rock = entity_getNearestEntity(v.n, "rock_breakable", 2000)
				if rock ~= 0 then
					createShot("energyblast", v.n, rock, entity_getPosition(v.n))
				end
			end
		end
	end

end

