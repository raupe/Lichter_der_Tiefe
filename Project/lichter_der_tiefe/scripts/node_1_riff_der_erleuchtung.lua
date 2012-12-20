-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

--[[
flag 100:
0 - start
1 - mejais dead



]]

-- on creation
function init(me)

    v.n = getNaija()
    v.flag = 100
    
    setCostume("emily")
    centerText("Riff der Erleuchtung")
    
    if getFlag(v.flag) > 0 then
    	mejais = getEntity("1_mejais")
		entity_setState(mejais, STATE_DEATHSCENE)
    	mejaisStart = getNode("1_mejais_1")
		createEntity("1_mejais_ghost", "", node_getPosition(mejaisStart))
    end
		
end

-- check trigger
function update(me, dt)
	

end

