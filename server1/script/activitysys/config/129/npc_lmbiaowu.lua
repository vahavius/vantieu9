-- �����ھֻ -- �ڳ����ٺ������󶨽ű�
Include("\\script\\activitysys\\config\\129\\head.lua")
Include("\\script\\activitysys\\config\\129\\config.lua")
Include("\\script\\activitysys\\config\\129\\variables.lua")

Include("\\script\\activitysys\\g_activity.lua");
Include("\\script\\dailogsys\\g_dialog.lua");

Include("\\script\\lib\\progressbar.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\activitysys\\playerfunlib.lua");

-- clear npc
function OnTimer(nNpcIndex, nTimeOut)
    DelNpc(nNpcIndex);
end

--break
local _OnBreak = function(nNpcIndex)
	Msg2Player("Qu� tr�nh nh�n Ti�u v�t b� ��t �o�n r�i.");
	return 0;
end

-- process
local _GetAward = function(nNpcIndex, dwNpcID)
    local nTSK_DailyPickNum = 3501;
    if GetNpcParam(nNpcIndex, 6) == 1 then
        return nil;
    end
    -- npc index �Ƿ�
    if nNpcIndex == nil then
        Msg2Player("Nh�n Ti�u v�t th�t b�i.");
        return 0;
    end
    -- npc index �Ƿ�
    if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcID then
        Msg2Player("Nh�n Ti�u v�t th�t b�i.");
        return 0;
    end
    -- 
    local nSettingIdx = GetNpcSettingIdx(nNpcIndex);
    if (nSettingIdx ~= 2156) then       --%%%%
        Msg2Player("Nh�n Ti�u v�t th�t b�i.");
        return 0;
    end
    -- ȡ������ȼ�
    local nLevel = GetNpcParam(nNpcIndex, 1);
    -- �����ռ��ж�
    local nMincCells = pActivity.tbPickCountCell[nLevel][2];
    local szTips = format("T�i kh�ng �� ch�, ��m b�o c� %d � tr�ng h�y ��n.", nMincCells);
    if PlayerFunLib:CheckFreeBagCell(nMincCells, szTips) ~= 1 then
        return 0;
    end
    -- ����Ʒ���ȼ���������ٸ���Ʒ
    pActivity:AddTaskDailyA(nTSK_DailyPickNum, 1);
    -- ������
    local tbItemAward = pActivity.tbAward[nLevel];
    tbAwardTemplet:GiveAwardByRate(tbItemAward, "[Long M�n Ti�u C�c-Nhi�m v� �p Ti�u] Nh�t v�t ph�m r�i c��p ti�u nh�n th��ng");
    local nCurCount = GetNpcParam(nNpcIndex, 2) + 1;
    SetNpcParam(nNpcIndex, 2, nCurCount);
    WriteYunBiaoLog(format("[Long M�n Ti�u C�c] T�i kho�n: %s, Nh�n v�t: %s, ID nh�t ti�u v�t [%s] r�i: %d", 
                GetAccount(), GetName(), GetNpcName(nNpcIndex), nCurCount));
    AddStatData("lmbj_treasure_get");
    -- ɾ��npc
    if (nCurCount >= pActivity.tbPickCountCell[nLevel][1]) then
        SetNpcParam(nNpcIndex, 6, 1);
        DelNpc(nNpcIndex);
    end
end

--��ں���
function main()
    --�ȼ��ж�
    if PlayerFunLib:CheckTotalLevel(150, "Ch�a ��t c�p 150 v� ch�a chuy�n sinh kh�ng th� ti�u v�t.", ">=") ~= 1 then
	    return nil;
    end
    -- �Ƿ��ǰ������
    if (GetCamp() == 0) then
        Talk(1, "", "��i hi�p v�n ch�a gia nh�p m�n ph�i, kh�ng th� nh�n Ti�u v�t r�t ra.");
        return nil;
    end
    local nNpcIndex = GetLastDiagNpc();
    -- �жϱ���ʱ��(3����)�����һ����һ�����Ա�ɼ� ��������ʱ�䶼�ɼ� �����
    if CanPickBiaoWu(nNpcIndex) ~= 1 then
        Msg2Player("Hi�n t�i ng��i kh�ng th� nh�n Ti�u v�t n�y.");
        return nil;
    end
    -- �����ռ��ж�
    local nLevel = GetNpcParam(nNpcIndex, 1);
    local nMincCells = pActivity.tbPickCountCell[nLevel][2];
    local szTips = format("T�i kh�ng �� ch�, ��m b�o c� %d � tr�ng h�y ��n.", nMincCells);
    if PlayerFunLib:CheckFreeBagCell(nMincCells, szTips) ~= 1 then
        return nil;
    end
    --���ղɼ������ж�
    if pActivity:GetTaskDailyA(TSK_DailyPickNum) >= 5 then
	    Msg2Player("M�i hi�p s� m�i ng�y t�i �a nh�t 5 l�n ti�u v�t, s� l�n nh�t h�m nay c�a hi�p s� �� ��t t�i �a.")
	    return nil;
    end
    Msg2Player("B�t ��u nh�n Ti�u v�t");
    --������
    local dwNpcIndex = GetNpcId(nNpcIndex);
    tbProgressBar:OpenByConfig(4, %_GetAward, {nNpcIndex, dwNpcIndex}, %_OnBreak, {nNpcIndex});
end

function CanPickBiaoWu(nNpcIdx)
    local nPassTime = GetCurrentTime() - GetNpcParam(nNpcIdx, 3);
    if (nPassTime >= 180) then
        return 1;
    end
    local nHashValue = String2Id(GetName());
    local nHash1 = GetNpcParam(nNpcIdx, 4);
    local nHash2 = GetNpcParam(nNpcIdx, 5);
    -- �����һ�����
    if (nHashValue == nHash1 + nHash2) then
        return 1;
    end
    -- �Ƿ�����һ�������һ��������
    local nOldPlayerIndex = PlayerIndex;
    local nResult = nil;
    local nTeamSize = GetTeamSize();
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i);
        nHashValue = String2Id(GetName());
        if (nHashValue == nHash1 + nHash2) then
            nResult = 1;
            break;
        end
    end
    PlayerIndex = nOldPlayerIndex;
    return nResult;
end
