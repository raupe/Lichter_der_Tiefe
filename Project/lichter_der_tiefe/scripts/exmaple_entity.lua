-- ================================================================================================
-- N A U T I L U S  P R I M E!!
-- ================================================================================================

dofile("scripts/entities/entityinclude.lua")

STATE_ATTACKPREP        = 1000
STATE_ATTACK            = 1001
STATE_STARTDELAY        = 1002
STATE_GIVEBIRTH         = 1003


-- ================================================================================================
-- L O C A L  V A R I A B L E S
-- ================================================================================================

lungeDelay = 0
fireDelay = 0

tentacles = 0
eye = 0
shell = 0

bigFireDelay = 3
shotsFired = 0
startx, starty = 0,0
leaveArea = 0
leaveDelay = 0
birthDelay = 2

beserk = false

spawned = {}
n = 0

-- ================================================================================================
-- FUNCTIONS
-- ================================================================================================

function init(me)
    -- health 40
    setupBasicEntity(
    me,
    "",                     -- texture
    40,                             -- health
    1,                              -- manaballamount
    1,                              -- exp
    1,                              -- money
    180,                            -- collideRadius (only used if hit entities is on)
    STATE_IDLE,                     -- initState
    90,                             -- sprite width
    90,                             -- sprite height
    1,                      -- particle "explosion" type, maps to particleEffects.txt -1 = none
    0,                              -- 0/1 hit other entities off/on (uses collideRadius)
    6000,                           -- updateCull -1: disabled, default: 4000
    1
    )

    startx = entity_x(me)
    starty = entity_y(me)

    entity_setCull(me, false)
    entity_initSkeletal(me, "NautilusPrime")

    entity_animate(me, "idle", LOOP_INF)

    entity_setDeathParticleEffect(me, "NautilusPrimeExplode")

    entity_generateCollisionMask(me)

    tentacles = entity_getBoneByName(me, "Tentacles")
    eye = entity_getBoneByName(me, "Eye")
    shell = entity_getBoneByName(me, "Shell")

    lungeDelay = 1.0                -- prevent the nautilus from attacking right away
    leaveArea = getNodeByName("NAUTILUSPRIME_LEAVEAREA")

    bone_alpha(eye, 0)

    entity_setTargetPriority(me, 1)
    entity_setTargetRange(me, 300)

    entity_setDeathScene(me, true)

    loadSound("NautilusPrime")
    loadSound("BossDieSmall")
    loadSound("BossDieBig")

    entity_setDamageTarget(me, DT_AVATAR_PET, false)
end

function postInit(me)
    n = getNaija()
end

function wakeUp(me)
    overrideZoom(0.5, 1)
    playMusic("MiniBoss")
    leaveDelay = 4
    bone_alpha(eye, 1, 2)
    entity_setState(me, STATE_STARTDELAY, 1.5)
    entity_sound(me, "NautilusPrime", 800)
    emote(EMOTE_NAIJAUGH)
end

