-- �����ھֻ -- �ڳ����ٺ������󶨽ű�
IncludeLib("LEAGUE")
Include("\\script\\activitysys\\config\\129\\head.lua")
Include("\\script\\activitysys\\config\\129\\config.lua")
Include("\\script\\activitysys\\config\\129\\variables.lua")

Include("\\script\\activitysys\\g_activity.lua");
Include("\\script\\dailogsys\\g_dialog.lua");

Include("\\script\\lib\\progressbar.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\activitysys\\playerfunlib.lua");

-- ��ṱ�׶ȴ����ļ�
Include("\\script\\tong\\tong_award_head.lua")

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
    if GetNpcParam(nNpcIndex, 2) == 1 then
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
    -- �ж�NPC�Ƿ��ǰ�����ﱦ��
    local nSettingIdx = GetNpcSettingIdx(nNpcIndex);
    if (nSettingIdx ~= nNpcTongBoxID) then
        Msg2Player("Nh�n Ti�u v�t th�t b�i.");
        return 0;
    end
    -- ȡ������ȼ�
    local nLevel = 10;
    -- �����ռ��ж�
    local nMincCells = pActivity.tbPickCountCell[nLevel][2];
    local szTips = format("T�i kh�ng �� ch�, ��m b�o c� %d � tr�ng h�y ��n.", nMincCells);
    if PlayerFunLib:CheckFreeBagCell(nMincCells, szTips) ~= 1 then
        return 0;
    end
    -- ������
    local nExpTime = getExpiredTime();
    local tbItemAward = {
        { szName = "R��ng Ti�u V�t Bang", tbProp = {6, 1, 4475, 1, 0, 0}, nBindState = -2, nExpiredTime = nExpTime,},
    }
    tbAwardTemplet:GiveAwardByList(tbItemAward, "[Long M�n Ti�u C�c_�p Ti�u Bang] Nh�t R��ng Ti�u V�t Bang");
    local nCurCount = GetNpcParam(nNpcIndex, 1) + 1;
    SetNpcParam(nNpcIndex, 1, nCurCount);
    -- ��ȫ������
    local szTongName = GetTongName();
    local szGlbNews = format("[%s] %s nh�t 1 �R��ng Ti�u V�t Bang�", szTongName, GetName());
    LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szGlbNews , "", "");
    -- ��־���
    AddStatData("bhyb_download_count");
    pActivity:WriteTongYBLog("Nh�t 1 R��ng Ti�u V�t Bang");
    -- ɾ��npc
    if (nCurCount >= pActivity.tbPickCountCell[nLevel][1]) then
        SetNpcParam(nNpcIndex, 2, 1);
        DelNpc(nNpcIndex);
    end
end

--��ں���
function main()
    -- �Ƿ�����˰��
    if CheckHasTong() ~= 1 then
        Talk(1, "", "Ch�a v�o bang, kh�ng th� nh�t R��ng Ti�u Xa Bang.");
        return nil;
    end
    -- ������ʱ��
    if pActivity:CheckJoinTongDays(7) ~= 1 then
        Talk(1, "", "V�o bang ch�a �� 7 ng�y, kh�ng th� nh�t R��ng Ti�u Xa Bang.");
        return nil;
    end
    local nNpcIndex = GetLastDiagNpc();
    -- �жϱ���ʱ��(3����)�����һ����һ�����Ա�ɼ� ��������ʱ�䶼�ɼ� �����
    if CanPickBiaoWu(nNpcIndex) ~= 1 then
        Msg2Player("Hi�n kh�ng th� nh�t R��ng Ti�u Xa Bang.");
        return nil;
    end
    -- �����ռ��ж�
    local nLevel = 10;
    local nMincCells = pActivity.tbPickCountCell[nLevel][2];
    local szTips = format("T�i kh�ng �� ch�, ��m b�o c� %d � tr�ng h�y ��n.", nMincCells);
    if PlayerFunLib:CheckFreeBagCell(nMincCells, szTips) ~= 1 then
        return nil;
    end
    Msg2Player("B�t ��u nh�t R��ng Ti�u Xa Bang.");
    --������
    local dwNpcIndex = GetNpcId(nNpcIndex);
    tbProgressBar:OpenByConfig(4, %_GetAward, {nNpcIndex, dwNpcIndex}, %_OnBreak, {nNpcIndex});
end

function CanPickBiaoWu(nNpcIdx)
    local nPassTime = GetCurrentTime() - GetNpcParam(nNpcIdx, 2);
    if (nPassTime >= 180) then
        return 1;
    end
    local nOwerTongId = GetNpcParam(nNpcIdx, 3) + GetNpcParam(nNpcIdx, 4);
    if nOwerTongId == 0 then
        return 1;
    end
    -- �Ƿ������һ����ҵİ���Ա����Ѻ����Ұ���Ա
    local nSrcTongId = GetNpcParam(nNpcIdx, 5) + GetNpcParam(nNpcIdx, 6);
    local szTongName, nTongId = GetTongName();
    if (nTongId == nOwerTongId or nTongId == nSrcTongId) then
        return 1;
    end
    return 0;
end
