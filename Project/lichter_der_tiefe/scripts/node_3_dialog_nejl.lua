-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.flag = 305

	v.songs = 307
	v.path = 306
	v.nejl = 303
	
	v.time = 0
	v.dt = 0
end


-- check
function update(me, dt)

	if isFlag(v.flag, 14) then
		-- nothing
	elseif isFlag( v.flag, 0 ) then
		if node_isEntityIn(me, v.n) then
			setFlag(v.flag, 1)
			v.time = 0
			v.dt = 4
			
			disableInput()
			setCutscene(1,1)
			entity_swimToNode(v.n, me, 4)
			setControlHint("Junge: Wer bist du?", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 1) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 2)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily: Ich bin Emily. Bist du Nejl?", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 2) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 3)
			v.time = 0
			v.dt = 2
			
			setControlHint("Junge: Ja.", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 4)
			v.time = 0
			v.dt = 3
			
			setControlHint("Nejl: Woher weisst du das?", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 5)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily: Ich habe deine Mutter getroffen. Sie ... Sie ist tot.", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 6)
			v.time = 0
			v.dt = 2
			
			setControlHint("Nejl: ... ", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 7)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily: Ich werde dir helfen, das Lied der Lichter zu lernen.", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 7) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 8)
			v.time = 0
			v.dt = 3
			
			setControlHint("Nejl: Wirklich? Danke!", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 8) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 9)
			v.time = 0
			v.dt = 3
			
			setControlHint("Nejl: Wieso hilfst du mir?", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 9) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 10)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily: Nur so kann ich wieder in meine Welt zurueck.", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 10) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 11)
			v.time = 0
			v.dt = 3
			
			setControlHint("Nejl: Deine Welt?", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 11) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 12)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily: Ueber dem Wasser ... Komm, lass uns die Lichterquallen suchen.", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 12) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 13)
			v.time = 0
			v.dt = 3
			
			setControlHint("Nejl: Gut. Ich folge dir.", 0,0,0, v.dt)
		end
		
	elseif isFlag(v.flag, 13) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 14)
			v.time = 0
			v.dt = 4
			
			setFlag(v.nejl, 1)
			setCutscene(0)		
			enableInput()
		end
	end
end

