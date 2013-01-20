-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false
    
    v.posNode = getNode("5_nejl_pos")
    
	v.flag = 505
end

-- check
function update(me, dt)

	if isFlag( v.flag, 0 ) and node_isEntityIn(me, v.n) then

		setFlag( v.flag, 1 )

        local nejl = getEntity("3_nejl")
        entity_swimToNode(nejl, v.posNode)

        setControlHint("Nejl: Da unten scheint es einen Gang zu geben. Was wohl am Ende ist ?", 0, 0, 0, 5)
	end
end

