-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    v.flag = 305

    node_setCursorActivation(me, true)
end


function activate(me)

    setFlag(303,1)
end
