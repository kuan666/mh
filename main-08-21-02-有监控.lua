require "TSLib"--使用本函数库必须在脚本开头引用并将文件放到设备 lua 目录下
local ts = require("ts")--使用官方库前一定要在开头插入这一句
init("0",1)


--函数---------------------------添加监控文件夹-----------------------------

function Ftp_Add()  
	status = ts.ftp.connect("lka0home.f3322.net","op163","qwe123")  --FTP 操作第一步，连 接 FTP 服务器，连接成功后才可进行 FTP 相关操作
	if status then
		toast("连接FTP成功", 1)
	else
		toast("连接FTP失败", 1)
	end

	mkStatus = ts.ftp.mkdir("/梦幻脚本/实时监控/"..zhanghaoxulie)   --在 FTP 上的 firstFile 文件夹内创建一个 childFile 文件夹，如果没有 firstFile 文件夹则先创建 firstFile 文件夹


	if mkStatus then
		toast("创建成功",1)
	else
		toast("创建失败",1)
	end

	ts.ftp.close()  --操作完成后，断开 FTP 服务器连接

end
--函数---------------------------添加监控文件夹-----------------------------



--函数---------------------------删除监控文件夹-----------------------------
function Ftp_Del()

	status = ts.ftp.connect("lka0home.f3322.net","op163","qwe123")  --FTP 操作第一步，连 接 FTP 服务器，连接成功后才可进行 FTP 相关操作
	if status then
		toast("连接FTP成功", 1)
	else
		toast("连接FTP失败", 1)
	end

	ts.ftp.rmdir("/梦幻脚本/实时监控/"..zhanghaoxulie)--删除目录下的文件夹

	ts.ftp.close()  --操作完成后，断开 FTP 服务器连接
end
--函数---------------------------删除监控文件夹-----------------------------




--函数---------------------------切换ip-----------------------------
function changeip() --建立切换ip函数
	while (true) do

		ip0 = getNetIP() --获取当前IP
		toast(ip0,1)
		setAirplaneMode(true);    --打开飞行模式
		mSleep(3*1000);
		setAirplaneMode(false);    --关闭飞行模式
		mSleep(12*1000);
		ip1 = getNetIP() --获取更新后IP
		toast(ip1,1)
		mSleep(2*1000);
		if ip0 ~= ip1  then
			toast("ip不一致,开始执行",1)
			mSleep(1*1000);
			break
		else
			toast("ip一致,重新飞行",1)
			mSleep(1*1000);
		end


	end	
end
-----------------------------切换ip-----------------------------




--函数---------------------------运行梦幻西游手游-----------------------------
function Run_mh() --建立运行函数

	toast("打开梦幻",1)
	runApp("com.netease.my")  --运行梦幻西游手游
	mSleep(8*1000);
	while (true) do
		mSleep(1*1000);   
		tap(100,100,50)  --点击跳过动画
		----------------下载列表失败点确定----------------
		x,y = findMultiColorInRegionFuzzy( 0x48301e, "1|0|0x886c3c,2|0|0xf9d672", 90, 683, 366, 687, 368) --下载列表失败,点(确定)按钮
		if x ~= -1 and y ~= -1  then
			tap(665,371,50)  --点(确定)按钮
			toast("点(确定)按钮",1)			
			mSleep(1*1000)
		end		
		----------------下载列表失败点确定----------------

		-----------------------------判断是否进入桌面则break-----------------------------
		x,y = findMultiColorInRegionFuzzy( 0xc91218, "6|0|0xe4bc0c,13|0|0x6e220f", 90, 61, 496, 76, 498)  --检测主页面左下二维码
		if x ~= -1 and y ~= -1  then		
			toast("检测到左下二维码,break,开始判断登陆分支",1)
			mSleep(2*1000);
			break
		end
		-----------------------------判断是否进入桌面则break-----------------------------

	end


end	
-----------------------------运行梦幻西游手游----------------------------- 


