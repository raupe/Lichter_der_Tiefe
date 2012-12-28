-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    v.flag = 800

    centerText("Hoehle der Ruhe")
end

-- check trigger
function update(me, dt)

end
