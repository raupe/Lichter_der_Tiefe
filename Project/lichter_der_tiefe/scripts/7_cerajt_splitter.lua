if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


function init(me)

	setupEntity( me )
	-- local texture = string.format("tile-rock-000%d", randRange(1,4))
	entity_setTexture( me, "7_cerajt/ice-rock-0003" )
	entity_scale(me, 0.5, 0.5)
	entity_setCollideRadius( me, 32 )
	entity_setBounceType(me, BOUNCE_REAL)
	entity_setMaxSpeed(me, randRange(400, 500))

	entity_setState( me, STATE_IDLE )
	v.falling = true
	v.bounce = 1
	v.x = randRange(-10, 10)
end


-- after nodes have initiated
function postInit(me)

	v.n = getNaija()
	
	entity_applySurfaceNormalForce(me, 1000)
	entity_applySurfaceNormalForce(me, 0)
	entity_addVel(me, v.x * 10, 100)
end



function update(me, dt)
	
	if v.falling then
		entity_touchAvatarDamage(me, 32, 0.5, 100)
	else
		entity_touchAvatarDamage(me, 32, 0, 100)
	end
	
	
	local vx = entity_velx(me)
	entity_rotate(me, entity_getRotation(me)+dt*vx)	

	entity_addVel(me, v.x, 10)

	entity_updateMovement(me, dt)
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