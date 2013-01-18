-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- ================================================================================================
-- entity specific
-- ================================================================================================

v.dir = 0

-- ================================================================================================
-- FUNCTIONS
-- ================================================================================================

function init(me)

	v.kills = 401
	v.flag = 404
	v.path = 306

	setupEntity( me )
	entity_setTexture( me, "Crotoid" )
	entity_setDeathParticleEffect( me, "TinyRedExplode" )

	entity_setEntityType(me, ET_ENEMY )
	entity_setMaxSpeedLerp(me, 1, 1, -1, 1)

	entity_setState( me, STATE_IDLE )
	entity_setWidth( me, 128 )
	entity_setHeight( me, 128 ) -- sprite

	entity_setCollideRadius( me, 64 ) -- sprite/2
	entity_setHealth( me, 3 )
end


-- after nodes have initiated
function postInit(me)

	v.n = getNaija()
end



function update(me, dt)

	entity_handleShotCollisions(me)
	entity_touchAvatarDamage(me, 32, 1, 1200)

	if v.dir == 0 then
		entity_addVel(me, -1000, 0)
	else
		entity_addVel(me, 1000, 0)
	end

	entity_updateMovement(me, dt)
end

function enterState(me)

	if entity_isState(me, STATE_IDLE) then
		entity_animate(me, "idle", -1)
	end

	if entity_isState(me, STATE_DEAD) then

		entity_animate( me, "dead", -1 )
	end

end

function exitState(me)
end

function hitSurface(me)
	entity_flipHorizontal(me)
	if v.dir == 0 then
		v.dir = 1
	elseif v.dir == 1 then
		v.dir = 0
	end
end

function activate(me)
end


function damage(me, attacker, bone, damageType, dmg)
	return true
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

	setFlag(v.kills, getFlag(v.kills)+1 )

	if isFlag(v.flag, 0) then

		if getFlag(v.kills) == 1 then

			setControlHint( "Nejls: Bitte hoere damit auf, du tust ihnen weh....", 0, 0, 0, 3 )

			else if getFlag(v.kills) == 3 then

				setFlag(v.flag, 1)

				setFlag(v.path, getFlag(v.path)-1 )
			end
		end
	end

end