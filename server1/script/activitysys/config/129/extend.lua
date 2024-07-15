-- Include Files
Include("\\script\\activitysys\\config\\129\\head.lua")
Include("\\script\\activitysys\\config\\129\\config.lua")
Include("\\script\\activitysys\\config\\129\\variables.lua")

Include("\\script\\global\\maplist.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

-- ��ṱ�׶ȴ����ļ�
Include("\\script\\tong\\tong_award_head.lua")

IncludeLib("TIMER")

pActivity.nPak = curpack();

-- �����޸� �ǵ�ͬ���޸� \\script\\global\\yunbiao_system.lua OnBiaoCheChangeMapNotice �ж�Ӧ�� tbBiaoCheLevel
pActivity.tbBJPathLevel = {
	[1] = {{ 1, 2}, 1,},
	[2] = {{ 3, 4}, 2,},
	[3] = {{ 5, 6}, 2,},
	[4] = {{ 7, 6}, 2,},
	[5] = {{ 8, 9}, 2,},
	[6] = {{10,11}, 2,},
	[7] = {{12,13}, 2,},
	[8] = {{ 7, 5}, 3,},
	[9] = {{ 1,14}, 3,},
	[10] = {{12, 5}, 4,},
	[11] = {{12, 6}, 4,},
	[12] = {{12, 5}, 5,},
	[13] = {{12, 6}, 5,},
	[14] = {{10, 3}, 5,},
	[15] = {{ 5,13}, 5,},
	[16] = {{ 5,13}, 6,},
	[17] = {{10, 4}, 6,},
	[18] = {{ 3,11}, 6,},
	[19] = {{10, 4}, 7,},
	[20] = {{ 3,11}, 7,},
	[21] = {{ 7,12}, 7,},
	[22] = {{ 6,13}, 7,},
	[23] = {{ 7,12}, 8,},
	[24] = {{ 6,13}, 8,},
	[25] = {{10, 5}, 8,},
	[26] = {{10, 5}, 9,},
    -- ���Ѻ��
    -- ����
	[27] = {{15, 16}, 10,},
	[28] = {{15, 17}, 10,},
	[29] = {{15, 18}, 10,},
    -- �ٰ�
	[30] = {{19, 20}, 10,},
	[31] = {{19, 21}, 10,},
	[32] = {{19, 22}, 10,},
	-- �꾩
    [33] = {{23, 24}, 10,},
	[34] = {{23, 25}, 10,},
	[35] = {{23, 26}, 10,},
	[36] = {{23, 27}, 10,},
    -- �ɶ�
    [37] = {{28, 29}, 10,},
	[38] = {{28, 30}, 10,},
	[39] = {{28, 31}, 10,},
	[40] = {{28, 32}, 10,},
    -- ����
    [41] = {{33, 34}, 10,},
	[42] = {{33, 35}, 10,},
	[43] = {{33, 36}, 10,},
    -- ����
	[44] = {{37, 38}, 10,},
	[45] = {{37, 39}, 10,},
	[46] = {{37, 40}, 10,},
    -- ����
	[47] = {{41, 42}, 10,},
	[48] = {{41, 43}, 10,},
	[49] = {{41, 44}, 10,},
}
pActivity.tbAllTask = {
        {nRate = 0,        tbID = {1} },            --1�� �����������ռλ��
        {nRate = 0.149,    tbID = {2,3,4,5,6,7,}},  --2��
        {nRate = 0.3,      tbID = {8,9,}},          --3��
        {nRate = 0.3,      tbID = {10,11,}},        --4��
        {nRate = 0.15,     tbID = {12,13,14,15,}},  --5��
        {nRate = 0.05,     tbID = {16,17,18,}},     --6��
        {nRate = 0.04,     tbID = {19,20,21,22,}},  --7��
        {nRate = 0.01,     tbID = {23,24,25,}},     --8��
        {nRate = 0.001,    tbID = {26,}},           --9��
    }

pActivity.tbBJPoints = {
	[1] = {"L�m An Nam (181,208)", {176, 1448, 3335},},
	[2] = {"L�m An B�c (191,185)", {176, 1534, 2974},},
	[3] = {"Th�nh �� (382,312)", {11, 3061, 4992},},
	[4] = {"Th�n Giang T�n (439,385)", {20, 3516, 6164},},
	[5] = {"T��ng D��ng (192,198)", {78, 1537, 3182},},
	[6] = {"��o H��ng Th�n (203,200)", {101, 1625, 3209},},
	[7] = {"D��ng Ch�u (223,189)", {80, 1786, 3037},},
	[8] = {"��i L� (204,200)", {162, 1639, 3215},},
	[9] = {"Th�ch C� Tr�n (209,202)", {153, 1677, 3240},},
	[10] = {"Ph��ng T��ng (199,193)", {1, 1597, 3093},},
	[11] = {"V�nh L�c Tr�n (209,201)", {99, 1673, 3229},},
	[12] = {"Bi�n Kinh (211,196)", {37, 1690, 3150},},
	[13] = {"Chu Ti�n Tr�n (202,194)", {100, 1622, 3113},},
	[14] = {"Th�n Long Tuy�n (199,204)", {174, 1596, 3271},},
    -- ���Ѻ��
    [15] = {" D��ng Ch�u", {80,1678,3147},},
    [16] = {"T��ng V�n ��ng", {116,1741,3031},},
    [17] = {"Ti�n C�c ��ng", {93, 1620,3182},},
    [18] = {"Linh C�c ��ng", {94, 1638,3106},},
    
    [19] = {" L�m An", {176,1399,3140},},
    [20] = {"L��ng Th�y ��ng", {181,1627,3052},},
    [21] = {"Long Cung ��ng", {180,1548,3176},},
    [22] = {"Nghi�t Long ��ng", {182,2107,3412},},
    
    [23] = {" Bi�n Kinh", {37,1703,3019},},
    [24] = {"Thi�n T�m ��ng", { 42,1642,3029},},
    [25] = {"Thi�n Nh�n Gi�o", { 45,1702,3076},},
    [26] = {"Phi Thi�n ��ng", {204,1621,3375},},
    [27] = {"Thi�u L�m ph�i", {103,1638,2930},},
    
    [28] = {" Th�nh ��", {11,3205,5078},},
    [29] = {"Nh�n Th�ch ��ng", { 10,1778,3065},},
    [30] = {"Th�n Ti�n ��ng", { 23,1854,3123},},
    [31] = {"B�ch V�n ��ng", { 22,1865,3274},},
    [32] = {"��ng Kinh Ho�ng", {  5,1597,3592},},

    [33] = {" T��ng D��ng", {78,1569,3280},},
    [34] = {"K� Qu�n ��ng", { 91,1602,2810},},
    [35] = {"Kh�a Lang ��ng", { 83,1660,2924},},
    [36] = {"D��ng Trung ��ng", {205,1587,3221},},

    [37] = {" Ph��ng T��ng", {1,1559,3258},},
    [38] = {"B�ng H� ��ng", {201,1736,3235},},
    [39] = {  " Hoa S�n", {  2,2406,3713},},
    [40] = {"��ng Kim Quang", {  4,1672,3096},},
    
    [41] = {" ��i L� ", {162,1650,3247},},
    [42] = {"Ph�ng Nh�n ��ng", {168,1653,3138},},
    [43] = {"�i�m Th��ng ��ng", {171,1494,2982},},
    [44] = {"V� Danh ��ng", {203,1505,3102},},
}

pActivity.nTaskGuideId = 14 --��\settings\task\taskguide.txt�����ļ��е�Ψһid
pActivity.nTaskGuideType = 2 --������ָ��ϵͳ�������ճ�����

-- �����������¼�
function pActivity:ServerStartCall()

end

-- ��ҿ����½�¼�
function pActivity:PlayerExchageServerLoginInit()
    -- ����������
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    if (nTaskFlagValue == 0) then
        --Talk(1, "", "��ʿû�н���Ѻ��������ô����ȡ�����أ�");
        return nil;
    end
    -- ȡ���
    if (GetTask(TSK_RefreshBiaoChe) == 0) then
        return nil;
    end
    -- ˢ���ڳ�
    local nSuriveTime = 1800 - (GetCurrentTime() - GetTask(TSK_LMBJTaskTime));
    if (nSuriveTime <= 0) then
        return nil;
    end
    self:refreshBiaoChe(nSuriveTime);
    -- �����ڳ�Ѫ��
    local nCurCarIndex = GetTask(TSK_LMBJCarIndex);
    if (nCurCarIndex <= 0) then
        return nil;
    end
    SetNpcParam(nCurCarIndex, 4, GetTask(TSK_LMBJTaskTime));
    SetNpcCurLife(nCurCarIndex, GetTask(TSK_BiaoCheLife));
    DynamicExecuteByPlayer(PlayerIndex, "\\script\\global\\yunbiao_system.lua", "OnBiaoCheChangeMapNotice");
    -- ������ˢ�����
    SetTask(TSK_RefreshBiaoChe, 0);
end

-- ��ҿ���˳��¼�
function pActivity:PlayerExchageServerLoginOut_BeforeSaveData()
    if GetPlayerEnteringTrap() == 0 then --��Ҳ��ǲ�trap��ĵ�ͼ
        return nil;
    end
    -- �������
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    if (nTaskFlagValue == 0) then
        return nil;
    end
    -- ����ڳ�λ��
    local nX32, nY32, nMapIdx = self:getCurrentCarPos();
    if (nMapID == -1) then
        return nil;
    end
    local nPMapID, nPX, nPY = GetWorldPos();
    if (nMapIdx ~= SubWorldID2Idx(nPMapID)) then
        return nil;
    end
    if (sqrt((nX32-nPX*32)*(nX32-nPX*32) + (nY32-nPY*32)*(nY32-nPY*32)) > 600) then
        return nil;
    end
    if (IsBiaoCheAlive() == 0) then
        return nil;
    end
    -- �����ڳ���Ϣ_Ѫ��
    local nBiaoCheNpcIndex = GetTask(TSK_LMBJCarIndex)
    if nBiaoCheNpcIndex <= 0 then
        return nil;
    end
    SetTask(TSK_BiaoCheLife, GetNpcLife(GetNpcId(nBiaoCheNpcIndex)));
    -- ���ÿ��ˢ�ڳ����
    SetTask(TSK_RefreshBiaoChe, 1);
    SetPlayerEnteringTrap(0);
    local szBiaoCheName = GetNpcName(nBiaoCheNpcIndex);
    if (DeleteBiaoChe() == 0) then
        WriteYunBiaoLog(format("T�i %s(%d,%d) x�a [%s] th�t b�i.", tbGlobalMapId2Name[nPMapID], nPX, nPY, szBiaoCheName));
    end
end

function pActivity:PlayerExchageServerLoginOut()
--    if GetTask(TSK_RefreshBiaoChe) ~= 1 then
--        return nil;
--    end
--    -- ɾ���ڳ�
--    DeleteBiaoChe();
end

-- ����ձ�������
function pActivity:AddTaskDailyA(nTskID, nValue)
    local nCurDate = tonumber(GetLocalDate("%y%m%d"));
    local nTaskValue = GetTask(nTskID);
    if floor(nTaskValue/256) ~= nCurDate then
        nTaskValue = nCurDate*256;
    end
    SetTask(nTskID, nTaskValue+nValue);
end

function pActivity:GetTaskDailyA(nTskID)
    local nCurDate = tonumber(GetLocalDate("%y%m%d"));
    local nTaskValue = GetTask(nTskID);

    if floor(nTaskValue/256) ~= nCurDate then
        nTaskValue = nCurDate * 256;
        SetTask(nTskID, nTaskValue);
    end
    return mod(nTaskValue, 256);
end

function pActivity:CheckHasTask()
    local nTaskValue = GetTask(TSK_LMBJTaskFlag);
    if (nTaskValue ~= 0) then
        local nPassTime = GetCurrentTime() - GetTask(TSK_LMBJTaskTime);
        if nPassTime < 1800 then
            return 1;
        end
    end
    return 0;
end

-- ����ܷ�������Ѻ������
function pActivity:CheckReceiveTaskCondition()
    -- �����жϣ��Ƿ���Ѻ��ʱ�� 10:00 ~ 23:00
    local nCurTime = tonumber(GetLocalDate("%H%M"));
    if (nCurTime>2300 or nCurTime<1000) then
        Talk(1, "", "Kh�ng trong th�i gian �p ti�u 10:00-23:00, hi�p s� h�y quay l�i.");
        return nil;
    end
    -- �ж��ǲ��ǰ������
    if (GetCamp() == 0) then
        Talk(1, "", "Sau khi gia nh�p m�n ph�i h�y ��n t�m ta nh�n nhi�m v�.");
        return nil;
    end
    -- �����жϣ��Ƿ���δ��ɵ�Ѻ������
    local nTaskValue = GetTask(TSK_LMBJTaskFlag);
    if (nTaskValue ~= 0) then
        local nId = floor(nTaskValue/10);
        local nLevel = self.tbBJPathLevel[nId][2];
        local nPassTime = GetCurrentTime() - GetTask(TSK_LMBJTaskTime);
        if nLevel < 10 or nPassTime < 1800 then
            Talk(1, "", "Ng��i �� nh�n nhi�m v�, h�y n�m b�t th�i gian");
            return nil;
        end
    end
    -- �����жϣ��Ƿ���δ��Ľ���
    if (CalcItemCount(-1, 6, 1, 4200, -1) > 0) then
        Talk(1, "", "Ng��i c� ph�n th��ng �p Ti�u ch�a nh�n, nh�n xong r�i quay l�i ��y.");
        return nil;
    end

    return 1;
end

-- ����������1��Ѻ������
function pActivity:ReceiveTaskLow()
    -- �����жϣ������Ƿ������3��Ѻ������
    local nTaskValue = self:GetTaskDailyA(TSK_DailyTaskNum);
    if (nTaskValue >= 3) then
        Talk(1, "", "Hi�p s� h�m nay �� ho�n th�nh 3 l�n �p ti�u, ng�y mai h�y quay l�i.");
        return nil;
    end
    local nTaskValue = GetTask(TSK_LMBJLowTskFlag);
    if (nTaskValue == 0) then
        nTaskValue = 1*10 + random(0, 1);
        SetTask(TSK_LMBJLowTskFlag, nTaskValue);
    end
    local tbPath = self.tbBJPathLevel[1][1];
    local nSid = tbPath[1];
    local nEid = tbPath[2];
    local bFlag = mod(nTaskValue, 10);
    if bFlag == 1 then -- ���������յ�
        nSid, nEid = nEid, nSid;
    end
    local nLevel = self.tbBJPathLevel[1][2];
    local szSName = self.tbBJPoints[nSid][1];
    local szEName = self.tbBJPoints[nEid][1];
    local szTitleMsg = format("<npc>Nhi�m v� Ti�u Xa 1 Sao, �i�m ��u %s-�i�m cu�i %s, trong v�ng 30 ph�t ��n n�i, ��ng �?", szSName, szEName);
    local tbOpt = {};
    tinsert(tbOpt, {"X�c nh�n", self.onSelectProcess, {self, 1, {1,bFlag} }, });
    tinsert(tbOpt, {"R�i kh�i", self.onSelectProcess, {self, 0, nil}, });
    CreateNewSayEx(szTitleMsg, tbOpt);
    return 1;
end

-- �������������Ѻ������
function pActivity:ReceiveTaskRandom()
    -- �����жϣ������Ƿ������3��Ѻ������
    local nTaskValue = self:GetTaskDailyA(TSK_DailyTaskNum);
    if (nTaskValue >= 3) then
        Talk(1, "", "Hi�p s� h�m nay �� ho�n th�nh 3 l�n �p ti�u, ng�y mai h�y quay l�i.");
        return nil;
    end
    local nTaskValue = GetTask(TSK_LMBJRanTskFlag);
    if (nTaskValue == 0) then
        -- �����µ�Ѻ��·��
        local szLocalPath = "\\script\\activitysys\\config\\129\\extend.lua";
        local szRemotePath = "\\script\\event\\longmenbiaoju\\event.lua";
        DynamicExecute(szLocalPath, 
                    "RemoteExecute", szRemotePath, "tbLMBJActivityData:g2s_GetTaskFlag", 0, 
                    "pActivity:getTaskFlagCallBack", PlayerIndex); -- �ڻص������б��淵��ֵ
        return 0;
    end
    self:CreateRandomTaskPanel(floor(nTaskValue/10), mod(nTaskValue,10));
    return 1;
end

function pActivity:CreateRandomTaskPanel(nId, bSwitch)
    local tbPath = self.tbBJPathLevel[nId][1];
    local nSid = tbPath[1];
    local nEid = tbPath[2];
    if bSwitch == 1 then
        nSid, nEid = nEid, nSid;
    end
    local nLevel = self.tbBJPathLevel[nId][2];
    local szSName = self.tbBJPoints[nSid][1];
    local szEName = self.tbBJPoints[nEid][1];
    local szTitleMsg = format("<npc>Nhi�m v� Ti�u Xa %d Sao, �i�m ��u %s-�i�m cu�i %s, trong v�ng 30 ph�t ��n n�i, ��ng �? Sau khi nh�n kh�ng th� t�o m�i nhi�m v�.", nLevel, szSName, szEName);
    local tbOpt = {};
    tinsert(tbOpt, {"Ti�p nh�n",               self.onSelectProcess, { self, 2, {nId,bSwitch} },});
    tinsert(tbOpt, {"L�m m�i nhi�m v� mi�n ph�",       self.onSelectProcess, { self, 3, {nId,bSwitch} },});
    tinsert(tbOpt, {"D�ng Ho�n Ti�u Ch� �� t�o m�i nhi�m v�", self.onSelectProcess, { self, 4, {nId,bSwitch} },});
    tinsert(tbOpt, {"R�i kh�i",               self.onSelectProcess, { self, 0, {nil} },});
    CreateNewSayEx(szTitleMsg, tbOpt);
end

-- �������߼�Ѻ������
function pActivity:ReceiveTaskHigh()
    local szTitleMsg = "<npc>Ng��i mu�n th� th�ch b�n th�n nh�n nhi�m v� �p Ti�u kh� nh�t? Kh�ng c� th�c l�c th� kh�ng ���c, n�u nh� ng��i c� <color=red> �p ti�u �y nhi�m tr�ng cao c�p <color> th� ta c� th� suy ngh� l�i.";
    local tbOpt = {};
    tinsert(tbOpt, {"S� d�ng �p ti�u �y nhi�m tr�ng cao c�p", self.onSelectProcess, {self, 5, {nil}}});
    tinsert(tbOpt, {"R�i kh�i", self.onSelectProcess, {self, 0, nil}, });
    CreateNewSayEx(szTitleMsg, tbOpt);
end

-- ��������ȡѺ��������
function pActivity:ReceiveAward(nNpcType)
    -- �����жϣ��Ƿ��������
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    if (nTaskFlagValue == 0) then
        local szTips = "Ng��i v�n ch�a nh�n nhi�m v� �p Ti�u, h�y ��n Long M�n Tr�n t�m �ng ch� Y�m M�n �i.";
        if (nNpcType == 0) then
            szTips = "Ng��i ch�a nh�n nhi�m v� �p Ti�u.";
        end
        Talk(1, "", szTips);
        return nil;
    end
    -- �ж��ڳ��Ƿ����
    if (GetTask(TSK_LMBJTaskTime) == 0) then
        Talk(1, "", "Ti�u Xa c�a ng��i v�n ch�a xu�t ph�t, mau �i ��n �i�m xu�t ph�t t�m Ti�u S� �� b�t ��u �i.");
        return nil;
    end
    -- ��ȡѺ��������Ϣ
    local nId = floor(nTaskFlagValue/10); -- Ѻ��·��ID
    local bFlag = mod(nTaskFlagValue,10); -- �Ƿ񽻻���ʼ��
    local tbPath = self.tbBJPathLevel[nId][1]; -- Ѻ��·��
    local nLevel = self.tbBJPathLevel[nId][2]; -- Ѻ�ڵȼ�
    if nLevel >= 10 then
        Talk(1, "", "Hi�n �ang nh�n nhi�m v� �p Ti�u Bang, mau ��a Ti�u Xa ��n Ti�p D�n Ti�u Xa Bang ch� ��nh.");
        return nil;
    end
    local tbCountCell = self.tbAllCountCell[nLevel];
    local tbAwardList = self.tbAward[nLevel];
    -- �Ƿ�������_��������ͱ�
    local nBiaoQiCount = CalcItemCount(-1, 6, 1, 4200, -1);
    if nBiaoQiCount > 0 then
        tbCountCell = self.tbLowCountCell[nLevel];
        -- ��鱳���ռ�
        local szTips = format("T�i kh�ng �� ch�, ��m b�o c� %d � tr�ng h�y ��n.", tbCountCell[2]);
        if PlayerFunLib:CheckFreeBagCell(tbCountCell[2], szTips) ~= 1 then
            return 0;
        end
        tongaward_longmenbiaoju();
        -- �޸�Ѻ�ڱ�Ǳ���
        SetTask(TSK_LMBJTaskFlag, 0);
        for i = 1, nBiaoQiCount do
            ConsumeItem(-1, 1, 6, 1, 4200, -1); -- �۳�����
        end
        DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "yunbiao"); -- ��������ӻ�Ծ��
        tbAwardTemplet:GiveAwardByList(tbAwardList, "[Long M�n Ti�u C�c] Ti�u Xa b� c��p nh�n ���c ph�n th��ng an �i.", tbCountCell[1]);
        AddStatData("lmbj_task_over");
        WriteYunBiaoLog(format("[Long M�n Ti�u C�c] T�i kho�n: %s, Nh�n v�t: %s, Ti�u Xa b� c��p nh�n ���c ph�n th��ng an �i, ID nhi�m v�: %d, C�p sao: %d", 
                                                            GetAccount(), GetName(), nId, nLevel));
        Talk(1, "", "Tuy l� Ti�u Xa b� c��p nh�ng c�ng may c��p l�i ���c Ti�u K�, kh�ng c� c�ng c�ng c� s�c, c� ch�t ti�n cho ng��i mua r��u h�y nh�n l�y.");
        return 0;
    end
    -- �����жϣ��ڳ��Ƿ�����Ҹ���
    local nNpcIndex = GetLastDiagNpc();
    local nX32, nY32, nMapIdx = GetNpcPos(nNpcIndex);
    local nPX32, nPY32, nPMapIdx = self:getCurrentCarPos();
    if (IsBiaoCheAlive() == 1 and nMapIdx == nPMapIdx) then -- �ڳ�����Ҹ���
        local nEPosId = tbPath[2-bFlag];            -- Ѻ��·�ߵ��յ�ID
        local tbPos = self.tbBJPoints[nEPosId][2];  -- �յ���ʦ����
        -- �����жϣ��Ի�NPC�ǲ����յ�NPC
        if ((nX32 ~= tbPos[2]*32) or (nY32 ~= tbPos[3]*32)) then
            Talk(1, "", "��i hi�p �i sai ���ng r�i, mau ch�ng h� t�ng Ti�u Xa ��n ��a �i�m ch�nh x�c.");
            return nil;
        end
        -- �����жϣ��ڳ��Ƿ����յ�NPC����600��֮��
        if (sqrt((nX32-nPX32)*(nX32-nPX32) + (nY32-nPY32)*(nY32-nPY32)) > 600) then
            Talk(1, "", "Ti�u Xa kh�ng c� � b�n c�nh, mau �i t�m xem.");
            return nil;
        end
        -- ��鱳���ռ�
        local szTips = format("T�i kh�ng �� ch�, ��m b�o c� %d � tr�ng h�y ��n.", tbCountCell[2]+1);
        if PlayerFunLib:CheckFreeBagCell(tbCountCell[2]+1, szTips) ~= 1 then
            return nil;
        end
        tongaward_longmenbiaoju();
        -- ɾ���ڳ�
        DeleteBiaoChe();
        -- �޸�Ѻ�ڱ�Ǳ���
        SetTask(TSK_LMBJTaskFlag, 0);
        -- ������
        DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "yunbiao"); -- ��������ӻ�Ծ��
        tbAwardTemplet:GiveAwardByList(tbAwardList, "[Long M�n Ti�u C�c] �p ti�u th�nh c�ng nh�n ���c to�n b� ph�n th��ng.", tbCountCell[1]);
        local tbAwardItem = {szName = "H� Ti�u L�nh", tbProp = {6, 1, 4203, 1, 0, 0}, nBindState = -2,};
        PlayerFunLib:GetItem(tbAwardItem, 2, "[Long M�n Ti�u C�c-Nhi�m v� �p Ti�u] �p ti�u th�nh c�ng nh�n ���c H� Ti�u L�nh");
        AddStatData("lmbj_task_over");
        WriteYunBiaoLog(format("[Long M�n Ti�u C�c] T�i kho�n: %s, Nh�n v�t: %s, �p ti�u th�nh c�ng nh�n ���c to�n b� ph�n th��ng, ID nhi�m v�: %d, C�p sao: %d", 
                                                            GetAccount(), GetName(), nId, nLevel));
        return 1;
    end
    -- �ڳ�������Ҹ���
    local szTitleMsg = "<npc>Nhi�m v� �p Ti�u ch�a k�t th�c, n�u l�m m�t Ti�u Xa v� Ti�u K� c� th� k�t th�c nhi�m v� v� nh�n 100 v�n kinh nghi�m, n�u Ti�u Xa b� c��p t�m l�i <color=red>Ti�u K�<color> s� nh�n ���c m�t s� ph�n th��ng.";
    local tbOpt = {};
    tinsert(tbOpt, {"K�t th�c nhi�m v�, nh�n kinh nghi�m", self.onSelectProcess, {self, 6, {nId, bFlag}}});
    tinsert(tbOpt, {"Ta �i t�m l�i xem sao", self.onSelectProcess, {self, 0, nil}, });
    CreateNewSayEx(szTitleMsg, tbOpt);
