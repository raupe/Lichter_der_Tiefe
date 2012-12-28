-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    v.flag = 305

    v.path = 306

    node_setCursorActivation(me, true)
end


function activate(me)

    -- 3 gute Punkte
    setFlag(v.path, 3)

    -- activate following nejl
    setFlag(303,1)
end


-- setting the "gessingungsbarotmer auf 3", wenn eine böse tat, dann -1 !