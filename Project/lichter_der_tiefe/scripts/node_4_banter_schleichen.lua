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

	v.flag = 402

    v.nejl = 303
    v.kills = 401
end

-- check
function update(me, dt)

    if isFlag(v.nejl, 1) and isFlag(v.flag, 0) and getFlag(v.kills) < 3 and node_isEntityIn(me, v.n) then

		setFlag(v.flag, 1 )

		setControlHint("Nejl"..nameLine.."Wow bist du geschickt, ohne dich haette ich das nicht geschaft.", 0, 0, 0, 4 )
    end
end

