-- �󶨽ű�
IncludeLib("LEAGUE")
Include("\\script\\activitysys\\config\\129\\head.lua")
Include("\\script\\activitysys\\config\\129\\extend.lua")
Include("\\script\\activitysys\\config\\129\\variables.lua")

Include("\\script\\global\\maplist.lua")
Include("\\script\\event\\longmenbiaoju\\head.lua")

pActivity.tbTongTask = {
    [80]    = {27, 28, 29, 27,},    -- ����
    [176]   = {30, 31, 32, 30,},    -- �ٰ�
    [37]    = {33, 34, 35, 36,},    -- �꾩
    [11]    = {37, 38, 39, 40,},    -- �ɶ�
    [78]    = {41, 42, 41, 42,},    -- ����
    [1]     = {44, 45, 46, 44,},    -- ����
    [162]   = {47, 48, 49, 47,},    -- ����
}

function main()
    local szTongName, nTongId = GetTongName();
    if nTongId == 0 then
        Talk(1, "", "Tr�ng s� ch�a gia nh�p bang h�i, kh�ng  th� tham gia �p ti�u");
        return nil;
    end
    pActivity:LogCurMapID();
    local nOccTongId = pActivity:GetOccupyTongId()
    if nTongId ~= nOccTongId then
        Talk(1, "", "Ti�u c�c c� v�t ph�m quan tr�ng c�n r�t nhi�u ng��i h� t�ng, ch�ng t�i ch� tin v�o th�c l�c bang chi�m l�nh th�nh, kh�ng h�p t�c v�i ng��i kh�c, xin h�y v� cho.");
        return nil;
    end
    pActivity:ClickStartGuideMan();
end

-- ������Ѻ�ڽ�����
function pActivity:ClickStartGuideMan()
    local szTitleMsg = "<npc>Ti�u c�c c� v�t ph�m quan tr�ng c�n r�t nhi�u ng��i h� t�ng, ch�ng t�i ch� tin v�o th�c l�c c�a qu� bang, n�u h� ti�u th�nh c�ng s� ���c h�u t�! Ngo�i ra, ng��i v�n ti�u c� th� d�ng ��o c� �p ti�u c� nh�n.";
    local tbOpt = {};
    -- ֻ�а����ɼ�
    if CheckIsMaster() == 1 then
        tinsert(tbOpt, {"M� �p Ti�u Bang", self.OpenTongState, {self}});
    end
    -- �����ͳ��Ͽɼ�
    if CheckIsElder() == 1 or CheckIsMaster() == 1 then
        tinsert(tbOpt, {"Nh�n �p Ti�u Bang", self.RecvTongBiaoChe, {self}});
    end
    -- �����˿ɼ�
    if self:IsTraner() == 1 then
        tinsert(tbOpt, {"Xem th�ng tin Ti�u Xa", self.ShowTongBiaoChe, {self}});
        tinsert(tbOpt, {"Truy�n t�ng ��n Ti�u Xa", self.GoToTongBiaoChe, {self}});
        tinsert(tbOpt, {"T� b� nhi�m v� �p Ti�u Bang hi�n t�i", self.CancelTongTask, {self}});
    end
    tinsert(tbOpt, {"R�i kh�i", });
    CreateNewSayEx(szTitleMsg, tbOpt);
end

