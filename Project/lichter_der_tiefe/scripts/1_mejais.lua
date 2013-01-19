-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_initSkeletal(me, "1_mejais")
	entity_setState(me, STATE_IDLE)
	entity_setCollideRadius(me, 32)
	entity_setHealth(me, 5)
	entity_setDeathParticleEffect(me, "TinyRedExplode")
end

-- after nodes have inited
function postInit(me)
	v.n = getNaija()
end

function update(me, dt)
end

function enterState(me)
	if entity_isState(me, STATE_IDLE) then
		entity_animate(me, "lie", -1)
	end
	if entity_isState(me, STATE_DEATHSCENE) then
		entity_animate(me, "dead", -1)
		entity_color(me, 0.3, 0.3, 0.3, 3)
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
