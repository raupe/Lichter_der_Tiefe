-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

	v.n = getNaija()
	v.flag = 1000

	v.nejl = 303
	v.songs = 307
end


-- check
function update(me, dt)

	if isFlag(v.songs, 3) and isFlag(v.flag, 0) and node_isEntityIn(me, v.n) then

		setFlag(v.flag, 1)

		learnSong(104)
		setControlHint(DATA_TEXTS.sounds_good_man_1, 0, 0, 0, 4)

		-- stop following + progress tunnel
		setFlag(v.nejl, 2)
	end
end