function pActivity:OpenTongState()
    local szTongName, nTongId = GetTongName();
    if nTongId == 0 then
        return nil;
    end
    -- ����Ƿ��Ѿ�����
    local nYaBiaoState = self:GetTongWeekTaskValue(nTongId, TONG_TASK_YABIAO_STATE);
    if nYaBiaoState > 0 then
        Talk(1, "", "Ho�t ��ng �p Ti�u c�a bang trong tu�n n�y �� m�.");
        return nil;
    end
    -- ����ǲ�����ĩ
    local nWeekIdx = tonumber(GetLocalDate("%w"));
    if nWeekIdx ~= 0 and nWeekIdx ~= 6 then
        Talk(1, "", "Kh�ng trong th�i gian m� �p Ti�u Bang (12:00-23:00 Th� b�y, Ch� nh�t).");
        return nil;
    end
    -- ���Ѻ��ʱ��
    local nCurTime = tonumber(GetLocalDate("%H%M"));
    if nCurTime < 1200 or nCurTime > 2300 then
        Talk(1, "", "Kh�ng trong th�i gian m� �p Ti�u Bang (12:00-23:00 Th� b�y, Ch� nh�t).");
        return nil;
    end
    -- ���ռ������
    local nOccCitys = self:GetTongWeekTaskValue(nTongId, TONG_TASK_OCCUPY_CITYS);
    local nCount = floor((nOccCitys+1)/2);
    if nCount <= 0 then
        Talk(1, "", "S� th�nh chi�m c�a bang trong tu�n kh�ng �� �� m� ho�t ��ng �p Ti�u.");
        return nil;
    end
    
    local szTitleMsg = "<npc>Sau khi m� �p Ti�u Bang, ng��i ch�i trong bang t� c�p tr��ng l�o tr� l�n (g�m bang ch�) c� th� nh�n nhi�m v� �p Ti�u Bang, m�t khi nh�n nhi�m v� s� l�p t�c m� ��m ng��c 30 ph�t.";
    local tbOpt = {};
    tinsert(tbOpt, {"��ng � m�", self.ConfirmOpenTongState, {self, nTongId, szTongName, nCount}});
    tinsert(tbOpt, {"�� ta suy ngh� l�i!",});
    CreateNewSayEx(szTitleMsg, tbOpt);
end

function pActivity:ConfirmOpenTongState(nTongId, szTongName, nCount)
    -- ���μ���ǲ�����ĩ
    local nWeekIdx = tonumber(GetLocalDate("%w"));
    if nWeekIdx ~= 0 and nWeekIdx ~= 6 then
        Talk(1, "", "Kh�ng trong th�i gian m� �p Ti�u Bang (12:00-23:00 Th� b�y, Ch� nh�t).");
        return nil;
    end
    -- ���μ��Ѻ��ʱ��
    local nCurTime = tonumber(GetLocalDate("%H%M"));
    if nCurTime < 1200 or nCurTime > 2300 then
        Talk(1, "", "Kh�ng trong th�i gian m� �p Ti�u Bang (12:00-23:00 Th� b�y, Ch� nh�t).");
        return nil;
    end
    -- ����ȷ�����
    if CheckIsMaster() ~= 1 then
        Talk(1, "", "Ch� bang ch� m�i ���c m� �p Ti�u Bang.");
        return nil;
    end
    -- �޸İ���������
    self:SetTongWeekTaskValue(nTongId, TONG_TASK_YABIAO_STATE, 1);
    self:SetTongWeekTaskValue(nTongId, TONG_TASK_YABIAO_COUNT, nCount);
    TONG_ApplySetTaskValue(nTongId, TONG_TASK_YABIAO_RAND, random(1, 4));
    local szName = GetName()
    Msg2Tong(nTongId, format("Bang ch� %s �� m� �p Ti�u Bang.", szName));

    -- ��־
    self:WriteTongYBLog("�� m� �p Ti�u Bang");
end

