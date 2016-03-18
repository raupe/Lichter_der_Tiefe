-- song setup
function castSong(songIdx)

	if songIdx == 101 then

		setControlHint(DATA_TEXTS.silence_song_name, 0, 0, 0, 2)

	elseif songIdx == 102 then

		setControlHint(DATA_TEXTS.currents_song_name, 0, 0, 0, 2)

	elseif songIdx == 103 then

        local n = getNaija()
        local pX,pY = entity_getScale(n)

		-- setControlHint("\nSong of Enlightenment", 0, 0, 0, 3)
        entity_scale(n, 1, 1, 2)

        watch(2)
        entity_scale(n, pX, pY, 20)

	elseif songIdx == 104 then

		setControlHint(DATA_TEXTS.light_song_name, 0, 0, 0, 2)
	end

end