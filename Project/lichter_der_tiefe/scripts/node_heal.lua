-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    v.inNode = false
end

-- check trigger
function update(me, dt)

    -- enter node
    if not v.inNode and node_isEntityIn(me, v.n) then

        v.inNode = true

        local perc = entity_getHealthPerc(v.n)
        if perc ~= 1 then
            entity_setHealth( v.n, math.floor( entity_getHealth(v.n) / perc + 0.5) )
            playSfx("HealthUpgrade-Collect")
            spawnParticleEffect("Heal", entity_getPosition(v.n))
        end
    end

    -- leave node
    if v.inNode and not node_isEntityIn(me, v.n) then
        v.inNode = false
    end

end

