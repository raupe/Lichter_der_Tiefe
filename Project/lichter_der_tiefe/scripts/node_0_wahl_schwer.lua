-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.flag = 004
	v.intro = 007

	v.time = 0
	v.dt = 1

	if isFlag(v.flag, 0) then
		node_setCursorActivation(me, true)
	end
end


function activate(me)

	if isFlag(v.flag, 1) then

		setFlag(v.flag, 3)

		local normal = node_getNearestNode("0_wahl_normal")
		node_setCursorActivation(me, false)
		node_setCursorActivation(normal, false)

		hideImage()
		enableInput()
	end
end


function update(me, dt)

	if isFlag(v.flag, 3) and isFlag(v.intro, 0) then

		v.time = v.time + dt
		if v.time >= v.dt then

			setFlag(v.intro, 1)

			centerText(DATA_TEXTS.port_name)

			setControlHint(DATA_TEXTS.difficulty_high, 0,0,0, 8)
		end
	end
end
