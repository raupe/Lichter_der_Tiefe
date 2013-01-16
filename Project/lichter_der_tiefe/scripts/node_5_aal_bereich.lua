-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false
	v.aal = getEntity("5_aal")
	
end

-- check
function update(me, dt)

	-- enter node
	if not v.inNode then
		if node_isEntityIn(me, v.n) and isForm(1) then
			v.inNode = true
			
			if not entity_isState(v.aal, STATE_SING) then
				entity_setState(v.aal, STATE_ATTACK)
			end
		end
	end
	
	-- leave node
	if v.inNode then
		if not node_isEntityIn(me, v.n) or not isForm(1) then
			v.inNode = false
			
			if entity_isState(v.aal, STATE_ATTACK) then
				entity_setState(v.aal, STATE_IDLE)
			end
		end
	end

end