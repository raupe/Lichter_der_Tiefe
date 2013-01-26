-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false
	v.form = 0
	v.flag = 704

	v.crystal = node_getNearestNode(me, "save")
end

-- check trigger
function update(me, dt)

	-- enter node
	if not v.inNode and node_isEntityIn(me, v.n) then

		v.inNode = true
		v.form = getForm()

		if v.form == 0 then

			entity_moveToNode( v.n, v.crystal, 2 )
		end
	end

	-- leave node
	if v.inNode and not node_isEntityIn(me, v.n) then

		v.inNode = false
		if v.form == 1 then
			changeForm(0)
			setFlag(v.flag, 0)
		end
	end

end