end

-- ����鿴Ѻ����Ϣ
function pActivity:ViewTaskInfor()
    local szTitleMsg = "";
    local szTempLine = "";
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    local nTaskTimeValue = GetTask(TSK_LMBJTaskTime);
    -- ���������������ڳ�
    local nBiaoQiCount = CalcItemCount(-1, 6, 1, 4200, -1);
    if (nTaskFlagValue ~= 0 and nTaskTimeValue ~= 0 and nBiaoQiCount <= 0) then
        local handle = OB_Create();
        ObjBuffer:PushObject(handle, GetName());
        local szLocalPath = "\\script\\activitysys\\config\\129\\extend.lua";
        local szRemotePath = "\\script\\event\\longmenbiaoju\\event.lua";
        DynamicExecute(szLocalPath,
            "RemoteExecute", szRemotePath, "tbLMBJActivityData:g2s_GetBiaoChePos", handle, 
            "pActivity:viewTaskInforCallBack", PlayerIndex);
        OB_Release(handle);
        return 1;
    end

    if (nTaskFlagValue == 0) then -- δ������
        szTitleMsg = "<npc><enter>Ch�a nh�n nhi�m v� �p Ti�u.";
    else
        local nId = floor(nTaskFlagValue/10);
        local nFlag = mod(nTaskFlagValue, 10);
        local tbPath = self.tbBJPathLevel[nId][1]; -- Ѻ��·��
        local nSid = tbPath[1];
        local nEid = tbPath[2];
        if nFlag == 1 then
            nSid, nEid = nEid, nSid;
        end
        local nLevel = self.tbBJPathLevel[nId][2]; -- Ѻ�ڵȼ�
        -- Ѻ����Ϣ
        szTitleMsg = format("<npc><enter>L� tr�nh �p Ti�u: %s-%s<enter>C�p nhi�m v�: %d Sao", self.tbBJPoints[nSid][1], self.tbBJPoints[nEid][1], nLevel);
        if (nTaskTimeValue == 0) then
            -- ����״̬
            szTempLine = "<enter>tr�ng th�i nhi�m v�: v�n ch�a nh�n Ti�u Xa";
        end
        if (nBiaoQiCount > 0) then
            szTempLine = "<enter>Tr�ng th�i nhi�m v�: Ti�u Xa b� c��p";
        end
        szTitleMsg = szTitleMsg..szTempLine;
    end
    -- ����Ѻ���������
    local nDailyTaskNum = self:GetTaskDailyA(TSK_DailyTaskNum);
    szTempLine = format("<enter>S� l�n nhi�m v� �p Ti�u h�m nay: %d/3", nDailyTaskNum);
    szTitleMsg = szTitleMsg..szTempLine;
    -- �������ˢ���������
    local nDailyFreeCount = self:GetTaskDailyA(TSK_DailyFreeCount);
    szTempLine = format("<enter>S� l�n l�m m�i nhi�m v� mi�n ph� h�m nay: %d/5", nDailyFreeCount);
    szTitleMsg = szTitleMsg..szTempLine;
    -- ������ʾ���
    local tbOpt = {};
    tinsert(tbOpt, {"R�i kh�i", self.onSelectProcess, {self, 0, nil}, });
    CreateNewSayEx(szTitleMsg, tbOpt);
    return 0;
