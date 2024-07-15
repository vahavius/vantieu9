Include("\\script\\event\\longmenbiaoju\\head.lua")

local StartTime = LongMenBiaoJu.StartTime
local EndTime = LongMenBiaoJu.EndTime

LongMenBiaoJu.ItemList.BiaoQi.szName = "Ti�u K�"
LongMenBiaoJu.ItemList.PingZheng.szName = "Ho�n Ti�u Ch�"
LongMenBiaoJu.ItemList.WeiRenZhuang.szName = "�p ti�u �y nhi�m tr�ng cao c�p"
LongMenBiaoJu.ItemList.HuBiaoLing.szName = "H� Ti�u L�nh"
LongMenBiaoJu.ItemList.KuaiMaJiaBian.szName = "Kho�i M� Gia Ti�n"
LongMenBiaoJu.ItemList.JianBuKeCui.szName = "Ki�n B�t Kh� T�a"
LongMenBiaoJu.ItemList.BiaoCheWeiYi.szName = "Ti�u Xa Di V�"

LongMenBiaoJu.LANG = {
	BIAOCHE_NAME = "Ti�u Xa %d sao c�a %s",
	BIAOCHE_NOTIFY = "Ti�u Xa %d sao c�a %s s� xu�t hi�n t�i b�n �� %s",
	
	DLG_ITEM_NAME_1 = "Kho�i M� Gia Ti�n (t�ng t�c)",
	DLG_ITEM_NAME_2 = "Ki�n B�t Kh� T�a (h�i ph�c m�u)",
	DLG_ITEM_NAME_3 = "Ti�u Xa Di V� (tr�nh k�t)",
	
	NPC_NAME_BIAOWU = "T�n L�c Ti�u V�t",
	NPC_NAME_BROKEN_BIAOCHE = "Ti�u Xa b� ph� ho�i",
	NPC_NAME_ZHANGGUI = "�ng ch� Ti�u c�c L�c Tam C�n",
	NPC_NAME_BIAOSHI = "Long M�n Ti�u S�",
	
	DLG_MAIN_CONTENT = "Giang h� hi�m �c, l�ng ng��i kh� �o�n, nh� v�y m� vi�c l�m �n c�a Ti�u c�c ta ng�y c�ng t�t. Hi�n t�i nh�n l�c kh�ng ��, ta th�y ��i hi�p c�t c�ch tinh c�, m�nh m� chi b�ng gi�p ch�ng ta v�n 1 chuy�n Ti�u Xa, ph�n th��ng nh�t ��nh s� l�m ng��i h�i l�ng. Ngo�i ra, sau khi ho�n th�nh nhi�m v� v�n ti�u s� nh�n ���c 'H� Ti�u L�nh' c� th� d�ng �� ��i ��o c� khi c�n �� v�n ti�u t�i c�a h�ng Ti�u c�c.",
	DLG_ACCEPT_TASK = "Nh�n nhi�m v� �p Ti�u",
	DLG_START_TASK = "B�t ��u �p Ti�u",
	DLG_CANCEL_TASK = "T� b� nhi�m v� �p Ti�u",
	DLG_GET_AWARD = "Nh�n ph�n th��ng nhi�m v� �p Ti�u",
	DLG_VIEW_INFO = "Ki�m tra th�ng tin �p Ti�u",
	DLG_TRANSFER_TO_BIAOCHE = format("Truy�n t�ng ��n v� tr� c�a Ti�u Xa (%d l��ng)", LongMenBiaoJu.TRANSFER_COST),
	DLG_OPEN_SHOP = "C�a h�ng Ti�u c�c",
	DLG_CONFIRM = " S� d�ng",
	DLG_CANCEL = " H�y b� ",
	DLG_CLOSE = " ��ng",
	DLG_CLOSE_2 = "Ta �i t�m l�i xem sao",
	DLG_ACCEPT_CONTENT = "��i hi�p r�t can ��m, � ��y ta c� c�c lo�i nhi�m v� �p Ti�u, h�y l��ng s�c m� l�a ch�n cho ph� h�p. G�n ��y trong r�ng th��ng xuy�n c� c��p Ti�u, khi �p Ti�u Xa cao c�p nh� ph�i c� t� ��i �i c�ng. Ti�u Xa b� c��p th� ��i v�i ng��i hay ta ��u l� 1 t�n th�t l�n.",
	DLG_ACCEPT_TYPE_LOW = "Nh�n nhi�m v� �p Ti�u 1 sao",
	DLG_ACCEPT_TYPE_RANDOM = "Nh�n nhi�m v� �p Ti�u ng�u nhi�n",
	DLG_ACCEPT_TYPE_HIGH = "Nh�n nhi�m v� �p Ti�u cao c�p",
	DLG_FREE_REFRESH_END = "Ng��i �� d�ng h�t s� l�n l�m m�i mi�n ph� c�a ng�y h�m nay, mu�n s� d�ng ti�p <color=red> Ho�n Ti�u Ch� <color>.",
	DLG_FREE_REFRESH_AVAILABLE = "S� l�n s� d�ng mi�n ph� c�a h�m nay v�n c�n, ng��i kh�ng c�n s� d�ng Ho�n Ti�u Ch�.",
	DLG_REFRESH_USING_ITEM_CONFIRM = "C� ph�i mu�n s� d�ng Ho�n Ti�u Ch� �� l�m m�i nhi�m v�?",
	DLG_CONFIRM_TASK_CONTENT = "Nhi�m v� Ti�u Xa %d sao, �i�m kh�i h�nh:%s - �i�m k�t th�c:%s, trong %d ph�t s� ��n, c� ti�p nh�n kh�ng?",
	DLG_HIGH_CONTENT = "Ng��i mu�n th� th�ch b�n th�n nh�n nhi�m v� �p Ti�u kh� nh�t? Kh�ng c� th�c l�c th� kh�ng ���c, n�u nh� ng��i c� <color=red> �p ti�u �y nhi�m tr�ng cao c�p <color> th� ta c� th� suy ngh� l�i.",
	DLG_HIGH_CONFIRM = "S� d�ng �p ti�u �y nhi�m tr�ng cao c�p",
	DLG_HIGH_CONTENT_FINAL = "N�p �p ti�u �y nhi�m tr�ng cao c�p s� ng�u nhi�n xu�t hi�n nhi�m v� �p Ti�u 7 sao, 8 sao, 9 sao. Ng��i �� chu�n b� xong ch�a?",
	DLG_RANDOM_ACCEPT = "Nh�n (kh�ng th� l�m m�i nhi�m v�)",
	DLG_RANDOM_REFRESH_FREE = "L�m m�i nhi�m v� mi�n ph�",
	DLG_RANDOM_REFRESH_CHARGE = "S� d�ng Ho�n Ti�u Ch� l�m m�i nhi�m v�",
	DLG_CANCEL_CONFIRM = "��i hi�p x�c ��nh l�n n�y kh�ng th� xu�t Ti�u kh�ng?",
	DLG_TOO_YONG = "Ng��i v�n ch�a ��n c�p 120, h�y c� g�ng h�n n�a.",
	DLG_CAMP_ERROR = "Thi�u Hi�p, hi�n t�i Thi�u Hi�p kh�ng th� l�nh nh�n nhi�m v� Long M�n Ti�u C�c.",
	DLG_GET_AWARD_NOT_FINISH_CONTENT = "Nhi�m v� ch�a k�t th�c. Ti�u Xa v� Ti�u K� ��u m�t h�t r�i th� c� th� k�t th�c nhi�m v� v� nh�n 100 v�n kinh nghi�m. Ti�u Xa b� c��p th� t�m l�i <color=red> Ti�u K� <color> c� th� nh�n 1 ph�n c�a ph�n th��ng",
	DLG_GET_AWARD_QUERY = "K�t th�c nhi�m v�, nh�n kinh nghi�m",
	DLG_FINISH_TASK_BIAOQI = "Tuy l� Ti�u Xa b� c��p nh�ng c�ng may c��p l�i ���c Ti�u K�, kh�ng c� c�ng c�ng c� s�c, c� ch�t ti�n cho ng��i mua r��u h�y nh�n l�y.",
	DLG_FINISH_TASK_OK = "Nhi�m v� th�nh c�ng",
	DLG_FINISH_TASK_BIAOCHE_EXIST = "Ti�u Xa c�a ng��i v�n c�n, h�y mau �i t�m l�i �i.",
	DLG_FINISH_TASK_FAILED = "Ti�u Xa c�a ng��i �� bi�n m�t ho�c b� ph� h�y, c� ph�i k�t th�c nhi�m v� l�n n�y?",
	
	DLG_SHOP = "Do ��i hi�p tham gia v�o vi�c h� ti�u n�n Ti�u S� c�a ch�ng ta �� c�i ti�n 1 t� n�t ��ng m� Ti�u Xa, c�i t�o kh�ng �t, ng��i c� th� l�y<color=red> H� Ti�u L�nh <color>�� ��i. Khi v�n ti�u c� th� s� d�ng ��o c� n�y ��i v�i Ti�u Xa k� b�n, b�o ��m ��i hi�p d�ng n�a s�c nh�ng c�ng g�p ��i.",
	
	DLG_BACK = "Tr� v�",
	
	MSG_NO_ITEM_PZ = "Ng��i kh�ng c�<color=red> Ho�n Ti�u Ch� <color>, kh�ng th� l�m m�i nhi�m v�.",
	MSG_NO_ITEM_WRZ = "Ng��i kh�ng c� �p ti�u �y nhi�m tr�ng cao c�p, ��ng ph� th�i gian n�a.",
	MSG_NOT_OPEN = format("Kh�ng trong th�i gian �p Ti�u %.2d:%.2d-%.2d:%.2d, ��i hi�p h�y quay v� �i", StartTime[1], StartTime[2], EndTime[1], EndTime[2]),
	MSG_BIWO_WU_MAX = format("M�i ng�y m�i ��i hi�p ch� c� th� nh�n %d l�n �p Ti�u, h�m nay s� l�n nh�n c�a ��i hi�p �� h�t.", LongMenBiaoJu.MAX_BIAO_WU_PICK_COUNT),
	MSG_MAX_COUNT_DAILY = format("H�m nay ng��i �� ho�n th�nh %d l�n �p Ti�u, ng�y mai quay l�i �i.", LongMenBiaoJu.MAX_TASK_COUNT),
	MSG_ALREADY_ACCEPT = "Ng��i �� nh�n nhi�m v�, h�y n�m b�t th�i gian",
	MSG_NEED_FINISH = "Ng��i c� ph�n th��ng �p Ti�u ch�a nh�n, nh�n xong r�i quay l�i ��y.",
	MSG_BAG_FULL = "H�nh trang �� ��y, kh�ng th� nh�n ���c.",
	MSG_HIGH_TASK_ACCEPTED = "Ng��i �� nh�n 1 nhi�m v� �p Ti�u cao c�p, h�y th�nh l�p t� ��i �� h� Ti�u",
	MSG_NO_TASK = "Ng��i v�n ch�a nh�n nhi�m v� v�n Ti�u.",
	MSG_NO_START = " Ti�u Xa v�n ch�a xu�t ph�t. ",
	MSG_CANCEL_ALREADY_START = "Ti�u Xa c�a ng��i �� xu�t ph�t r�i, l�m sao c� th� b� gi�a ch�ng ���c!",
	MSG_CANCEL_HIGH_TASK = "Ng��i �� nh�n nhi�m v� �p Ti�u cao c�p l�m sao c� th� b� ���c? Ta xem tr�ng ng��i!",
	MSG_START_ALREADY_START = "Kh�ng ph�i Ti�u Xa c�a ng��i �� xu�t ph�t t� l�u r�i sao, c�n kh�ng mau �i b�o v� n�u kh�ng s� b� k� x�u c��p m�t b�y gi�!",
	MSG_START_WRONG_NPC = "Ng��i t�m sai ch� r�i, Ti�u Xa � �i�m xu�t ph�t ��i ng��i",
	MSG_NO_MONEY = "Ng�n l��ng c�a ��i hi�p kh�ng ��.",
	MSG_NO_BIAOCHE = "Ti�u Xa ��u b� ng��i l�m m�t h�t r�i, kh�ng th� truy�n t�ng.",
	MSG_TRANSFER_CD = format("V�n ch�a v��t qu� %d gi�y so v�i l�n truy�n t�ng tr��c, ��i m�t ch�t.", LongMenBiaoJu.TRANSFER_CD),
	
	MSG_FINISH_NO_TASK = "Ng��i v�n ch�a nh�n nhi�m v� �p Ti�u, h�y ��n Long M�n Tr�n t�m �ng ch� Y�m M�n �i.",
	MSG_FINISH_NOT_START = "Ti�u Xa c�a ng��i v�n ch�a xu�t ph�t, mau �i ��n �i�m xu�t ph�t t�m Ti�u S� �� b�t ��u �i.",
	MSG_FINISH_WRONG_NPC = "��i hi�p �i sai ���ng r�i, mau ch�ng h� t�ng Ti�u Xa ��n ��a �i�m ch�nh x�c.",
	MSG_TASK_STATE_BROKEN = "Ti�u Xa c�a ng��i �� b� ph� ho�i, nhi�m v� k�t th�c.",
	MSG_TASK_TIME_REMAIN = "��m ng��c th�i gian %d ph�t %d gi�y",
	MSG_TASK_FAILED = "Nhi�m v� th�t b�i",
	
	MSG_TASK_COUNT = "S� l�n nhi�m v� �p Ti�u h�m nay: %d/%d",
	MSG_REFRESH_COUNT_FREE = "S� l�n l�m m�i nhi�m v� mi�n ph� h�m nay: %d/%d",
	MSG_ROUTE_INFO = "Ng��i �� nh�n nhi�m v� �p Ti�u %d sao, %s - %s.",
	MSG_REFRESH_COMFIRM = "C� ph�i l�m m�i nhi�m v�?",
	
	MSG_CAN_NOT_PICK = "��ng c�p c�a ng��i v�n ch�a ��n c�p 120 v� ch�a tr�ng sinh, kh�ng th� nh�t Ti�u v�t r�t ra",
	MSG_CAN_NOT_PICK2 = "��i hi�p v�n ch�a gia nh�p m�n ph�i, kh�ng th� nh�n Ti�u v�t r�t ra.",
	MSG_CAN_NOT_PICK_NOW = "Hi�n t�i ng��i kh�ng th� nh�n Ti�u v�t n�y.",
	MSG_START_PICK = "B�t ��u nh�n Ti�u v�t",
	MSG_PICK_BROKEN = "Qu� tr�nh nh�n Ti�u v�t b� ��t �o�n r�i.",
	MSG_PICK_FAILED = "Nh�n Ti�u v�t th�t b�i.",
	MSG_PICK_SUCCESS = "Nh�n Ti�u v�t th�nh c�ng.",
	
	MSG_LACK_ITEM_HBL = "H� Ti�u L�nh c�a ng��i kh�ng �� %d c�i.",
	MSG_ITEM_CD =  "Ng��i v�a s� d�ng ��o c� n�y, sau %d ph�t %d gi�y n�a s� d�ng l�i",
	MSG_BIAOCHE_NOT_NEAR = "Ti�u Xa kh�ng n�m trong ph�m vi c� hi�u qu�, h�y l�i g�n Ti�u Xa.",
	
	MSG_BIAOCHE_FARAWAY = "��ng c�ch Ti�u Xa xa qu�.",
	MSG_EXTRA_AWARD = "M�i ng�y th�nh c�ng ho�n th�nh 3 l�n V�n Ti�u s� nh�n ���c th�m m�t L� Bao Ti�u C�c.",
	MSG_ALREADY_ACCEPT_TONG_TASK = "Sau khi nh�n nhi�m v� �p Ti�u Bang H�i, kh�ng th� nh�n nhi�m v� �p ti�u c� nh�n.",
}

