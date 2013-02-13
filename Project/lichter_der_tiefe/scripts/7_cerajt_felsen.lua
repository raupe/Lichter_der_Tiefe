if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


function init(me)

	setupEntity( me )
	entity_setEntityType(me, ET_ENEMY)
	entity_setTexture( me, "7_cerajt/ice-rock-0001.png")

	entity_setCollideRadius( me, 128 )
	-- entity_generateCollisionMask(me)
	entity_setDeathParticleEffect(me, "TinyRedExplode") -- scherben ?
	entity_setMaxSpeed(me, 500)
	-- entity_scale(me, 1, 1)


	entity_setState( me, STATE_IDLE )

	-- entity_setBounceType(me, BOUNCE_REAL)
	-- entity_setMaxSpeed(me, randRange(400, 500))

	v.falling = false
	-- v.x = 20
end


-- after nodes have initiated
function postInit(me)

	v.n = getNaija()
	-- entity_applySurfaceNormalForce(me, 1000)
	-- entity_applySurfaceNormalForce(me, 0)
	-- entity_addVel(me, v.x * 10, 100)
end



function update(me, dt)
	entity_handleShotCollisions(me)

	if v.falling then

		entity_addVel(me, 0, 10)
		entity_updateMovement(me, dt)
	end
end

function enterState(me)
end

function exitState(me)
end

function hitSurface(me)
	v.falling = false
end

function activate(me)
end


function damage(me, attacker, bone, damageType, dmg)

	v.falling = true
	--setControlHint("debug: falling", 0,0,0, 4)
	return false
end


function animationKey(me, key)
end

function songNote(me, note)
end

function songNoteDone(me, note)
end

function song(me, song)
end


function dieNormal(me)
end