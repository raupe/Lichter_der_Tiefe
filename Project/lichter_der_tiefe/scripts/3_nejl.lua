-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_initSkeletal(me, "nejl")
	entity_setState(me, STATE_IDLE)

	v.gvel = false
	entity_setActivation(me, AT_CLICK, 32, 500)
	
end

-- after nodes have inited
function postInit(me)

	-- states:
	-- STATE_FOLLOW: follows emily
	-- STATE_IDLE: starts following as soon as emily is in range
	-- STATE_WAIT: won't follow emily
	-- STATE_DISABLED: won't follow emily until flag 303 is set to 1
	-- STATE_SING: falls asleep because of 'klang der ruhe'
	-- STATE_DELAY: lied-der-lichter dialog after 4 sec
	-- STATE_MOVE: flees from energyform

    v.n = getNaija()
    v.flag = 303
	v.followDelay = 0.2
	v.flagSleep = 802
	v.flagWake = 803
	v.flagAbschied = 308
	v.step = 0

    if isFlag(v.flag, 1) then
        v.x,v.y = entity_getPosition( v.n )
        entity_setPosition(me, v.x, v.y)
        entity_setState(me, STATE_FOLLOW)
        
    else
        entity_setState(me, STATE_DISABLED)
    end
    
    entity_scale(me, 0.4, 0.4)
	
	-- debug:
	-- setFlag(v.flagSleep, 0)
end

function update(me, dt)    
    
	entity_updateCurrents(me, dt)
	
	if entity_isState(me, STATE_DISABLED) then
    	if isFlag(v.flag, 1) then
        	entity_setState(me, STATE_FOLLOW)
    	end
    elseif entity_isState(me, STATE_MOVE) then
    	if v.step == 0 then    	
    		local x, y = node_getPathPosition(v.fleePath, 2)
    		if entity_isPositionInRange(me, x, y, 128) then
    			v.step = 1
    			entity_swimToPosition(me, node_getPathPosition(v.fleePath, 1))
    		end
    	elseif v.step == 1 then
    		local x, y = node_getPathPosition(v.fleePath, 1)
    		if entity_isPositionInRange(me, x, y, 128) then
    			v.step = 2
    			entity_swimToPosition(me, node_getPathPosition(v.fleePath, 0))
    		end
    	elseif v.step == 2 then
    		local x, y = node_getPathPosition(v.fleePath, 0)
    		if entity_isPositionInRange(me, x, y, 128) then
    			v.step = 3
    			entity_setState(STATE_DISABLED)
    		end
    	end
    
    
    elseif entity_isState(me, STATE_DELAY) then
    	v.time = v.time + dt
    	if v.time > 4 then
    		setControlHint("Nejl"..nameLine.."Jetzt haben wir alle Klaenge gelernt. Lass uns in meine Hoehle schwimmen um das Lied der Lichter zu lernen.", 0,0,0, 6)
    		entity_setState(me, STATE_FOLLOW)
    	end
    elseif entity_isState(me, STATE_IDLE) then
		entity_setTarget(me, v.n)
		v.followDelay = v.followDelay - dt
		if v.followDelay < 0 then
			v.followDelay = 0
		end
		if entity_isEntityInRange(me, v.n, 1024) and not entity_isEntityInRange(me, v.n, 256) and not avatar_isOnWall() then
			if v.followDelay <= 0 then
				entity_setState(me, STATE_FOLLOW)
			end
		end 
		entity_doSpellAvoidance(me, dt, 128, 0.1)
		if entity_isEntityInRange(me, v.n, 20) then
			entity_moveTowardsTarget(me, dt, -150)
		end
	elseif entity_isState(me, STATE_FOLLOW) then
		local amt = 800
		entity_doCollisionAvoidance(me, dt, 4, 1, 100, 1, true)
		
		entity_setTarget(me, v.n)
		
		if entity_isEntityInRange(me, v.n, 180) then
			entity_setMaxSpeedLerp(me, 0.2, 1)
		else
			entity_setMaxSpeedLerp(me, 1, 0.2)
		end
		
		if entity_isEntityInRange(me, v.n, 180) then
			entity_doFriction(me, dt, 200)
			if ((math.abs(entity_velx(v.n)) < 10 and math.abs(entity_vely(v.n)) < 10) or avatar_isOnWall()) then
				entity_setState(me, STATE_IDLE)
			end
		elseif entity_isEntityInRange(me, v.n, 250) then
			entity_moveTowardsTarget(me, dt, amt)
		elseif entity_isEntityInRange(me, v.n, 512) then
			entity_moveTowardsTarget(me, dt, amt*2)
		elseif not entity_isEntityInRange(me, v.n, 1024) then
			entity_moveTowardsTarget(me, dt, amt)
		else
			entity_moveTowardsTarget(me, dt, amt)
		end
	
		if math.abs(entity_velx(me)) < 1 and math.abs(entity_vely(me)) < 1 then
			entity_setMaxSpeedLerp(me, 1)
			entity_moveTowardsTarget(me, 1, 500)
		end
	elseif entity_isState(me, STATE_SING) then
		entity_addVel(me, 0, 4)
		entity_rotateToVel (me, 3, 90) 
	end
	
	if not entity_isState(me, STATE_SING) then
		if (math.abs(entity_velx(me))) > 10 then
			entity_flipToVel(me)
		end
		if not entity_isState(me, STATE_IDLE) then
			entity_rotateToVel(me, 0.1)
		end
	end
	
	if math.abs(entity_velx(me)) > 20 or math.abs(entity_vely(me)) > 20 then
		entity_doFriction(me, dt, 150)
		v.gvel = true
	else
		if v.gvel then
			entity_clearVel(me)
			v.gvel = false
		else
			entity_doFriction(me, dt, 40)
		end
	end
	entity_updateMovement(me, dt)

