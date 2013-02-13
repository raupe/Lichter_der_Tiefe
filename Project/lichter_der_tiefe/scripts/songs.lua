-- song setup
function castSong(songIdx)

	if songIdx == 101 then

		setControlHint("\nKlang der Ruhe", 0, 0, 0, 2)

	elseif songIdx == 102 then

		setControlHint("\nKlang der Stroemung", 0, 0, 0, 2)

	elseif songIdx == 103 then

        local n = getNaija()
        local pX,pY = entity_getScale(n)

		-- setControlHint("\nKlang der Entschlossenheit", 0, 0, 0, 3)
        entity_scale(n, 1, 1, 2)

        watch(2)
        entity_scale(n, pX, pY, 20)

	elseif songIdx == 104 then

		setControlHint("\nLied der Lichter", 0, 0, 0, 2)
	end

end