-----------------------------主页面判断分支1\2----------------------------- 
function panduan_denglu_fenzhi()

	while (true) do
		x,y = findMultiColorInRegionFuzzy( 0xffffed, "0|1|0xba3211", 90, 416, 361, 418, 364)  --检测主页面已登录状态的服务器圆点
		if x ~= -1 and y ~= -1  then		
			toast("检测圆点,进入分支1",1)
			mSleep(2*1000);

			a1=false
			a2=false --分支1,不跳过a1,a2步骤

			break
		end

		x,y = findMultiColorInRegionFuzzy( 0x22b260, "0|1|0xbdd4c7,0|2|0xffffff", 90, 629, 323, 631, 327)  --检测主页面的(使用其他账号登陆)字样
		if x ~= -1 and y ~= -1  then		
			toast("检测圆点,进入分支2",1)
			mSleep(2*1000);

			a1=true
			a2=true --分支2,跳过a1,a2步骤

			break
		end	

	end	

end	
-----------------------------主页面判断分支1\2----------------------------- 


----------------------------------主页面进入用户中心----------------------------------
function zhuyemian_to_yonghuzhongxin_a1()  --a1步骤

	while (true) do
		toast("点击小人",1)
		tap(1096,45,50)  --点击小人
		mSleep(2*1000)
		x,y = findMultiColorInRegionFuzzy( 0x8d8d8d, "1|0|0xe5e5e5", 90, 51, 32, 54, 34) --查找左上角灰色箭头
		if x ~= -1 and y ~= -1  then	
			toast("找到左上角箭头,跳出循环",1)			
			mSleep(1*1000)
			break
		end	
	end

end
----------------------------------主页面进入用户中心----------------------------------



----------------------------------网易用户中心点击切换账号----------------------------------

function yonghuzhongxin_to_qiehuanzhanghao_a2()  --a2步骤


	while (true) do
		toast("点击切换账号1",1)
		tap(1065,150,50)  --点击切换账号
		mSleep(3*1000)
		x,y = findMultiColorInRegionFuzzy( 0x22b260, "0|1|0xbad3c5,0|2|0xffffff", 90, 630, 323, 632, 327) --查找大绿色(登陆)按钮字样
		if x ~= -1 and y ~= -1  then	
			toast("找到绿色(登陆)按钮,跳出循环",1)			
			mSleep(1*1000)
			break
		end	
	end


end
----------------------------------网易用户中心点击切换账号----------------------------------


----------------------------------(使用其他账号登陆)界面点击使用其他账号登陆----------------------------------

function shiyongqitazhanghaodenglu_to_denglufangshi()  


	while (true) do
		toast("点击使用其他账号登陆",1)
		tap(565,476,50)  --点击切换账号
		mSleep(2*1000)
		x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|1|0xf1bcbb,0|2|0xd4302f", 90, 563, 303, 565, 307) --查找(网易邮箱账号)图标
		if x ~= -1 and y ~= -1  then	
			toast("找到(网易邮箱账号)图标,跳出循环",1)			
			mSleep(1*1000)
			break
		end	
	end


end
----------------------------------(使用其他账号登陆)界面点击使用其他账号登陆----------------------------------

----------------------------------登陆方式界面点击网易邮箱账号----------------------------------

function denglufangshi_to_wangyiyouxiang()  


	while (true) do
		toast("点击网易邮箱账号登陆",1)
		tap(565,365,50)  --点击网易邮箱账号登陆
		mSleep(2*1000)
		x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|1|0xd0dbd4,0|2|0x90d8ae", 90, 634, 326, 636, 330) --查找浅绿色(下一步)图标
		if x ~= -1 and y ~= -1  then	
			toast("找到浅绿色(下一步)图标,跳出循环",1)			
			mSleep(1*1000)
			break
		end	
	end


end
----------------------------------登陆方式界面点击网易邮箱账号----------------------------------

----------------------------------填入登陆账号----------------------------------

function input_zh()  

	tap(510,230,50)  --点击账号输入框
	mSleep(1*1000)
	inputText(ccc[1])  --输入账号
	mSleep(1*1000)
	while (true) do
		x,y = findMultiColorInRegionFuzzy( 0xffffff, "1|0|0x49b678", 90, 703, 203, 706, 205) --查找深绿色(下一步)图标,
		if x ~= -1 and y ~= -1  then	
			break
		end	
	end


	while (true) do
		tap(660,210,50)  --点击深绿色(下一步)图标
		x,y = findMultiColorInRegionFuzzy( 0x90d8ae, "0|1|0xd4ddd8,0|2|0xffffff", 90, 697, 348, 699, 352) --查找浅绿色(登陆)图标,
		if x ~= -1 and y ~= -1  then	
			toast("找到浅绿色(登陆)图标,跳出循环",1)
			mSleep(1*1000)
			break
		end	
	end

	mSleep(2*1000)


