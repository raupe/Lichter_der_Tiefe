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
	v.flag = 500

	centerText("Aalbau")

	-- debug:
	-- learnSong(101)
end

-- check trigger
function update(me, dt)

    preventGameOverScreen()
end