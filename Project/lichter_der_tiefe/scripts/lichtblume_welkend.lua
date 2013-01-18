-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	
	v.flagLiedDerLichter = 1100
	
	entity_initSkeletal(me, "lichtblume")
end

-- after nodes have inited
function postInit(me)
end

function update(me, dt)	
end

function enterState(me)
	if getFlag(v.flagLiedDerLichter) == 1 then
		entity_animate(me, "welken", -1)
	else
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
	local r = randRange(50, 100) / 100
	local g = randRange(50, 100) / 100
	local b = randRange(50, 100) / 100
	
	v.glow = createQuad("Naija/LightFormGlow", 13)
	quad_setPosition(v.glow, entity_getPosition(me))
	quad_scale(v.glow, 8, 8)
	quad_alpha(v.glow, 0)
	quad_alpha(v.glow, 1, 0.5)
	quad_color(v.glow, r, g, b)
end

function activate(me)
end