seen = false
function update(me, dt)
    entity_handleShotCollisionsSkeletal(me)

    if entity_getHealth(me) < 15 and not beserk then
        beserk = true
        bone_setColor(shell, 1, 0.5, 0.5, 0.5)
    end
    if entity_hasTarget(me) then
        n = getNaija()
        if entity_touchAvatarDamage(me, 200, 1, 800) then
            if not entity_isState(n, STATE_PUSH) then
                x,y = entity_getVectorToEntity(me, n)
                x, y = vector_setLength(x, y, 1000)
                entity_push(getNaija(), x, y, 0.5)
            end
        end
    end

    if entity_getState(me)==STATE_IDLE then
        if not entity_hasTarget(me) then
            entity_findTarget(me, 400)
            if entity_hasTarget(me) then
                wakeUp(me)
            end
        else
            if leaveDelay > 0 then leaveDelay = leaveDelay - dt if leaveDelay < 0 then leaveDelay = 0 end end
            if leaveDelay== 0 and not node_isEntityIn(leaveArea, getNaija()) then
                updateMusic()
                overrideZoom(0, 1)
                bone_alpha(eye, 0)
                entity_setPosition(me, node_x(leaveArea), node_y(leaveArea), 2)
                entity_setTarget(me, 0)
                entity_rotate(me, 0, 10)
                entity_clearVel(me)
                entity_heal(me, 10)
                debugLog("nautilusPrime heals 10")
                return
            end

            if bigFireDelay > 0 then bigFireDelay = bigFireDelay - dt if bigFireDelay < 0 then bigFireDelay = 0 shotsFired = 0 fireDelay = 0 end end
            if bigFireDelay == 0 then
                if fireDelay > 0 then fireDelay = fireDelay - dt if fireDelay < 0 then fireDelay = 0 end end

                if fireDelay == 0 then
                    firex, firey = bone_getWorldPosition(tentacles)
                    velx, vely = firex-entity_x(me),firey-entity_y(me)
                    offx, offy = 0,0

                    s = 0
                    if not beserk then
                        s = createShot("NautilusPrimeAngry", me, entity_getTarget(me), firex, firey)
                        fireDelay = 0.3
                    else
                        s = createShot("NautilusPrimeNormal", me, entity_getTarget(me), firex, firey)
                        fireDelay = 0.1
                    end
                    shot_setAimVector(s, velx, vely)
                    shotsFired = shotsFired + 1
                end
                maxShots = 3
                if beserk then
                    maxShots = 14
                end
                if shotsFired >= maxShots then
                    bigFireDelay = 4
                    shotsFired = 0
                end
            else
                if lungeDelay > 0 then lungeDelay = lungeDelay - dt if lungeDelay < 0 then lungeDelay = 0 end end
            end

            if entity_isTargetInRange(me, 2000) then
                if entity_isTargetInRange(me, 200) then
                    entity_moveTowardsTarget(me, dt, -500)
                else
                    entity_moveTowardsTarget(me, dt, 1000)
                end
            end

            dist = 500
            if beserk then
                dist = 600
            end
            if entity_isTargetInRange(me, dist) then
                if math.random(100) < 40 and lungeDelay == 0 and not(bigFireDelay == 0) then
                    entity_setState(me, STATE_ATTACKPREP, 0.5)
                end
            else
                if birthDelay > 0 then
                    birthDelay = birthDelay - dt
                    if birthDelay < 0 then
                        birthDelay = 0
                        if node_getNumEntitiesIn(leaveArea, "Nautilus") < 12 then
                            entity_setState(me, STATE_GIVEBIRTH, 3)
                        end
                        birthDelay = 5
                    end
                end
            end

            entity_doEntityAvoidance(me, dt, 128, 0.5);
            entity_doCollisionAvoidance(me, dt, 15, 0.1);
        end
    end
    entity_updateMovement(me, dt)

    entity_clearTargetPoints(me)
    entity_addTargetPoint(me, bone_getWorldPosition(tentacles))

end

