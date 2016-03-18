-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    v.flag = 200

    centerText(DATA_TEXTS.home_waters_name)
end

-- check
function update(me, dt)

end