end
----------------------------------填入登陆账号----------------------------------

----------------------------------填入登陆密码----------------------------------

function input_mm()  

	tap(507,241,50)  --点击密码输入框
	mSleep(1*1000)
	inputText(ccc[2])  --输入密码
	mSleep(0.5*1000)	
	tap(1064,517,50)  --点击删除
	mSleep(1*1000)
	while (true) do
		x,y = findMultiColorInRegionFuzzy( 0x22b260, "0|1|0xc6d8ce,0|2|0xffffff", 90, 697, 224, 699, 228) --查找深绿色(登陆)图标,
		if x ~= -1 and y ~= -1  then	
			break
		end	
	end


	while (true) do
		tap(658,228,50)  --点击深绿色(登陆)图标
		x,y = findMultiColorInRegionFuzzy( 0x6c310a, "1|0|0xa87b38,2|0|0xeac463", 90, 772, 554, 776, 556) --查找用户协议的接受按钮
		if x ~= -1 and y ~= -1  then	
			toast("检测到用户协议接受,跳出循环",1)
			tap(722,555,50)  --点击接受按钮
			mSleep(2*1000)
			break
		end	


--------------------相同账号会直接进入主页面,没有用户协议图片,则检测主页面登陆游戏按钮--------------------
		x,y = findMultiColorInRegionFuzzy( 0xffffff, "1|0|0xe9ddd4,2|0|0x93572c", 90, 630, 479, 634, 481) --查找主页面登陆游戏按钮
		if x ~= -1 and y ~= -1  then	
			toast("检测到主页面登陆游戏按钮,跳出循环",1)
			mSleep(1*1000)
			break
		end	
--------------------相同账号会直接进入主页面,没有用户协议图片,则检测登陆游戏按钮--------------------


	end


end
----------------------------------填入登陆密码----------------------------------


----------------------------------主页面点击扫一扫----------------------------------

function zhuyemian_to_saoyisao()  


	while (true) do
		----------------连不上服务器点确定----------------
		x,y = findMultiColorInRegionFuzzy( 0x48301e, "1|0|0x8f723f,2|0|0xf9d672", 90, 493, 380, 497, 382) --查找连不上服务器,(好的)按钮
		if x ~= -1 and y ~= -1  then
			tap(476,386,50)  --点击(好的)按钮
			toast("点击(好的)按钮",1)			
			mSleep(1*1000)
		end		
		----------------连不上服务器点确定----------------
		
		----------------用户协议,点接受----------------
		x,y = findMultiColorInRegionFuzzy( 0x6c310a, "1|0|0x92622a,2|0|0xeac565", 90, 772, 553, 776, 555) --用户协议,点(接受)按钮
		if x ~= -1 and y ~= -1  then
			tap(722,555,50)  --点(接受)按钮
			toast("点(接受)按钮",1)			
			mSleep(1*1000)
		end		
		----------------用户协议,点接受----------------		


		----------------扫太快了,直接进入深绿色(确认登陆)按钮界面----------------
		x,y = findMultiColorInRegionFuzzy( 0xd6e1da, "1|0|0xa9ccb8,2|0|0x46b676", 90, 637, 397, 641, 399) --用户协议,点(接受)按钮
		if x ~= -1 and y ~= -1  then
			toast("扫太快了,直接进入深绿色(确认登陆)按钮界面,break",1)			
			mSleep(1*1000)
			break
		end		
		----------------扫太快了,直接进入深绿色(确认登陆)按钮界面----------------			
	
		toast("点击扫一扫",1)
		tap(1097,191,50)  --点击扫一扫
		mSleep(2*1000)
		x,y = findMultiColorInRegionFuzzy( 0x29b46f, "1|0|0xffffff", 90, 406, 133, 409, 135) --查找扫一扫的框
		if x ~= -1 and y ~= -1  then	
			toast("找到扫一扫的框,跳出循环",1)			
			mSleep(1*1000)
			break
		end	
	end


end
----------------------------------主页面点击扫一扫----------------------------------


----------------------------------扫一扫后点击确认登陆----------------------------------

