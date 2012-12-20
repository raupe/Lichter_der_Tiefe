-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
	v.flag = 103
end

-- check trigger
function update(me, dt)
	
	dialogNode = getNode("1_dialog_mejais")
	
	if isFlag(v.flag, 0) and node_isEntityIn(me, v.n) then
		disableInput()
		setFlag(v.flag, 1)
		entity_swimToNode(v.n, dialogNode, 4)
	end
	
	if isFlag(v.flag, 1) and node_isEntityIn(dialogNode, v.n) then
		setFlag(v.flag, 2)
		enableInput()
	end

end

