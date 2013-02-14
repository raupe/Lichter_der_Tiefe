-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- ================================================================================================
-- entity specific
-- ================================================================================================

v.dir = 0

-- ================================================================================================
-- FUNCTIONS
-- ================================================================================================

function init(me)

    setupEntity(me)
    entity_setTexture(me, "spikeyegg")
    entity_setHealth (me, 3)
    entity_setCollideRadius(me, 64)

    entity_setState(me, STATE_IDLE)
    entity_setWidth(me, 128)
    entity_setHeight(me, 128)

    entity_setEntityType(me, ET_ENEMY)

    entity_color(me, 10, 20, 0)

    entity_setDeathParticleEffect( me, "TinyRedExplode" )

    entity_setMaxSpeedLerp(me, 1, 1, -1, 1)
end


-- after nodes have initiated
function postInit(me)

    v.n = getNaija()
    v.diff = 004
end



function update(me, dt)

    entity_handleShotCollisions(me)
    entity_touchAvatarDamage(me, 32, 0.3 * getFlag(v.diff), 1200)

    if v.dir == 0 then
        entity_addVel(me, 0, -1000)
    else
        entity_addVel(me, 0, 1000)
    end

    entity_updateMovement(me, dt)
end

function enterState(me)

    if entity_isState(me, STATE_IDLE) then
        entity_animate(me, "idle", -1)
    end

    if entity_isState(me, STATE_IDLE) then
        entity_animate(me, "dead", -1)
    end

end

function exitState(me)
end

function hitSurface(me)
    entity_flipVertical(me)
    if v.dir == 0 then
        v.dir = 1
    elseif v.dir == 1 then
        v.dir = 0
    end
end

function damage(me, attacker, bone, damageType, dmg)
    return false
end
