-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()

    v.flag = 300
    v.nejl = 303

    if isFlag(v.nejl, 0) then 
		v.text = DATA_TEXTS.nejl_home_undiscovered_name 
	else 
		v.text = DATA_TEXTS.nejl_home_name 
	end

    centerText(v.text)
end

-- check
function update(me, dt)

end
