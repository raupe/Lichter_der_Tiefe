-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


function init(me)

    setupEntity(me)
    entity_setEntityType(me, ET_NEUTRAL)
    entity_initSkeletal(me, "c_lichtqualle")
    entity_generateCollisionMask(me)
    entity_setCollideRadius(me, 32)
    entity_scale(me, 2, 2)
    
    entity_setEntityLayer(me, 1)
end

-- after nodes have inited
function postInit(me)
    v.n = getNaija()
	v.song = 1001
	v.songs = 307
    
    v.songA = 801
    v.songB = 901

    v.time = 0
    v.duration = 5

    if isFlag(v.song, 0) then
        entity_setActivation(me, AT_CLICK, 200, 500)
    end
end

function update(me, dt)

    if isFlag(v.song, 1) then
        v.time = v.time + dt
        if v.time >= v.duration+1 then
            setFlag(v.song, 2)
            showInGameMenu()
        end
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
end



function activate(me)

	setFlag(v.song, 1)

    learnSong(103)
    setFlag(v.songs, getFlag(v.songs)+1 )
    setControlHint("Lichterqualle: So klignt der \"Klang der Entschlossenheit\". Sei'est du dir stets bewusst was du tust...", 0, 0, 0, 5)

    local perc = entity_getHealthPerc(v.n)
    if perc ~= 1 then
        entity_setHealth( v.n, math.floor( entity_getHealth(v.n) / perc + 0.5) )
        playSfx("HealthUpgrade-Collect")
        spawnParticleEffect("Heal", entity_getPosition(v.n))
    end

    entity_setActivation(me, AT_NONE , 200, 500)

	if isFlag(v.songA, 2) and isFlag(v.songB, 2) then
        setFlag(v.song, 2)
		local nejl = getEntity("3_nejl")
		entity_setState(nejl, STATE_DELAY)
	end
end
