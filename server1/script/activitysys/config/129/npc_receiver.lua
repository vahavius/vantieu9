-- �󶨽ű�

Include("\\script\\activitysys\\config\\129\\head.lua")
Include("\\script\\activitysys\\config\\129\\extend.lua")
Include("\\script\\activitysys\\config\\129\\variables.lua")

Include("\\script\\global\\maplist.lua")

function main()
    if CheckHasTong() ~= 1 then
        Talk(1, "", "Hi�p s� sao kh�ng v�o bang tham gia h� ti�u?");
        return nil;
    end
    pActivity:ClickEndGuideMan();
end

-- ������Ѻ���ջ���
function pActivity:ClickEndGuideMan()
    local szTitleMsg = "<npc>Ti�u v�t c�a ch�ng t�i �� an to�n ��n n�i? Khi giao nhi�m v� Ti�u Xa Bang ph�i � xung quanh ta. Sau khi ho�n th�nh nhi�m v�, bang ch�ng h� ti�u c� th� ��n ch� ta nh�n th��ng c� nh�n.";
    local tbOpt = {};
    -- �����˿ɼ�
    if self:IsTraner() == 1 then
        tinsert(tbOpt, {"Giao Ti�u Xa Bang", self.HandTongBiaoChe, {self}});
    end
    tinsert(tbOpt, {"Nh�n ph�n th��ng h� ti�u c� nh�n", self.GetConvoyAward, {self}});
    tinsert(tbOpt, {"R�i kh�i", });
    CreateNewSayEx(szTitleMsg, tbOpt);
end

function pActivity:HandTongBiaoChe()
    -- �ж���û�н�Ѻ������
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    if nTaskFlagValue == 0 then
        Talk(1, "", "Ch�a nh�n nhi�m v� �p Ti�u, kh�ng th� nh�n th��ng.");
        return nil;
    end
    -- �ж�����ȼ�
    local nId = floor(nTaskFlagValue/10); -- Ѻ��·��ID
    local tbPath = self.tbBJPathLevel[nId][1]; -- Ѻ��·��
    local nLevel = self.tbBJPathLevel[nId][2]; -- Ѻ�ڵȼ�
    if nLevel < 10 then
        Talk(1, "", "Kh�ng ph�i Ti�u Xa Bang.");
        return nil;
    end
    local nMapId, nX, nY = GetWorldPos();
    local nEPosId = tbPath[2];                  -- Ѻ��·�ߵ��յ�ID
    local tbPos = self.tbBJPoints[nEPosId][2];  -- �յ���ʦ����
    -- �жϵ�ǰ�ջ����ǲ�������ָ���ջ���
    local nNpcIndex = GetLastDiagNpc();
    local nX32, nY32, nMapIdx = GetNpcPos(nNpcIndex);
    if ((nMapId) ~= tbPos[1] or (nX32 ~= tbPos[2]*32) or (nY32 ~= tbPos[3]*32)) then
        Talk(1, "", "��i hi�p �� nh�m l�n, xin h�y xem k� v� tr� NPC �i�m cu�i c�a �p Ti�u Bang.");
        return nil;
    end
    -- �ж��ڳ��Ƿ���
    if IsBiaoCheAlive() ~= 1 then
        Talk(1, "", "Qu� bang �� kh�ng th� b�o v� Ti�u Xa, h�y c� g�ng h�n � l�n sau!");
        return nil;
    end
    -- �ж��ڳ��Ƿ���NPC����
    local nPX32, nPY32, nPMapIdx = self:getCurrentCarPos();
    if (sqrt((nX32-nPX32)*(nX32-nPX32) + (nY32-nPY32)*(nY32-nPY32)) > 600) then
        Talk(1, "", "Ti�u Xa kh�ng c� � b�n c�nh, mau �i t�m xem.");
        return nil;
    end
    local tbCountCell = self.tbAllCountCell[10];
    local nExpTime = getExpiredTime();
    local tbAwardList = {
        { szName = "R��ng Ti�u V�t Bang", tbProp = {6,1,4475,1,0,0}, nBindState = -2, nExpiredTime = nExpTime,},
    }
    -- ��鱳���ռ�
    local szTips = format("T�i kh�ng �� ch�, ��m b�o c� %d � tr�ng h�y ��n.", tbCountCell[2]);
    if PlayerFunLib:CheckFreeBagCell(tbCountCell[2], szTips) ~= 1 then
        return nil;
    end
    -- ɾ���ڳ�
    DeleteBiaoChe();
    -- �޸�Ѻ�ڱ�Ǳ���
    SetTask(TSK_LMBJTaskFlag, 0);
    local _, nTongId = GetTongName();
    TONG_ApplySetTaskValue(nTongId, TONG_TASK_YABIAO_TIME, 0);
    -- ������
    tbAwardTemplet:GiveAwardByList(tbAwardList, "[Long M�n Ti�u C�c_�p Ti�u Bang] �p ti�u th�nh c�ng nh�n to�n b� th��ng.", tbCountCell[1]);
    Talk(1, "", "Qu� bang d�ng m�nh, thu�n l�i ho�n th�nh �p Ti�u Bang l�n n�y.");
    -- ��־
    AddStatData("bhyb_success_count");
    local szLogs = format("Th�nh c�ng ho�n th�nh �p Ti�u Bang, bang nh�n ���c R��ng Ti�u V�t Bang #%d#", tbCountCell[1]);
    self:WriteTongYBLog(szLogs);
    return 1;
