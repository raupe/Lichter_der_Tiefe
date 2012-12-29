-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.flag = 900

	centerText("Hoehle der Stroemung")

	v.nejl = 303
	v.song = 901
	v.learn = false
	v.songs = 307


	if isFlag(v.nejl, 1) and isFlag(v.song, 0) then

		node_setCursorActivation(me, true)

		v.x,v.y = node_getPosition(me)
		v.e = createEntity("b_lichterqualle", "", v.x, v.y)
	end

end

-- trigger
function activate(me)

	if isFlag(v.song, 0) then

		setFlag(v.song, 1)

		entity_alpha(v.e, 0, 3)

		learnSong(102)
		setFlag(v.songs, getFlag(v.songs)+1 )
		v.learn = true
	end
end


-- check
function update(me, dt)

	if v.learn then

		v.learn = false
		setControlHint("Lichterqualle: Nagut, ich bringe dir den \"Klang der Stroemung\" bei. Moeges du immer einen Weg finden...", 0, 0, 0, 3)
	end
end