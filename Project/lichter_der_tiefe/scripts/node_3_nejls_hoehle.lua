-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()

    v.flag = 300
    v.nejl = 303

    if isFlag(v.nejl, 0) then v.text = "" else v.text = "Nejls" end

    centerText(v.text.." Hoehle")
end

-- check
function update(me, dt)

end
