-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	if entity_isFlag(me, 1) then
		entity_delete(me)
	end
	
	v.flagDie = 702
	v.diff = 004
	
	setupEntity(me)
	entity_initSkeletal(me, "anglerfish")
	entity_scale(me, 3, 3)
	entity_flipHorizontal(me)
	
    entity_setCollideRadius(me, 32)
    entity_generateCollisionMask(me)
    entity_setDeathParticleEffect(me, "TinyRedExplode")
	
	entity_setEntityType(me, ET_ENEMY)
	entity_setState(me, STATE_IDLE)
    entity_setHealth(me, 15 * getFlag(v.diff))
end

-- after nodes have inited
function postInit(me)
	v.n = getNaija()
end

function update(me, dt)
	if entity_collideSkeletalVsCircle(me, v.n) ~= 0 then
		entity_touchAvatarDamage(me, 0, 0, 500)
	end
	
	entity_handleShotCollisionsSkeletal(me)
end

function enterState(me)
	if entity_isState(me, STATE_IDLE) then
		entity_animate(me, "idle", -1)
	end
end

function dieNormal(me)
	entity_setFlag(me, 1)
	setFlag(v.flagDie, 1)
	
	local nejl = getEntity("3_Nejl")
	entity_setState(nejl, STATE_FOLLOW)
	setControlHint("Nejl: Emily! Du hast mich gerettet!", 0,0,0, 4)
end

function exitState(me)
end

function damage(me, attacker, bone, damageType, dmg)
	return true
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
