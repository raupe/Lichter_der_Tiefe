-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------


-- on creation
function init(me)

    v.n = getNaija()
	v.mejais = getEntity("1_mejais")
	v.flag = 104
	v.time = 0
	v.dt = 0
end

-- check trigger
function update(me, dt)	

	if isFlag(v.flag, 0) and node_isEntityIn( getNode("1_triff_mejais"), v.n) then

		setCutscene(1, 1)

		watch(5)
		disableInput()

		entity_swimToNode(v.n, me, 4)
		entity_flipToEntity(v.n, v.mejais)
		setFlag(v.flag, 1)

	elseif isFlag(v.flag, 1) and node_isEntityIn(me, v.n) then
		disableInput()
		setControlHint("???"..nameLine.."...", 0, 0, 0, 3)
		setFlag(v.flag, 2)
	
	elseif isFlag(v.flag, 2) then
		v.time = v.time + dt
		if v.time >= 4 then
			v.dt = 4
			entity_setState(v.mejais, STATE_DEATHSCENE)
			local ghost = createEntity("1_mejais_ghost", "", entity_getPosition(v.mejais))
			entity_setState(ghost, STATE_WAIT)
			setFlag(100, 1)
			setFlag(v.flag, 3)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("???"..nameLine.."Oh nein! Was soll jetzt nur werden?", 0, 0, 0, v.dt)
			setFlag(v.flag, 4)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Emily"..nameLine.."Wo bin ich?", 0, 0, 0, v.dt)
			setFlag(v.flag, 5)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("???"..nameLine.."Du befindest dich im Riff der Erleuchtung.", 0, 0, 0, v.dt)
			setFlag(v.flag, 6)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Emily"..nameLine.."Wie komme ich zurueck in meine Welt?", 0, 0, 0, v.dt)
			setFlag(v.flag, 7)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 7) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 7
			setControlHint("Mejais"..nameLine.."Ich heisse Mejais und wurde kurz vor deiner Ankunft angegriffen.\nNun bin ich tot - aber ich kann noch nicht gehen!", 0, 0, 0, v.dt)
			setFlag(v.flag, 8)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 8) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Mejais"..nameLine.."Hilf mir und ich zeige dir den Weg zurueck.", 0, 0, 0, v.dt)
			setFlag(v.flag, 9)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 9) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Emily"..nameLine.."Was muss ich tun?", 0, 0, 0, v.dt)
			setFlag(v.flag, 10)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 10) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint("Mejais"..nameLine.."Nejl, mein Sohn, er ist ganz allein. Seit meinem Tot ist er der letzte Waechter des Lichts.", 0, 0, 0, v.dt)
			setFlag(v.flag, 11)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 11) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Emily"..nameLine.."Waechter des Lichts?", 0, 0, 0, v.dt)
			setFlag(v.flag, 12)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 12) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint("Mejais"..nameLine.."Die Waechter des Lichts bringen durch ihren Gesang die Blumenfelder zum Strahlen. Sie leuchten in der Dunkelheit.", 0, 0, 0, v.dt)
			setFlag(v.flag, 13)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 13) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 7--6
			setControlHint("Mejais"..nameLine.."Doch Cerajt hat das Riff ueberfallen. Er ist eine Kreatur der Finsternis \n- er braucht den Schatten um jagen zu koennen.", 0, 0, 0, v.dt)
			setFlag(v.flag, 14)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 14) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 4
			setControlHint("Emily"..nameLine.."Wie kann ich euch nun helfen?", 0, 0, 0, v.dt)
			setFlag(v.flag, 15)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 15) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint("Mejais"..nameLine.."Nejl, mein Sohn, er hat das Lied der Lichter noch nicht gelernt.\nBegib dich auf die Suche nach den Lichterquallen,sie behueten\njeweils einen Klang den er braucht.", 0, 0, 0, v.dt)
			setFlag(v.flag, 16)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 16) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.dt = 8
			setControlHint("Mejais"..nameLine.."Wenn du alle Toene gefunden hast, lehre meinem Nejl das Lied der Lichter. Danach kannst du mit Hilfe der Lichter zurueck nach Hause gelangen.", 0, 0, 0, v.dt)
			setFlag(v.flag, 17)
			v.time = 0
		end
	
	elseif isFlag(v.flag, 17) then
		v.time = v.time + dt
		if v.time >= v.dt then
			v.mejaisStart = getNode("1_mejais_1")
			local ghost = getEntity("1_mejais_ghost")
			entity_swimToNode(ghost, v.mejaisStart, 4)
			entity_setState(ghost, STATE_IDLE)
			enableInput()
			setFlag(v.flag, 18)
			setCutscene(0)
		end
	end

end

