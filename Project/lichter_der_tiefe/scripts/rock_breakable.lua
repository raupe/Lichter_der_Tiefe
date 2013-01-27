if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


function init(me)

	setupEntity( me )
	local texture = string.format("tile-rock-000%d", randRange(1,4))
	entity_setTexture( me, texture )

	entity_setCollideRadius( me, 64 )
	entity_setHealth(me, 2)
    --entity_setDeathParticleEffect(me, "TinyRedExplode")
    
	entity_setEntityType(me, ET_ENEMY)
	entity_setState( me, STATE_IDLE )
end


-- after nodes have initiated
function postInit(me)

	v.n = getNaija()
end



function update(me, dt)
	entity_handleShotCollisions(me)
end

function enterState(me)

end

function exitState(me)
end

function hitSurface(me)
end

function activate(me)
end


function damage(me, attacker, bone, damageType, dmg)

	playSfx("mithalasurn-break", 0, 0.6)
	
	for i=1,5 do
		createEntity("rock_falling", "", entity_x(me), entity_y(me))
	end
	
	
	return false
end


function animationKey(me, key)
end

function songNote(me, note)
end

function songNoteDone(me, note)
end

function song(me, song)
end


function dieNormal(me)
end