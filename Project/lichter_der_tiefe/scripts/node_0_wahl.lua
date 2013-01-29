-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    v.diff = 004

    -- DEBUG: temporary
    setFlag(v.diff, 2)
end