end

function enterState(me)
	if entity_isState(me, STATE_FOLLOW) then
		v.followDelay = 0.2
		entity_animate(me, "idle", LOOP_INF)
		entity_setMaxSpeed(me, 600)
		
		entity_setMaxSpeedLerp(me, 1, 0.1)
		entity_animate(me, "swim", -1)
		setFlag(v.flag, 1)
	else
		entity_animate(me, "idle", -1)
	end
	
	if entity_isState(me, STATE_WAIT) then
		entity_clearVel(me)
	elseif entity_isState(me, STATE_DISABLED) then
		entity_clearVel(me)
		if isFlag(v.flag, 1) then
			setFlag(v.flag, 2)
		end
	elseif entity_isState(me, STATE_DELAY) then
		v.time = 0
	elseif entity_isState(me, STATE_MOVE) then
		v.fleePath = getNode("3_nejl_flee")
		entity_swimToPosition(me, node_getPathPosition(v.fleePath, 2))
	end
end

function exitState(me)
end

function damage(me, attacker, bone, damageType, dmg)
	return false
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
	if song == 101 and getFlag(v.flagSleep) ~= 1 then
		setFlag(v.flagSleep, 1)
		if getNode("a_hoehle_der_ruhe") ~= 0 then
			entity_setState(me, STATE_SING)
			setControlHint("Emily"..nameLine.."Nejl? ... Er ist eingeschlafen.", 0, 0, 0, 4)
		else
			setControlHint("Nejl"..nameLine.."Uhaaa ... fast haette mich das Lied eingeschlaefert!", 0, 0, 0, 4)
		end
	elseif song == 104 and isFlag(v.flagAbschied, 0) then
		entity_swimToPosition(me, entity_getPosition(v.n))
		setFlag(v.flagAbschied, 8)
	end
end

function activate(me)
	if entity_isState(me, STATE_SING) then
		setFlag(v.flagWake, 1)
	elseif entity_isState(me, STATE_FOLLOW) or entity_isState(me, STATE_IDLE) then
		setControlHint("Nejl"..nameLine.."Schwimm vor, ich folge dir.", 0, 0, 0, 2)
	end

end





-- function init(me)

-- 	setupEntity(me)
-- 	entity_setEntityType(me, ET_NEUTRAL)
-- 	entity_initSkeletal(me, "1_mejais_ghost")
-- 	entity_setState(me, STATE_IDLE)
-- 	entity_setCollideRadius(me, 32)
-- 	entity_setHealth(me, 5)
-- 	entity_setDeathParticleEffect(me, "TinyRedExplode")

-- 	setupBasicEntity( me,
-- 	  "", -- texture
-- 	  4, -- health
-- 	  2, -- manaballamount
-- 	  2, -- exp
-- 	  1, -- money
-- 	  48, -- collideRadius (for hitting entities and spells)
-- 	  STATE_IDLE, -- initState
-- 	  128,  -- sprite width
-- 	  128,  -- sprite height
-- 	  1, -- particle "explosion" type, maps to particleEffects.txt -1 = none
-- 	  1, -- 0/1 hit other entities off/on (uses collideRadius)
-- 	  400  -- updateCull -1: disabled, default: 4000 //
-- 	)

-- 	entity_setEntityType(me, ET_NEUTRAL)

-- 	-- setupEntity(me)


-- 	entity_initSkeletal(me, "00_starter")
-- 	entity_setState(me, STATE_IDLE)
-- end




-- -- after nodes have inited
-- function postInit(me)

-- 	v.n = getNaija()
-- end


-- function update(me, dt)
-- 	entity_followEntity(me, getEntity("Naija"))
-- end

-- function enterState(me)
-- 	if entity_isState(me, STATE_IDLE) then
-- 		entity_animate(me, "idle", -1)
-- 	end
-- end



-- function exitState(me)
-- end

-- function damage(me, attacker, bone, damageType, dmg)
-- 	return false
-- end

