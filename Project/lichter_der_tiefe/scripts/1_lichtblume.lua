-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_initSkeletal(me, "1_lichterblume")
	entity_setState(me, STATE_IDLE)
	
	v.glow = false
	v.r = randRange(50, 100) / 100
	v.g = randRange(50, 100) / 100
	v.b = randRange(50, 100) / 100
end

-- after nodes have inited
function postInit(me)
end

function update(me, dt)
	if not v.glow and getFlag(100) > 1 then
		v.glow = true
		
		local current = entity_getNearestNode(me, "current")
        node_setActive(current, false)
	end
	
	if v.glow then
		local l = createQuad("Naija/LightFormGlow", 13)
		quad_setPosition(l, entity_getPosition(me))
		quad_scale(l, 2, 2)
		-- quad_alpha(l, 0)
		-- quad_alpha(l, 1, 0.5)
		quad_color(l, v.r, v.g, v.b)		
		quad_delete(l, 4)
		quad_color(v.glow, r, g, b, 0.5)
	end
end

function enterState(me)
	if entity_isState(me, STATE_IDLE) then
		entity_animate(me, "idle", -1)
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
	if song == 104 then
		setFlag(100, 2)
	end
end

function activate(me)
end