function pActivity:RecvTongBiaoChe()
    --�ȼ��ж�
    if PlayerFunLib:CheckTotalLevel(150, "Ch�a ��t c�p 150 v� ch�a chuy�n sinh, kh�ng th� nh�n �p Ti�u Bang.", ">=") ~= 1 then
	    return nil;
    end
    -- ��û�п������Ѻ��
    local szTongName, nTongId = GetTongName();
    local nYaBiaoState = self:GetTongWeekTaskValue(nTongId, TONG_TASK_YABIAO_STATE);
    if nYaBiaoState == 0 then
        Talk(1, "", "Bang kh�ng c� ho�c ch�a m� nhi�m v� �p Ti�u c�a tu�n n�y, h�y mau li�n h� bang ch� �� m�.");
        return nil;
    end
    -- ������ʱ��
    if self:CheckJoinTongDays(7) ~= 1 then
        Talk(1, "", "V�o bang ch�a �� 7 ng�y, kh�ng th� nh�n �p Ti�u Bang.");
        return nil;
    end
    -- ����ǲ�����ĩ
    local nWeekIdx = tonumber(GetLocalDate("%w"));
    if nWeekIdx ~= 0 and nWeekIdx ~= 6 then
        Talk(1, "", "Ch� th� b�y ho�c ch� nh�t trong tu�n m�i ���c nh�n �p Ti�u Bang.");
        return nil;
    end
    -- ���Ѻ��ʱ��
    local nCurTime = tonumber(GetLocalDate("%H%M"));
    if nCurTime < 1200 or nCurTime > 2300 then
        Talk(1, "", "Th�i gian nh�n �p Ti�u Bang l� m�i cu�i tu�n 12:00~23:00.");
        return nil;
    end
    
    -- �������Ƿ�����Ѻ������
    local data = LongMenBiaoJu:GetDataClass()
    if (GetTask(TSK_LMBJTaskFlag) ~= 0) or (data:GetType() ~= 0) then
        Talk(1, "", "C� nhi�m v� �p Ti�u ch�a ho�n th�nh, kh�ng th� nh�n �p Ti�u Bang.");
        return nil;
    end
    -- ����Ƿ��Ѿ����˿�ʼѺ����
    local nLastTime = TONG_GetTaskValue(nTongId, TONG_TASK_YABIAO_TIME);
    local nNowTimes = GetCurrentTime();
    if nNowTimes - nLastTime < 1800 then
        Talk(1, "", "Bang �� c� ng��i nh�n nhi�m v� �p Ti�u, h�y mau h� tr� h� t�ng Ti�u Xa.");
        return nil;
    end
    local nOccCitys = self:GetTongWeekTaskValue(nTongId, TONG_TASK_OCCUPY_CITYS);
    local nSumCount = floor((nOccCitys+1)/2);
    -- ��鵱ǰ���ﻹ��û��Ѻ������
    local nCount = self:GetTongWeekTaskValue(nTongId, TONG_TASK_YABIAO_COUNT);
    if nCount <= 0 then
        Talk(1, "", format("Tu�n n�y qu� bang �� nh�n <color=yellow>%d<color> l�n �p Ti�u Bang, ch�ng t�i �� h�t v�t ph�m c�n v�n chuy�n.", nSumCount));
        return nil;
    end
    -- �ж�����Ƿ��������NPC�Ի�
    local nMapID, nX, nY = GetWorldPos();
    if (GetTask(TSK_MapIDFlag) ~= nMapID) then
        return nil;
    end
    -- Ѻ������
    local tbTask = self.tbTongTask[nMapID];
    if not tbTask then
        return nil;
    end
    local nRand = TONG_GetTaskValue(nTongId, TONG_TASK_YABIAO_RAND);
    if nRand == 0 then
        nRand = random(1, 4);
        TONG_ApplySetTaskValue(nTongId, TONG_TASK_YABIAO_RAND, nRand);
    end
    local nId = tbTask[nRand];
    local tbPath = self.tbBJPathLevel[nId][1]; -- Ѻ��·��
    local nEid = tbPath[2];
    local szTitleMsg = format("<npc>Tu�n n�y qu� bang �� nh�n <color=yellow>%d/%d<color> l�n �p Ti�u Bang, nhi�m v� l�n n�y ��m ng��c 30 ph�t, di�m cu�i l� %s", nSumCount-nCount, nSumCount, self.tbBJPoints[nEid][1]);
    local tbOpt = {};
    tinsert(tbOpt, {"��ng � nh�n", self.ConfirmRecvTongTask, {self, nTongId, nId}});
    tinsert(tbOpt, {"�� ta suy ngh� l�i!",});
    CreateNewSayEx(szTitleMsg, tbOpt);
    return 1;
end

