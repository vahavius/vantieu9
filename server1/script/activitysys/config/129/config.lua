Include("\\script\\activitysys\\config\\129\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "S� ki�n m� server",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
        --{"NpcFunLib:AddDialogNpc",	{szNpcZhangGuiName, nNpcZhangGuiID, tbNpcZhangGuiPos} },
        --{"NpcFunLib:AddDialogNpc",	{szNpcBiaoShiName, nNpcBiaoShiID, tbNpcBiaoShiPos} },
        {"NpcFunLib:AddObjNpc",	{szNpcConsignerName, nNpcConsignerID, tbNpcConsignerPos, szNpcConsignerScriptPath} },
        {"NpcFunLib:AddObjNpc",	{szNpcReceiverName, nNpcReceiverID, tbNpcReceiverPos, szNpcReceiverScriptPath} },
        {"ThisActivity:ServerStartCall",	{nil} },
    }
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "PlayerLogin",
	szName = "Ng��i ch�i ��ng nh�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {0,1},
	tbCondition = 
	{
	},
	tbActition = 
	{
        {"ThisActivity:PlayerExchageServerLoginInit", {nil}},
	},
}

tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "PlayerLogin",
	szName = "Ng��i ch�i ��ng nh�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {0,0},
	tbCondition = 
	{
	},
	tbActition = 
	{
        {"ThisActivity:PlayerExchageServerLoginInit", {nil}},
	},
}
