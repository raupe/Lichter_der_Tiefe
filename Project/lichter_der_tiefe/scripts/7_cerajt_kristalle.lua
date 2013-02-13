if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


function init(me)

	setupEntity( me )
	entity_setEntityType(me, ET_ENEMY)
	entity_setTexture( me, "7_cerajt/ice-rock-0001.png")

	entity_setCollideRadius( me, 128 )
	entity_generateCollisionMask(me)
	entity_setDeathParticleEffect(me, "TinyRedExplode") -- scherben ?
	entity_setMaxSpeed(me, 500)

	entity_setState( me, STATE_IDLE )

	v.falling = false
end


-- after nodes have initiated
function postInit(me)

	v.n = getNaija()
	v.cerajt = getEntity("7_cerajt")
end



function update(me, dt)

	entity_handleShotCollisions(me)

	if v.falling then

		entity_addVel(me, 0, 10)
		entity_updateMovement(me, dt)

		v.nearest = entity_getNearestEntity(me)

		if v.nearest == v.cerajt then


			playSfx("mithalasurn-break", 0, 0.6)

			for i=1,5 do
				createEntity("7_cerajt_splitter", "", entity_x(me), entity_y(me))
			end

			-- cerajt dmg + splitter
			entity_changeHealth(v.cerajt, -1)
			entity_delete(me)
		end

	end
end

function enterState(me)
end

function exitState(me)
end

function hitSurface(me)
	entity_delete(me)
end

function activate(me)
end


function damage(me, attacker, bone, damageType, dmg)
	v.falling = true
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