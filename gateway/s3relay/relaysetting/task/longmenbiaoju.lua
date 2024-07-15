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
	--设置方案名称
	TaskName("longmenbiaoju")
	
	local  nInterval = 60
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--设置间隔时间，单位为分钟
	TaskInterval(nInterval) --nInterval分钟一次
	--设置触发次数，0表示无限次数
	

	TaskCountLimit(0)
	


	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "T╪g ph莕 thng Long M玭 Ti猽 C鬰.",nNextHour, nNextMinute, nInterval)
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
		local szMsg = "Chng m玭 L鬰 Tam C﹏ c玭g b� ph莕 thng g蕄 b閕, chi猽 m� hi謕 kh竎h v薾 ti猽, th阨 gian ch� c� m閠 ti課g ng h�, c竎 hi謕 s� mu鑞 tham gia h穣 mau ch鉵g b竜 danh nh�."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		OutputMsg("start longmenbiaoju award rise begin")
	elseif flag == 2 then
		local szMsg = "Th阨 gian ph莕 thng g蕄 b閕 Long M玭 Ti猽 C鬰  qua, c竎 hi謕 kh竎h xin h穣 l璾 � th阨 gian g蕄 b閕 l莕 sau."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		OutputMsg("start longmenbiaoju award rise end")
	end
end


function GameSvrConnected(dwGameSvrIP)

end

function GameSvrReady(dwGameSvrIP)

end