function pActivity:ConfirmRecvTongTask(nTongId, nID)
    -- ���μ���ǲ�����ĩ
    local nWeekIdx = tonumber(GetLocalDate("%w"));
    if nWeekIdx ~= 0 and nWeekIdx ~= 6 then
        Talk(1, "", "Ch� th� b�y ho�c ch� nh�t trong tu�n m�i ���c nh�n �p Ti�u Bang.");
        return nil;
    end
    -- ���μ�����ʱ��
    if self:CheckJoinTongDays(7) ~= 1 then
        Talk(1, "", "V�o bang ch�a �� 7 ng�y, kh�ng th� nh�n �p Ti�u Bang.");
        return nil;
    end
    -- ����ȷ�ϼ��Ѻ��ʱ��
    local nCurTime = tonumber(GetLocalDate("%H%M"));
    if nCurTime < 1200 or nCurTime > 2300 then
        Talk(1, "", "Th�i gian nh�n �p Ti�u Bang l� m�i cu�i tu�n 12:00~23:00.");
        return nil;
    end
    -- ����ȷ�����
    if CheckIsElder() ~= 1 and CheckIsMaster() ~= 1 then
        Talk(1, "", "�p Ti�u Bang ph�i l� tr��ng l�o ho�c bang ch� m�i ���c nh�n, c�p ch�c v� c�a b�n ch�a ��.");
        return nil;
    end
    -- ���μ���ڴ�ȷ�Ͽ��ڼ��Ƿ��Ѿ����˿�ʼѺ����
    local nLastTime = TONG_GetTaskValue(nTongId, TONG_TASK_YABIAO_TIME);
    local nNowTimes = GetCurrentTime();
    if nNowTimes - nLastTime < 1800 then
        Talk(1, "", "Bang �� c� ng��i nh�n nhi�m v� �p Ti�u, h�y mau h� tr� h� t�ng Ti�u Xa.");
        return nil;
    end
    local nOccCitys = self:GetTongWeekTaskValue(nTongId, TONG_TASK_OCCUPY_CITYS);
    local nSumCount = floor((nOccCitys+1)/2);
    -- ���μ�鵱ǰ���ﻹ��û��Ѻ������
    local nCount = self:GetTongWeekTaskValue(nTongId, TONG_TASK_YABIAO_COUNT);
    if nCount <= 0 then
        Talk(1, "", format("Tu�n n�y qu� bang �� nh�n <color=yellow>%d<color> l�n �p Ti�u Bang, ch�ng t�i �� h�t v�t ph�m c�n v�n chuy�n.", nSumCount));
        return nil;
    end
    -- �ж�����Ƿ��������NPC�Ի�
    local nMapID, nX, nY = GetWorldPos();
    if (GetTask(TSK_MapIDFlag) ~= nMapID) then
        return nil;
    end
    -- �����жϣ��Ƿ�Զ����Ѻ�ڽ�����
    local nNpcIndex = GetLastDiagNpc();
    local nX32, nY32 = GetNpcPos(nNpcIndex);
    if(abs(nX32-nX*32) > 600 or abs(nY32-nY*32) > 600) then
        Talk(1, "", "B�n c�ch xa Ti�p D�n �p Ti�u Bang, kh�ng th� t�o ra Ti�u Xa.");
        return nil;
    end
    -- ��������ʼʱ�䵽����������
    TONG_ApplySetTaskValue(nTongId, TONG_TASK_YABIAO_TIME, nNowTimes);
    -- ���°�᱾��Ѻ�ڴ���
    self:AddTongWeekTaskValue(nTongId, TONG_TASK_YABIAO_COUNT, -1);
    -- ������һ�ν���·�������
    TONG_ApplySetTaskValue(nTongId, TONG_TASK_YABIAO_RAND, random(1, 4));
    -- ���µ�ǰ���Ѻ���˽�ɫ��Hash�浵
    self:SetCurExecutorHash(nTongId, GetName());
    -- ���������������
    SetTask(TSK_LMBJTaskTime, nNowTimes);           -- �����ȡʱ��
    SetTask(TSK_TransTongCarTime, nNowTimes);   -- �ڳ�����ʱ��
    SetTask(TSK_TransTongCarCD, 0);
    SetTask(TSK_ItemKMJBTime, 0);                   -- ���ʹ�ÿ���ӱ�ʱ��
    SetTask(TSK_ItemJBKCTime, 0);                   -- ���ʹ�ü᲻�ɴ�ʱ��
    SetTask(TSK_ItemBCYWTime, 0);                   -- ���ʹ���ڳ���λʱ��
    SetTask(TSK_LMBJTaskFlag, nID*10);              -- �����ȡ��Ѻ������
    self:refreshBiaoChe(30*60);                     -- ˢ���ڳ�
    SetNpcParam(GetTask(TSK_LMBJCarIndex), 4, nNowTimes); -- �����ڳ���NPC����
    -- һЩ��ʾ
    local tbPath = self.tbBJPathLevel[nID][1]; -- Ѻ��·��
    local nSid, nEid = unpack(tbPath);
    local szSName = self.tbBJPoints[nSid][1];
    local szEName = self.tbBJPoints[nEid][1];
    Talk(1, "", format("Th�nh c�ng nh�n �p Ti�u Bang 10 Sao, �i�m ��u: %s-�i�m cu�i %s, trong 30 ph�t ��n n�i.", szSName, szEName));
    local szTongName = GetTongName();
    local szGlbNews = format("Bang <color=red>%s<color>-<color=green>%s<color> t�i <color=red>%s<color> th�nh c�ng nh�n �p Ti�u Bang 10 Sao.", szTongName, GetName(), szSName);
    AddGlobalNews(szGlbNews);
    -- ��ȫ��ȫ�����½ǹ���
    LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szGlbNews , "", "");
    --����Ծ��ϵͳ����������ȡ���Ѻ�������û�Ծ��
    --if nTongId > 0 then
    	--DynamicExecute("\\script\\tong\\tong_huoyuedu.lua", "tbTongHuoYueDu:BangHuiYaBiao", nTongId);
    --end
    -- ��־���
    AddStatData("bhyb_accept_count");
    local szLogs = format("�� nh�n �p Ti�u Bang (%s#%s)", szSName, szEName);
    self:WriteTongYBLog(szLogs);
    return 1;
