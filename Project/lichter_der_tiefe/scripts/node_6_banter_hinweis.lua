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

	v.flag = 606
end

-- check
function update(me, dt)

	if isFlag( v.flag, 0 ) and node_isEntityIn(me, v.n) then

		setFlag( v.flag, 1 )

		setControlHint("Nejl"..nameLine.."Die Stroemung ist wieder launisch, hier gehts wohl gerade nicht weiter...", 0, 0, 0, 4)
	end
end

