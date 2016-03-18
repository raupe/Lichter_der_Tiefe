-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

    v.n = getNaija()
    v.flag = 405

    if isFlag(v.flag, 0 ) then

        node_setCursorActivation(me, true)

        v.x,v.y = node_getPosition(me)
        v.e = createEntity("2_healthcontainer", "", v.x, v.y)
    end
end


-- check
function activate(me)

    if isFlag(v.flag, 0 ) then

        setFlag(v.flag, 1)

        upgradeHealth()
        entity_alpha(v.e, 0, 2)
        playSfx("HealthUpgrade-Collect")
        spawnParticleEffect("HealthUpgradeReceived", node_getPosition(me))

        setControlHint(DATA_TEXTS.health_container_1, 0, 0, 0, 4)
    end
end