-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    node_setCursorActivation(me, true)
end

-- check trigger
function activate(me)


    if confirm ("Willst du was cooles lernen ?") then

        learnSong(18)
    end

end




-- function update(me, dt)
-- end

-- function enterState(me)
--     -- if entity_isState(me, STATE_IDLE) then
--     --     entity_animate(me, "idle", -1)
--     -- end
-- end

-- function exitState(me)
-- end

-- function damage(me, attacker, bone, damageType, dmg)
--     return false
-- end

-- function animationKey(me, key)
-- end

-- function hitSurface(me)
-- end

-- function songNote(me, note)
-- end

-- function songNoteDone(me, note)
-- end

-- function song(me, song)
-- end



-- function activate(me)

--     learnSong(1)--
-- end
