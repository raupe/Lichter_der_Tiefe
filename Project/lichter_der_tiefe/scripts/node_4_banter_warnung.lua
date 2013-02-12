-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false

	v.flag = 401

	v.nejl = 303
end

-- check
function update(me, dt)

	if isFlag(v.nejl, 1) and isFlag(v.flag, 0) and node_isEntityIn(me, v.n) then

		setFlag(v.flag, 1)

		setControlHint("Nejl: O nein, die Energiekristalle... Komm, hier koennen wir ihnen entgehen.", 0, 0, 0, 5 )
		
		local weg = getNode("4_weg_gut")
		local nejl = getEntity("3_nejl")
		entity_setState(nejl, STATE_WAIT)
		entity_swimToNode(nejl, weg)
	end
end

