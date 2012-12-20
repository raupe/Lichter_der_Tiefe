-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)
	v.n = getNaija()
	v.flag = 102
end

-- check trigger
function update(me, dt)

	if isFlag( v.flag, 0 ) and node_isEntityIn(me, v.n) then
		setFlag( v.flag, 1 )
		setControlHint("Emily: Ob ich hier jemals wieder raus komme?", 0, 0, 0, 3)
	end

end

