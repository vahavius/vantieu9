local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	
	if nNextMinute >= 60 then
		
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end



function TaskShedule()
	--���÷�������
	TaskName("longmenbiaoju")
	
	local  nInterval = 60
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--���ü��ʱ�䣬��λΪ����
	TaskInterval(nInterval) --nInterval����һ��
	--���ô���������0��ʾ���޴���
	

	TaskCountLimit(0)
	


	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "T�ng ph�n th��ng Long M�n Ti�u C�c.",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	local nTime = tonumber(date("%H%M"))
	
	local flag = 0
	if (nTime >= 1300 and nTime < 1400) then
		flag = 1
	elseif nTime == 1400 then
		flag = 2
	elseif (nTime >= 1900 and nTime < 2000) then
		flag = 1
	elseif nTime == 2000 then
		flag = 2
	end
	
	if flag == 1 then
		local szMsg = "Ch��ng m�n L�c Tam C�n c�ng b� ph�n th��ng g�p b�i, chi�u m� hi�p kh�ch v�n ti�u, th�i gian ch� c� m�t ti�ng ��ng h�, c�c hi�p s� mu�n tham gia h�y mau ch�ng b�o danh nh�."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		OutputMsg("start longmenbiaoju award rise begin")
	elseif flag == 2 then
		local szMsg = "Th�i gian ph�n th��ng g�p b�i Long M�n Ti�u C�c �� qua, c�c hi�p kh�ch xin h�y l�u � th�i gian g�p b�i l�n sau."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		OutputMsg("start longmenbiaoju award rise end")
	end
end


function GameSvrConnected(dwGameSvrIP)

end

function GameSvrReady(dwGameSvrIP)

end