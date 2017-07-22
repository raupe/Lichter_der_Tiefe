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
    v.flagMejaisWeg = 108

    setCostume("emily")
    
    if getFlag(v.flagSchacht) == 1 then
	    centerText(DATA_TEXTS.reef_enlightenment_name)
	end

    if getFlag(v.flag) == 1 then
    	local mejais = getEntity("1_mejais")
		entity_setState(mejais, STATE_DEATHSCENE)
		if not isFlag(v.flagMejaisWeg, 1) then
	    	local mejaisStart = getNode("1_mejais_1")
			createEntity("1_mejais_ghost", "", node_getPosition(mejaisStart))
		end
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

