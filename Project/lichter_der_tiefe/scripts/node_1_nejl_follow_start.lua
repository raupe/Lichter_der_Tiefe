-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
	v.inNode = false
	v.flag = 101
	v.flagNejl = 303

	if node_isEntityIn(me, v.n) then
		setFlag(v.flag, 0)
	end

end

-- check trigger
function update(me, dt)

	if getFlag(v.flagNejl) == 1 then

		-- enter node
		if not v.inNode and node_isEntityIn(me, v.n) then
			v.inNode = true
			
			local nejl = getEntity("3_nejl")
			entity_setState(nejl, STATE_FOLLOW)
		end
	
		-- leave node
		if v.inNode and not node_isEntityIn(me, v.n) then
			v.inNode = false
		end

	end

end

