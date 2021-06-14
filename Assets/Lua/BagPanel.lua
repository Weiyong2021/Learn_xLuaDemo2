-------------------------背包面板的脚本-------------------------------

--一个新的面板对应一个新的表
BagPanel={}

--让BagPanel继承于BasePanel
--BasePanel:subClass("BagPanel")




--面板对象
BagPanel.panelObj=nil

--
BagPanel.btnClose=nil
BagPanel.tog1=nil
BagPanel.tog2=nil
BagPanel.tog3=nil

BagPanel.svBag=nil
BagPanel.Content=nil


--用一个表来存储老的格子对象
BagPanel.oldItemList={}


--刚开始默认类型为-1

BagPanel.type=-1

--成员方法


-------------------------------初始化面板---------------------------------
function BagPanel:Init()


    if self.panelObj==nil then
        --①--实例化面板对象
        self.panelObj=ABMgr:LoadRes("ui","BagPanel",typeof(GameObject))
        --设置父节点
        self.panelObj.transform:SetParent(Canvas,false)

        --②找到控件
        --2.1找关闭按钮的控件
        self.btnClose=self.panelObj.transform:Find("btnClose"):GetComponent(typeof(Button))
       
        --2.2找到单选框的控件
        local togGroup=self.panelObj.transform:Find("togGroup")
        --装备的tog1
        self.tog1=togGroup.transform:Find("tog1"):GetComponent(typeof(Toggle))
        --道具tog2
        self.tog2=togGroup.transform:Find("tog2"):GetComponent(typeof(Toggle))
        --宝石tog3
        self.tog3=togGroup.transform:Find("tog3"):GetComponent(typeof(Toggle))
        --svBag
        self.svBag=self.panelObj.transform:Find("svBag"):GetComponent(typeof(ScrollRect))

        --Content
        self.Content=self.svBag.transform:Find("Viewport"):Find("Content")
        -------------------③给对应的控件添加事件监听-----------------------
        --给关闭按钮添加事件监听
        self.btnClose.onClick:AddListener(function()
            self:HideMe()

        end)

        --给tog们添加事件监听
        self.tog1.onValueChanged:AddListener(function (value)
            if value==true then
                self:DoWithType(1)--转入表示的是装备
            end
        end)

        self.tog2.onValueChanged:AddListener(function (value)
            if value==true then
                self:DoWithType(2)--转入表示的是道具
            end
        end)

        self.tog3.onValueChanged:AddListener(function (value)
            if value==true then
                self:DoWithType(3)--转入表示的是宝石
            end
        end)

    end

    
end


-------------------------根据玩家的选择来处理相应的事件-----------------------------
---1.表示装备      2.表示道具      3.表示宝石
function BagPanel:DoWithType(type)
    -- if type==1 then
    --     print("----装备----"..type)

    -- elseif type==2 then
    --     print("----道具----"..type)

    -- elseif type==3 then
    --     print("----宝石----"..type)
    -- end

    --注意这里的写法，如果每一次都是点击一样的tog,则不需要删除格子了，直接返回
    --这一步是优化的
    if self.type==type then
        return
    end

    --更新之前，把老的格子删除掉
    for i=1,#self.oldItemList do
        --GameObject.Destroy(self.oldItemList[i].obj)
        --self.oldItemList[i]:Destroy()
        self.oldItemList[i]:Destroy()
       
    end
    self.oldItemList={}

    --更新新的格子
    local nowItems=nil
    --1。先创建新的格子
    if type==1 then 
        nowItems=PlayerData.equips

    elseif type==2 then
        nowItems=PlayerData.items

    else
        nowItems=PlayerData.gems

    end
    --
    for i=1,#nowItems do


        -------------------方法一：创建的格子对象不具有面向对象----------
        -- local grid={}--一个空表来代表一个格子
        -- grid.obj=ABMgr:LoadRes("ui","Item")
        -- --设置父对象
        -- grid.obj.transform:SetParent(self.Content,false)
        -- --设置他的位置
        -- grid.obj.transform.localPosition=Vector3((i-1)%4*155,math.floor((i-1)/4)*155)
        -- --设置图标
        -- --先找控件
        -- grid.imgItem=grid.obj.transform:Find("imgItem"):GetComponent(typeof(Image))
        -- grid.txtNum=grid.obj.transform:Find("txtNum"):GetComponent(typeof(Text))

        -- --设置图片
        -- local data=ItemData[nowItems[i].id]

        -- local str=string.split(data.icon,"_")

        -- --加载图集
        -- local spriteAtlas =ABMgr:LoadRes("ui",str[1],typeof(SpriteAtlas))
        -- print("=============="..spriteAtlas.name)

        -- print("------------我搞----------"..str[2])

        -- --设置图片
        -- grid.imgItem.sprite=spriteAtlas:GetSprite(str[2])

        -- --设置数量
        -- grid.txtNum.text=nowItems[i].num

        -- --存起来
        -- table.insert(self.oldItemList,grid)

        ------------方法二：利用面向对象类创建一个个格子对象--------------
        --new一个格子对象出来。。
        local grid=itemGrid:new()
        --然后去实例化格子对象，也就是初始化他的成员变量
        grid:Init(self.Content,(i-1)%4*155,math.floor((i-1)/4)*155)

        --初始化格子对象的信息    也就是更新格子对象下面的控件的信息
        grid:InitData(nowItems[i])

        --记录下格子对象         grid就是itemGrid脚本
        table.insert(self.oldItemList,grid)
        
    end
end


function BagPanel:BtnOnClick()
    print("关闭按钮")

end




-------------------------------显示面板---------------------------------
function BagPanel:ShowMe()

    self:Init()

    self.panelObj:SetActive(true)

    --第一次进来type==-1,则需要更改type
    self:DoWithType(1)

    
end

-------------------------------隐藏面板---------------------------------
function BagPanel:HideMe()
    --我搞，老是出现这种，妈耶   成员函数必须使用冒号
    --LuaException: c# exception:Non-static method requires a target.,stack:  
    --at System.Reflection.MonoMethod.Invoke 
    --(System.Object obj, System.Reflection.BindingFlags 
    --invokeAttr, System.Reflection.Binder binder, System.Object[] 
    --parameters, System.Globalization.CultureInfo culture) [0x0004c] 
    --in <fb001e01371b4adca20013e0ac763896>:0 

     -- self.panelObj.SetActive(true)
   --我搞，老是出现这种，妈耶   成员函数必须使用冒号
    self.panelObj:SetActive(false)

end













