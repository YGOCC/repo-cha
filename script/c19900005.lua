--Mana, Cactsun Girl of Fiber VINE
local cid,id=GetID()
function cid.initial_effect(c)
		local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY)
	e1:SetCode(EVENT_SUMMON_SUCCESS)
	e1:SetCountLimit(1,id)
	e1:SetTarget(cid.target)
	e1:SetOperation(cid.operation)
	c:RegisterEffect(e1)
		c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	c:RegisterEffect(e2)
	local e3=e1:Clone()
	e3:SetCode(EVENT_FLIP_SUMMON_SUCCESS)
	c:RegisterEffect(e3)
 
end
function cid.filter(c,e,tp)
	return c:IsType(TYPE_MONSTER) and (c:IsSetCard(0x85a) or c:IsRace(RACE_PLANT))and c:IsCanBeSpecialSummoned(e,0,tp,false,false) and not c:IsCode(id)
end
function cid.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingMatchingCard(cid.filter,tp,LOCATION_HAND+LOCATION_DECK,0,1,nil,e,tp) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_HAND+LOCATION_DECK)
end
function cid.operation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectMatchingCard(tp,cid.filter,tp,LOCATION_HAND+LOCATION_DECK,0,1,1,nil,e,tp)
   local tc=g:GetFirst()
	if tc and Duel.SpecialSummonStep(tc,0,tp,tp,false,false,POS_FACEUP) then
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_DISABLE)
		e1:SetReset(RESET_EVENT+0x1fe0000)
		tc:RegisterEffect(e1,true)
		local e2=Effect.CreateEffect(e:GetHandler())
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetCode(EFFECT_DISABLE_EFFECT)
		e2:SetReset(RESET_EVENT+0x1fe0000)
		tc:RegisterEffect(e2,true)
		local e3=Effect.CreateEffect(e:GetHandler())
		e3:SetType(EFFECT_TYPE_SINGLE)
		e3:SetCode(EFFECT_CANNOT_BE_SYNCHRO_MATERIAL)
		e3:SetProperty(EFFECT_FLAG_UNCOPYABLE)
		e3:SetValue(1)
		e3:SetReset(RESET_EVENT+0x1fe0000)
		tc:RegisterEffect(e3,true)
		local e4=e3:Clone()
		e4:SetCode(EFFECT_CANNOT_BE_FUSION_MATERIAL)
		tc:RegisterEffect(e4,true)
		local e5=e3:Clone()
		e5:SetCode(EFFECT_CANNOT_BE_XYZ_MATERIAL)
		tc:RegisterEffect(e5,true)   
		local e6=e3:Clone()
		e6:SetCode(EFFECT_CANNOT_BE_LINK_MATERIAL)
		tc:RegisterEffect(e6,true)
		  local e7=e3:Clone()
		e7:SetCode(CANNOT_BE_POLARITY_MATERIAL)
		tc:RegisterEffect(e7,true)
		 local e8=e3:Clone()
local e10=e1:Clone()
		e10:SetCode(EFFECT_CANNOT_BE_BIGBANG_MATERIAL)
		tc:RegisterEffect(e10,true)
		e8:SetCode(EFFECT_CANNOT_BE_SPACE_MATERIAL)
		tc:RegisterEffect(e8,true)
		 local e11=e1:Clone()
		e11:SetCode(EFFECT_CANNOT_BE_SPATIAL_MATERIAL)
		tc:RegisterEffect(e11,true)  
		local e12=e1:Clone()
		e12:SetCode(EFFECT_CANNOT_BE_HARMONIZED_MATERIAL)
		tc:RegisterEffect(e12,true)
		local e13=e1:Clone()
		e13:SetCode(EFFECT_CANNOT_BE_BYPATH_MATERIAL)
		tc:RegisterEffect(e13,true)
		local e14=e1:Clone()
		e14:SetCode(EFFECT_CANNOT_BE_TIMELEAP_MATERIAL)
		tc:RegisterEffect(e14,true)
		local e15=e1:Clone()
		e15:SetCode(EFFECT_CANNOT_HAVE_CHROMA_MATERIAL)
		tc:RegisterEffect(e15,true)
		local e16=e1:Clone()
		e16:SetCode(EFFECT_CANNOT_BE_ANNOTEE_MATERIAL)
		tc:RegisterEffect(e16,true)
		local e17=e1:Clone()
		e17:SetCode(EFFECT_CANNOT_BE_ACCENTED_MATERIAL)
		tc:RegisterEffect(e17,true)
		local e18=e1:Clone()
		e18:SetCode(EFFECT_CANNOT_BE_ACCENTED_MATERIAL)
		tc:RegisterEffect(e18,true)
		Duel.SpecialSummonComplete()
	end
end
