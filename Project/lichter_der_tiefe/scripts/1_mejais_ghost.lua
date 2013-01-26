-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_initSkeletal(me, "1_mejais_ghost")
	entity_setState(me, STATE_IDLE)
	entity_setCollideRadius(me, 32)
	entity_setHealth(me, 5)
	entity_setDeathParticleEffect(me, "TinyRedExplode")
	
	entity_setActivation(me, AT_CLICK, 32, 500)
end

-- after nodes have inited
function postInit(me)
	v.n = getNaija()
	v.time = 0
end

function update(me, dt)
	if entity_isState(me, STATE_IDLE) then
		v.time = v.time + dt
		if v.time > 5 then
			v.time = 0

			v.rand = randRange(0, 3)
			if v.rand == 1 then
				v.pos = getNode("1_mejais_1")
				entity_swimToNode(me, v.pos, 4)
			elseif v.rand == 2 then
				v.pos = getNode("1_mejais_2")
				entity_swimToNode(me, v.pos, 4)
			elseif v.rand == 3 then
				v.pos = getNode("1_mejais_3")
				entity_swimToNode(me, v.pos, 4)
			end

		end
	end
end

function enterState(me)
	if entity_isState(me, STATE_WAIT) then
		entity_animate(me, "idle", -1)

	elseif entity_isState(me, STATE_IDLE) then
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
	
	if isFlag(303, 0) then				-- Nejl noch nicht getroffen
		setControlHint("Mejais: Emily, bitte, suche Nejl.", 0, 0, 0, 3)
	elseif not isFlag(801, 1) then 		-- KLang der Ruhe noch nicht gelernt
		setControlHint("Mejais: Schwimm nach Sueden. Dort lernst du den Klang der Ruhe.", 0, 0, 0, 4)
	elseif not isFlag(901, 1) then 		-- KLang der Stroemung noch nicht gelernt
		setControlHint("Mejais: Du musst weiter, vorbei am Aal. Dort lebt die Qualle der Stroemung.", 0, 0, 0, 4)
	elseif not isFlag(1001, 1) then 	-- KLang der Entschlossenheit noch nicht gelernt
		setControlHint("Mejais: Bitte die Sphinx dich passieren zu lassen. Sie bewacht die letzte Qualle.", 0, 0, 0, 4)
	elseif not isFlag(1100, 1) then 	-- Lied der Lichter noch nicht gelernt gelernt
		setControlHint("Mejais: Ihr kennt jetzt alle Klaenge. Nun wird Nejl sich an das Lied erinnern.", 0, 0, 0, 4)
	elseif isFlag(106, 1) then			-- dialog nach Lied der Lichter noch nicht gehalten
		disableInput()
		entity_setState(me, STATE_WAIT)
		entity_swimToPosition(me, entity_getPosition(v.n))
		setFlag(106, 2)
	elseif isFlag(302, 0) then 			-- Nejl ist noch nicht verschwunden
		setControlHint("Mejais: Beeil dich, sonst verwelken die Blumen.", 0, 0, 0, 3)
	elseif not isFlag(701, 2) then		-- untiefen noch nicht betreten
		setControlHint("Mejais: Du musst dich entschieden, willst du zurueck in deine Welt, oder hilfst du Nejl?", 0,0,0, 4)
	elseif not isFlag(702, 1) then		-- Ceraijt noch nicht besiegt
		setControlHint("Mejais: Die Blumen sind verwelkt. Hilf Nejl!", 0, 0, 0, 3)
	else
		setControlHint("to be continued" ,0,0,0, 2)
	
--	else
--		setControlHint("Mejais: Hallo Emily.", 0, 0, 0, 2)
	end
end
