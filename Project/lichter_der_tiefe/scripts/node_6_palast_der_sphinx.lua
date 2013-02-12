-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

----------------------------------------
local function preventGameOverScreen()

    if entity_getHealth(v.n) == 0 then
        pause()
        doLoadMenu()
    end
end
----------------------------------------

-- on creation
function init(me)

    v.n = getNaija()
    centerText("Palast der Sphinx")
    -- v.flag = 600

    --debug:
    --learnSong(102)
end

-- check trigger
function update(me, dt)

    preventGameOverScreen()
end
