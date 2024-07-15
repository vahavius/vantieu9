-- �����ھ��ڳ��󶨽ű�

Include("\\script\\global\\maplist.lua")
Include("\\script\\activitysys\\config\\129\\head.lua")
Include("\\script\\activitysys\\config\\129\\config.lua")
Include("\\script\\activitysys\\config\\129\\extend.lua")
Include("\\script\\activitysys\\config\\129\\variables.lua")

tbDialogNpcList = {
    ["L� Quan"]         = 1,
    ["B� Long"]         = 1,
    ["��i s� ho�t ��ng"]     = 1,
    ["M�c Th�ch L�o Nh�n"]     = 1,
    ["R��ng ch�a ��"]       = 1,
    ["Nhi�p Th� Tr�n"]       = 1,
    ["B�nh B�nh c� n��ng"]     = 1,
    ["Xa phu"]         = 1,
    [" V� binh Th�nh m�n"]     = 1,
    ["Quan nh�c nh� Ho�ng Th�nh T�"] = 1,
    ["V� l�m truy�n nh�n"]   = 1,
    ["Tri�u ��nh Chi�u M� S�"]   = 1,
    ["D� T�u"]         = 1,
    ["Long M�n Ti�u S�"]     = 1,
}


function OnTimer(nNpcIndex, nTimeOut)
    local nTongId = GetNpcParam(nNpcIndex, 5) + GetNpcParam(nNpcIndex, 6);
    local tbPlayerList, nCount = GetNpcAroundPlayerList(nNpcIndex, 25);
    local nOldPlayerIndex = PlayerIndex;
    for i = 1, nCount do
        PlayerIndex = tbPlayerList[i];
        local szScripPath = "\\script\\activitysys\\config\\129\\extend.lua";
        local szFunName = "pActivity:AddFollowExp"
        DynamicExecuteByPlayer(tbPlayerList[i], szScripPath, szFunName, nTongId);
    end
    PlayerIndex = nOldPlayerIndex;
    SetNpcTimer(nNpcIndex, 18*60);
end

