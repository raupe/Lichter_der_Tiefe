-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.flag = 900

	centerText("Hoehle der Stroemung")

end

-- trigger
function activate(me)
end


-- check
function update(me, dt)
end