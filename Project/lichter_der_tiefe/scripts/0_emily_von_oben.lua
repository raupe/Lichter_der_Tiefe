-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_initSkeletal(me, "0_emily_von_oben")
	entity_setState(me, STATE_IDLE)
	entity_setCollideRadius(me, 32)
	entity_setHealth(me, 5)
	entity_setDeathParticleEffect(me, "TinyRedExplode")
end

-- after nodes have inited
function postInit(me)
	v.n = getNaija()
	v.time = 0
	
	entity_followEntity(me, v.n)
end

function update(me, dt)
	--if not entity_isEntityInRange(me, v.n, 180) then
	--	entity_moveTowardsTarget(me, v.n, 800)
	--end
	
	entity_setPosition(me, entity_getPosition(v.n))
	entity_rotate(me, entity_getRotation(v.n))
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
