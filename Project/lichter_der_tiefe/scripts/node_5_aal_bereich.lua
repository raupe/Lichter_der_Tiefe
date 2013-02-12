-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-------------------------
local nameLine = ":\n \n"
-------------------------

-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false
	v.aal = getEntity("5_aal")
	v.nejl = getEntity("3_nejl")
	
	v.flagNejl = 503
	
end

-- check
function update(me, dt)

	-- enter node
	if not v.inNode then
		if node_isEntityIn(me, v.n) and isForm(1) and not entity_isDead(v.aal) then
			v.inNode = true
			
			if not entity_isState(v.aal, STATE_SING) then
				entity_setState(v.aal, STATE_ATTACK)
				entity_setState(v.nejl, STATE_WAIT)
				
				if getFlag(v.flagNejl) ~= 1 then
					setControlHint("Nejl"..nameLine.."Emily, sei vorsichtig!", 0,0,0, 3)
					setFlag(v.flagNejl, 1)
				end
			end
		end
	end
	
	-- leave node
	if v.inNode then
		if not node_isEntityIn(me, v.n) or not isForm(1) or entity_isDead(v.aal) then
			v.inNode = false
			
			if entity_isState(v.aal, STATE_ATTACK) then
				entity_setState(v.aal, STATE_IDLE)
				entity_setState(v.nejl, STATE_FOLLOW)
			elseif entity_isDead(v.aal) then
				entity_setState(v.nejl, STATE_FOLLOW)
			end
		end
	end

end