end

-- ���������ٴ��͵��ڳ�λ��
function pActivity:Transport2Dest()
    -- �ж��Ƿ��������
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    if (nTaskFlagValue == 0) then
        Talk(1, "", "Hi�p s� ch�a nh�n nhi�m v� �p Ti�u.");
        return nil;
    end
    -- �ж������Ƿ�ʼ
    if (GetTask(TSK_LMBJTaskTime) == 0) then
        Talk(1, "", "Ti�u Xa ch�a xu�t ph�t.");
        return nil;
    end
    -- ��ǰ�����ǲ��Ǹ���Ѻ������
    local nId = floor(nTaskFlagValue/10);
    if self.tbBJPathLevel[nId][2] >= 10 then
        Talk(1, "", "Hi�n nh�n nhi�m �p Ti�u Bang, Ti�u Xa Bang kh�ng c� � ch� ta.");
        return nil;
    end
    local nMoney = GetCash();
    if (nMoney < 10000) then
        Talk(1, "", "Ng�n l��ng c�a ��i hi�p kh�ng ��.");
        return nil;
    end
    -- ��鴫����CDʱ�� 30��
    local nPassTime = GetCurrentTime() - GetTask(TSK_TransCarTime);
    if (nPassTime < 30) then
        Talk(1, "", "C�ch l�n truy�n t�ng tr��c ch�a ��n 30 gi�y, h�y ��i.");
        return nil;
    end
    -- ����ڳ��Ƿ��ѱ��ݻٻ�����ʧ
    if (CalcItemCount(-1, 6, 1, 4200, -1) > 0) then
        Talk(1, "", "Ti�u Xa ��u b� ng��i l�m m�t h�t r�i, kh�ng th� truy�n t�ng.");
        return nil;
    end
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, GetName());
    local szLocalPath = "\\script\\activitysys\\config\\129\\extend.lua";
    local szRemotePath = "\\script\\event\\longmenbiaoju\\event.lua";
    DynamicExecute(szLocalPath, 
        "RemoteExecute", szRemotePath, "tbLMBJActivityData:g2s_GetBiaoChePos", handle, 
        "pActivity:getBiaoChePosCallBack", PlayerIndex);
    OB_Release(handle);
