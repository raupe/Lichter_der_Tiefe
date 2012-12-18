-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end



-- STATE_MYSTATE = 1000

-- localVar = 0


-- createEntity ("Li", "", 100, 100)


function init(me)

    setupBasicEntity( me,
      "", -- texture
      4, -- health
      2, -- manaballamount
      2, -- exp
      1, -- money
      48, -- collideRadius (for hitting entities and spells)
      STATE_IDLE, -- initState
      128,  -- sprite width
      128,  -- sprite height
      1, -- particle "explosion" type, maps to particleEffects.txt -1 = none
      1, -- 0/1 hit other entities off/on (uses collideRadius)
      400  -- updateCull -1: disabled, default: 4000 //
    )

	entity_setEntityType(me, ET_NEUTRAL)

    -- setupEntity(me)


	entity_initSkeletal(me, "00_starter")
	entity_setState(me, STATE_IDLE)
end




-- after nodes have inited
function postInit(me)

    v.n = getNaija()
end


function update(me, dt)
    entity_followEntity(me, getEntity("Naija"))
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
--   setupBasicEntity(
--   me,
--   "", -- texture
--   4, -- health
--   2, -- manaballamount
--   2, -- exp
--   1, -- money
--   48, -- collideRadius (for hitting entities and spells)
--   STATE_IDLE, -- initState
--   128,  -- sprite width
--   128,  -- sprite height
--   1, -- particle "explosion" type, maps to particleEffects.txt -1 = none
--   1, -- 0/1 hit other entities off/on (uses collideRadius)
--   4000  -- updateCull -1: disabled, default: 4000
-- )
-- end

-- function update(me, dt)
--   entity_updateMovement(me, dt)
-- end

-- function dieNormal(me)
-- end

-- function enterState(me)
-- end

-- function exitState(me)
-- end

-- function damage(me, attacker, bone, damageType, dmg)
-- end

-- function hitSurface(me)
-- end