end

function pActivity:ShowTongBiaoChe()
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    -- �жϵ�ǰ�ڳ��ȼ�
    if nTaskFlagValue ~= 0 then
        local nId = floor(nTaskFlagValue/10);
        if self.tbBJPathLevel[nId][2] < 10 then
            Talk(1, "", "Ch�a nh�n �p Ti�u Bang.");
            return nil;
        end
    else
        Talk(1, "", "Ch�a nh�n �p Ti�u Bang.");
        return nil;
    end
    local nCurrentTime = GetCurrentTime();
    local nTaskTimeValue = GetTask(TSK_LMBJTaskTime);
    if nCurrentTime - nTaskTimeValue > 1800 then
        Talk(1, "", "Nhi�m v� �� k�t th�c, Ti�u Xa �� bi�n m�t.");
        return nil;
    end

    local handle = OB_Create();
    ObjBuffer:PushObject(handle, GetName());
    local szLocalPath = "\\script\\activitysys\\config\\129\\extend.lua";
    local szRemotePath = "\\script\\event\\longmenbiaoju\\event.lua";
    DynamicExecute(szLocalPath,
        "RemoteExecute", szRemotePath, "tbLMBJActivityData:g2s_GetBiaoChePos", handle, 
        "pActivity:showTongBiaoCheCallBack", PlayerIndex);
    OB_Release(handle);
    return 1;
end

