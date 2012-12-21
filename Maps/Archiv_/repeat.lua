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
	if v.inNode and node_isEntityIn(me, v.n) then

		setControlHint("Willkommen in \"Lichter der Tiefe\" - einer Aquaria Mod mit Heldenreise. "..
						"Um dich zu bewegen kannst du entweder die Tastatur oder die Mouse benutzen. "..
						"Verwende dazu die WASD-Tasten oder klicke in die entsprechende Richtung.", 1, 0, 0, 12)
	end

	-- leave node
	if not v.inNode and node_isEntityIn(me, v.n) then
		v.inNode = true
	end

end

