-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
	v.mejais = getEntity("1_mejais")
	v.flag = 104
	v.time = 0
end

-- check trigger
function update(me, dt)	

	if isFlag(v.flag, 0) then
		v.triffMejaisNode = getNode("1_triff_mejais")
		if node_isEntityIn(v.triffMejaisNode, v.n) then
			disableInput()
			entity_swimToNode(v.n, me, 4)
			setFlag(v.flag, 1)
		end
	
	elseif isFlag(v.flag, 1) and node_isEntityIn(me, v.n) then
		disableInput()
		setControlHint("Mejais: ...", 0, 0, 0, 3)
		setFlag(v.flag, 2)
	
	elseif isFlag(v.flag, 2) then
		v.time = v.time + dt
		if v.time >= 4 then
			v.dt = 4
			entity_setState(v.mejais, STATE_DEATHSCENE)
			v.ghost = createEntity("1_mejais_ghost", "", entity_getPosition(v.mejais))
			entity_setState(v.ghost, STATE_WAIT)
			setFlag(v.flag, 3)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Mejais: Oh nein! Was soll jetzt nur werden?", 0, 0, 0, v.dt)
			setFlag(v.flag, 4)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Emily: Wo bin ich?", 0, 0, 0, v.dt)
			setFlag(v.flag, 5)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Mejais: Du bist im Riff der Erleuchtung.", 0, 0, 0, v.dt)
			setFlag(v.flag, 6)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Emily: Wie komme ich zurueck in meine Welt?", 0, 0, 0, v.dt)
			setFlag(v.flag, 7)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 7) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 6
			setControlHint("Mejais: Wir wurden angegriffen. Kurz vor deiner Ankunft. Ich bin tot - aber ich kann noch nicht gehen!", 0, 0, 0, v.dt)
			setFlag(v.flag, 8)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 8) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Mejais: Hilf mir und ich zeige dir den Weg zurueck.", 0, 0, 0, v.dt)
			setFlag(v.flag, 9)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 9) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Emily: Was muss ich tun?", 0, 0, 0, v.dt)
			setFlag(v.flag, 10)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 10) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint("Mejais: Nejl, mein Sohn, er ist ganz allein. Seit meinem Tot ist er der letzte Waechter des Lichts.", 0, 0, 0, v.dt)
			setFlag(v.flag, 11)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 11) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Emily: Waechter des Lichts?", 0, 0, 0, v.dt)
			setFlag(v.flag, 12)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 12) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint("Mejais: Die Waechter des Lichts bringen durch ihren Gesang die Blumenfelder zum Leuchten.", 0, 0, 0, v.dt)
			setFlag(v.flag, 13)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 13) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 6
			setControlHint("Mejais: Cerajt, er hat unser Riff ueberfallen. Cerajt braucht die Dunkelheit, um zu jagen.", 0, 0, 0, v.dt)
			setFlag(v.flag, 14)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 14) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Emily: Doch wie kann ich euch helfen?", 0, 0, 0, v.dt)
			setFlag(v.flag, 15)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 15) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint("Mejais: Nejl, mein Sohn, er hat das Lied der Lichter noch nicht gelernt. Begib dich auf die Suche nach den Lichterquallen, sie behueten jeweils einen Ton.", 0, 0, 0, v.dt)
			setFlag(v.flag, 16)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 16) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint("Mejais: Wenn du alle Toene gefunden hast, lehre meinem Sohn Nejl das Lied der Lichter. Danach kannst du mit Hilfe der Lichter zurueck in deine Welt gelangen.", 0, 0, 0, v.dt)
			setFlag(v.flag, 17)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 17) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.mejaisStart = getNode("1_mejais_1")
			entity_swimToNode(v.ghost, v.mejaisStart, 4)
			entity_setState(v.ghost, STATE_IDLE)
			enableInput()
			setFlag(100, 1)
			setFlag(v.flag, 18)
		end
	end
	
end

