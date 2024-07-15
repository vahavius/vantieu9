-- �����ھ֣�������߰󶨽ű���
Include("\\script\\activitysys\\config\\129\\head.lua");
Include("\\script\\activitysys\\config\\129\\config.lua");
Include("\\script\\activitysys\\config\\129\\variables.lua")

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main(nItemIndex)
	-- ���ȼ�
	if PlayerFunLib:CheckTotalLevel(150,"Ch� ng��i ch�i ��t c�p 150 ho�c �� chuy�n sinh m�i c� th� d�ng ��o c� n�y!",">=") ~= 1 then
		return 1;
    end
    local nG, nD, nP =  GetItemProp(nItemIndex);
    if (nP>4207 or nP<4204) then
        return nil;
    end
    -- �Ƿ������
    local nTaskFlagValue = GetTask(TSK_LMBJTaskFlag);
    if (nTaskFlagValue == 0) then
        return 1;
    end

    local nCarNpcIndex = GetTask(TSK_LMBJCarIndex);
    if (nCarNpcIndex == 0) then
        Talk(1, "", "Hi�n kh�ng c� Ti�u Xa, kh�ng th� d�ng ��o c�.");
        return 1;
    end

    -- ����Ƿ�����ȴʱ��(5����)
    local nCurTime = GetCurrentTime();
    local nItemTaskID = nP - 4204 + TSK_ItemKMJBTime;
    local nLeftTime = 180 - (nCurTime-GetTask(nItemTaskID));
    if nLeftTime > 0 then
        Talk(1, "", format("Ng��i v�a s� d�ng ��o c� n�y, sau %d ph�t %d gi�y n�a s� d�ng l�i", floor(nLeftTime/60), mod(nLeftTime, 60)));
        return 1;
    end
    -- ����ڳ��Ƿ�����Ч��Χ
    local nX32, nY32, nMapIdx = GetBiaoChePos();
    local nPMapID, nPX, nPY = GetWorldPos();
    if (nMapID == -1 or nMapIdx ~= SubWorldID2Idx(nPMapID)) then
        Talk(1, "", "Ti�u Xa kh�ng n�m trong ph�m vi c� hi�u qu�, h�y l�i g�n Ti�u Xa.");
        return 1;
    end
    local nDistance = sqrt((nX32-nPX*32)*(nX32-nPX*32) + (nY32-nPY*32)*(nY32-nPY*32));
    if ( nDistance >= 750) then
        Talk(1, "", "Ti�u Xa kh�ng n�m trong ph�m vi c� hi�u qu�, h�y l�i g�n Ti�u Xa.");
        return 1;
    end
    -- ����ӱ�
    if (nP == 4204) then
        SetTask(nItemTaskID, nCurTime);
        NpcCastSkill(nCarNpcIndex, 1467, 1);
        return nil;
    end
    -- �᲻�ɴ�
    if (nP == 4205) then
        -- ��ȡѺ��������Ϣ
        local nId = floor(nTaskFlagValue/10);       -- Ѻ��·��ID
        SetTask(nItemTaskID, nCurTime);
        NpcCastSkill(nCarNpcIndex, 1468, getSkillLevel(nId));
        return nil;
    end
    -- �����ܲ�
--    if (nP == 4206) then
--        SetTask(nItemTaskID, nCurTime);
--        NpcCastSkill(nCarNpcIndex, 1469, 1);
--        return nil;
--    end
    -- �ڳ���λ
    if (nP == 4207) then
        SetTask(nItemTaskID, nCurTime);
        SetNpcPos(nCarNpcIndex, nPX*32, nPY*32);
        return nil;
    end
    return nil;
end

function getSkillLevel(nTskID)
    local nLevel = pActivity.tbBJPathLevel[nTskID][2];
    local tbSkillLevelbyLevel = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 2,
        [5] = 2,
        [6] = 2,
        [7] = 3,
        [8] = 3,
        [9] = 3,
        [10] = 3,
    }
    return tbSkillLevelbyLevel[nLevel];
end

