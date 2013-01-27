-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

    -- if skipped
    setCutscene(0)

    v.n = getNaija()
    v.flag = 100
    v.flagLichtblume = 105
    v.flagSchacht = 101

    setCostume("emily")
    
    if getFlag(v.flagSchacht) == 1 then
	    centerText("Riff der Erleuchtung")
	end

    if getFlag(v.flag) == 1 then
    	local mejais = getEntity("1_mejais")
		entity_setState(mejais, STATE_DEATHSCENE)
    	local mejaisStart = getNode("1_mejais_1")
		createEntity("1_mejais_ghost", "", node_getPosition(mejaisStart))
    end
    
    -- turn off glowing
    if getFlag(v.flagLichtblume) == 1 then
    	setFlag(v.flagLichtblume, 0)
    end
    
    -- debug:
    -- learnSong(104)
    -- setFlag(1100, 1)

end

-- check trigger
function update(me, dt)


end

