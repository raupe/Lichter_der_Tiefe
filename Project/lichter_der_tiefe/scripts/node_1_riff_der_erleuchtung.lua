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
    v.flagLichtblume = 105

    setCostume("emily")
    centerText("Riff der Erleuchtung")

    if getFlag(v.flag) == 1 then
    	local mejais = getEntity("1_mejais")
		entity_setState(mejais, STATE_DEATHSCENE)
    	local mejaisStart = getNode("1_mejais_1")
		createEntity("1_mejais_ghost", "", node_getPosition(mejaisStart))
    end
    
    -- turn off glowing
    if getFlag(v.flagLichtblume) == 2 then
    	setFlag(v.flagLichtblume, 1)
    end
    
    
    -- learnSong(104)

end

-- check trigger
function update(me, dt)


end

