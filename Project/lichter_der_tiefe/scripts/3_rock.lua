-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- entity: rock, changing texture etc.
function init(me)

	v.range = 750
	
	v.flag = 302
	v.flagUntiefen = 701
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
end


-- check
function update(me, dt)

	-- loose focus first time
	if isFlag(v.flag, 0) then
		if isFlag(v.flagUntiefen, 1) then
			setFlag(v.flag, 1)
			v.time = 0
			
			disableInput()
			setControlHint("Emily: Wo ist nur Nejl...", 0, 0, 0, 4 )
			
			setCameraLerpDelay(3)
			cam_toEntity(me)
			
			
			-- testing
			--[[
			if getFlag(v.path) <= 1 then
				v.msg = "Schlechtes Ende :("
			else
				v.msg = "Gutes Ende :)"
			end
			setControlHint(v.msg, 0, 0, 0, 10)
			]]--
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
			
			setCameraLerpDelay(0)
			enableInput()
		end		
	
	end

	-- hit node
	if isFlag(v.flagUntiefen, 0) and entity_isEntityInRange(me, v.n, v.range) then

		-- entity_doCollisionAvoidance(v.n, dt, 12, 0.5)
		entity_touchAvatarDamage(me, v.range, 0, 300)
	end

end