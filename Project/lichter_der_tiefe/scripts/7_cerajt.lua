-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	if entity_isFlag(me, 1) then
		entity_delete(me)
	end
	
	v.flagDie = 702
	v.diff = 004
	
	v.inNode = false
	v.time = 0
	v.dt = 2
	v.change = 0

	
	setupEntity(me)
	entity_initSkeletal(me, "anglerfish")
	entity_scale(me, 3, 3)
	entity_flipHorizontal(me)
	
    entity_setCollideRadius(me, 256)
    entity_generateCollisionMask(me)
    entity_setDeathParticleEffect(me, "TinyRedExplode")
	
	entity_setEntityType(me, ET_ENEMY)
	entity_setState(me, STATE_IDLE)
    entity_setHealth(me, getFlag(v.diff))
    
    v.wentBack = false
end

-- after nodes have inited
function postInit(me)
	v.n = getNaija()
	v.back = getNode("7_cerajt_back")

	entity_setTarget(me, v.n)
end

function update(me, dt)

	if entity_getHealth(me) == 0 then

		-- should be on dieNormal() -> e.g. death animation
		entity_setFlag(me, 1)
		setFlag(v.flagDie, 1)

		local nejl = getEntity("3_Nejl")
		entity_setState(nejl, STATE_FOLLOW)
		setControlHint(DATA_TEXTS.cerajt_1, 0,0,0, 4)

		--dieNormal()
		return
	end

	-- get damage
	if entity_collideSkeletalVsCircle(me, v.n) ~= 0 then
		entity_touchAvatarDamage(me, 0, 1, 500)
	end

	if not v.inNode and node_isEntityIn(v.back, me) then
		watch(1)
		entity_flipToEntity(me, v.n)
		entity_setState(me, STATE_ATTACK)
		v.inNode = true
	end

	entity_handleShotCollisionsSkeletal(me)


	-- additional animate
	if v.wentBack then
		v.time = v.time + dt
		if v.time >= v.dt then
	
			v.time = 0
	
			if v.change > 0 then
				v.change = -20
			else
				v.change = 20
			end
	
			entity_addVel(me, 0, v.change)
		end
	end

	entity_updateMovement(me, dt)
end

function enterState(me)

	if entity_isState(me, STATE_IDLE) then
		entity_animate(me, "idle", -1)
	end

	if entity_isState(me, STATE_PREP) then
		entity_swimToNode(me, v.back)
	end

	-- if entity_isState(me, STATE_DEAD) then
	-- end
end


function dieNormal(me)
	entity_setFlag(me, 1)
	setFlag(v.flagDie, 1)

	local nejl = getEntity("3_Nejl")
	entity_setState(nejl, STATE_FOLLOW)
	setControlHint(DATA_TEXTS.cerajt_1, 0,0,0, 4)
end

function exitState(me)
end

function damage(me, attacker, bone, damageType, dmg)
	if attacker == v.n then
		return false
	else
		return true
	end
end

function song(me, song)
	if song == 103 then
		entity_setState(me, STATE_PREP)
		v.wentBack = true
	end
end
