Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main(nItemIndex)
	if PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1 then
		return 1
	end

	local tbItem = 
	{
		{szName="Th��ng Long V�n Tinh- Gi�p [C�p 1]",tbProp={6,1,3560,1,0,0},nCount=1,nRate=4},
		{szName="Th��ng Long V�n Tinh- �t [C�p 1]",tbProp={6,1,3570,1,0,0},nCount=1,nRate=4},
		{szName="Th��ng Long V�n Tinh- B�nh[C�p 1]",tbProp={6,1,3580,1,0,0},nCount=1,nRate=4},
		{szName="Th��ng Long V�n Tinh- �inh [C�p 1]",tbProp={6,1,3590,1,0,0},nCount=1,nRate=4},
		{szName="�m M�c V�n Tinh- Gi�p [C�p 1]",tbProp={6,1,3600,1,0,0},nCount=1,nRate=4},
		{szName="�m M�c V�n Tinh- �t [C�p 1]",tbProp={6,1,3610,1,0,0},nCount=1,nRate=4},
		{szName="Huy�n Th�y V�n Tinh- Gi�p [C�p 1]",tbProp={6,1,3620,1,0,0},nCount=1,nRate=4},
		{szName="Huy�n Th�y V�n Tinh- �t [C�p 1]",tbProp={6,1,3630,1,0,0},nCount=1,nRate=4},
		{szName="Thi�n L�i V�n Tinh- Gi�p [C�p 1]",tbProp={6,1,3640,1,0,0},nCount=1,nRate=4},
		{szName="Thi�n L�i V�n Tinh- �t [C�p 1]",tbProp={6,1,3650,1,0,0},nCount=1,nRate=4},
		{szName="Thi�n L�i V�n Tinh- B�nh[C�p 1]",tbProp={6,1,3660,1,0,0},nCount=1,nRate=4},
		{szName="Thi�n L�i V�n Tinh- �inh [C�p 1]",tbProp={6,1,3670,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n Tinh- Gi�p [C�p 1]",tbProp={6,1,3680,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n Tinh- �t [C�p 1]",tbProp={6,1,3690,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n Tinh- B�nh[C�p 1]",tbProp={6,1,3700,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n Tinh- �inh [C�p 1]",tbProp={6,1,3710,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n Tinh- M�u[C�p 1]",tbProp={6,1,3720,1,0,0},nCount=1,nRate=4},
		{szName="Nh��c Th�y V�n Tinh- K� [C�p 1]",tbProp={6,1,3730,1,0,0},nCount=1,nRate=4},
		{szName="B�n Long V�n Tinh #Gi�p[c�p 1 ]",tbProp={6,1,3740,1,0,0},nCount=1,nRate=4},
		{szName="B�n Long V�n Tinh #�t [c�p 1 ]",tbProp={6,1,3750,1,0,0},nCount=1,nRate=4},
		{szName="Kim Long V�n Tinh- Gi�p [C�p 1]",tbProp={6,1,3760,1,0,0},nCount=1,nRate=4},
		{szName="Thanh M�c V�n Tinh- Gi�p [C�p 1]",tbProp={6,1,3770,1,0,0},nCount=1,nRate=4},
		{szName="M�ch Th�y V�n Tinh #Gi�p[c�p 1 ]",tbProp={6,1,3780,1,0,0},nCount=1,nRate=4},
		{szName="X�ch H�a V�n Tinh- Gi�p [C�p 1]",tbProp={6,1,3790,1,0,0},nCount=1,nRate=4},
		{szName="L�c L�i V�n Tinh #Gi�p[c�p 1 ]",tbProp={6,1,3800,1,0,0},nCount=1,nRate=4},
	}
	tbAwardTemplet:Give(tbItem, 1, {"LongMenBiaoJu", "BiaoJuLibao"})
end