-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.flag = 306

	v.inNode = false

	v.time = 0
	v.duration = 4

	setFlag(v.flag, 4)
end


-- check trigger
function update(me, dt)


	-- enter node
	if not v.inNode and node_isEntityIn(me, v.n) then

		v.inNode = true

		-- leave
		if isFlag(v.flag, 3) then

			fadeOut(v.duration/2)
			fadeOutMusic(v.duration/2)

	        v.trg = getEntity("3_rock")
	        v.x,v.y = entity_getPosition( v.trg )
	        entity_setPosition(v.n, v.x, v.y)
		end

		-- arrive
		if isFlag(v.flag, 4) then

			centerText("Untiefen")
		end

	end



	-- leave node
	if v.inNode and not node_isEntityIn(me, v.n) then


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
