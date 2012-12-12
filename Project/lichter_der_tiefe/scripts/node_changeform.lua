-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false

	setStringFlag("message", node_getName(me))
end

-- check trigger
function update(me, dt)

	-- reset
	if getStringFlag("message") ~= node_getName(me) then
		v.started = false
		return
	end

	-- enter node
	if not v.inNode and node_isEntityIn(me, v.n) then
		v.inNode = true
		if isForm(0) then
			changeForm(1)
		else
			changeForm(0)
		end

	end

	-- leave node
	if not v.inNode and not node_isEntityIn(me, v.n) then
		v.inNode = false
	end

end

