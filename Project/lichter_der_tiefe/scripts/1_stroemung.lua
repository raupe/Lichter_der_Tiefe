-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
    setupEntity(me)
    entity_setEntityType(me, ET_NEUTRAL)
    v.deaktivated = false
end

-- after nodes have inited
function postInit(me)
end

function update(me, dt)
	if not v.deaktivated and getFlag(100) > 1 then
        local current = entity_getNearestNode(me, "current")
        node_setActive(current, false)
        v.deaktivated = true
	end
end

function enterState(me)
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
	if song == 104 then
		setFlag(100, 2)
		local banterSchacht = getNode("1_banter_schacht")
		node_setActive(banterSchacht, false)
	end
end

function activate(me)
end
