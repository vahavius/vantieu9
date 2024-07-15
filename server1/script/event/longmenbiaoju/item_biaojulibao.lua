Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main(nItemIndex)
	if PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1 then
		return 1
	end

	local tbItem = 
	{
		{szName="Kho�i M� Gia Ti�n",tbProp={6,1,4204,1,0,0},nCount=1,nRate=30, nBindState=-2},
		{szName="Thi�t Xa M�t B�",tbProp={6,1,4206,1,0,0},nCount=1,nRate=30, nBindState=-2},
		{szName="Ki�n B�t Kh� T�a",tbProp={6,1,4205,1,0,0},nCount=1,nRate=30, nBindState=-2},
		{szName="Ho�n Ti�u Ch�",tbProp={6,1,4201,1,0,0},nCount=1,nRate=10, nBindState=-2},
	}
	tbAwardTemplet:Give(tbItem, 1, {"LongMenBiaoJu", "BiaoJuLibao"})
end