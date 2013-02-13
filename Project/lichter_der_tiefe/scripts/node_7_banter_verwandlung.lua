-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------

-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false

	v.time = 0
	v.dt = 5

	v.flag = 703
end

-- check
function update(me, dt)

	if isFlag(v.flag, 0) and node_isEntityIn(me, v.n) and isForm(1) then

		setFlag(v.flag, 1)

		setControlHint("Emily"..nameLine.."Was ist passiert? Warum habe ich mich verwandelt?", 0, 0, 0, 4)
	end

	v.time = v.time + dt
	if v.time >= v.dt then

		v.time = 0
		v.dt = math.random() * 10

		if isForm(0) then
			changeForm(1)
		else
			changeForm(0)
		end
	end

end

