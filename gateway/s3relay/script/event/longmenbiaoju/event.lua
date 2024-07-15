--�����ھֻ--ȫ�ֹ������ݲ���
Include("\\script\\lib\\objbuffer_head.lua")

tbLMBJActivityData = {}
tbLMBJActivityData.key = "EVENT_LongMenBiaoJuActivityData";
tbLMBJActivityData.nMemDate    = 0;
tbLMBJActivityData.nMemCount7  = 0;
tbLMBJActivityData.nMemCount8  = 0;
tbLMBJActivityData.nMemWeek    = 0;
tbLMBJActivityData.nMemCount9  = 0;

function DataInit()
    -- ����ձ�����ʼ��
    local nCurDate = tonumber(date("%y%m%d"));
    local handle = OB_Create();
    OB_LoadShareData(handle, tbLMBJActivityData.key, 20131478, nCurDate);
    tbLMBJActivityData.nMemDate   = nCurDate;
    tbLMBJActivityData.nMemCount7 = 0;
    tbLMBJActivityData.nMemCount8 = 0;
    if OB_IsEmpty(handle) ~= 1 then
        tbLMBJActivityData.nMemCount7 = ObjBuffer:PopObject(handle);
        tbLMBJActivityData.nMemCount8 = ObjBuffer:PopObject(handle);
    end
    OB_Release(handle);
    -- ����ձ�����ʼ��
    local nCurWeek = tonumber(date("%y%m%W"));
    handle = OB_Create();
    OB_LoadShareData(handle, tbLMBJActivityData.key, 20131409, nCurWeek);
    tbLMBJActivityData.nMemWeek = nCurWeek;
    tbLMBJActivityData.nMemCount9 = 0;
    if OB_IsEmpty(handle) ~= 1 then
        tbLMBJActivityData.nMemCount9 = ObjBuffer:PopObject(handle);
    end
    OB_Release(handle);
end

function tbLMBJActivityData:g2s_GetBiaoChePos(ParamHandle, ResultHandle)
    local tbCarPos = {-1, -1, -1};
    local szPlayerName = "";
    if (OB_IsEmpty(ParamHandle) ~= 1) then
        szPlayerName = ObjBuffer:PopObject(ParamHandle);
    end
    if (szPlayerName == "") then
        ObjBuffer:PushObject(ResultHandle, tbCarPos);
        return nil;
    end
    local nMapID, nX, nY, nState = GetBiaoChePos(szPlayerName);
    tbCarPos[1] = nMapID;
    tbCarPos[2] = nX;
    tbCarPos[3] = nY;
    tbCarPos[4] = nState;
    ObjBuffer:PushObject(ResultHandle, tbCarPos);
end

function tbLMBJActivityData:g2s_GetTaskFlag(ParamHandle, ResultHandle)
    local nCurDate = tonumber(date("%y%m%d"));
    if (nCurDate ~= self.nMemDate) then
        self.nMemDate = nCurDate;
        self.nMemCount7 = 0;
        self.nMemCount8 = 0;
    end
    local nCurWeek = tonumber(date("%y%m%W"));
    if (nCurWeek ~= self.nMemWeek) then
        self.nMemWeek = nCurWeek;
        self.nMemCount9 = 0;
    end
    local tbAllTask = {
        {nRate = 0,        tbID = {1} },            --1�� �����������ռλ��
        {nRate = 0.4053,   tbID = {2,3,4,5,6,7,}},  --2��
        {nRate = 0.4,      tbID = {8,9,}},          --3��
        {nRate = 0.15,     tbID = {10,11,}},        --4��
        {nRate = 0.03,     tbID = {12,13,14,15,}},  --5��
        {nRate = 0.01,     tbID = {16,17,18,}},     --6��
        {nRate = 0.004,    tbID = {19,20,21,22,}},  --7��:ÿ��ȫ����������13
        {nRate = 0.0006,   tbID = {23,24,25,}},     --8��:ÿ��ȫ����������3
        {nRate = 0.0001,   tbID = {26,}},           --9��:ÿ��ȫ����������3
    }
    local nLevel = 1;
    local nRandValue = random(1, 10000)
    local nCurValue = 0;
    for i = 2, getn(tbAllTask) do
        nCurValue = nCurValue + tbAllTask[i].nRate * 10000;
        if (nRandValue <= nCurValue) then
            nLevel = self:getCorrectLevel(i);
            break;
        end
    end
    local nRi = random(1, getn(tbAllTask[nLevel].tbID));
    local nTaskFlag = tbAllTask[nLevel].tbID[nRi]*10 + random(0, 1);

    -- ���������
    ObjBuffer:PushObject(ResultHandle, nTaskFlag);
end

function tbLMBJActivityData:g2s_SaveTaskFlag(ParamHandle, ResultHandle)
    local nLevel = 0;
    if (OB_IsEmpty(ParamHandle) ~= 1) then
        nLevel = ObjBuffer:PopObject(ParamHandle);
    end
    local nCurDate = tonumber(date("%y%m%d"));
    if (nCurDate ~= self.nMemDate) then
        self.nMemDate = nCurDate;
        self.nMemCount7 = 0;
        self.nMemCount8 = 0;
    end
    local nCurWeek = tonumber(date("%y%m%W"));
    if (nCurWeek ~= self.nMemWeek) then
        self.nMemWeek = nCurWeek;
        self.nMemCount9 = 0;
    end
    if (nLevel == 9) then
        self.nMemCount9 = self.nMemCount9 + 1;
    elseif (nLevel == 8) then
        self.nMemCount8 = self.nMemCount8 + 1;
    elseif (nLevel == 7) then
        self.nMemCount7 = self.nMemCount7 + 1;
    else
        return nil;
    end
    -- ����7��8�ǲ���
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, self.nMemCount7);
    ObjBuffer:PushObject(handle, self.nMemCount8);
    OB_SaveShareData(handle, self.key, 20131478, nCurDate);
    OB_Release(handle);
    -- ����9�ǲ���
    handle = OB_Create();
    ObjBuffer:PushObject(handle, self.nMemCount9);
    OB_SaveShareData(handle, self.key, 20131409, nCurWeek);
    OB_Release(handle);
end

function tbLMBJActivityData:getCorrectLevel(nParam)
    local nLevel = nParam;
    -- �浽9������,��������
    if (nParam == 9) then
        if (self.nMemCount9 >= 3) then
            nLevel = 8;
            if (self.nMemCount8 >= 3) then
                nLevel = 7;
                if (self.nMemCount7 >= 13) then
                    nLevel = 6;
                end
            end
        end
    end
    -- �浽8������,��������
    if (nParam == 8) then
        if(self.nMemCount8 >= 3) then
            nLevel = 7;
            if (self.nMemCount7 >= 13) then
                nLevel = 6;
            end
        end
    end
    -- �浽7�����񣬲�������
    if (nParam == 7) then
        if(self.nMemCount7 >= 13) then
            nLevel =  6;
        end
    end

    return  nLevel;
end

DataInit();

