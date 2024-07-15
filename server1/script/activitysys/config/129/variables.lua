
szNpcZhangGuiName = "�ng ch� Ti�u c�c L�c Tam C�n"
nNpcZhangGuiID = 2157
tbNpcZhangGuiPos = {{121,1989,4476},}

szNpcBiaoShiName = "Long M�n Ti�u S�"
nNpcBiaoShiID = 2145
tbNpcBiaoShiPos = {{176,1448,3335},{176,1534,2974},{11,3061,4992},{78,1537,3182},{1,1597,3093},{162,1639,3215},{37,1690,3150},{80,1786,3037},{20,3516,6164},{99,1673,3229},{100,1622,3113},{101,1625,3209},{153,1677,3240},{174,1596,3271},}

szNpcConsignerName = "Ti�p D�n �p Ti�u Bang"
nNpcConsignerID = 2230
tbNpcConsignerPos = {
    {80,1678,3147}, {176,1399,3140}, {37,1703,3019}, {11,3205,5078}, {78,1569,3280}, {1,1559,3258}, {162,1650,3247},
}
szNpcConsignerScriptPath = "\\script\\activitysys\\config\\129\\npc_consigner.lua"

szNpcReceiverName = "Nh�n H�ng �p Ti�u Bang"
nNpcReceiverID = 2231
tbNpcReceiverPos = {
    {116,1741,3031},{93, 1620,3182},{94, 1638,3106},
    {181,1627,3052},{180,1548,3176},{182,2107,3412},
    { 42,1642,3029},{ 45,1702,3076},{204,1621,3375},{103,1638,2930},
    { 10,1778,3065},{ 23,1854,3123},{ 22,1865,3274},{  5,1597,3592},
    { 91,1602,2810},{ 83,1660,2924},{205,1587,3221},
    {201,1736,3235},{  2,2406,3713},{  4,1672,3096},
    {168,1653,3138},{171,1494,2982},{203,1505,3102},
}
szNpcReceiverScriptPath = "\\script\\activitysys\\config\\129\\npc_receiver.lua"

-- ������ﱦ��
szNpcTongBoxName = "R��ng Ti�u V�t Bang"
nNpcTongBoxID = 2232
szNpcTongBoxScriptPath = "\\script\\activitysys\\config\\129\\npc_lmbiaobox.lua"

-- ����������
TONG_TASK_OCCUPY_CITYS  = 1149   -- ��᱾��ռ�������������
TONG_TASK_YABIAO_STATE  = 1150   -- ��᱾��Ѻ��״̬ ÿ���ɰ������� 0:û�п���
TONG_TASK_YABIAO_COUNT  = 1151   -- ��᱾��Ѻ�ڴ��� <= 1148
TONG_TASK_YABIAO_TIME   = 1152   -- ����ϴν���ʱ��
TONG_TASK_YABIAO_AWARD  = 1153   -- ����콱������> 0ʱ�н��������꽱����
TONG_TASK_YABIAO_RAND   = 1154   -- ���Ѻ��·�������
TONG_TASK_MEMBER_HASH1  = 1155   -- ��ᵱǰѺ��������Hashֵ1
TONG_TASK_MEMBER_HASH2  = 1156   -- ��ᵱǰѺ��������Hashֵ2

--ʹ�õ��������
TSK_DailyTaskNum        = 4178 -- ÿ�ս��ڵĴ���
TSK_LMBJTaskFlag        = 4179 -- ����ID*10 + Flag (Flag:����յ��Ƿ񽻻�)
TSK_LMBJTaskTime        = 4180 -- ����ʱ���
TSK_LMBJLowTskFlag      = 4181 -- 
TSK_LMBJRanTskFlag      = 4182 -- 
TSK_DailyFreeCount      = 4183 -- ÿ����ѻ��ڵĴ���
TSK_LMBJCarIndex        = 4184 -- �ڳ�ˢ��ʱ��NPCIndex���ڳ�����ʱ��ֵ-1���ڳ����˾������400���ʱ�䳬��5����ɾ��ʱ��ֵ0
TSK_DailyPickNum        = 4185 -- ���ÿ��ʰȡ�������
TSK_RefreshBiaoChe      = 4186 -- ��ҿ����ˢ�ڳ�
TSK_BiaoCheLife         = 4187 -- �ڳ���Ѫ��

TSK_ItemKMJBTime        = 3500 -- ����ӱ�ʹ��ʱ��
TSK_ItemJBKCTime        = 3501 -- �᲻�ɴ�ʹ��ʱ��
TSK_TransCarTime        = 3506 -- �����ڳ�ʹ��ʱ��
TSK_ItemBCYWTime        = 3502 -- �ڳ���λʹ��ʱ��
TSK_MapIDFlag           = 3508 -- �����ʦʱ���ڵ�ͼID

TSK_TransTongCarTime    = 3540 -- �ϴδ��Ͱ���ڳ�ʱ��
TSK_TransTongCarCD      = 3541 -- ���Ͱ���ڳ���CDʱ��
TSK_WeekFollowCount     = 3542 -- ÿ�ܻ��ڻ�ȡ���澭���ۻ������� �ܹ��ĸ� 3542,3543,3544,3545

function getExpiredTime()
    local nCurH = tonumber(date("%H"));
    local nCurM = tonumber(date("%M"));
    -- ����ʣ��ʱ��
    local nDayTime = (23-nCurH)*60 + (60-nCurM);
    local nCurw = tonumber(date("%w"));
    local nDays = 6;
    if nCurw == 0 then -- ��������һ��
        nDays = 5;
    end
    local nExpiredTime = (nDayTime + nDays*24*60)*60 + GetCurrentTime();
    local nReValue = tonumber(FormatTime2String("%Y%m%d", nExpiredTime));
    return nReValue;
end
