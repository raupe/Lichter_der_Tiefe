-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------

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

	v.step = 0
    v.time = 0
    v.duration = 6

    entity_setActivation(me, AT_CLICK, 200, 500)
end

function update(me, dt)

    if v.step == 1 then
        v.time = v.time + dt
        if v.time >= v.duration then
            v.step = 2
            v.duration = 8
            v.time = 0
			setControlHint("\nSchau im Menue nach, welche Toene du fuer den Klang brauchst.\nDann nutze die rechte Maustaste um zu singen.", 0, 0, 0, 8)
        end
    elseif v.step == 2 then
        v.time = v.time + dt
        if v.time >= v.duration+1 then
            v.step = 0
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

	if not isFlag(v.song, 1) then
	    setFlag(v.song, 1)
	
	    learnSong(102)
	    setFlag(v.songs, getFlag(v.songs)+1 )
	    setControlHint("Lichterqualle"..nameLine.."Ich bringe dir hiermit den \"Klang der Stroemung\" bei. Moeges du immer einen Weg finden...", 0, 0, 0, v.duration)
	
	    local perc = entity_getHealthPerc(v.n)
	    if perc ~= 1 then
	        entity_setHealth( v.n, math.floor( entity_getHealth(v.n) / perc + 0.5) )
	        playSfx("HealthUpgrade-Collect")
	        spawnParticleEffect("Heal", entity_getPosition(v.n))
	    end
	
	    if isFlag(v.songA, 1) and isFlag(v.songC, 1) then
	        local nejl = getEntity("3_nejl")
	        entity_setState(nejl, STATE_DELAY)
	    elseif isFlag(v.songA, 0) and isFlag(v.songC, 0) then
	    	v.step = 1
	    end
	else
		setControlHint("Lichterqualle"..nameLine.."Mehr kann ich dir nicht beibringen.", 0,0,0, 4)	
	end

end
