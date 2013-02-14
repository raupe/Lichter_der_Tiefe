-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------

-- entity: rock, changing texture etc.
function init(me)
	
	v.range = 750
	
	v.flag = 302
	v.flagUntiefen = 701
	v.flagCerajt = 702
	-- v.nejl = 303
	-- v.path = 306
	
	v.time = 0
	v.duration = 4
	
	setupEntity(me)
	
	if isFlag(v.flagUntiefen, 0) then
		entity_setTexture(me, "3_weg_untiefen")
	end
	entity_scale(me, 2, 2)
	entity_setEntityType(me, ET_NEUTRAL)

	entity_setCollideRadius(me, v.range)
end


-- after nodes have inited
function postInit(me)

	v.n = getNaija()
	if not isFlag(v.flagUntiefen, 0) and not isFlag(v.flagCerajt, 1) then
		local nejl = getEntity("3_nejl")
		entity_setPosition(nejl, 0,0)
	end
end


-- check
function update(me, dt)

	-- hit node
	if isFlag(v.flagUntiefen, 0) and entity_isEntityInRange(me, v.n, v.range) then

		-- entity_doCollisionAvoidance(v.n, dt, 12, 0.5)
		entity_touchAvatarDamage(me, v.range, 0, 300)
	end
	
	if not isFlag(v.flag, 0) and not isFlag(v.flag, 6) then
		disableInput()
	end
	
	
	-- loose focus first time
	if isFlag(v.flag, 0) then
		if isFlag(v.flagUntiefen, 1) then
			setFlag(v.flag, 1)
			v.time = 0
			
			disableInput()
			setControlHint("Emily"..nameLine.."Wo ist nur Nejl...", 0, 0, 0, 4 )
			
			setCameraLerpDelay(3)
			cam_toEntity(me)
		end
	elseif isFlag(v.flag, 1) then
		v.time = v.time + dt
		if v.time >= v.duration then

			setFlag(v.flag, 2)
			v.time = 0

			cam_toEntity(v.n)
		end
		
	elseif isFlag(v.flag, 2) then
		v.time = v.time + dt
		if v.time >= v.duration then
			setFlag(v.flag, 3)
			v.time = 0
			v.duration = 3
			
			setControlHint("Emily"..nameLine.."Oh nein, Nejl!", 0,0,0, 3)
		end
		
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.duration then
			setFlag(v.flag, 4)
			v.time = 0
			v.duration = 6

			setControlHint("Emily"..nameLine.."Wenn ich da jetzt runter schwimme, schaffe ich es wahrscheinlich nicht mehr rechtzeitig zurueck!", 0,0,0, 6)
			setCameraLerpDelay(0)
		end
		
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.duration then
			setFlag(v.flag, 5)
			v.time = 0
			v.duration = 6
			
			setControlHint("Emily"..nameLine.."Aber ich kann Nejl auch nich allein zurueck lassen!", 0,0,0, 6)
		end
	
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time >= v.duration then
			setFlag(v.flag, 6)
			
			setControlHint("Emily"..nameLine.."Was mache ich nur?", 0,0,0, 3)
			enableInput()
		end
	
	end

end