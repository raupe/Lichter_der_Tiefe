-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	
end

-- after nodes have inited
function postInit(me)

	v.flagLiedDerLichter = 1100
	
	if getFlag(v.flagLiedDerLichter) == 1 then
		v.dark = createQuad("lichtblume/lichtblume_darkness_2", 13)
	else
		v.dark = createQuad("lichtblume/lichtblume_darkness", 13)
	end
	
	quad_setPosition(v.dark, entity_getPosition(me))
	quad_scale(v.dark, 32, 32)
	quad_alpha(v.dark, 0)
	quad_alpha(v.dark, 1, 0.5)
	quad_color(v.dark, 0, 0, 0)
end

function update(me, dt)	
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
end

function activate(me)
end
