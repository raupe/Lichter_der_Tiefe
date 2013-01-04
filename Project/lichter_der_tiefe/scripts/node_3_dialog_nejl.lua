-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    v.flag = 305

    v.songs = 307
    v.path = 306
    v.nejl = 303

    if isFlag(v.flag, 0) then

        node_setCursorActivation(me, true)
    end
end

-- trigger
function activate(me)

    setFlag(v.flag, 1)

    -- activate following nejl
    setFlag(v.nejl, 1)

    -- 3 points
    setFlag(v.path, 3)

    -- known songs
    setFlag(v.songs, 0)

    setControlHint("Nejl: Danke fuer die Hilfe. Geh voran, ich folge dir Flosse auf Flosse !", 0, 0, 0, 4)
end
