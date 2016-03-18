-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

----------------------------------------
local function preventGameOverScreen()

    if entity_getHealth(v.n) == 0 then
        pause()
        doLoadMenu()
        goToTitle()
    end
end
----------------------------------------

-- on creation
function init(me)

    v.n = getNaija()
    centerText(DATA_TEXTS.sphinx_palace_name)
    -- v.flag = 600

    --debug:
    --learnSong(102)
end

-- check trigger
function update(me, dt)

    preventGameOverScreen()
end
