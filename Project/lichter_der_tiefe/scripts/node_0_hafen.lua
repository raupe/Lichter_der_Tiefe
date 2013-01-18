-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)
	-- init all flgas:
	v.flagIni = 002
	if getFlag(v.flagIni) ~= 1 then
		setFlag(v.flagIni, 1)
		setFlag(1100, 0)
	end


    v.n = getNaija()
    centerText("Hafen von Winumsund")
    entity_alpha(v.n, 0)
end

-- check trigger
function update(me, dt)

end
