-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


function init(me)

    setupEntity(me)
    entity_setEntityType(me, ET_NEUTRAL)
    entity_setTexture (me, "energyorb")
end

-- after nodes have inited
function postInit(me)

    v.n = getNaija()
end

function update(me, dt)

end