end

function pActivity:getAward(nCount)
    local tbItem = {}
    if nCount < 5 then
        tbItem = { szName = "C�m nang thay ��i tr�i ��t", tbProp = {6,1,2527,1,0,0}, nBindState = -2, tbParam={0}, nExpiredTime = 43200,
            CallBack = function(nItemIndex) AddStatData("bhyb_followaward1_count"); end,};
    elseif nCount >= 5 and nCount < 12 then
        tbItem = { szName = "Th��ng T�n Trung", tbProp = {6,1,4473,1,0,0}, nBindState = -2, nExpiredTime = 10080,
            CallBack = function(nItemIndex) AddStatData("bhyb_followaward2_count"); end,};
    elseif nCount >= 12 then
        tbItem = { szName = "Th��ng Trung Th�nh", tbProp = {6,1,4474,1,0,0}, nBindState = -2, nExpiredTime = 10080,
            CallBack = function(nItemIndex) AddStatData("bhyb_followaward3_count"); end,};
    end
    return tbItem;
end

function pActivity:GetConvoyAward()
    -- ������ʱ��
    if self:CheckJoinTongDays(7) ~= 1 then
        Talk(1, "", "V�o bang ch�a �� 7 ng�y, kh�ng th� nh�n th��ng h� ti�u c� nh�n.");
        return nil;
    end
    local tbAwardList = {};
    local nAward = 0;
    for i = 0, 3 do
        local nTaskValue = self:GetFollowAwardCount(TSK_WeekFollowCount + i);
        if nTaskValue > 0 then
            nAward = nAward + 1;
            tbAward = self:getAward(nTaskValue);
            tinsert(tbAwardList, tbAward);
        end
    end
    if nAward == 0 then
        Talk(1, "", "Ch�a t�ch c�c tham gia h�nh ��ng h� ti�u bang l�n n�y, kh�ng th� nh�n th��ng.");
        return nil;
    end
    -- ������ǲ�������Ѻ��
    local _, nTongId = GetTongName();
    local nLastTime = TONG_GetTaskValue(nTongId, TONG_TASK_YABIAO_TIME);
    local nNowTimes = GetCurrentTime();
    if nNowTimes - nLastTime < 1800 then
        Talk(1, "", "Qu� bang ch�a ho�n th�nh �p Ti�u Bang l�n n�y, kh�ng th� nh�n th��ng h� ti�u.");
        return nil;
    end
    -- ��鱳���ռ�
    local szTips = format("T�i kh�ng �� ch�, ��m b�o c� %d � tr�ng h�y ��n.", nAward);
    if PlayerFunLib:CheckFreeBagCell(nAward, szTips) ~= 1 then
        return nil;
    end
    -- ���������
    self:ClearFollowAwardCount();
    -- ������
    tbAwardTemplet:GiveAwardByList(tbAwardList, "[Long M�n Ti�u C�c_�p Ti�u Bang] ��n Nh�n H�ng �p Ti�u Bang �� nh�n ph�n th��ng h� ti�u");
    -- ��־
    local szLogs = format("Nh�n %d th��ng c� nh�n �p Ti�u Bang", nAward);
    self:WriteTongYBLog(szLogs);
end

