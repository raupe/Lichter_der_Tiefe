-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.nejl = getEntity("3_nejl")
	v.flag = 803
	v.inNode = false

	centerText(DATA_TEXTS.silence_cave_name)
end

-- trigger
function activate(me)
	
end

-- check
function update(me, dt)

	if node_isEntityIn(me, v.n) and entity_isState(v.nejl, STATE_SING) then
		setFlag(v.flag, 1)
	elseif node_isFlag(me, 1) then
		setFlag(v.flag, 1)
	end	
end

