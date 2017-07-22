-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	
	v.flagLiedDerLichter = 1100
	v.flagSongs = 307
	v.flagUntiefen = 701
	
	v.alpha = 0
	if isFlag(v.flagUntiefen, 2) then
		v.alpha = 0.75
	elseif getFlag(v.flagSongs) >= 3 then
		v.alpha = 0.65
	elseif getFlag(v.flagSongs) == 2 then
		v.alpha = 0.45
	elseif getFlag(v.flagSongs) == 1 then
		v.alpha = 0.25
	end
	entity_alpha(me, 0) -- fg: prevent white dot from showing up
end

-- after nodes have inited
function postInit(me)

	if getFlag(v.flagSongs) >= 3 then
		v.dark = createQuad("lichtblume/lichtblume_darkness", 13)
		quad_setPosition(v.dark, entity_getPosition(me))
		quad_scale(v.dark, 64, 64)
		quad_alpha(v.dark, v.alpha)
		quad_color(v.dark, 0, 0, 0)
	end	

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
