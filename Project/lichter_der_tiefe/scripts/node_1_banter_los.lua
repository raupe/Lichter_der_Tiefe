-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.flag = 102

	v.time = 0
	v.dt = 1
end

-- check trigger
function update(me, dt)

	if isFlag(v.flag, 0) and node_isEntityIn(me, v.n) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 5
			v.time = 0
			setFlag(v.flag, 1)
			setControlHint(DATA_TEXTS.inwater_1, 0, 0, 0, v.dt)
		end

	elseif isFlag(v.flag, 1) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 5
			v.time = 0
			setFlag(v.flag, 2)
			setControlHint(DATA_TEXTS.inwater_2, 0, 0, 0, v.dt)
		end


	elseif isFlag(v.flag, 2) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 4
			v.time = 0
			setFlag(v.flag, 3)
			setControlHint(DATA_TEXTS.inwater_3, 0, 0, 0, v.dt)
		end

	elseif isFlag(v.flag, 3) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 5
			v.time = 0
			setFlag(v.flag, 4)
			setControlHint(DATA_TEXTS.inwater_4, 0, 0, 0, v.dt)
		end

	elseif isFlag(v.flag, 4) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 4
			v.time = 0
			setFlag(v.flag, 5)
			setControlHint(DATA_TEXTS.inwater_5, 0, 0, 0, v.dt)
		end
	end


end
