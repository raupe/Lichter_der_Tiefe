-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.flag = 1000

	centerText("Hoehle der Entschlossenheit")

end

-- trigger
function activate(me)
end

-- check
function update(me, dt)
end

