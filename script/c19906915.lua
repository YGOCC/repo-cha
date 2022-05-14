--Paintress Seiu
local cid,id=GetID()
Duel.LoadScript("init.lua")
function cid.initial_effect(c)
	Evolute.AddOrigEvoluteType(c)
	c:EnableReviveLimit()
 Evolute.AddEvoluteProc(c,nil,7,aux.TRUE,2,function(ec,tp,g) return g:FilterCount(cid.filter3,nil)==1 end)
end


function cid.filter3(c,ec,tp)
	return c:IsAttribute(ATTRIBUTE_DARK)
end