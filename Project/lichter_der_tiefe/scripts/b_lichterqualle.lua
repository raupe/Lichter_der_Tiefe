-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


function init(me)

    setupEntity(me)
    entity_setEntityType(me, ET_NEUTRAL)
    entity_initSkeletal(me, "b_lichtqualle")
    entity_generateCollisionMask(me)
    entity_setCollideRadius(me, 32)
    entity_scale(me, 2, 2)
    
    entity_setEntityLayer(me, 1)
end

-- after nodes have inited
function postInit(me)
    v.n = getNaija()
	v.song = 901
	v.songs = 307
    
    v.songA = 801
    v.songC = 1001

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

    learnSong(102)
    setFlag(v.songs, getFlag(v.songs)+1 )
    setControlHint("Lichterqualle: Ich bringe dir hiermit den \"Klang der Stroemung\" bei. Moeges du immer einen Weg finden...", 0, 0, 0, v.duration)

    entity_setActivation(me, AT_NONE , 200, 500)

    if isFlag(v.songA, 2) and isFlag(v.songC, 2) then
        setFlag(v.song, 2)
        local nejl = getEntity("3_nejl")
        entity_setState(nejl, STATE_DELAY)
    end

end
