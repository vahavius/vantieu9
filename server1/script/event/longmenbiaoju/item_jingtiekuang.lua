Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main(nItemIndex)
	if PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1 then
		return 1
	end

	local tbItem = 
	{
		{szName="Th��ng Long V�n C��ng- Gi�p [C�p 1]",tbProp={8,1,1,1,0,0},nCount=1,nRate=4},
		{szName="Th��ng Long V�n C��ng- �t [C�p 1]",tbProp={8,1,11,1,0,0},nCount=1,nRate=4},
		{szName="Th��ng Long V�n C��ng- B�nh[C�p 1]",tbProp={8,1,21,1,0,0},nCount=1,nRate=4},
		{szName="Th��ng Long V�n C��ng- �inh [C�p 1]",tbProp={8,1,31,1,0,0},nCount=1,nRate=4},
		{szName="�m M�c V�n C��ng#Gi�p [c�p 1 ]",tbProp={8,1,41,1,0,0},nCount=1,nRate=4},
		{szName="�m M�c V�n C��ng#�t  [c�p 1 ]",tbProp={8,1,51,1,0,0},nCount=1,nRate=4},
		{szName="Huy�n Th�y V�n C��ng#Gi�p [c�p 1 ]",tbProp={8,1,61,1,0,0},nCount=1,nRate=4},
		{szName="Huy�n Th�y V�n C��ng#�t  [c�p 1 ]",tbProp={8,1,71,1,0,0},nCount=1,nRate=4},
		{szName="Thi�n L�i V�n C��ng#Gi�p [c�p 1 ]",tbProp={8,1,81,1,0,0},nCount=1,nRate=4},
		{szName="Thi�n L�i V�n C��ng#�t  [c�p 1 ]",tbProp={8,1,91,1,0,0},nCount=1,nRate=4},
		{szName="Thi�n L�i V�n C��ng#B�nh [c�p 1 ]",tbProp={8,1,101,1,0,0},nCount=1,nRate=4},
		{szName="Thi�n L�i V�n C��ng#�inh  [c�p 1 ]",tbProp={8,1,111,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n C��ng#Gi�p [c�p 1 ]",tbProp={8,1,121,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n C��ng#�t  [c�p 1 ]",tbProp={8,1,131,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n C��ng#B�nh [c�p 1 ]",tbProp={8,1,141,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n C��ng#�inh  [c�p 1 ]",tbProp={8,1,151,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n C��ng#M�u  [c�p 1 ]",tbProp={8,1,161,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n C��ng#K�  [c�p 1 ]",tbProp={8,1,171,1,0,0},nCount=1,nRate=4},
		{szName="B�n Long V�n C��ng#Gi�p [c�p 1 ]",tbProp={8,1,181,1,0,0},nCount=1,nRate=4},
		{szName="B�n Long V�n C��ng#�t  [c�p 1 ]",tbProp={8,1,191,1,0,0},nCount=1,nRate=4},
		{szName="Kim Long V�n C��ng#Gi�p [c�p 1 ]",tbProp={8,1,201,1,0,0},nCount=1,nRate=4},
		{szName="Thanh M�c V�n C��ng#Gi�p [c�p 1 ]",tbProp={8,1,211,1,0,0},nCount=1,nRate=4},
		{szName="M�ch Th�y V�n C��ng#Gi�p [c�p 1 ]",tbProp={8,1,221,1,0,0},nCount=1,nRate=4},
		{szName="X�ch H�a V�n C��ng#Gi�p [c�p 1 ]",tbProp={8,1,231,1,0,0},nCount=1,nRate=4},
		{szName="L�c L�i V�n C��ng#Gi�p [c�p 1 ]",tbProp={8,1,241,1,0,0},nCount=1,nRate=4},		
	}
	tbAwardTemplet:Give(tbItem, 1, {"LongMenBiaoJu", "BiaoJuLibao"})
end