-- npc death
function OnDeath(nNpcIndex)
    local nX32, nY32, nMapIdx = GetNpcPos(nNpcIndex);
    local nMapID = SubWorldIdx2ID(nMapIdx);
    -- ��ȡ�ڳ���Ϣ
    local nLevel = GetNpcParam(nNpcIndex, 1);
    local nHash1 = GetNpcParam(nNpcIndex, 2); -- �����������Hashֵ1
    local nHash2 = GetNpcParam(nNpcIndex, 3); -- �����������Hashֵ2
    local nTaskTime = GetNpcParam(nNpcIndex, 4); -- ��ȡ��ν���ʱ��
    SyncBiaoCheDeathInfoToRelay(nNpcIndex);

    -- �ж��Ƿ�������NPC����
    local tbNpcIdxList, nCount = GetNpcAroundNpcList(nNpcIndex, 5);
    for i = 1, nCount do
        local nNpcIdx = tbNpcIdxList[i];
        local szNpcName = GetNpcName(nNpcIdx);
        if tbDialogNpcList[szNpcName] == 1 then
            WriteYunBiaoLog(format("<%s> t�i <%s> �� h�y <%s>, �ang trong thao t�c tr�ng th�i chi�n ��u.", GetName(), tbGlobalMapId2Name[nMapID], szBiaoCheName));
            return nil;
        end
    end

    local szBiaoCheName = GetNpcName(nNpcIndex);

    if nLevel < 10 then
        -- �Ҳ����������
        if not PlayerIndex or PlayerIndex <= 0 then
            return nil;
        end
        -- ��ȡ���һ���Ľ�����ҵ�λ��_ˢ����
        local _, nPX, nPY = GetWorldPos();
        -- ��ȡ�ڳ�λ��_ˢ�����ڳ�
        local nNpcBQIdx = AddNpcEx(2158, 1, 1, nMapIdx, nX32, nY32, 1, "Ti�u Xa b� ph� ho�i", 0);
        SetNpcScript(nNpcBQIdx, "\\script\\activitysys\\config\\129\\npc_lmbiaoqi.lua");
        SetNpcTimer(nNpcBQIdx, 600*18);
        SetNpcParam(nNpcBQIdx, 1, nLevel); -- ��������ĵȼ�
        SetNpcParam(nNpcBQIdx, 2, nHash1); -- �����������Hashֵ1
        SetNpcParam(nNpcBQIdx, 3, nHash2); -- �����������Hashֵ2
        SetNpcParam(nNpcBQIdx, 4, nTaskTime); -- �������ʱ�䣬��ֹ��ҽ��������������
        -- ˢ����
        local nBXNpcIdx = AddNpcEx(2156, 1, 1, nMapIdx, nPX*32, nPY*32, 1, "T�n L�c Ti�u V�t", 0);
        SetNpcScript(nBXNpcIdx, "\\script\\activitysys\\config\\129\\npc_lmbiaowu.lua");
        SetNpcTimer(nBXNpcIdx, 600*18);
        SetNpcParam(nBXNpcIdx, 1, nLevel);  -- ��������ĵȼ�
        SetNpcParam(nBXNpcIdx, 2, 0);       -- �ѱ��������
        SetNpcParam(nBXNpcIdx, 3, GetCurrentTime()); -- ��������ʱ��_���ڱ���ʱ��
        local dwHashValue = String2Id( GetName() );
        nHash1 = floor(dwHashValue/2);
        nHash2 = dwHashValue - nHash1;
        SetNpcParam(nBXNpcIdx, 4, nHash1);
        SetNpcParam(nBXNpcIdx, 5, nHash2);
        local szDataStr = "lmbj_car_kill_high";
        if (nLevel < 7) then
            szDataStr = "lmbj_car_kill_low";
        end
        AddStatData(szDataStr);
        WriteYunBiaoLog(format("[Long M�n Ti�u C�c] %s b� h�y, B�n �� hi�n t�i: %s", szBiaoCheName, tbGlobalMapId2Name[nMapID]));
    else -- ˢ����ڳ�
        local szTongName = "";
        local nOwnerTongId = 0;
        local nAwardTongId = 0;
        if PlayerIndex and PlayerIndex > 0 then
            szTongName, nOwnerTongId = GetTongName();
            nAwardTongId = nOwnerTongId;
        end
        local nSrcHash1, nSrcHash2 = GetNpcParam(nNpcIndex,5), GetNpcParam(nNpcIndex,6);
        local nCarTongId = nSrcHash1 + nSrcHash2;
        local nBXNpcIdx = AddNpcEx(nNpcTongBoxID, 1, 1, nMapIdx, nX32, nY32, 1, szNpcTongBoxName, 0);
        SetNpcScript(nBXNpcIdx, szNpcTongBoxScriptPath);
        SetNpcTimer(nBXNpcIdx, 900*18);
        SetNpcParam(nBXNpcIdx, 1, 0);       -- �ѱ��������
        SetNpcParam(nBXNpcIdx, 2, GetCurrentTime()); -- ��������ʱ��_���ڱ���ʱ��
        if nCarTongId == nOwnerTongId then
            nOwnerTongId = 0;
        end
        nHash1 = floor(nOwnerTongId/2);
        nHash2 = nOwnerTongId - nHash1;
        SetNpcParam(nBXNpcIdx, 3, nHash1);
        SetNpcParam(nBXNpcIdx, 4, nHash2);
        SetNpcParam(nBXNpcIdx, 5, nSrcHash1);
        SetNpcParam(nBXNpcIdx, 6, nSrcHash2);
        Msg2Tong(nCarTongId, format("Ti�u Xa Bang c�a qu� bang t�i %s b� h�y.", tbGlobalMapId2Name[nMapID]));

	--����Ծ��ϵͳ����������ڳ����٣��������һ��������ڰ���û�Ծ��
    	--local nJoinTongTime = GetJoinTongTime()
    	--if nAwardTongId > 0 and nJoinTongTime >= 7*24*60 then  --���ʱ�䳬��һ�ܷ������ӻ�Ծ��
    	    --DynamicExecute("\\script\\tong\\tong_huoyuedu.lua", "tbTongHuoYueDu:BangHuiYaBiao", nAwardTongId);
    	--end

        -- ��־���
        AddStatData("bhyb_destroy_count");
        local szLogs = format("T�i <%s> c�ng ph� %s", tbGlobalMapId2Name[nMapID], szBiaoCheName);
        pActivity:WriteTongYBLog(szLogs);
    end
end