function pActivity:showTongBiaoCheCallBack(nParam, ResultHandle)
    local tbCurCarPos = {-1, 0, 0, 0};
    if (OB_IsEmpty(ResultHandle) ~= 1) then
        tbCurCarPos = ObjBuffer:PopObject(ResultHandle);
    end
    local nOldPlayerIndex = PlayerIndex;
    PlayerIndex = nParam;
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    local nId = floor(nTaskFlagValue/10);
    local tbPath = self.tbBJPathLevel[nId][1]; -- Ѻ��·��
    local nSid, nEid = unpack(tbPath);
    local szTitleMsg = format("<npc>�� nh�n �p Ti�u Bang 10 Sao, %s-%s", self.tbBJPoints[nSid][1], self.tbBJPoints[nEid][1]);
    local szTempLine = "";
    -- ����״̬
    if (tbCurCarPos==nil or tbCurCarPos[1]==-1) then -- �ڳ���ʧ
        szTempLine = "<enter>Ti�u Xa �� bi�n m�t, nhi�m v� k�t th�c.";
    else
        local nCurrentTime = GetCurrentTime();
        local nPassTime = nCurrentTime - GetTask(TSK_LMBJTaskTime);
        local nMapId, nX, nY = unpack(tbCurCarPos);
        local nMinTime = GetTask(TSK_TransTongCarTime) + GetTask(TSK_TransTongCarCD);
        local nTime = nMinTime - nCurrentTime;
        if nTime < 0 then
            nTime = 0;
        end
        szTempLine = format("<enter>��m ng��c kho�ng %d ph�t, Ti�u Xa Bang �ang d�ng t�i %s(%d,%d)<enter>Th�i gian ch� truy�n t�ng ��n Ti�u Xa Bang %d gi�y", 
            30-floor(nPassTime/60), tbGlobalMapId2Name[nMapId], floor(nX/8), floor(nY/16), nTime);
    end
    szTitleMsg = szTitleMsg..szTempLine;
    local tbOpt = {};
    tinsert(tbOpt, {" K�t th�c ��i tho�i!", });
    CreateNewSayEx(szTitleMsg, tbOpt);
    PlayerIndex = nOldPlayerIndex;
end

function pActivity:GoToTongBiaoChe()
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    -- �жϵ�ǰ�ڳ��ȼ�
    if nTaskFlagValue ~= 0 then
        local nId = floor(nTaskFlagValue/10);
        if self.tbBJPathLevel[nId][2] < 10 then
            Talk(1, "", "Ch�a nh�n �p Ti�u Bang.");
            return nil;
        end
    else
        Talk(1, "", "Ch�a nh�n �p Ti�u Bang.");
        return nil;
    end
    local nCurrentTime = GetCurrentTime();
    local nTaskTimeValue = GetTask(TSK_LMBJTaskTime);
    if nCurrentTime - nTaskTimeValue > 1800 then
        Talk(1, "", "Nhi�m v� �� k�t th�c, Ti�u Xa �� bi�n m�t.");
        return nil;
    end
    -- ��鴫����CDʱ��
    local nCDTime = GetTask(TSK_TransTongCarCD);
    local nMinTimes = GetTask(TSK_TransTongCarTime) + nCDTime;
    if nCurrentTime < nMinTimes then
        Talk(1, "", format("V�n ch�a v��t qu� %d gi�y so v�i l�n truy�n t�ng tr��c, ��i m�t ch�t.", nCDTime));
        return nil;
    end
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, GetName());
    local szLocalPath = "\\script\\activitysys\\config\\129\\extend.lua";
    local szRemotePath = "\\script\\event\\longmenbiaoju\\event.lua";
    DynamicExecute(szLocalPath, 
        "RemoteExecute", szRemotePath, "tbLMBJActivityData:g2s_GetBiaoChePos", handle, 
        "pActivity:gotoTongBiaoCheCallBack", PlayerIndex);
    OB_Release(handle);
end

function pActivity:gotoTongBiaoCheCallBack(nParam, ResultHandle)
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
    -- ���ô���ʱ��
    local nCurTime = GetCurrentTime();
    local nTaskValue = GetTask(TSK_TransTongCarTime);
    local nCDTime = GetTask(TSK_TransTongCarCD);
    if nCDTime < 60 then
        SetTask(TSK_TransTongCarCD, nCDTime+20);
    end
    SetTask(TSK_TransTongCarTime, nCurTime);
    -- ����ս��״̬
    SetFightState(tbCurCarPos[4]);
    NewWorld(tbCurCarPos[1], tbCurCarPos[2], tbCurCarPos[3]);
    PlayerIndex = nOldPlayerIndex;
end

