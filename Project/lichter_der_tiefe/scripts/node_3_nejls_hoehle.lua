-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    -- v.n = getNaija()
    centerText("Nejls Hoehle")
    v.flag = 300
end

-- check trigger
function update(me, dt)

end
