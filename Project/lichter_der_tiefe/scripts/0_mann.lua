-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	v.range = 64

	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_setTexture(me, "0_mann")
	entity_setState(me, STATE_IDLE)
	entity_setCollideRadius(me, v.range)
end

-- after nodes have inited
function postInit(me)
	v.n = getNaija()
end

function update(me, dt)
	if entity_isEntityInRange(me, v.n, v.range) then
		entity_touchAvatarDamage(me, v.range, 0, 300)
	end
end

function enterState(me)
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