end

-- ����Ѻ������ �ڳ�δˢ��
function pActivity:AbandonTask()
    -- �����жϣ��Ƿ�ӵ�����
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    if (nTaskFlagValue == 0) then
        Talk(1, "", "Ng��i v�n ch�a nh�n nhi�m v� v�n Ti�u.");
        return nil;
    end
    -- ��ǰ�����ǲ��Ǹ���Ѻ������
    local nId = floor(nTaskFlagValue/10);
    if self.tbBJPathLevel[nId][2] >= 10 then
        Talk(1, "", "Hi�n �ang nh�n nhi�m v� �p Ti�u Bang, kh�ng th� b�.");
        return nil;
    end
    -- �ж��Ƿ������ڳ�
    if GetTask(TSK_LMBJTaskTime) ~= 0 then
        Talk(1, "", "Ti�u Xa c�a ng��i �� xu�t ph�t r�i, l�m sao c� th� b� gi�a ch�ng ���c!");
        return nil;
    end
    -- 7~9���ڲ��ܷ���
    local nId = floor(nTaskFlagValue/10);
    local nLevel = self.tbBJPathLevel[nId][2]; -- Ѻ�ڵȼ�
    if (nLevel >= 7) then
        Talk(1, "", "Ng��i �� nh�n nhi�m v� �p Ti�u cao c�p l�m sao c� th� b� ���c? Ta xem tr�ng ng��i!");
        return nil;
    end
    -- ����ȷ�Ͽ�
    local szTitleMsg = "<npc>��i hi�p x�c ��nh l�n n�y kh�ng th� xu�t Ti�u kh�ng?";
    local tbOpt = {};
    tinsert(tbOpt, {"X�c nh�n", self.onConfirmProcess, { self, 5, {nId, 0} },});
    tinsert(tbOpt, {"R�i kh�i", self.onConfirmProcess, { self, 0, {nil} },});
    CreateNewSayEx(szTitleMsg, tbOpt);
    return nil;
end

function pActivity:LogCurMapID()
    local nMapID = GetWorldPos();
    SetTask(TSK_MapIDFlag, nMapID);
    return 1;
end

-- ��ʼѺ��
function pActivity:ReceiveBiaoChe()
    -- �����жϣ��Ƿ�ӵ�����
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    if (nTaskFlagValue == 0) then
        Talk(1, "", "Ch�a nh�n nhi�m v� V�n Ti�u, h�y ��n Long M�n Tr�n t�m Ch��ng Qu�.");
        return nil;
    end
    local nCurTime = tonumber(GetLocalDate("%H%M"));
    if (nCurTime>=2300 or nCurTime < 1000) then
        Talk(1, "", "Kh�ng trong th�i gian �p ti�u 10:00-23:00, hi�p s� h�y quay l�i.");
        return nil;
    end
    -- �ж�����Ƿ��������NPC�Ի�
    local nMapID, nX, nY = GetWorldPos();
    if (GetTask(TSK_MapIDFlag) ~= nMapID) then
        return nil;
    end
    -- ��ȡѺ��������Ϣ
    local nId = floor(nTaskFlagValue/10); -- Ѻ��·��ID
    local bFlag = mod(nTaskFlagValue,10); -- �Ƿ񽻻���ʼ��
    local tbPath = self.tbBJPathLevel[nId][1]; -- Ѻ��·��
    local nLevel = self.tbBJPathLevel[nId][2]; -- Ѻ�ڵȼ�
    -- �����жϣ��Ի�NPC�Ƿ�����������NPC
    local nNpcIndex = GetLastDiagNpc();
    local nX32, nY32 = GetNpcPos(nNpcIndex);
    local nEPosId = tbPath[1+bFlag];            -- Ѻ��·�ߵ��յ�ID
    local tbPos = self.tbBJPoints[nEPosId][2];  -- Ѻ��·���յ�����
    if ((nX32 ~= tbPos[2]*32) or (nY32 ~= tbPos[3]*32)) then
        Talk(1, "", "Hi�p s� ��n nh�m ch� r�i, Ti�u Xa �ang � �i�m b�t ��u.");
        return nil;
    end
    -- �����жϣ��Ƿ��Ѿ��ӹ��ڳ�
    local nLastTaskTime = GetTask(TSK_LMBJTaskTime);
    if (nLastTaskTime ~= 0) then
        Talk(1, "", "Kh�ng ph�i Ti�u Xa c�a ng��i �� xu�t ph�t t� l�u r�i sao, c�n kh�ng mau �i b�o v� n�u kh�ng s� b� k� x�u c��p m�t b�y gi�!");
        return nil;
    end
    -- �����жϣ��Ƿ�Զ�������ʦ
    if(abs(nX32-nX*32) > 600 or abs(nY32-nY*32) > 600) then
        Talk(1, "", "Ng��i �ang c�ch xa �i�m b�t ��u Ti�u S�, khi Ti�u Xa xu�t hi�n kh�ng n�n r�i xa Ti�u S�.");
        return nil;
    end
    -- ˢ���ڳ�
    self:refreshBiaoChe(30*60);
    SetTask(TSK_ItemKMJBTime, 0);
    SetTask(TSK_ItemJBKCTime, 0);
    SetTask(TSK_TransCarTime, 0);
    SetTask(TSK_ItemBCYWTime, 0);
    -- ���������ʱ��
    local nCurTime = GetCurrentTime();
    SetNpcParam(GetTask(TSK_LMBJCarIndex), 4, nCurTime);
    SetTask(TSK_LMBJTaskTime, nCurTime);
    -- �������
    AddStatData(format("lmbj_car_build_%d", nLevel));
end

