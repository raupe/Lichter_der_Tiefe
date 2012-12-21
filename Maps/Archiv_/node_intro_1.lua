-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
end

-- check trigger
function update(me, dt)

    -- enter node
    if node_isEntityIn(me, v.n) then

        centerText( "Riff der Erleuchtung" )
    end

end