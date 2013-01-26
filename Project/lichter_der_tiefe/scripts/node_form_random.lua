-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false
	v.flagCerajt = 702
	v.flagForm = 704
	
	v.time = 0
	v.dt = math.random() * 2 + 5
end

-- check trigger
function update(me, dt)

	if isFlag(v.flagCerajt, 1) and isFlag(v.flagForm, 0) then
		
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

end