function pActivity:onSelectProcess(nSelId, tbParam)
    -- �뿪��ȡ������
    if (nSelId == 0) then
        return nil;
    end

    local szTitleMsg = "";
    local tbOpt = {};

    -- �߼�Ѻ������
    if (nSelId == 5) then
        szTitleMsg = "<npc>N�p �p ti�u �y nhi�m tr�ng cao c�p s� ng�u nhi�n xu�t hi�n nhi�m v� �p Ti�u 7 sao, 8 sao, 9 sao. Ng��i �� chu�n b� xong ch�a?"
        tinsert(tbOpt, {"X�c nh�n", self.onConfirmProcess, { self, 3, {nil} },});
        tinsert(tbOpt, {"R�i kh�i", self.onConfirmProcess, { self, 0, {nil} },});
        CreateNewSayEx(szTitleMsg, tbOpt);
        return nSelId;
    end

    -- �Ұ��ڳ������춼Ū����
    if(nSelId == 6) then
        -- �鿴�ڳ��Ƿ��Ѿ���ʧ
        tongaward_longmenbiaoju();
        local handle = OB_Create();
        ObjBuffer:PushObject(handle, GetName());
        local szLocalPath = "\\script\\activitysys\\config\\129\\extend.lua";
        local szRemotePath = "\\script\\event\\longmenbiaoju\\event.lua";
        DynamicExecute(szLocalPath, 
            "RemoteExecute", szRemotePath, "tbLMBJActivityData:g2s_GetBiaoChePos", handle, 
            "pActivity:getCheckBiaoCheCallBack", PlayerIndex);
        OB_Release(handle);
        return nSelId;
    end
    
    local nId   = tbParam[1];
    local bFlag = tbParam[2];
    local tbPath = self.tbBJPathLevel[nId][1];
    local nLevel = self.tbBJPathLevel[nId][2];
    local nSid = tbPath[1];
    local nEid = tbPath[2];
    if (bFlag == 1) then -- ���������յ�
        nSid, nEid = nEid, nSid;
    end

    -- Ѻ������ȷ��
    if (nSelId == 1) then
        self:AddTaskDailyA(TSK_DailyTaskNum, 1);
        self:saveTask(tbParam);
        -- ���͵�������ʼ��ʦλ��
        self:transToBeginPos(tbParam);
        self:updateRelayData(nId);
        return nSelId;
    end

    -- ���Ѻ������-����
    if (nSelId == 2) then
        local szSName = self.tbBJPoints[nSid][1];
        local szEName = self.tbBJPoints[nEid][1];
        szTitleMsg = format("<npc>Nhi�m v� Ti�u Xa %d Sao, �i�m ��u %s-�i�m cu�i %s, trong v�ng 30 ph�t ��n n�i, ��ng �?",nLevel, szSName, szEName);
        tbOpt = {};
        tinsert(tbOpt, {"X�c nh�n", self.onSelectProcess, {self,1,tbParam}, });
        tinsert(tbOpt, {"R�i kh�i", self.onSelectProcess, {self,0,{nil}}, });
        CreateNewSayEx(szTitleMsg, tbOpt);
        return nSelId;
    end

    -- ���Ѻ������-���ˢ������
    if (nSelId == 3) then
        -- �����ж� : �����Ƿ�����ѻ��ڻ���
        local nFreeCount = self:GetTaskDailyA(TSK_DailyFreeCount);
        szTitleMsg = "Ng��i �� d�ng h�t s� l�n l�m m�i mi�n ph� c�a ng�y h�m nay, mu�n s� d�ng ti�p <color=red> Ho�n Ti�u Ch� <color>.";
        if (nFreeCount<5) then
            szTitleMsg = "<npc>C� ph�i l�m m�i nhi�m v�?";
            tinsert(tbOpt, {"X�c nh�n", self.onConfirmProcess, {self,1,tbParam}, });
        end
        tinsert(tbOpt, {"Tr� v�", self.CreateRandomTaskPanel, {self, tbParam[1], tbParam[2]}, });
        CreateNewSayEx(szTitleMsg, tbOpt);
        return nSelId;
    end

    -- ���Ѻ������-��Ʊ֤ˢ������
    if (nSelId == 4) then
        -- �����жϣ��Ƿ�����ѻ��ڻ���
        if (self:GetTaskDailyA(TSK_DailyFreeCount) < 5) then
            Talk(1, "", "Hi�n hi�p s� c�n s� l�n mi�n ph�, kh�ng c�n d�ng Ho�n Ti�u Ch�.");
            return 0;
        end
        -- �����жϣ��������Ƿ��л�Ʊƾ֤
        if (CalcItemCount(3, 6, 1, 4201, -1) <= 0) then
            Talk(1, "", "Kh�ng c� Ho�n Ti�u Ch�, kh�ng n�n l�ng ph� th�i gian.");
            return 0;
        end
        szTitleMsg = "<npc>D�ng Phi�u ��i Ti�u t�o m�i nhi�m v�?";
        tinsert(tbOpt, {"X�c nh�n", self.onConfirmProcess, { self, 2, tbParam },});
        tinsert(tbOpt, {"Tr� v�", self.CreateRandomTaskPanel, {self, tbParam[1], tbParam[2]}, });
        CreateNewSayEx(szTitleMsg, tbOpt);
        return nSelId;
    end

end

function pActivity:onConfirmProcess(nSelId, tbParam)
    if (nSelId == 0) then
        return nil;
    end

    -- ȷ����ѻ���
    if (nSelId == 1) then
        -- ���յ���ѻ��ڴ���+1
        self:AddTaskDailyA(TSK_DailyFreeCount, 1);
        local szTips = format("Nhi�m v� �p Ti�u �� t�o m�i, c�n %d l�n mi�n ph�.", 5-self:GetTaskDailyA(TSK_DailyFreeCount));
        Msg2Player(szTips);
        -- �����µ�Ѻ��·��
        local szLocalPath = "\\script\\activitysys\\config\\129\\extend.lua";
        local szRemotePath = "\\script\\event\\longmenbiaoju\\event.lua";
        DynamicExecute(szLocalPath, 
                    "RemoteExecute", szRemotePath, "tbLMBJActivityData:g2s_GetTaskFlag", 0, 
                    "pActivity:getTaskFlagCallBack", PlayerIndex);
        return nSelId;
    end

    -- ȷ��ʹ�û���ƾ֤����
    if (nSelId == 2) then
        if (ConsumeItem(3, 1, 6, 1, 4201, -1) == 1) then -- �۳�����(����ƾ֤)
            Msg2Player("Nhi�m v� �p Ti�u �� t�o m�i, tr� 1 Ho�n Ti�u Ch�.");
            -- ���²���Ѻ��·��
            local nTaskValue = self:getChangeTaskFlag();
            SetTask(TSK_LMBJRanTskFlag, nTaskValue);
            WriteYunBiaoLog(format("[Long M�n Ti�u C�c] T�i kho�n: %s, Nh�n v�t: %s d�ng Ho�n Ti�u Ch�", GetAccount(), GetName()));
            AddStatData("lmbj_task_refresh");
            self:CreateRandomTaskPanel(floor(nTaskValue/10), mod(nTaskValue,10));
        else
            Msg2Player("Kh�u tr� ��o c� th�t b�i, h�y ��t Ho�n Ti�u Ch� v�o trong T�i.");
        end
        return nSelId;
    end

    -- ȷ�����ܸ߼�Ѻ������
    if (nSelId == 3) then
        if (ConsumeItem(3, 1, 6, 1, 4202, -1) ~= 1) then -- �۳�����(����ƾ֤)
            Talk(1, "", "Ng��i kh�ng c� �p ti�u �y nhi�m tr�ng cao c�p, ��ng ph� th�i gian n�a.");
            return nil;
        end
        local nLevel = 8;
        local nRandValue = random(1, 100);
        if (nRandValue <= 60) then -- 60%�ĸ���7���ڳ�
            nLevel = 7;
        elseif (nRandValue >90) then-- 10%�ĸ���9���ڳ�
            nLevel = 9;
        end
        local tbAllId = self.tbAllTask[nLevel].tbID;
        local nId = tbAllId[random(1, getn(tbAllId))];
        local bSwitchSE = random(0, 1);
        self:saveTask({nId, bSwitchSE});
        Msg2Player("�� nh�n 1 nhi�m v� �p Ti�u c�p cao, ki�n ngh� t� ��i h� ti�u.");
        WriteYunBiaoLog(format("[Long M�n Ti�u C�c]  T�i kho�n: %s, Nh�n v�t: %s d�ng �p Ti�u �y Tr�ng Nhi�m V� Cao C�p, ID nhi�m v�: %d, C�p sao: %d", GetAccount(), GetName(), nId, nLevel));
        AddStatData("lmbj_task_highbook");
        self:transToBeginPos({nId, bSwitchSE});
        return nSelId;
    end

    -- �ڳ������춼û�н����������񣬸�����
    local nId = tbParam[1];
    local nLevel = self.tbBJPathLevel[nId][2];
    if (nSelId == 4) then
        SetTask(TSK_LMBJTaskFlag, 0);
--        DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", 32); -- ��������ӻ�Ծ��
        PlayerFunLib:AddExp(1000000, 1, "[Long M�n Ti�u C�c] Ti�u Xa bi�n m�t, kh�ng c� ph�n th��ng kinh nghi�m d�ng Ti�u K� k�t th�c nhi�m v�");
        AddStatData("lmbj_task_over");
        WriteYunBiaoLog(format("[Long M�n Ti�u C�c] T�i kho�n: %s, Nh�n v�t: %s, ID nhi�m v� k�t th�c: %d, C�p sao: %d", GetAccount(), GetName(), nId, nLevel));
        Msg2Player("�� k�t th�c nhi�m v� �p Ti�u l�n n�y.");
    end
    -- ȷ���������� ��δˢ���ڳ�
    if (nSelId == 5) then
        SetTask(TSK_LMBJTaskFlag, 0);
        Msg2Player("�� b� nhi�m v� �p Ti�u l�n n�y.");
        WriteYunBiaoLog(format("[Long M�n Ti�u C�c] T�i kho�n: %s, Nh�n v�t: %s, ID nhi�m v� t� b�: %d, C�p sao: %d", GetAccount(), GetName(), nId, nLevel));
    end