function enterState(me)
    if entity_getState(me)==STATE_IDLE then
        entity_animate(me, "idle", LOOP_INF)
        if beserk then
            entity_setMaxSpeed(me, 600)
        else
            if entity_getHealth(me) < 20 then
                entity_setMaxSpeed(me, 400)
            else
                entity_setMaxSpeed(me, 200)
            end
        end
    elseif entity_getState(me)==STATE_ATTACKPREP then
        entity_setMaxSpeed(me, 0)
        entity_doGlint(me, "Glint", BLEND_ADD)
    elseif entity_isState(me, STATE_STARTDELAY) then
    elseif entity_isState(me, STATE_GIVEBIRTH) then
        entity_animate(me, "birth", LOOP_INF)
        entity_rotate(0, 2)
        debugLog("giving birth!")
        bone_scale(eye, 1, 0.7, 0.6)
        entity_offset(me, -20, 0, 1.0, LOOP_INF, 1)
    elseif entity_isState(me, STATE_DEATHSCENE) then
        clearShots()
        entity_stopInterpolating(me)
        entity_setStateTime(me, 99)
        fadeOutMusic(6)
        entity_idle(n)
        entity_setInvincible(n, true)
        cam_toEntity(me)
        entity_offset(me, 0, 0)
        entity_offset(me, 10, 0, 0.1, -1, 1)
        e = getFirstEntity()
        while e ~= 0 do
            if node_isEntityIn(leaveArea, e) and entity_isName(e, "nautilus") then
                entity_damage(e, me, 99)
                watch(0.2)
            end
            e = getNextEntity()
        end
        watch(1)
        playSfx("BossDieSmall")
        spawnParticleEffect("TinyRedExplode", entity_x(me), entity_y(me))
        fade(1, 0.2, 1, 1, 1)
        watch(0.2)
        fade(0, 0.5, 1, 1, 1)
        watch(0.5)

        watch(1)
        playSfx("BossDieSmall")
        spawnParticleEffect("TinyRedExplode", entity_x(me), entity_y(me))
        fade(1, 0.2, 1, 1, 1)
        watch(0.2)
        fade(0, 0.5, 1, 1, 1)
        watch(0.5)
        playSfx("BossDieSmall")
        spawnParticleEffect("TinyRedExplode", entity_x(me), entity_y(me))
        fade(1, 0.2, 1, 1, 1)
        watch(0.2)
        fade(0, 0.5, 1, 1, 1)
        watch(0.5)
        entity_offset(me, 0, 0)
        entity_offset(me, 20, 0, 0.05, -1, 1)
        playSfx("BossDieBig")
        spawnParticleEffect("TinyRedExplode", entity_x(me), entity_y(me))
        fade(1, 1, 1, 1, 1)
        watch(1.2)
        fade(0, 0.5, 1, 1, 1)



        cam_toEntity(n)
        entity_setInvincible(n, false)

        pickupGem("Boss-Nautilus")

        overrideZoom(0, 1)
        entity_setStateTime(me, 0.1)
        entity_setState(me, STATE_DEAD, -1, 1)

    elseif entity_isState(me, STATE_DEAD) then
        n = getNaija()
        overrideZoom(0,1)
        updateMusic()
        cam_toEntity(n)
        entity_setInvincible(n, false)
    elseif entity_getState(me)==STATE_ATTACK then
        lungeDelay = 2.0
        if beserk then
            entity_setMaxSpeed(me, 1000)
        else
            entity_setMaxSpeed(me, 1200)
        end
        entity_moveTowardsTarget(me, 1000, 1)
    end
end

function spawnNautilus(me, x, y)
    ent = createEntity("Nautilus", "", entity_x(me)+x, entity_y(me)+y)
    entity_scale(ent, 0, 0)
    entity_scale(ent, 1, 1, 2.5)
end

function exitState(me)
    if entity_getState(me)==STATE_ATTACKPREP then
        if not beserk then
            entity_setState(me, STATE_ATTACK, 2.5)
        else
            entity_setState(me, STATE_ATTACK, 3)
        end
    elseif entity_isState(me, STATE_GIVEBIRTH) then
        out = 100
        spawnNautilus(me, -out, 0)
        spawnNautilus(me, out, 0)
        spawnNautilus(me, 0, -out)
        spawnNautilus(me, 0, out)

        bone_scale(eye, 1, 1, 1)
        entity_offset(me, -5, 0, 0.5, -1, 1)
        birthDelay = 10 + math.random(5)
        entity_rotate(me, 360 + entity_getRotation(me), 4, LOOP_INF)
        entity_setState(me, STATE_IDLE)
    elseif entity_getState(me)==STATE_ATTACK then
        entity_setState(me, STATE_IDLE)
    elseif entity_isState(me, STATE_STARTDELAY) then
        lungeDelay = 0
        entity_setState(me, STATE_IDLE)
        entity_rotate(me, 360 + entity_getRotation(me), 4, LOOP_INF)
    end
end

function hitSurface(me)
    if entity_isState(me, STATE_ATTACK) then
        entity_sound(me, "BigRockHit", 900+math.random(200))
        cx, cy = getLastCollidePosition()
        spawnParticleEffect("Dirt", cx, cy)
        shakeCamera(5, 0.5)
        if entity_isEntityInRange(me, getNaija(), 400) then
            avatar_fallOffWall()
        end

    end
end

function damage(me, attacker, bone, damageType, dmg)
    if damageType == DT_CRUSH then
        return true
    end
    if bone ~= 0 and bone_isName(bone, "Tentacles") then
        if not entity_hasTarget(me) then
            entity_findTarget(me, 2000)
            if entity_hasTarget(me) then
                wakeUp(me)
            end
        end
        if entity_getHealth(me)-dmg <= 0 then
            entity_sound(me, "NautilusPrime", 500)
        else
            entity_sound(me, "NautilusPrime", 1100+math.random(100))
        end
        return true
    end
    playNoEffect()
    return false
end