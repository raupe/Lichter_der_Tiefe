-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------

function init(me)
	if entity_isFlag(me, 1) then
		entity_delete(me)
	end
	
	v.flagDie = 702
	v.diff = 004
	
	v.inNode = false
	v.spawn = true
	
	v.time = 0
	v.dt = math.random() * 5
	
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
	v.back = getNode("7_cerajt_back")

	entity_setTarget(me, v.n)
end

function update(me, dt)

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


	-- random spawn
	if v.spawn and entity_isTargetInRange(me, 1600) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.time = 0
			v.dt =  math.random() * 5


			v.num = math.random() * 3
	        v.x,v.y = entity_getPosition(me)

	        while v.num >= 0 do

	        	v.num = v.num - 1
				createEntity("7_cerajt_fische", "", v.x, v.y + math.random() * (v.num*50) )
	        end
    	end
	end

	entity_handleShotCollisionsSkeletal(me)
end
-- in die n'he dann spawn !
function enterState(me)

	if entity_isState(me, STATE_IDLE) then
		entity_animate(me, "idle", -1)
	end

	if entity_isState(me, STATE_PREP) then
		v.spawn = false
		entity_swimToNode(me, v.back)
	end

	if entity_isState(me, STATE_ATTACK) then
		v.spawn = true
	end

end

function dieNormal(me)
	entity_setFlag(me, 1)
	setFlag(v.flagDie, 1)

	local nejl = getEntity("3_Nejl")
	entity_setState(nejl, STATE_FOLLOW)
	setControlHint("Nejl"..nameLine.."Emily! Du hast mich gerettet!", 0,0,0, 4)
end

function exitState(me)

end

function damage(me, attacker, bone, damageType, dmg)
	-- return true
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
	if song == 103 then
		entity_setState(me, STATE_PREP)
	end
end

function activate(me)
end
