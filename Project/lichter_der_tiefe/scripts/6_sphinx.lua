-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------

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
    
    -- entity_setHealth(me, 30)
    v.flagComment = 603
    v.flagPass = 604
    v.quest = false
    
    
    v.time = 0
    v.flagGutBoese = 602
    v.flagNejl = 605
    v.diff = 004

    v.path = 306

    if getFlag(v.diff) == 2 then
        v.shotDt = 1    -- normal
    else
        v.shotDt = 0.5  -- diff
    end

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
			setControlHint("Sphinx"..nameLine.."Gut, du hast ihn mir gebracht, du darfst vorbei.", 0,0,0, 4)
			entity_delete(v.item)
		end
		
		if getFlag(v.flagPass) ~= 1 and entity_isEntityInRange(me, v.n, 600) and v.quest == false then
			v.quest = true
			setControlHint("Sphinx"..nameLine.."Bring mir den Stein aus der Mitte des Labyrinths.\nDann lasse ich dich vorbei.", 0,0,0, 5)
		end
		
		if getFlag(v.flagComment) ~= 1 and isForm(1) then
			setControlHint("Nejl"..nameLine.."Was machen diese Energie-Kristalle hier ?\nIm Palast darf doch gar nicht geschossen werden!", 0,0,0, 4)
			setFlag(v.flagComment, 1)
		end
		
	elseif entity_isState(me, STATE_ATTACK) then
		if isForm(0) then
		    entity_setState(me, STATE_IDLE)
		end
		
		v.time = v.time - dt
		if v.time < 0 and entity_isTargetInRange(me, 2000) then

            -- for i=1,v.num do -- verschiebung ?
            local s = createShot("sphinx", me, getNaija(), node_x(v.startShot), node_y(v.startShot))
            local dx = entity_x(v.n) - node_x(v.startShot)
            local dy = entity_y(v.n) - node_y(v.startShot)
            shot_setAimVector(s, dx, dy)
            -- end

			v.time = v.shotDt
		end
	
	end
end

function enterState(me)
    if entity_isState(me, STATE_ATTACK) then
    	entity_setTarget(me, v.n)
    	v.time = 0
    else
    	entity_setHealth(me, 20 * getFlag(v.diff) )
    end
    entity_animate(me, "idle", -1)
end

function exitState(me)
end

function damage(me, attacker, bone, damageType, dmg)
    if getFlag(v.flagNejl) ~= 1 then
        setControlHint("Sphinx"..nameLine.."War das schon alles ? An mir kommst du nicht so einfach vorbei!", 0,0,0, 4)
        setFlag(v.flagNejl, 1)
    end
	if entity_isState(me, STATE_IDLE) then
		entity_setState(me, STATE_ATTACK)
	end
    return true
end

function dieNormal(me)
	entity_setFlag(me, 1)
	setFlag(v.flagGutBoese, 1) -- ?
    setFlag(v.path, getFlag(v.path)-1 )
    setControlHint("Nejl"..nameLine.."Warum hast du sie umgebracht?", 0,0,0, 3)
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
