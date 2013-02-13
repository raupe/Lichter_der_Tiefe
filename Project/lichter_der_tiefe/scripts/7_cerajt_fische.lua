-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- ================================================================================================
-- entity specific
-- ================================================================================================

v.dir = 0


-------------------------
local nameLine = ":\n \n"
-------------------------

-- ================================================================================================
-- FUNCTIONS
-- ================================================================================================

function init(me)

	-- if entity_isFlag(me, 1) then
	-- 	entity_delete(me)
	-- end


	-- setupEntity( me )
	-- entity_setTexture( me, "Crotoid" )
	-- entity_setDeathParticleEffect( me, "TinyRedExplode" )

	-- entity_setEntityType(me, ET_ENEMY )
	-- entity_setMaxSpeedLerp(me, 1, 1, -1, 1)

	-- entity_setState( me, STATE_IDLE )
	-- entity_setWidth( me, 128 )
	-- entity_setHeight( me, 128 )

	-- entity_setCollideRadius( me, 64 )
	-- entity_setHealth( me, 1 * getFlag(v.diff) )
	
	
	setupBasicEntity(
	me,
	"Nautilus",						-- texture
	4,								-- health
	1,								-- manaballamount
	1,								-- exp
	1,								-- money
	32,								-- collideRadius (only used if hit entities is on)
	STATE_IDLE,						-- initState
	90,								-- sprite width
	90,								-- sprite height
	1,								-- particle "explosion" type, maps to particleEffects.txt -1 = none
	0,								-- 0/1 hit other entities off/on (uses collideRadius)
	-1,								-- updateCull -1: disabled, default: 4000
	1
	)

	entity_setDeathParticleEffect(me, "TinyBlueExplode")

	entity_rotate(me, 360, 1, LOOP_INF)		-- make the nautilus spin 360 degrees endlessly over 1 second
	v.lungeDelay = 1.0						-- prevent the nautilus from attacking right away
	loadSound("Nautilus")

	-- entity_setMaxSpeed(me, 450)

	v.time = 0
	v.lifeTime = math.random() * 4
end


-- after nodes have initiated
function postInit(me)

	v.n = getNaija()
	entity_setTarget(me, v.n)
end



function update(me, dt)


	v.time = v.time + dt
	if v.time >= v.lifeTime then

		v.time = 0
		entity_delete(me)
		return
	end

	entity_handleShotCollisions(me)
	entity_touchAvatarDamage(me, 32, 0.1, 1200)

	entity_moveTowardsTarget(me, 950, 1)
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
end


