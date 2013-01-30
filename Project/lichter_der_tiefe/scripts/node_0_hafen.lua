-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)
    v.n = getNaija()
    entity_alpha(v.n, 0)

    changeForm(0)

    v.diff = 004
end

-- check trigger
function update(me, dt)

    if isFlag(v.diff, 0) then

        setFlag(v.diff, 1) -- prevent recalling

        showImage("0_schwierigkeitsgrad")
    end

end
