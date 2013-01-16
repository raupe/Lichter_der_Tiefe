-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

--[[
Status:
	STATUS_IDLE
	STATUS_SING - schlafend
	STATUS_ATTACK
]]--

function init(me)
	v.collisionSegs = 50

	setupBasicEntity(
	me,
	"",						-- texture
	6,						-- health
	1,						-- manaballamount
	1,						-- exp
	1,						-- money
	32,						-- collideRadius (only used if hit entities is on)
	STATE_IDLE,				-- initState
	90,						-- sprite width
	90,						-- sprite height
	1,						-- particle "explosion" type, maps to particleEffects.txt -1 = none
	0,						-- 0/1 hit other entities off/on (uses collideRadius)
	-1						-- updateCull -1: disabled, default: 4000
	)

	entity_initHair(
	me,
	80,						-- divisions
	4,						-- length per division
	32,						-- width
	"eel-0001"				-- gfx name
	)
	
	entity_setMaxSpeed (me, 2000)
	
	v.dir = 1
	v.n = getNaija()
	v.pos = 1
	
	
end

-- after nodes have inited
function postInit(me)
	v.posNode1 = getNode("5_aal_pos_1")
	v.posNode2 = getNode("5_aal_pos_2")
	v.posNode3 = getNode("5_aal_pos_3")
	v.posNode4 = getNode("5_aal_pos_4")
end

function update(me, dt)
	
	-- get damage
	entity_handleShotCollisionsHair(me, v.collisionSegs)

	if entity_isState(me, STATE_IDLE) then
		if v.pos == 1 then
			entity_swimToNode(me, v.posNode1)
			if node_isEntityIn(v.posNode1, me) then
				v.pos = 2
			end
		elseif v.pos == 2 then
			entity_swimToNode(me, v.posNode2)
			if node_isEntityIn(v.posNode2, me) then
				v.pos = 3
			end
		elseif v.pos == 3 then
			entity_swimToNode(me, v.posNode3)
			if node_isEntityIn(v.posNode3, me) then
				v.pos = 4
			end
		else
			entity_swimToNode(me, v.posNode4)
			if node_isEntityIn(v.posNode4, me) then
				v.pos = 1
			end
		end

	elseif entity_isState(me, STATE_SING) then
		entity_addVel(me, 0, 4)
		entity_exertHairForce(me, 100, 0, dt)
		
	elseif entity_isState(me, STATE_ATTACK) then
		
		entity_moveTowardsTarget(me, dt, 3000)
		
		entity_doEntityAvoidance(me, dt, 1, 1)
		entity_doCollisionAvoidance(me, dt, 4, 0.8)
		
		-- collide with naija
		if entity_collideHairVsCircle(me, v.n, v.collisionSegs) then
			entity_touchAvatarDamage(me, 0, 2, 800)
		end
		
	end
	
	entity_updateMovement(me, dt)	
	entity_setHairHeadPosition(me, entity_x(me), entity_y(me))
	entity_updateHair(me, dt)
end

function enterState(me)
	if entity_isState(me, STATE_ATTACK) then
		entity_setTarget(me, v.n)
	elseif entity_isState(me, STATE_SING) then
		entity_clearTargetPoints(me)
		entity_clearVel(me)
	end
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
	if song == 101 then
		entity_setState(me, STATE_SING)
	end
end

function activate(me)
end


local function sleep()

end


