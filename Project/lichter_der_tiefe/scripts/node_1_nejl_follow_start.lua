-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
	v.inNode = false
	v.flag = 101

	if node_isEntityIn(me, v.n) then
		setFlag(v.flag, 0)
	end

end

-- check trigger
function update(me, dt)

	-- enter node
	if not v.inNode and node_isEntityIn(me, v.n) then
		v.inNode = true
		
		setFlag(303,1)
	end

	-- leave node
	if v.inNode and not node_isEntityIn(me, v.n) then
		v.inNode = false
		
		local nejl = getEntity("3_nejl")
		entity_setState(nejl, STATE_FOLLOW)
	end

end

