-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false

	v.timer = 999
	v.duration = 4
	v.line = -1

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
	if v.inNode and node_isEntityIn(me, v.n) then

		v.timer = v.timer + dt

		if v.timer > v.duration then

			v.timer = 0
			v.line = v.line + 1

			if v.line == 0 then
				setControlHint("Willkommen in \"Lichter der Tiefe\" - einer Aquaria Mod mit Heldenreise. ", 0, 0, 0, 3 )
			elseif v.line == 1 then
				setControlHint(	"Um dich zu bewegen kannst du entweder die WASD-Tasten benutzen oder in die jeweilige Richtung klicken.", 1, 0, 0, 8)
			end

		end

	end

	-- leave node
	if not v.inNode and node_isEntityIn(me, v.n) then
		v.inNode = true
	end

end
