-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- entity: rock, changing texture etc.
function init(me)

	setupEntity(me)
	entity_setEntityType(me, ET_NEUTRAL)
	entity_setTexture (me, "grass-tile-0002")

	v.range = 32
end


-- after nodes have inited
function postInit(me)

	v.n = getNaija()
	v.flag = 302

	v.time = 0
	v.duration = 4
	v.inNode = false


	-- first entering the cave
	-- setFlag(v.flag, 1)

	if isFlag(303, 1 ) then
		-- change on mejas 3.dialog
		setFlag(v.flag, 2)
	end

	if not isFlag(v.flag, 1) then
		entity_setTexture (me, "hint-bubble")
	end

	-- focus first time
	if isFlag(v.flag, 2) then

		setCameraLerpDelay(v.duration)
		disableInput()
		cam_toEntity(me)
	end

	-- 3, already focus
end



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



	-- enter node
	if not v.inNode and entity_isEntityInRange(me, v.n, v.range) then

		v.inNode = true

		-- leave
		if isFlag(v.flag, 3) then

			fadeOut(v.duration/2)
			fadeOutMusic(v.duration/2)

			v.trg = getNode("3_warp_untiefen")
			v.x,v.y = node_getPosition( v.trg )
			entity_setPosition (v.n, v.x, v.y )
		end

		-- arrive
		if isFlag(v.flag, 4) then

			centerText("Nejls Hoehle")
		end

	end



	-- leave node
	if v.inNode and not entity_isEntityInRange(me, v.n, v.range) then


		if isFlag(v.flag, 3) then

			v.time = v.time + dt

			if v.time >= v.duration then

				fadeIn(v.duration)
				cam_toEntity(v.n)

				v.time = 0
				setFlag(v.flag, 4)
				v.inNode = false
			end

		end


		if isFlag(v.flag, 4) then

			setFlag(v.flag, 3 )
			v.inNode = false
		end

	end

end