end

function pActivity:saveTask(tbParam)
    local nId = tbParam[1];
    local bSwitch = tbParam[2];
    if (nId == nil or bSwitch == nil) then
        Msg2Player("Nh�n ti�u th�t b�i");
        return nil;
    end
    SetTask(TSK_LMBJTaskFlag, nId*10+bSwitch);
    Msg2Player(format("Th�nh c�ng nh�n nhi�m v� �p Ti�u %d Sao", self.tbBJPathLevel[nId][2]));
    AddStatData("lmbj_task_start");
    WriteYunBiaoLog(format("[Long M�n Ti�u C�c] T�i kho�n: %s, Nh�n v�t: %s, C�p sao nhi�m v� �p Ti�u nh�n: %d", GetAccount(), GetName(), self.tbBJPathLevel[nId][2]));
    -- ���1�ǡ����Ѻ������
    SetTask(TSK_LMBJLowTskFlag, 0);
    SetTask(TSK_LMBJRanTskFlag, 0);
end

function pActivity:getChangeTaskFlag()
    local nIdx = 0;
    local nRandValue = random(1, 10000)
    local nCurValue = 0;
    for i = 2, getn(self.tbAllTask) do
        nCurValue = nCurValue + self.tbAllTask[i].nRate * 10000;
        if (nRandValue <= nCurValue) then
            nIdx = i;
            break;
        end
    end
    local nID = random(1, getn(self.tbAllTask[nIdx].tbID));
    local nTskID = self.tbAllTask[nIdx].tbID[nID];
    return nTskID*10 + random(0, 1);
end

function pActivity:getTaskFlagCallBack(nParam, ResultHandle)
    local nTaskFlagValue = random(2, 18)*10 + random(0, 1);
    if (OB_IsEmpty(ResultHandle) ~= 1) then
        nTaskFlagValue = ObjBuffer:PopObject(ResultHandle);
    end
    local nOldPlayerIndex = PlayerIndex;
    PlayerIndex = nParam;
    SetTask(TSK_LMBJRanTskFlag, nTaskFlagValue);
    self:CreateRandomTaskPanel(floor(nTaskFlagValue/10), mod(nTaskFlagValue,10));
    PlayerIndex = nOldPlayerIndex;
end

function pActivity:getBiaoChePosCallBack(nParam, ResultHandle)
    local tbCurCarPos = {-1, 0, 0, 0};
    if (OB_IsEmpty(ResultHandle) ~= 1) then
        tbCurCarPos = ObjBuffer:PopObject(ResultHandle);
    end
    local nOldPlayerIndex = PlayerIndex;
    PlayerIndex = nParam;
    if (tbCurCarPos==nil or tbCurCarPos[1]==-1) then
        Talk(1, "", "Ti�u Xa �� b� ph� h�y ho�c bi�n m�t, kh�ng th� truy�n t�ng");
        PlayerIndex = nOldPlayerIndex;
        return nil;
    end
    -- ���ñ��δ���ʱ��
    SetTask(TSK_TransCarTime, GetCurrentTime());
    -- ��Ǯ
    Pay(10000);
    -- ���͵��ڳ�λ��
    SetFightState(tbCurCarPos[4]);
    NewWorld(tbCurCarPos[1], tbCurCarPos[2], tbCurCarPos[3]);
    PlayerIndex = nOldPlayerIndex;
end

function pActivity:getCheckBiaoCheCallBack(nParam, ResultHandle)
    local tbCurCarPos = {-1, 0, 0, 0};
    if (OB_IsEmpty(ResultHandle) ~= 1) then
        tbCurCarPos = ObjBuffer:PopObject(ResultHandle);
    end
    local nOldPlayerIndex = PlayerIndex;
    PlayerIndex = nParam;
    -- ��ȡѺ��������Ϣ
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    local nId = floor(nTaskFlagValue/10); -- Ѻ��·��ID
    local bFlag = mod(nTaskFlagValue,10); -- �Ƿ񽻻���ʼ��
    local nPassTime = GetCurrentTime() - GetTask(TSK_LMBJTaskTime);
    local szTitleMsg = "";
    local tbOpt = {};
    if (tbCurCarPos[1] == -1 or nPassTime >= 1800) then
        szTitleMsg = "<npc>Ti�u Xa c�a ng��i �� bi�n m�t ho�c b� ph� h�y, c� ph�i k�t th�c nhi�m v� l�n n�y?";
        tinsert(tbOpt, {"X�c nh�n", self.onConfirmProcess, { self, 4, {nId, bFlag} },});
    else
        szTitleMsg = format("<npc>Ti�u Xa c�a b�n �ang d�ng � b�n �� %s(%s/%s).", tbGlobalMapId2Name[tbCurCarPos[1]], floor(tbCurCarPos[2]/8), floor(tbCurCarPos[3]/16));
    end
    tinsert(tbOpt, {"R�i kh�i", self.onConfirmProcess, { self, 0, {nil} },});
    CreateNewSayEx(szTitleMsg, tbOpt);
    PlayerIndex = nOldPlayerIndex;
end

function pActivity:viewTaskInforCallBack(nParam, ResultHandle)
    local tbCurCarPos = {-1, 0, 0, 0};
    if (OB_IsEmpty(ResultHandle) ~= 1) then
        tbCurCarPos = ObjBuffer:PopObject(ResultHandle);
    end
    local nOldPlayerIndex = PlayerIndex;
    PlayerIndex = nParam;
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    local nId = floor(nTaskFlagValue/10);
    local nFlag = mod(nTaskFlagValue, 10);
    local tbPath = self.tbBJPathLevel[nId][1]; -- Ѻ��·��
    local nLevel = self.tbBJPathLevel[nId][2]; -- Ѻ�ڵȼ�
    local nSid = tbPath[1];
    local nEid = tbPath[2];
    if nFlag == 1 then
        nSid, nEid = nEid, nSid;
    end
    -- Ѻ����Ϣ
    local szTitleMsg = format("<npc><enter>L� tr�nh �p Ti�u: %s-%s<enter>C�p nhi�m v�: %d Sao", self.tbBJPoints[nSid][1], self.tbBJPoints[nEid][1], nLevel);
    local szTempLine = "";
    -- ����״̬
    if (tbCurCarPos==nil or tbCurCarPos[1]==-1) then -- �ڳ���ʧ
        szTempLine = "<enter>Tr�ng th�i nhi�m v�: Ti�u Xa �� bi�n m�t, nhi�m v� k�t th�c.";
    else
        local nPassTime =  GetCurrentTime() - GetTask(TSK_LMBJTaskTime);
        szTempLine = format("<enter>Tr�ng th�i nhi�m v�: ��m ng��c kho�ng %d ph�t", 30-floor(nPassTime/60));
    end
    local nPassTime = GetCurrentTime() - GetTask(TSK_LMBJTaskTime);
    if ( nPassTime >= 1800) then -- ����ڷ�����崻��ڳ�һֱ���ڳ�ʱ��ֹ
        szTempLine = "<enter>Tr�ng th�i nhi�m v�: Ti�u Xa �� bi�n m�t, nhi�m v� k�t th�c.";
    end
    szTitleMsg = szTitleMsg..szTempLine;
    -- ����Ѻ���������
    local nDailyTaskNum = self:GetTaskDailyA(TSK_DailyTaskNum);
    szTempLine = format("<enter>S� l�n nhi�m v� �p Ti�u h�m nay: %d/3", nDailyTaskNum);
    szTitleMsg = szTitleMsg..szTempLine;
    -- �������ˢ���������
    local nDailyFreeCount = self:GetTaskDailyA(TSK_DailyFreeCount);
    szTempLine = format("<enter>S� l�n l�m m�i nhi�m v� mi�n ph� h�m nay: %d/5", nDailyFreeCount);
    szTitleMsg = szTitleMsg..szTempLine;
    local tbOpt = {};
    tinsert(tbOpt, {"R�i kh�i", self.onSelectProcess, {self, 0, nil}, });
    CreateNewSayEx(szTitleMsg, tbOpt);
    PlayerIndex = nOldPlayerIndex;
end

-- ���͵�Ѻ��
function pActivity:transToBeginPos(tbParam)
    local nId = tbParam[1];
    local bSwitch = tbParam[2];
    if (nId == nil or bSwitch == nil) then
        return nil;
    end
    local tbCurPath = self.tbBJPathLevel[nId][1];
    local nSid = tbCurPath[1+bSwitch];
    local tbPos = self.tbBJPoints[nSid][2];
    SetTask(TSK_LMBJTaskTime, 0);
    SetTask(TSK_LMBJCarIndex, 0);
    NewWorld(tbPos[1], tbPos[2], tbPos[3]);
end

-- Ҫʵ�ֳ��˲���ͬһ̨GS�»�ȡ����λ��
function pActivity:getCurrentCarPos()
    -- ��������ͬһ̨GS��
    local nX32, nY32, nMapIdx = GetBiaoChePos();
    if (nMapIdx == -1) then
        return 0, 0, -1;
    end

    return nX32, nY32, nMapIdx;
end