-- ����Ѻ������
function pActivity:CancelTongTask()
    local szTongName, nTongId = GetTongName();
    if nTongId == 0 then
        return nil;
    end
    -- ����Ƿ��Ѿ�����
    local nYaBiaoState = self:GetTongWeekTaskValue(nTongId, TONG_TASK_YABIAO_STATE);
    if nYaBiaoState == 0 then
        Talk(1, "", "Ho�t ��ng �p Ti�u c�a bang trong tu�n n�y ch�a m�.");
        return nil;
    end
    -- ���Ѻ��ʱ��
    local nCurTime = tonumber(GetLocalDate("%H%M"));
    if nCurTime < 1200 or nCurTime > 2300 then
        Talk(1, "", "Kh�ng trong th�i gian m� �p Ti�u Bang (12:00-23:00 Th� b�y, Ch� nh�t).");
        return nil;
    end
    -- �����û�����ڽ��е�Ѻ������
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    -- �жϵ�ǰ�ڳ��ȼ�
    if nTaskFlagValue ~= 0 then
        local nId = floor(nTaskFlagValue/10);
        if self.tbBJPathLevel[nId][2] < 10 then
            Talk(1, "", "Ch�a nh�n �p Ti�u Bang.");
            return nil;
        end
    else
        Talk(1, "", "Ch�a nh�n �p Ti�u Bang.");
        return nil;
    end
    -- ��ѯ�ڳ�λ�ã����ڳ����ܷ�������
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, GetName());
    local szLocalPath = "\\script\\activitysys\\config\\129\\extend.lua";
    local szRemotePath = "\\script\\event\\longmenbiaoju\\event.lua";
    DynamicExecute(szLocalPath, 
        "RemoteExecute", szRemotePath, "tbLMBJActivityData:g2s_GetBiaoChePos", handle, 
        "pActivity:CancelTongTaskCallBack", PlayerIndex);
    OB_Release(handle);
end

function pActivity:CancelTongTaskCallBack(nParam, ResultHandle)
    local tbCurCarPos = {-1, 0, 0, 0};
    if (OB_IsEmpty(ResultHandle) ~= 1) then
        tbCurCarPos = ObjBuffer:PopObject(ResultHandle);
    end
    local nOldPlayerIndex = PlayerIndex;
    PlayerIndex = nParam;
    if (tbCurCarPos==nil or tbCurCarPos[1]==-1) then
        local szTitleMsg = "Ti�u Xa Bang �� b� h�y ho�c bi�n m�t, ��ng � k�t th�c nhi�m v� �p Ti�u l�n n�y?";
        local tbOpt = {};
        tinsert(tbOpt, {"��ng � k�t th�c nhi�m v�", self.ConfirmCancelTongTask, {self}});
        tinsert(tbOpt, {"�� ta suy ngh� l�i!",});
        CreateNewSayEx(szTitleMsg, tbOpt);
        PlayerIndex = nOldPlayerIndex;
        return nil;
    end

    local nMapId, nX, nY = unpack(tbCurCarPos);
    szTempLine = format("Ti�u Xa Bang �ang d�ng � %s(%d,%d), kh�ng th� b� nhi�m v� �p Ti�u.", 
                        tbGlobalMapId2Name[nMapId], floor(nX/8), floor(nY/16));
    Talk(1, "", szTempLine);
    PlayerIndex = nOldPlayerIndex;
    return 1;
end

function pActivity:ConfirmCancelTongTask()
    local szTongName, nTongId = GetTongName();
    SetTask(TSK_LMBJTaskFlag, 0);
    if nTongId == 0 then
        return nil;
    end
    local nPassTime = GetCurrentTime() - GetTask(TSK_LMBJTaskTime);
    -- ����û�г���30���ӣ�ֱ��ɾ����Ӧ�������
    if nPassTime < 1800 then
        TONG_ApplySetTaskValue(nTongId, TONG_TASK_YABIAO_TIME, 0);
    else
        local dwNameHash = String2Id(GetName());
        if self:GetCurExecutorHash(nTongId) == dwNameHash then
            TONG_ApplySetTaskValue(nTongId, TONG_TASK_YABIAO_TIME, 0);
        end
    end
    Talk(1, "", "�p Ti�u Bang l�n n�y �� h�y.");
    -- ��־
    self:WriteTongYBLog("�p Ti�u Bang �� k�t th�c");
end
