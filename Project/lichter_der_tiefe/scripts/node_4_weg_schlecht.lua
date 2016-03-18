-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

    v.n = getNaija()
	v.inNode = false
	v.flagNejl = 303

	v.step = 0
	v.nejl = getEntity("3_nejl")
end

-- check trigger
function update(me, dt)

	if getFlag(v.flagNejl) == 1 then

		-- enter node
		if not v.inNode and node_isEntityIn(me, v.n) then
			v.inNode = true
			
			if entity_isState(v.nejl, STATE_WAIT) then
				v.step = 1
				disableInput()
				entity_swimToPosition(v.n, entity_getPosition(v.n))
				setControlHint(DATA_TEXTS.weg_schlect_1, 0,0,0, 5)
				entity_swimToPosition(v.nejl, node_getPathPosition(me, 1))
			end
		end
	
		-- leave node
		if v.inNode and not node_isEntityIn(me, v.n) then
			v.inNode = false
		end

		if v.step == 1 then
			local x, y = node_getPathPosition(me, 1)
		 	if entity_isPositionInRange(v.nejl, x, y, 128) then
				v.step = 2
				entity_swimToPosition(v.nejl, node_getPathPosition(me, 0))
			end
		elseif v.step == 2 then
			local x, y = node_getPathPosition(me, 0)
			if entity_isPositionInRange(v.nejl, x, y, 128) then
				v.step = 3
				entity_setState(v.nejl, STATE_FOLLOW)
				enableInput()
			end
		end

	end

end

