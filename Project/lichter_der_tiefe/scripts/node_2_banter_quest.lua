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

	v.flag = 203
	v.songB = 901
    v.songC = 1001
end

-- check
function update(me, dt)

	if isFlag(v.songB, 1) and not isFlag(v.songC, 1) and isFlag(v.flag, 0) and node_isEntityIn(me, v.n) then

		setFlag(v.flag, 1)

		setControlHint("Emily"..nameLine.."Keine Sorge Nejl, wir schaffen das schon. Auf zum letzten Klang...", 0, 0, 0, 3)
	end
end