function pActivity:refreshBiaoChe(nSuriveTime)
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    if (nTaskFlagValue == 0) then
        return nil;
    end
    local szTongName, nTongId = GetTongName();
    -- ��ȡѺ��������Ϣ
    local nId = floor(nTaskFlagValue/10);       -- Ѻ��·��ID
    local nLevel = self.tbBJPathLevel[nId][2];  -- Ѻ�ڵȼ�
    -- ��ȡ�ڳ���Ϣ
    local nNpcSettingID = self:getBiaoCheNpcSettingId(nLevel);
    local szPlayerName = GetName();
    local szCarName = format("%s-Ti�u Xa %d Sao", szPlayerName, nLevel);
    local szScriptPath = "\\script\\activitysys\\config\\129\\npc_lmbiaoche.lua";
    if nLevel >= 10 then
        szCarName = format("Ti�u Xa bang c�a [%s]%s", szTongName, szPlayerName);
        szScriptPath = "\\script\\activitysys\\config\\129\\npc_lmbiaoche.lua";
    end
    local nNpcIndex = CreateBiaoChe(random(1,4), nNpcSettingID, 95, szCarName, nSuriveTime*18);
    SetNpcParam(nNpcIndex, 1, nLevel);
    local nHashValue = String2Id(szPlayerName); -- ����ҽ�ɫ����Hashֵ����
    local nHash1 = floor(nHashValue/2);
    local nHash2 = nHashValue - nHash1;
    SetNpcParam(nNpcIndex, 2, nHash1);
    SetNpcParam(nNpcIndex, 3, nHash2);
--    SetNpcParam(nNpcIndex, 4, TaskStartTime);
    nHash1 = floor(nTongId / 2);
    nHash2 = nTongId - nHash1;
    SetNpcParam(nNpcIndex, 5, nHash1);
    SetNpcParam(nNpcIndex, 6, nHash2);
    SetNpcScript(nNpcIndex, szScriptPath);
    SetTask(TSK_LMBJCarIndex, nNpcIndex); --�����ڳ�Index
    if nLevel >= 10 then
        SetNpcTimer(nNpcIndex, 18*60);
    end
end

function pActivity:getBiaoCheNpcSettingId(nLevel)
    local tbSettingIDbyLevel = {
        [1] = 2146,
        [2] = 2146,
        [3] = 2146,
        [4] = 2147,
        [5] = 2147,
        [6] = 2147,
        [7] = 2148,
        [8] = 2148,
        [9] = 2148,
        [10] = 2233,
    }
    return tbSettingIDbyLevel[nLevel];
end

function pActivity:updateRelayData(nTskID)
    local nLevel = self.tbBJPathLevel[nTskID][2];
    if (nLevel == nil or nLevel < 7) then
        return nil;
    end
    if (self:GetTaskDailyA(TSK_DailyFreeCount) >= 5) then
        return nil;
    end
    local szRemotePath = "\\script\\event\\longmenbiaoju\\event.lua";
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, nLevel);
    RemoteExecute(szRemotePath, "tbLMBJActivityData:g2s_SaveTaskFlag", handle);
    OB_Release(handle);
end

--------------------------------------------���Ѻ������ӿ�--------------------------------------------
function pActivity:GetOccupyTongId()
    local tbMainCity = {
        [1]     = 1,    -- ����
        [11]    = 2,    -- �ɶ�
        [162]   = 3,    -- ����
        [37]    = 4,    -- �꾩
        [78]    = 5,    -- ����
        [80]    = 6,    -- ����
        [176]   = 7,    -- �ٰ�
    };
    local nMapID = GetWorldPos();
    if not tbMainCity[nMapID] then
        return 0;
    end
    local szOccTongName = GetCityOwner(tbMainCity[nMapID]);
    if szOccTongName == "" then
        return 0;
    end
    return TONG_Name2ID(szOccTongName), szOccTongName;
end

-- ���Ѻ����־
function pActivity:WriteTongYBLog(szLog)
    if not szLog then
        WriteYunBiaoLog("!!!!!!!!!!!!!!!Log tr�ng!!!!!!!!!!!!!!!");
        return 0;
    end
    local szWriteLog = "";
    if PlayerIndex and PlayerIndex > 0 then
        local szTongName = GetTongName();
        szWriteLog = format("[Long M�n Ti�u C�c_�p Ti�u Bang] Bang: %s, T�i kho�n: %s, T�n nh�n v�t: %s, Ch�c v�: %s %s", szTongName, GetAccount(), GetName(), GetTongFigureStr(), szLog);
    else
        szWriteLog = format("[Long M�n Ti�u C�c_�p Ti�u Bang] Bang: !!! T�i kho�n: !!! T�n nh�n v�t: !!! Ch�c v�: !!! %s", szLog);
    end
    WriteYunBiaoLog(szWriteLog);
end

-- ����ǲ���Ѻ����
function pActivity:IsTraner()
    local szTongName, nTongId = GetTongName()
    if nTongId == 0 then
        return nil;
    end
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    if nTaskFlagValue == 0 then
        return nil;
    end
    local nId = floor(nTaskFlagValue/10); -- Ѻ��·��ID
    local nLevel = self.tbBJPathLevel[nId][2];  -- Ѻ�ڵȼ�
    if nLevel < 10 then
        return nil;
    end
    return 1;
end

-- ����������
function pActivity:CheckJoinTongDays(nDay)
    local nDayTime = nDay * 24 * 60;
    local nJoinTime = GetJoinTongTime();

    if nJoinTime >= nDayTime then
        return 1
    end
    return nil;
end

-- �������ܷ���λ
function pActivity:CheckCanChangeMaster()
    local szTongName, nTongId = GetTongName();
    if nTongId == 0 then
        return 0;
    end
    if self:GetTongWeekTaskValue(nTongId, TONG_TASK_YABIAO_STATE) == 1 then
        Talk(1, "", "�� m� ho�t ��ng �p Ti�u Bang tu�n n�y, kh�ng th� ch�p h�nh bang ch� tho�i v�.");
        return 0;
    end
    return 1;
end

-- ����ܷ��߳�nTongId���szKickName
function pActivity:CheckCanKick(nTongId, szKickName)
    local nPassTime = GetCurrentTime() - TONG_GetTaskValue(nTongId, TONG_TASK_YABIAO_TIME);
    if nPassTime >= 1800 then
        return 1;
    end
    local dwKickHash = String2Id(szKickName);
    if self:GetCurExecutorHash(nTongId) == dwKickHash and nPassTime < 1800 then
        --Talk(1, "", format("<color=red>%s<color>�ѽ�ȡ�Ĺ��İ��Ѻ�����񣬲��ܶ���ִ���߳���������", szKickName));
        Talk(1, "", format("<color=red>%s<color> �� nh�n nhi�m v� �p ti�u bang h�i c�a qu� bang, kh�ng th� ph�n b�i bang h�i.", szKickName));
        return 0;
    end
    return 1;
end

-- ����ܷ��˰�
function pActivity:CheckCanLeaveTong()
    local nTaskValue = GetTask(TSK_LMBJTaskFlag);
    if nTaskValue == 0 then
        return 1;
    end
    local nID = floor(nTaskValue/10);
    local nLevel = self.tbBJPathLevel[nID][2]; -- Ѻ�ڵȼ�
    local nPassTime = GetCurrentTime() - GetTask(TSK_LMBJTaskTime);
    if nLevel >= 10 and nPassTime < 1800 then
        Talk(1, "", "�� nh�n nhi�m v� �p Ti�u Bang, kh�ng th� r�i bang.");
        return 0;
    end
    return 1;
end

-- ��ȡ����հ���������ֵ
function pActivity:GetTongWeekTaskValue(nTongId, nTaskId)
    if nTongId == 0 or nTaskId == 0 then
        return 0;
    end
    local nCurYearWeek = tonumber(GetLocalDate("%Y%W"));
    local nTaskValue = TONG_GetTaskValue(nTongId, nTaskId);
    local nMemDate = floor(nTaskValue / 100);
    local nMemValue = mod(nTaskValue, 100);
    if nMemDate ~= nCurYearWeek then
        nMemValue = 0;
        TONG_ApplySetTaskValue(nTongId, nTaskId, nCurYearWeek*100);
    end
    return nMemValue;
end

function pActivity:SetTongWeekTaskValue(nTongId, nTaskId, nValue)
    if nTongId == 0 or nTaskId == 0 then
        return nil;
    end
    local nCurYearWeek = tonumber(GetLocalDate("%Y%W"));
    local nTaskValue = nCurYearWeek*100 + mod(nValue, 100);
    TONG_ApplySetTaskValue(nTongId, nTaskId, nTaskValue);
end

function pActivity:AddTongWeekTaskValue(nTongId, nTaskId, nValue)
    if nTongId == 0 or nTaskId == 0 then
        return nil;
    end
    local nCurYearWeek = tonumber(GetLocalDate("%Y%W"));
    local nTaskValue = TONG_GetTaskValue(nTongId, nTaskId);
    local nMemDate = floor(nTaskValue / 100);
    local nMemValue = mod(nTaskValue, 100);
    if nMemDate ~= nCurYearWeek then
        nMemValue = 0;
    end
    nMemValue = nMemValue + nValue;
    if nMemValue < 0 then
        nMemValue = 0;
    end
    local nTaskValue = nCurYearWeek*100 + mod(nMemValue, 100);
    TONG_ApplySetTaskValue(nTongId, nTaskId, nTaskValue);
end