function saoyisao_to_querendenglu()  


	while (true) do
		toast("扫码中",1)	
		mSleep(2*1000)
		x,y = findMultiColorInRegionFuzzy( 0xd6e1da, "1|0|0xa9ccb8,2|0|0x46b676", 90, 637, 397, 641, 399) --查找深绿色(确认登陆)按钮
		if x ~= -1 and y ~= -1  then	
			toast("扫码成功",1)			
			mSleep(1*1000)
			break
		end	
	end


end
----------------------------------扫一扫后点击确认登陆----------------------------------


----------------------------------点击(确认登陆)按钮,直到检测到主页面----------------------------------

function querendenglu_to_zhuyemian()  


	while (true) do
	
		----------------------------------触发用户失效报错,则杀掉进程,zhanghaoxulie = zhanghaoxulie -1 ----------------------------------
		x,y = findMultiColorInRegionFuzzy( 0x22b260, "0|1|0x90c5a7,0|2|0xf5f6f5", 90, 706, 331, 708, 335) --查找深色(下一步)按钮
		if x ~= -1 and y ~= -1  then	
			toast("找到主页面登陆游戏按钮,跳出循环",1)
			mSleep(1*1000)
			zhanghaoxulie = zhanghaoxulie - 1 --后移一位数组成员序号
			mSleep(1*1000)
			toast("回退a值,次循环继续上号",1)
			mSleep(3*1000)
			break
		end			
		----------------------------------触发用户失效报错,则重新登陆----------------------------------
		
		----------------点太快进入选择服务器界面,点x关闭----------------
		x,y = findMultiColorInRegionFuzzy( 0xd71000, "1|0|0xeb7758,2|0|0xf7dac1", 90, 1013, 35, 1017, 37) --点太快进入选择服务器界面,点x关闭
		if x ~= -1 and y ~= -1  then
			tap(1008,35,50)  --点击(好的)按钮
			toast("点击(X)按钮",1)			
			mSleep(1*1000)
		end		
		----------------点太快进入选择服务器界面,点x关闭----------------
		

		x,y = findMultiColorInRegionFuzzy( 0xffffff, "1|0|0xe9ddd4,2|0|0x93572c", 90, 630, 479, 634, 481) --查找主页面登陆游戏按钮
		if x ~= -1 and y ~= -1  then	
			toast("找到主页面登陆游戏按钮,跳出循环",1)			
			mSleep(3*1000)
			break
		end	
		toast("点击确认登陆",1)
		tap(571,386,50)  --点击(确认登陆)按钮
		mSleep(4*1000)
		

		
	end


end
----------------------------------点击(确认登陆)按钮,直到检测到主页面----------------------------------


----------------------------------杀掉进程----------------------------------
function kill_App()
	toast("3秒后杀掉进程",1)		
	mSleep(3*1000)
	closeApp("com.netease.my"); 
	mSleep(6*1000)
end
----------------------------------杀掉进程----------------------------------



-------------------------定时任务-------------------------
function Timed_task()  

	-------------------------赋值计时开始时间-------------------------
	while (true) do

		time_Starting =getNetTime();  --获取开始网络时间
		mSleep(1*1000);	--考虑到网络延迟

		if time_Starting ~= 0 then  --检测是否获取到网络时间,返回0则获取失败
			time_Starting_txt=os.date("%Y/%m/%d %X", time_Starting);  --格式化时间
			toast("开始时间:"..time_Starting_txt,1)
			break
		end


	end
	-------------------------赋值计时开始时间-------------------------



	-------------------------判断定时任务是否完成-------------------------
	while (true) do

		mSleep(15*1000);	--15秒检测一次



		-------------------------获取当前时间-------------------------
		while (true) do

			time_current =getNetTime();  --获取当前网络时间
			mSleep(1*1000);	--考虑到网络延迟

			if time_current ~= 0 then  --检测是否获取到网络时间,返回0则获取失败
				time_current_txt=os.date("%Y/%m/%d %X", time_current);  --格式化时间
				toast("当前时间:"..time_current_txt,1)
				break
			end


		end
	
	
	
	
		-------------------------获取当前时间-------------------------


		------判断时间是否到时------
		time_subtraction=(time_current-time_Starting)/60  --相减后格式成分钟

		if time_subtraction > time_interval then  --判断是否大于预设的时间间隔,是则break
			toast("已到预计时间,break",1)
			break		
		else		
			toast((time_interval-time_subtraction).."分钟后到时",1)		
		end
		------判断时间是否到时------

	end
		-------------------------判断定时任务是否完成-------------------------




