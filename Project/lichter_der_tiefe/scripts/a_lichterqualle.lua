-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


function init(me)

    setupEntity(me)
    entity_setEntityType(me, ET_NEUTRAL)
    entity_initSkeletal(me, "a_lichtqualle")
    entity_generateCollisionMask(me)
    entity_setCollideRadius(me, 32)
    entity_scale(me, 2, 2)
    
    entity_setEntityLayer(me, 1)
end

-- after nodes have inited
function postInit(me)
    v.n = getNaija()
	v.song = 801
	v.songs = 307
	v.step = 0
    
	v.songB = 901
    v.songC = 1001
    
    entity_setActivation(me, AT_CLICK, 200, 500)
end

function update(me, dt)
	
	if v.step == 0 then
		-- nothing
	elseif v.step == 1 then
		v.step = v.step + 1
		v.time = 0
		v.dt = 4
	
		setControlHint("Lichterqualle: Wie du willst, ich bringe dir den \"Klang der Ruhe\" bei. Auf das du immer wachsam bleibst...", 0, 0, 0, 3)
		
		
		if isFlag(v.songB, 1) and isFlag(v.songC, 1) then
			local nejl = getEntity("3_nejl")
			entity_setState(nejl, STATE_DELAY)
			enableInput()
			
			v.step = 0
		end
		
	elseif v.step == 2 then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.time = 0
			v.dt = 4
			
			if isFlag(v.songB, 1) or isFlag(v.songC, 1) then
				setControlHint("Nejl: Toll, du hast de naechsten Klang gelernt. Probier ihn doch gleich mal aus.", 0, 0, 0, 4)
				v.step = 5
			else
				setControlHint("Nejl: Toll, du hast de ersten Klang gelernt. Probier ihn doch gleich mal aus.", 0, 0, 0, 4)
				v.step = 3
			end
		end
	
	elseif v.step == 3 then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.step = v.step + 1
			v.time = 0
			v.dt = 8
			setControlHint("Schau im Menue nach, welche Toene du fuer den Klang braust. Dann nutze die rechte Maustaste um zu singen.", 0, 0, 0, 8)
		end
	
	elseif v.step == 4 then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.step = 0
			enableInput()
			showInGameMenu()
		end
	
	elseif v.step == 5 then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.step = 0
			enableInput()
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
		
		learnSong(101)
		setFlag(v.songs, getFlag(v.songs)+1 )
	
		local perc = entity_getHealthPerc(v.n)
		if perc ~= 1 then
	    	entity_setHealth( v.n, math.floor( entity_getHealth(v.n) / perc + 0.5) )
	 		playSfx("HealthUpgrade-Collect")
	    	spawnParticleEffect("Heal", entity_getPosition(v.n))
	    end
	
		v.step = 1
		disableInput()
	else	
		setControlHint("Lichterqualle: Ich habe dich alles gelehrt, was ich weiss.", 0, 0, 0, 3)
	end
end
