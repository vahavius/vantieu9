-- �����ھֻ -- ����󶨽ű�
Include("\\script\\activitysys\\config\\129\\head.lua")
Include("\\script\\activitysys\\config\\129\\config.lua")
Include("\\script\\activitysys\\config\\129\\variables.lua")

Include("\\script\\activitysys\\playerfunlib.lua");

-- clear npc
function OnTimer(nNpcIndex, nTimeOut)
    DelNpc(nNpcIndex);
end

--��ں���
function main()
    --�ȼ��ж�
    if PlayerFunLib:CheckTotalLevel(150, "Ch�a ��t c�p 150 v� ch�a chuy�n sinh kh�ng th� nh�t.", ">=") ~= 1 then
	    return nil;
    end
    -- ȡ��������Ϣ
    local nNpcIndex = GetLastDiagNpc();
    local nSaveHash = GetNpcParam(nNpcIndex, 2) + GetNpcParam(nNpcIndex, 3);
    local nTaskTime = GetNpcParam(nNpcIndex, 4);
    local nHashValue = String2Id(GetName());
    local nCurTaskTime = GetTask(TSK_LMBJTaskTime);
    if (GetNpcParam(nNpcIndex, 5) == 1) then
        return nil;
    end
    -- �����Ƿ����ڸ����
    if (nHashValue ~= nSaveHash ) then
        Msg2Player("Ng��i kh�ng th� nh�n Ti�u K� c�a ng��i kh�c");
        return nil;
    end
    if (nTaskTime ~= nCurTaskTime) then
        SetNpcParam(nNpcIndex, 5, 1);
        DelNpc(nNpcIndex);
        return nil;
    end
    -- �ж��Ƿ������
    if (GetTask(TSK_LMBJTaskFlag) == 0) then
        SetNpcParam(nNpcIndex, 5, 1);
        DelNpc(nNpcIndex);
        return nil;
    end
    -- �����ռ��ж�
    local nMincCells = 1;
    local szTips = format("T�i kh�ng �� ch�, ��m b�o c� %d � tr�ng h�y ��n.", nMincCells);
    if PlayerFunLib:CheckFreeBagCell(nMincCells, szTips) ~= 1 then
        return nil;
    end
    local tbBiaoQiItem = {szName = "Ti�u K�", tbProp = {6,1,4200,1,0,0}, nBindState = -2,};
    PlayerFunLib:GetItem(tbBiaoQiItem, 1, "[Ho�t ��ng Long M�n Ti�u C�c] Ti�u Xa b� c��p nh�n ���c Ti�u K�");
    SetNpcParam(nNpcIndex, 5, 1);
    DelNpc(nNpcIndex);
end