end
-------------------------定时任务-------------------------





w,h = getScreenSize()
UINew(1,"脚本配置","确定","取消","lka.dat",0,120,w*0.8,h*0.8,"221,240,237","88,210,232")
UILabel("txt文本名(无后缀)",15,"left","0,0,0",-1,1)
UIEdit("zhanghaowenbenming","txt文本名(无后缀)","as",15,"left","0,0,0")

UILabel("每次循环上多少个账户",15,"left","0,0,0",-1,1)
UIEdit("zhanghaoshu","每次循环上多少个账户","20",15,"left","0,0,0")

UILabel("每次循环后休息多久时间(分钟)",15,"left","0,0,0",-1,1)
UIEdit("xiuxishijian","每次循环后休息多久时间(分钟)","120",15,"left","0,0,0")

UILabel("第几个账户开始执行",15,"left","0,0,0",-1,1)
UIEdit("zhanghaoxulie","第几个账户开始执行","1",15,"left","0,0,0")
UIShow()

txtname = zhanghaowenbenming  --赋值账号文本名

Cyclic_accumulation_target = tonumber(zhanghaoshu)  --赋值每次循环上多少个账户

time_interval = tonumber(xiuxishijian)  --赋值每次循环后休息多久时间(分钟)

zhanghaoxulie = tonumber(zhanghaoxulie)  --赋值第几个账户开始执行







closeApp("com.netease.my");

---------------读取账户本文TXT---------------
aaa = readFileString(userPath().."/res/"..txtname..".txt") --读取账账号内容，返回全部内容的string给aaa
bbb = strSplit(aaa,"\n",1) ---分割换行符赋值给bbb数组
---------------读取账户本文TXT---------------

Cyclic_accumulation_current=1  --当前循环累计,初始化=1


while (true) do
	ccc = strSplit(bbb[zhanghaoxulie],"----",1)   --分离账号密码,赋值给ccc数组
	
	
	mSleep(1*1000)
	toast("开始登陆第"..zhanghaoxulie.."个账户:"..ccc[1],1)
	mSleep(1*1000)

	Ftp_Add()


	closeApp("com.netease.my"); 
	mSleep(3*1000)



	a1=false	--分支a1初始化
	a2=false	--分支a2初始化
	a3=false	--分支a3初始化
	a4=false	--分支a4初始化
	a5=false	--分支a5初始化
	a6=false	--分支a6初始化
	a7=false	--分支a7初始化
	a8=false	--分支a8初始化	
	
	
	--changeip()
	Run_mh()
	panduan_denglu_fenzhi() --决定分支a1,a2是否执行

	if a1 == false then
		zhuyemian_to_yonghuzhongxin_a1()	
	end

	if a2 == false then
		yonghuzhongxin_to_qiehuanzhanghao_a2()
	end
	
	if a3 == false then
	shiyongqitazhanghaodenglu_to_denglufangshi()
	end
	
	if a4 == false then
	denglufangshi_to_wangyiyouxiang()
	end
	
	if a5 == false then
	input_zh()
	end
	
	if a6 == false then
	input_mm() 
	end
	
	if a6 == false then
	zhuyemian_to_saoyisao() 
	end
	
	if a7 == false then
	saoyisao_to_querendenglu() 
	end
	
	if a8 == false then
	querendenglu_to_zhuyemian()	
	end
	
	kill_App()
	
	Ftp_Del()
	

	-----------判断小循环累计是否到达预设值-----------
	if Cyclic_accumulation_current == Cyclic_accumulation_target then  --判断是否累计上号到达,是则进行休息任务
		toast("回到桌面休息"..time_interval.."分钟",1)
		Timed_task()
		toast("休息结束,继续循环",1)
		Cyclic_accumulation_current = 0
	end
	-----------判断小循环累计是否到达预设值-----------
	
	Cyclic_accumulation_current = Cyclic_accumulation_current + 1  --小循环累计+1
	
	zhanghaoxulie = zhanghaoxulie + 1 --后移一位账户序列数组成员序号

end