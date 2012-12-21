-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_initSkeletal(me, "1_mejais_ghost")
	entity_setState(me, STATE_IDLE)
	entity_setCollideRadius(me, 32)
	entity_setHealth(me, 5)
	entity_setDeathParticleEffect(me, "TinyRedExplode")
end

-- after nodes have inited
function postInit(me)
	v.n = getNaija()
	v.time = 0
end

function update(me, dt)
	if entity_isState(me, STATE_IDLE) then
		v.time = v.time + dt
		if v.time > 5 then
			v.time = 0

			rand = randRange(0, 3)
			if rand == 1 then
				pos = getNode("1_mejais_1")
				entity_swimToNode(me, pos, 4)
			elseif rand == 2 then
				pos = getNode("1_mejais_2")
				entity_swimToNode(me, pos, 4)
			elseif rand == 3 then
				pos = getNode("1_mejais_3")
				entity_swimToNode(me, pos, 4)
			end

		end
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