function pActivity:SetCurExecutorHash(nTongId, szExecutorName)
    local dwHashValue = String2Id(szExecutorName);
    local nHash1 = floor(dwHashValue/2);
    local nHash2 = dwHashValue - nHash1;
    TONG_ApplySetTaskValue(nTongId, TONG_TASK_MEMBER_HASH1, nHash1);
    TONG_ApplySetTaskValue(nTongId, TONG_TASK_MEMBER_HASH2, nHash2);
end

function pActivity:GetCurExecutorHash(nTongId)
    if nTongId == 0 then
        return 0;
    end
    local nHash1 = TONG_GetTaskValue(nTongId, TONG_TASK_MEMBER_HASH1);
    local nHash2 = TONG_GetTaskValue(nTongId, TONG_TASK_MEMBER_HASH2);
    return (nHash1+nHash2);
end

function pActivity:GetFollowAwardCount(nTaskIndex)
    local nTaskValue = GetTask(nTaskIndex);
    local nWeekIdx = floor(nTaskValue/1000);
    local nCount = mod(nTaskValue, 1000);
    local nCurWeekIdx = tonumber(date("%W"));
    if nWeekIdx == nCurWeekIdx then  -- �ܴ�һ����ֵ��Ч����nCount
        return nCount;
    end
    local nCurWeek = tonumber(date("%w"));
    if nCurWeek > 0 and nCurWeek < 6 then -- �ܴβ�һ����������һ ~ ������֮�� 
        if nWeekIdx + 1 == nCurWeekIdx or nCurWeekIdx < nWeekIdx then -- �ܴ����1���߿���ֵ��Ч
            return nCount;
        end
    end
    -- �������ֵ��Ч ���� 0
    return 0;
end

function pActivity:AddFollowAwardCount(nTongId)
    local nTaskIndex = TSK_WeekFollowCount + self:GetTongWeekTaskValue(nTongId, TONG_TASK_YABIAO_COUNT);
    local nTaskValue = GetTask(nTaskIndex);
    local nWeekIdx = floor(nTaskValue/1000);
    local nCount = mod(nTaskValue, 1000);
    local nCurWeekIdx = tonumber(date("%W"));
    if nWeekIdx ~= nCurWeekIdx and nCurWeekIdx ~= 0 then
        nCount = 0;
    end
    nCount = nCount + 1;
    SetTask(nTaskIndex, nCurWeekIdx*1000+mod(nCount, 1000));
end

function pActivity:ClearFollowAwardCount()
    for i = 0, 3 do
        SetTask(TSK_WeekFollowCount+i, 0);
    end
end

-- ��ȡ���Ѻ�����影��
function pActivity:GetTongAward()
    local szTongName, nTongId = GetTongName();
    if nTongId == 0 then
        return nil;
    end
    local nAwardCount = TONG_GetTaskValue(nTongId, TONG_TASK_YABIAO_AWARD);
    if nAwardCount <= 0 then
        Talk(1, "", "R��ng �p Ti�u Bang l� 0, kh�ng c� ph�n th��ng c� th� nh�n");
        return nil;
    end
    if nAwardCount > 50 then
        nAwardCount = 50;
    end
    g_AskClientNumberEx(1, nAwardCount, "S� l��ng nh�p: ", {self.GetTongAwardCallBack, {self, 1, nAwardCount, szTongName, nTongId, TONG_TASK_YABIAO_AWARD}} );
    return 1;
end
function pActivity:GetTongAwardCallBack(nMin, nMax, szTongName, nTongId, nTongTaskId, nCount)
    -- �������
    if (nCount < nMin or nCount > nMax) then
        Msg2Player("S� l��ng nh�p v� hi�u, h�y nh�p l�i!");
        return nil;
    end
    -- ���μ���ǲ��ǰ���
    if CheckIsMaster() ~= 1 then
        return nil;
    end
    -- �жϱ����ռ�
    local nMinCells = nCount * 5;
    local szErrorTips = format("T�i kh�ng �� ch�, ��m b�o c� %d � tr�ng h�y ��n.", nMinCells);
    if PlayerFunLib:CheckFreeBagCell(nMinCells, szErrorTips) ~= 1 then
        return nil;
    end
    TONG_ApplyAddTaskValue(nTongId, nTongTaskId, -nCount);
    -- ������ʽ�
    local nNum = 0;
    for i = 1, nCount do
        --AddTongMoney(szTongName, 60000000);
        if random(1,100) > 50 then
            nNum = nNum + 1;
        end
    end
    --local szTongMsg = format("��ϲ�����:%d����͢����, %d���ֵ�����, %sW����ʽ�", nCount, nCount*5, nCount*6000);
    local tbAwardList = self.tbAward["tongaward"][2];
    --if nNum > 0 then
        --local tbItem = self.tbAward["tongaward"][1];
        --local nNumber = 65535;
        --local nTongHash1 = mod(nTongId, nNumber);
        --local nTongHash2 = floor(nTongId/nNumber);
        --tbItem[1].tbParam = {nTongHash1, nTongHash2, nNumber};
        --tbItem[1].nCount = nNum;
        --tbAwardTemplet:GiveAwardByList(tbItem, "[�����ھ�_���Ѻ��] ������ȡѺ�ڽ���_��Ӫ����������");
        --szTongMsg = format("��ϲ�����:%d����͢����, %d����Ӫ����������, %d���ֵ�����, %sW����ʽ�", nCount, nNum, nCount*5, nCount*6000);
    --end
    tbAwardTemplet:GiveAwardByList(tbAwardList, "[Long M�n Ti�u C�c_�p Ti�u Bang] Bang ch� nh�n ph�n th��ng �p Ti�u", nCount);
    --Msg2Tong(nTongId, szTongMsg);
    --Msg2Tong(nTongId, "��������ʽ���������;��,������10���������ӵ������Ŀ,���Եȡ�");
    -- ��־
    local szLogs = format("Nh�n %d ph�n th��ng nh�m �p Ti�u Bang", nCount);
    self:WriteTongYBLog(szLogs);
end

-- �������ڳ�����
function pActivity:AddFollowExp(nTongId)
    local szTongName, nMyTongId = GetTongName();
    -- û�����Ĳ���
    if nMyTongId == 0 then
        return nil;
    end
    -- �������ڳ����ڰ��Ĳ���
    if nMyTongId ~= nTongId then
        return nil;
    end
    -- ������ʱ��
    if self:CheckJoinTongDays(7) ~= 1 then
        return nil;
    end
    
    --��ս��״̬����
    if GetFightState() == 0 then
    	return
    end
    -- ������
    PlayerFunLib:AddExp(4000000, 1, "[Long M�n Ti�u C�c_�p Ti�u Bang] H� t�ng Ti�u Xa nh�n kinh nghi�m.");
    self:AddFollowAwardCount(nTongId);
end

function pActivity:HandInBiaoCheBox()
    -- ����Ƿ����
    local szTongName, nTongId = GetTongName();
    if nTongId == 0 then
        Talk(1, "", "Ch�a v�o bang, kh�ng th� n�p R��ng Ti�u Xa Bang.");
        return nil;
    end
    -- ������ʱ��
    if self:CheckJoinTongDays(7) ~= 1 then
        Talk(1, "", "��i hi�p v�o bang ch�a �� 7 ng�y, kh�ng th� n�p R��ng Ti�u Xa Bang.");
        return nil;
    end

    g_GiveItemUI("N�p R��ng Ti�u Xa Bang", "��t v�o R��ng Ti�u Xa Bang", {self.PutBiaoCheBox, {self, TONG_TASK_YABIAO_AWARD}}, {}, 1);
end

function pActivity:PutBiaoCheBox(nTongTaskId, nCount)
    if nCount < 1 then
        Msg2Player("H�y ��t v�o R��ng Ti�u Xa Bang mu�n n�p.");
        return nil;
    end
    -- ������ʱ��
    if self:CheckJoinTongDays(7) ~= 1 then
        Msg2Player("N�p R��ng Bang th�t b�i, h�y th� l�i.");
        return nil;
    end
    local bCheckResult = 1;
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i);
        local  nG, nD, nP = GetItemProp(nItemIndex);
        if nP ~= 4475 then
            bCheckResult = 0;
            break;
        end
    end
    if bCheckResult == 0 then
        Talk(1, "", "Ch� c� th� n�p R��ng Ti�u Xa Bang, kh�ng ��t v�t ph�m kh�c.");
        return nil;
    end
    -- �����ߺϷ���
    local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
    local nExpired = 0;
    local nSuccess = 0;
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i);
        local nG, nD, nP = GetItemProp(nItemIndex);
        if nP == 4475 then
            local nStackCount = GetItemStackCount(nItemIndex);
            local nMemDate = self:GetItemExpiredTime(nItemIndex);
            if nCurDate >= nMemDate then
                nExpired = nExpired + nStackCount;
            else
                nSuccess = nSuccess + nStackCount;
            end
            RemoveItemByIndex(nItemIndex);
        end
    end

    if nSuccess == 0 and nExpired == 0 then
        return nil;
    end
    -- �ǰ���������
    local szTongName, nTongId = GetTongName();
    TONG_ApplyAddTaskValue(nTongId, nTongTaskId, nSuccess);
    local szTips = format("Th�nh c�ng n�p R��ng �p Ti�u Bang �%s� %d c�i, qu� h�n x�a %d c�i.", szTongName, nSuccess, nExpired);
    Talk(1, "", szTips);
    -- ��־���
    AddStatData("bhyb_upload_count", nSuccess);
    local szLogs = format("N�p R��ng �p Ti�u: %d c�i, qu� h�n x�a %d c�i", nSuccess, nExpired);
    self:WriteTongYBLog(szLogs);
end

