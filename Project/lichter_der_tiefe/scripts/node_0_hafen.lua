-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    centerText("Hafen")
    entity_alpha(v.n, 0)
    -- v.flag = 000
end

-- check trigger
function update(me, dt)

end
