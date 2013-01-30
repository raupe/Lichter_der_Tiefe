-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    v.flag = 004

    if isFlag(v.flag, 0) then
        node_setCursorActivation(me, true)
    end
end



function activate(me)

    setFlag(v.flag, 3)

    local normal = node_getNearestNode("0_wahl_normal")
    node_setCursorActivation(me, false)
    node_setActive(normal, false)

    hideImage()

    -- spawnParticleEffect("TitleEffect1", me)
    centerText("Hafen von Winumsund")
end