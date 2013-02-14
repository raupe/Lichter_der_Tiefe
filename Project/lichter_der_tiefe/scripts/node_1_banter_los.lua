-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------



-- on creation
function init(me)

	v.n = getNaija()
	v.flag = 102

	v.inNode = false

	v.time = 0
	v.dt = 1
end

-- check trigger
function update(me, dt)

	if isFlag(v.flag, 0) and node_isEntityIn(me, v.n) then

		v.inNode = true

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 5
			v.time = 0
			setFlag(v.flag, 1)
			setControlHint("Emily"..nameLine.."Was ist das hier ? Wie komme ich hierher ?", 0, 0, 0, v.dt)
		end

	elseif isFlag(v.flag, 1) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 5
			v.time = 0
			setFlag(v.flag, 2)
			setControlHint("Emily"..nameLine.."Es fuehlt sich so seltsam vertraut an, aber irgendwas ist anders.", 0, 0, 0, v.dt)
		end


	elseif isFlag(v.flag, 2) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 4
			v.time = 0
			setFlag(v.flag, 3)
			setControlHint("Emily"..nameLine.."Ich kann reden, atmen und ... SCHWIMMEN ? Bin ich etwa unter Wasser ?", 0, 0, 0, v.dt)
		end

	elseif isFlag(v.flag, 3) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 5
			v.time = 0
			setFlag(v.flag, 4)
			setControlHint("Emily"..nameLine.."Vorhin muss ich wohl vom Steg gefallen sein.", 0, 0, 0, v.dt)
		end

	elseif isFlag(v.flag, 4) then

		v.time = v.time + dt
		if v.time >= v.dt then

			v.dt = 4
			v.time = 0
			setFlag(v.flag, 5)
			setControlHint("Emily"..nameLine.."Irgendwo muss es wieder nach oben gehen !", 0, 0, 0, v.dt)
		end
	end


    -- leave node
    if v.inNode and not node_isEntityIn(me, v.n) then
        setFlag(v.flag, 5)
       	clearControlHint()
        v.inNode = false
    end


end
