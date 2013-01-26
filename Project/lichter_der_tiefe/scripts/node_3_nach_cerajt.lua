-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.flagCerajt = 702
end

-- check
function update(me, dt)
		
	-- enter node
	if node_isEntityIn(me, v.n) and isFlag(v.flagCerajt, 1) then
		
		local nejl = getEntity("3_Nejl")
		entity_setState(nejl, STATE_DISABLED)
	end
end

