
--只要是一个新的对象，我们就建立一张新的表
 --MainPanel={}


 --让MainPanel继承于BasePanel

 BasePanel:subClass("MainPanel")
 --成员变量，面板的名字
 MainPanel.name="MainPanel"

 
--不是必须写的，因为lua的特性   不存在 生命变量的概念
--这样写的目的  是当别人看到这个lua代码的时候
-- 知道 这个表（对象）有什么变量很重要

--关联的面板对象
--MainPanel.panelObj=nil

--MainPanel.btnRole=nil

--MainPanel.btnSkill=nil

--初始化该民办   实例化对象  控件事件的监听
function MainPanel:Init()
   
    self.base.Init(self)
    if self.eventflog==false then 
        self:GetControl("btnRole","Button").onClick:AddListener(self.BtnOnClick)
        self.eventflog=true
    end
    
    -- if self.panelObj==nil then
    --     --①--实例化面板对象   MainPanel

    --     print("-------------------fdafdsa-----------------------");
    --     self.panelObj=ABMgr:LoadRes("ui","MainPanel",typeof(GameObject))
    --     --设置父节点
    --     self.panelObj.transform:SetParent(Canvas,false)

    --     --②找到控件
    --     self.btnRole=self.panelObj.transform:Find("btnRole"):GetComponent(typeof(Button))

    --     print(self.btnRole)

    --     --③为事件添加事件监听  进行事件的操作处理
    --     --注意在这里MainPanel.BtnOnClick不是调用，而是传进去而已
    --     --这样写的话，在MainPanel.BtnOnClick的实现内部逻辑理不能使用self
    --     --self.btnRole.onClick:AddListener(MainPanel.BtnOnClick)--这样写不对

    --     self.btnRole.onClick:AddListener(self.BtnOnClick)

    --     --如果要在按钮点击之后，相应 函数的内部逻辑可以使用self，则需要包裹一次
    --     --这时就需要使用到匿名函数
    --     -- self.btnRole.onClick:AddListener(function()
    --     --     self:BtnOnClick()

    --     -- end)
    -- end
  
end


function MainPanel:BtnOnClick()
    --print("---------我搞，妈耶----------")
    --如果在内部里面使用self,会报错
    --显示背包面板
    if BagPanel==nil then 
        print("BagPanel is null")
    else
        BagPanel:ShowMe()

    end

end



-- function MainPanel:ShowMe()
--     self:Init()
--     self.panelObj:SetActive(true)
   
-- end


-- function MainPanel:HideMe()
--     self.panelObj:SetActive(false)

-- end