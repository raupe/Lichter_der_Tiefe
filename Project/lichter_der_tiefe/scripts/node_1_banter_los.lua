-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-----------------------------
local formated = "\n        " -- 8 whitespaces
-----------------------------



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
			setControlHint("Emily: Was ist das hier ?"..formated.."Wie komme ich hierher ?", 0, 0, 0, v.dt)
		end

	elseif isFlag(v.flag, 1) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 7
			v.time = 0
			setFlag(v.flag, 2)
			setControlHint("Emily: Es fuehlt sich so seltsam vertraut an, aber irgendwas ist anders."..formated.."Ich kann reden, atmen und...", 0, 0, 0, v.dt)
		end--7


	elseif isFlag(v.flag, 2) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 4
			v.time = 0
			setFlag(v.flag, 3)
			setControlHint("Emily: ...SCHWIMMEN ? Bin ich etwa unter Wasser ?", 0, 0, 0, v.dt)
		end

	elseif isFlag(v.flag, 3) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 7
			v.time = 0
			setFlag(v.flag, 4)
			setControlHint("Emily: Vorhin muss ich wohl vom Steg gefallen sein."..formated.."Irgendwo muss es wieder nach oben gehen !", 0, 0, 0, v.dt)
		end
	end

end
