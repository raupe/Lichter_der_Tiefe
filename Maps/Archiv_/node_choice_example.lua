-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	node_setCursorActivation(me, true)
end

-- check trigger
function activate(me)


	if confirm ("Willst du wieder nach Hause ?") then

		setControlHint("Ne - so einfach ist's dann doch nicht :D", 0, 0, 0, 4 )
	else
		setControlHint("Schade - ich haett dir gegoennt ^_^", 0, 0, 0, 4 )
	end

end
