-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- ================================================================================================
-- entity specific
-- ================================================================================================

v.dir = 0

-- entity specific
local STATE_FIRE			= 1000
local STATE_PULLBACK		= 1001
-- local STATE_REGROUP			= 1002

-- ================================================================================================
-- FUNCTIONS
-- ================================================================================================

function init(me)

	setupBasicEntity(
	me,
	"piranha",						-- texture
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

	v.time = 0
	v.lifeTime = math.random() * 4
end


-- after nodes have initiated
function postInit(me)

	v.n = getNaija()
	v.cerajt = 702
	v.radius = 500
	
	v.diff = 004

end


function update(me, dt)	

	if isFlag(v.cerajt, 1) then
	 	entity_delete(me)
		return
	end

	if entity_isState(me, STATE_ATTACK) then
		entity_moveTowardsTarget(me, dt, 1000)
		entity_rotateToVel(me, 0.1)
		entity_flipToVel(me)
		entity_doCollisionAvoidance(me, dt, 8, 0.4)
		entity_doEntityAvoidance(me, dt, 16, 0.8)
	elseif entity_isState(me, STATE_PULLBACK) then
		entity_moveTowardsTarget(me, dt, -4000)
		entity_rotateToVel(me, 0.1)
		entity_flipToVel(me)
		entity_doCollisionAvoidance(me, dt, 8, 0.4)
		entity_doEntityAvoidance(me, dt, 32, 0.8)
	-- elseif entity_isState(me, STATE_REGROUP) then
	-- 	entity_doEntityAvoidance(me, dt, 32, -2.0)
	elseif entity_isState(me, STATE_IDLE) then
		if v.dir == 0 then
			entity_addVel(me, -1000, 0)
		else
			entity_addVel(me, 1000, 0)
		end
		entity_rotateToVel(me, 0.1)
		entity_flipToVel(me)
		entity_doEntityAvoidance(me, dt, 32, 0.8)
	end

	if entity_hasTarget(me) then
		if not (entity_isState(me, STATE_ATTACK) or entity_isState(me, STATE_PULLBACK)) then
			entity_setState(me, STATE_ATTACK)
		else
			entity_findTarget(me, v.radius)
		end
	else
		if not entity_isState(me, STATE_IDLE) then
			entity_setState(me, STATE_IDLE)
		end
		entity_findTarget(me, v.radius)
	end

	entity_updateCurrents(me, dt)

	entity_updateMovement(me, dt)

	entity_handleShotCollisions(me)
	if entity_isState(me, STATE_ATTACK) then
		if entity_touchAvatarDamage(me, entity_getCollideRadius(me), 0.2 , 200) then--* getFlag(v.diff), 200) then
			entity_sound(me, "Bite", 1200+math.random(200))
			entity_setState(me, STATE_PULLBACK, 1)
		end
	end

end

function enterState(me)
	if entity_isState(me, STATE_ATTACK) then
		entity_setMaxSpeedLerp(me, 2.25, 0.5)
	elseif entity_isState(me, STATE_PULLBACK) then
		entity_setMaxSpeedLerp(me, 2, 0.5)
		entity_moveTowardsTarget(me, 1, -500)
	elseif entity_isState(me, STATE_IDLE) then
		entity_setMaxSpeedLerp(me, 0.5)
		entity_setMaxSpeedLerp(me, 1, 1, -1, 1)
		entity_rotate(me, 0, 1, 0, 0, 1)
	end
end

function exitState(me)
	if entity_isState(me, STATE_PULLBACK) then
		entity_setState(me, STATE_ATTACK)
	-- elseif entity_isState(me, STATE_REGROUP) then
		-- entity_setState(me, STATE_IDLE)
	end
end

function hitSurface(me)
	entity_flipHorizontal(me)
	if v.dir == 0 then
		v.dir = 1
	elseif v.dir == 1 then 
		v.dir = 0
	end
end

function damage(me, attacker, bone, damageType, dmg)
	return false
end


function dieNormal(me)
end
