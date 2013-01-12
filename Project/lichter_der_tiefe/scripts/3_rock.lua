-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- entity: rock, changing texture etc.
function init(me)

	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_setTexture (me, "grass-tile-0002")

	v.range = 100
	entity_setCollideRadius(me, v.range)
end


-- after nodes have inited
function postInit(me)

	v.n = getNaija()
	v.flag = 302

	v.time = 0
	v.duration = 4

	v.nejl = 303
	v.path = 306


	-- change on lied der lichter
	if isFlag(v.nejl, 2 ) then
		setFlag(v.flag, 2)
	end

	--
	if not isFlag(v.flag, 0) then
		entity_setTexture (me, "hint-bubble")
	end

	-- focus first time
	if isFlag(v.flag, 2) then

		disableInput()

		setControlHint("Emily: Wo ist nur Nejl...", 0, 0, 0, 4 )
		setCameraLerpDelay(v.duration)

		cam_toEntity(me)

		-- testing
		if getFlag(v.path) <= 1 then
			v.msg = "Schlechtes Ende :("
		else
			v.msg = "Gutes Ende :)"
		end

		setControlHint(v.msg, 0, 0, 0, 10)
	end

	-- 3, already focused
end


-- check
function update(me, dt)

	-- loose focus first time
	if isFlag(v.flag, 2) then

		v.time = v.time + dt

		if v.time >= v.duration then

			setFlag(v.flag, 3)

			cam_toEntity(v.n)
			enableInput()

			v.time = 0
		end
	end

	-- hit node
	if not isFlag(v.flag, 3) and entity_isEntityInRange(me, v.n, v.range) then

		entity_doCollisionAvoidance(v.n, dt, 12, 0.5)
	end

end