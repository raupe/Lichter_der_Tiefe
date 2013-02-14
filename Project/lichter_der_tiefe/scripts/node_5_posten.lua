-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

	v.n = getNaija()
	v.aal = getEntity("5_aal")

	v.inNode = false
	v.time = 0
	v.dt = 6

	v.flag = 506
end

-- check
function update(me, dt)

	if isFlag(v.flag, 1) then

        setFlag(v.flag, 2)
        setCameraLerpDelay(2)
        cam_toEntity(v.aal)
		return

	elseif isFlag(v.flag, 2) then

		v.time = v.time + dt
        if v.time >= v.dt then
            v.time = 0
            setCameraLerpDelay(2)
            cam_toEntity(v.n)
            setFlag(v.flag, 0)
            --setControlHint("Emily:\n \nEr bewegt sich so schnell. Wenn er doch nur zur Ruhe kommen koennte...", 0, 0, 0, 5)
        end

		return
	end


	if not v.inNode and node_isEntityIn(me, v.n) then
		v.inNode = true
		setFlag(v.flag, 1)
	end

	if v.inNode and not node_isEntityIn(me, v.n) then
		v.inNode = false
        setCameraLerpDelay(0)
        cam_toEntity(v.n)
	end

end