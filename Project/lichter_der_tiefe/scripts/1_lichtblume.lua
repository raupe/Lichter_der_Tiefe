-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_initSkeletal(me, "lichtblume")
	entity_setState(me, STATE_IDLE)
	
	v.flag = 105
	
	v.glowing = false
	v.r = randRange(50, 100) / 100
	v.g = randRange(50, 100) / 100
	v.b = randRange(50, 100) / 100
end

-- after nodes have inited
function postInit(me)
end

function update(me, dt)
	if not v.glowing and getFlag(v.flag) == 1 then
		v.glowing = true
		
		local r = randRange(50, 100) / 100
		local g = randRange(50, 100) / 100
		local b = randRange(50, 100) / 100
		
		v.glow = createQuad("Naija/LightFormGlow", 13)
		quad_setPosition(v.glow, entity_getPosition(me))
		quad_scale(v.glow, 4, 4)
		quad_alpha(v.glow, 0)
		quad_alpha(v.glow, 1, 0.5)
		quad_color(v.glow, r, g, b)	
			
		local current = entity_getNearestNode(me, "current")
        node_setActive(current, false)
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
		setFlag(v.flag, 1)
	end
end

function activate(me)
end
