-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

--[[
States:
STATE_IDLE
STATE_ATTACK
]]--

function init(me)
	if entity_isFlag(me, 1) then
		entity_delete(me)
	end
	
    setupEntity(me)
    entity_setEntityType(me, ET_ENEMY)
    entity_initSkeletal(me, "6_sphinx")
    entity_setCollideRadius(me, 32)
    entity_generateCollisionMask(me)
    entity_setDeathParticleEffect(me, "TinyRedExplode")
    entity_scale(me, 2, 2)
    entity_setState(me, STATE_IDLE)
    
    entity_setHealth(me, 10)
    v.flagComment = 603
    v.flagPass = 604
    v.quest = false
    
    v.shotDt = 1
    v.time = 0
    v.flagGutBoese = 602
	
end

-- after nodes have inited
function postInit(me)
	v.n = getNaija()
    v.item = getEntity("6_item")
    v.startShot = getNode("6_shot_start")
end

function update(me, dt)
	if entity_collideSkeletalVsCircle(me, v.n) ~= 0 and getFlag(v.flagPass) ~= 1 then
		entity_touchAvatarDamage(me, 0, 0, 500)
	end
	
	entity_handleShotCollisionsSkeletal(me)
	
	if entity_isState(me, STATE_IDLE) then
	
		if getFlag(v.flagPass) ~= 1 and entity_isEntityInRange(me, v.item, 600) then
			setFlag(v.flagPass, 1)
			setControlHint("Sphinx: Gut, du hast ihn mir gebracht, du darfst vorbei.", 0,0,0, 4)
			entity_delete(v.item)
		end
		
		if getFlag(v.flagPass) ~= 1 and entity_isEntityInRange(me, v.n, 600) and v.quest == false then
			v.quest = true
			setControlHint("Sphinx: Bring mir den Stein aus der Mitte des Labyrinths. Dann lasse ich dich vorbei.", 0,0,0, 5)
		end
		
		if getFlag(v.flagComment) ~= 1 and isForm(1) then
			setControlHint("Sphinx: Bist du sicher, dass du das tuen willst?", 0,0,0, 4)
			setFlag(v.flagComment, 1)
		end
		
	elseif entity_isState(me, STATE_ATTACK) then
		if isForm(0) then
		    if isFlag(v.flagPass, 1) then
	    		entity_setState(me, STATE_OPEN)
		    else
			    entity_setState(me, STATE_IDLE)
			end
		end
		
		v.time = v.time - dt		
		if v.time < 0 and entity_isTargetInRange(me, 2000) then
			local s = createShot("sphinx", me, getNaija(), node_x(v.startShot), node_y(v.startShot))
			local dx = entity_x(v.n) - node_x(v.startShot)
			local dy = entity_y(v.n) - node_y(v.startShot)
			shot_setAimVector(s, dx, dy)
			
			v.time = v.shotDt
		end
	
	end
end

function enterState(me)
    if entity_isState(me, STATE_ATTACK) then
    	entity_setTarget(me, v.n)
    	v.time = 0
    else
    	entity_setHealth(me, 10)
    end
    entity_animate(me, "idle", -1)
end

function exitState(me)
end

function damage(me, attacker, bone, damageType, dmg)
	if entity_isState(me, STATE_IDLE) then
		entity_setState(me, STATE_ATTACK)
	end
    return true
end

function dieNormal(me)
	entity_setFlag(me, 1)
	setFlag(v.flagGutBoese, 1)
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
end

function activate(me)
end
