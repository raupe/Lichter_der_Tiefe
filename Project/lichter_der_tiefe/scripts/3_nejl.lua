-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_initSkeletal(me, "cc_kid")
	entity_setState(me, STATE_IDLE)

end

-- after nodes have inited
function postInit(me)

    v.n = getNaija()
    v.flag = 303

    if isFlag(v.flag, 1) then

        v.x,v.y = entity_getPosition( v.n )
        entity_setPosition(me, v.x, v.y)
    end
end

function update(me, dt)

    if isFlag(v.flag, 1) then

	   entity_followEntity(me, v.n)
    end

end

function enterState(me)
	if entity_isState(me, STATE_IDLE) then
		entity_animate(me, "idle", -1)
	end
end

function exitState(me)
end

function damage(me, attacker, bone, damageType, dmg)
	return false
end

function animationKey(me, key)
end

function hitSurface(me)
end

function songNote(me, note)
end

function songNoteDone(me, note)
end

function song(me, song)
end

function activate(me)


end





-- function init(me)

-- 	setupEntity(me)
-- 	entity_setEntityType(me, ET_NEUTRAL)
-- 	entity_initSkeletal(me, "1_mejais_ghost")
-- 	entity_setState(me, STATE_IDLE)
-- 	entity_setCollideRadius(me, 32)
-- 	entity_setHealth(me, 5)
-- 	entity_setDeathParticleEffect(me, "TinyRedExplode")

-- 	setupBasicEntity( me,
-- 	  "", -- texture
-- 	  4, -- health
-- 	  2, -- manaballamount
-- 	  2, -- exp
-- 	  1, -- money
-- 	  48, -- collideRadius (for hitting entities and spells)
-- 	  STATE_IDLE, -- initState
-- 	  128,  -- sprite width
-- 	  128,  -- sprite height
-- 	  1, -- particle "explosion" type, maps to particleEffects.txt -1 = none
-- 	  1, -- 0/1 hit other entities off/on (uses collideRadius)
-- 	  400  -- updateCull -1: disabled, default: 4000 //
-- 	)

-- 	entity_setEntityType(me, ET_NEUTRAL)

-- 	-- setupEntity(me)


-- 	entity_initSkeletal(me, "00_starter")
-- 	entity_setState(me, STATE_IDLE)
-- end




-- -- after nodes have inited
-- function postInit(me)

-- 	v.n = getNaija()
-- end


-- function update(me, dt)
-- 	entity_followEntity(me, getEntity("Naija"))
-- end

-- function enterState(me)
-- 	if entity_isState(me, STATE_IDLE) then
-- 		entity_animate(me, "idle", -1)
-- 	end
-- end



-- function exitState(me)
-- end

-- function damage(me, attacker, bone, damageType, dmg)
-- 	return false
-- end

